/* $Id: alsa-util.c 1272 2006-08-18 21:38:40Z lennart $ */

/***
  This file is part of PulseAudio.
 
  PulseAudio is free software; you can redistribute it and/or modify
  it under the terms of the GNU Lesser General Public License as published
  by the Free Software Foundation; either version 2 of the License,
  or (at your option) any later version.
 
  PulseAudio is distributed in the hope that it will be useful, but
  WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
  General Public License for more details.
 
  You should have received a copy of the GNU Lesser General Public License
  along with PulseAudio; if not, write to the Free Software
  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
  USA.
***/

#ifdef HAVE_CONFIG_H
#include <config.h>
#endif

#include <sys/types.h>
#include <asoundlib.h>

#include <pulse/sample.h>
#include <pulse/xmalloc.h>

#include <pulsecore/log.h>

#include "alsa-util.h"

struct pa_alsa_fdlist {
    int num_fds;
    struct pollfd *fds;
    /* This is a temporary buffer used to avoid lots of mallocs */
    struct pollfd *work_fds;

    snd_pcm_t *pcm;
    snd_mixer_t *mixer;

    pa_mainloop_api *m;
    pa_defer_event *defer;
    pa_io_event **ios;

    int polled;

    void (*cb)(void *userdata);
    void *userdata;
};

static void io_cb(pa_mainloop_api*a, pa_io_event* e, PA_GCC_UNUSED int fd, pa_io_event_flags_t events, void *userdata) {
    struct pa_alsa_fdlist *fdl = (struct pa_alsa_fdlist*)userdata;
    int err, i;
    unsigned short revents;

    assert(a && fdl && (fdl->pcm || fdl->mixer) && fdl->fds && fdl->work_fds);

    if (fdl->polled)
        return;

    fdl->polled = 1;

    memcpy(fdl->work_fds, fdl->fds, sizeof(struct pollfd) * fdl->num_fds);

    for (i = 0;i < fdl->num_fds;i++) {
        if (e == fdl->ios[i]) {
            if (events & PA_IO_EVENT_INPUT)
                fdl->work_fds[i].revents |= POLLIN;
            if (events & PA_IO_EVENT_OUTPUT)
                fdl->work_fds[i].revents |= POLLOUT;
            if (events & PA_IO_EVENT_ERROR)
                fdl->work_fds[i].revents |= POLLERR;
            if (events & PA_IO_EVENT_HANGUP)
                fdl->work_fds[i].revents |= POLLHUP;
            break;
        }
    }

    assert(i != fdl->num_fds);

    if (fdl->pcm)
        err = snd_pcm_poll_descriptors_revents(fdl->pcm, fdl->work_fds, fdl->num_fds, &revents);
    else
        err = snd_mixer_poll_descriptors_revents(fdl->mixer, fdl->work_fds, fdl->num_fds, &revents);

    if (err < 0) {
        pa_log_error("Unable to get poll revent: %s",
            snd_strerror(err));
        return;
    }

    a->defer_enable(fdl->defer, 1);

    if (revents) {
        if (fdl->pcm)
            fdl->cb(fdl->userdata);
        else
            snd_mixer_handle_events(fdl->mixer);
    }
}

static void defer_cb(pa_mainloop_api*a, PA_GCC_UNUSED pa_defer_event* e, void *userdata) {
    struct pa_alsa_fdlist *fdl = (struct pa_alsa_fdlist*)userdata;
    int num_fds, i, err;
    struct pollfd *temp;

    assert(a && fdl && (fdl->pcm || fdl->mixer));

    a->defer_enable(fdl->defer, 0);

    if (fdl->pcm)
        num_fds = snd_pcm_poll_descriptors_count(fdl->pcm);
    else
        num_fds = snd_mixer_poll_descriptors_count(fdl->mixer);
    assert(num_fds > 0);

    if (num_fds != fdl->num_fds) {
        if (fdl->fds)
            pa_xfree(fdl->fds);
        if (fdl->work_fds)
            pa_xfree(fdl->work_fds);
        fdl->fds = pa_xmalloc0(sizeof(struct pollfd) * num_fds);
        fdl->work_fds = pa_xmalloc(sizeof(struct pollfd) * num_fds);
    }

    memset(fdl->work_fds, 0, sizeof(struct pollfd) * num_fds);

    if (fdl->pcm)
        err = snd_pcm_poll_descriptors(fdl->pcm, fdl->work_fds, num_fds);
    else
        err = snd_mixer_poll_descriptors(fdl->mixer, fdl->work_fds, num_fds);

    if (err < 0) {
        pa_log_error("Unable to get poll descriptors: %s",
            snd_strerror(err));
        return;
    }

    fdl->polled = 0;

    if (memcmp(fdl->fds, fdl->work_fds, sizeof(struct pollfd) * num_fds) == 0)
        return;

    if (fdl->ios) {
        for (i = 0;i < fdl->num_fds;i++)
            a->io_free(fdl->ios[i]);
        if (num_fds != fdl->num_fds) {
            pa_xfree(fdl->ios);
            fdl->ios = pa_xmalloc(sizeof(pa_io_event*) * num_fds);
            assert(fdl->ios);
        }
    } else {
        fdl->ios = pa_xmalloc(sizeof(pa_io_event*) * num_fds);
        assert(fdl->ios);
    }

    /* Swap pointers */
    temp = fdl->work_fds;
    fdl->work_fds = fdl->fds;
    fdl->fds = temp;

    fdl->num_fds = num_fds;

    for (i = 0;i < num_fds;i++) {
        fdl->ios[i] = a->io_new(a, fdl->fds[i].fd,
            ((fdl->fds[i].events & POLLIN) ? PA_IO_EVENT_INPUT : 0) |
            ((fdl->fds[i].events & POLLOUT) ? PA_IO_EVENT_OUTPUT : 0),
            io_cb, fdl);
        assert(fdl->ios[i]);
    }
}

struct pa_alsa_fdlist *pa_alsa_fdlist_new(void) {
    struct pa_alsa_fdlist *fdl;

    fdl = pa_xmalloc(sizeof(struct pa_alsa_fdlist));

    fdl->num_fds = 0;
    fdl->fds = NULL;
    fdl->work_fds = NULL;

    fdl->pcm = NULL;
    fdl->mixer = NULL;

    fdl->m = NULL;
    fdl->defer = NULL;
    fdl->ios = NULL;

    fdl->polled = 0;

    return fdl;
}

void pa_alsa_fdlist_free(struct pa_alsa_fdlist *fdl) {
    assert(fdl);

    if (fdl->defer) {
        assert(fdl->m);
        fdl->m->defer_free(fdl->defer);
    }

    if (fdl->ios) {
        int i;
        assert(fdl->m);
        for (i = 0;i < fdl->num_fds;i++)
            fdl->m->io_free(fdl->ios[i]);
        pa_xfree(fdl->ios);
    }

    if (fdl->fds)
        pa_xfree(fdl->fds);
    if (fdl->work_fds)
        pa_xfree(fdl->work_fds);

    pa_xfree(fdl);
}

int pa_alsa_fdlist_init_pcm(struct pa_alsa_fdlist *fdl, snd_pcm_t *pcm_handle, pa_mainloop_api* m, void (*cb)(void *userdata), void *userdata) {
    assert(fdl && pcm_handle && m && !fdl->m && cb);

    fdl->pcm = pcm_handle;
    fdl->m = m;

    fdl->defer = m->defer_new(m, defer_cb, fdl);
    assert(fdl->defer);

    fdl->cb = cb;
    fdl->userdata = userdata;

    return 0;
}

int pa_alsa_fdlist_init_mixer(struct pa_alsa_fdlist *fdl, snd_mixer_t *mixer_handle, pa_mainloop_api* m) {
    assert(fdl && mixer_handle && m && !fdl->m);

    fdl->mixer = mixer_handle;
    fdl->m = m;

    fdl->defer = m->defer_new(m, defer_cb, fdl);
    assert(fdl->defer);

    return 0;
}

static int set_format(snd_pcm_t *pcm_handle, snd_pcm_hw_params_t *hwparams, pa_sample_format_t *f) {

    static const snd_pcm_format_t format_trans[] = {
        [PA_SAMPLE_U8] = SND_PCM_FORMAT_U8,
        [PA_SAMPLE_ALAW] = SND_PCM_FORMAT_A_LAW,
        [PA_SAMPLE_ULAW] = SND_PCM_FORMAT_MU_LAW,
        [PA_SAMPLE_S16LE] = SND_PCM_FORMAT_S16_LE,
        [PA_SAMPLE_S16BE] = SND_PCM_FORMAT_S16_BE,
        [PA_SAMPLE_FLOAT32LE] = SND_PCM_FORMAT_FLOAT_LE,
        [PA_SAMPLE_FLOAT32BE] = SND_PCM_FORMAT_FLOAT_BE,
    };

    static const pa_sample_format_t try_order[] = {
        PA_SAMPLE_S16NE,
        PA_SAMPLE_S16RE,
        PA_SAMPLE_FLOAT32NE,
        PA_SAMPLE_FLOAT32RE,
        PA_SAMPLE_ULAW,
        PA_SAMPLE_ALAW,
        PA_SAMPLE_U8,
        PA_SAMPLE_INVALID
    };

    int i, ret;
    
    assert(pcm_handle);
    assert(f);

    if ((ret = snd_pcm_hw_params_set_format(pcm_handle, hwparams, format_trans[*f])) >= 0)
        return ret;

    if (*f == PA_SAMPLE_FLOAT32BE)
        *f = PA_SAMPLE_FLOAT32LE;
    else if (*f == PA_SAMPLE_FLOAT32LE)
        *f = PA_SAMPLE_FLOAT32BE;
    else if (*f == PA_SAMPLE_S16BE)
        *f = PA_SAMPLE_S16LE;
    else if (*f == PA_SAMPLE_S16LE)
        *f = PA_SAMPLE_S16BE;
    else
        goto try_auto;

    if ((ret = snd_pcm_hw_params_set_format(pcm_handle, hwparams, format_trans[*f])) >= 0)
        return ret;
        
try_auto:

    for (i = 0; try_order[i] != PA_SAMPLE_INVALID; i++) {
        *f = try_order[i];
        
        if ((ret = snd_pcm_hw_params_set_format(pcm_handle, hwparams, format_trans[*f])) >= 0)
            return ret;
    }

    return -1;
}

/* Set the hardware parameters of the given ALSA device. Returns the
 * selected fragment settings in *period and *period_size */
int pa_alsa_set_hw_params(snd_pcm_t *pcm_handle, pa_sample_spec *ss, uint32_t *periods, snd_pcm_uframes_t *period_size) {
    int ret = -1;
    snd_pcm_uframes_t buffer_size;
    unsigned int r = ss->rate;
    unsigned int c = ss->channels;
    pa_sample_format_t f = ss->format;
    snd_pcm_hw_params_t *hwparams;
    
    assert(pcm_handle);
    assert(ss);
    assert(periods);
    assert(period_size);

    buffer_size = *periods * *period_size;
    
    if ((ret = snd_pcm_hw_params_malloc(&hwparams)) < 0 ||
        (ret = snd_pcm_hw_params_any(pcm_handle, hwparams)) < 0 ||
        (ret = snd_pcm_hw_params_set_rate_resample(pcm_handle, hwparams, 0)) < 0 ||
    	(ret = snd_pcm_hw_params_set_access(pcm_handle, hwparams, SND_PCM_ACCESS_RW_INTERLEAVED)) < 0)
        goto finish;

    if ((ret = set_format(pcm_handle, hwparams, &f)) < 0)
        goto finish;

    if ((ret = snd_pcm_hw_params_set_rate_near(pcm_handle, hwparams, &r, NULL)) < 0)
        goto finish;

    if ((ret = snd_pcm_hw_params_set_channels_near(pcm_handle, hwparams, &c)) < 0)
        goto finish;

    if ((*period_size > 0 && (ret = snd_pcm_hw_params_set_period_size_near(pcm_handle, hwparams, period_size, NULL)) < 0) ||
        (*periods > 0 && (ret = snd_pcm_hw_params_set_buffer_size_near(pcm_handle, hwparams, &buffer_size)) < 0))
        goto finish;

    if  ((ret = snd_pcm_hw_params(pcm_handle, hwparams)) < 0)
        goto finish;

    if (ss->rate != r) {
        pa_log_warn("device doesn't support %u Hz, changed to %u Hz.", ss->rate, r);

        /* If the sample rate deviates too much, we need to resample */
        if (r < ss->rate*.95 || r > ss->rate*1.05)
            ss->rate = r;
    }

    if (ss->channels != c) {
        pa_log_warn("device doesn't support %u channels, changed to %u.", ss->channels, c);
        ss->channels = c;
    }

    if (ss->format != f) {
        pa_log_warn("device doesn't support sample format %s, changed to %s.", pa_sample_format_to_string(ss->format), pa_sample_format_to_string(f));
        ss->format = f;
    }
    
    if ((ret = snd_pcm_prepare(pcm_handle)) < 0)
        goto finish;

    if ((ret = snd_pcm_hw_params_get_buffer_size(hwparams, &buffer_size)) < 0 ||
        (ret = snd_pcm_hw_params_get_period_size(hwparams, period_size, NULL)) < 0)
        goto finish;
    
    assert(buffer_size > 0);
    assert(*period_size > 0);
    *periods = buffer_size / *period_size;
    assert(*periods > 0);
    
    ret = 0;
    
finish:
    if (hwparams)
        snd_pcm_hw_params_free(hwparams);
    
    return ret;
}

int pa_alsa_prepare_mixer(snd_mixer_t *mixer, const char *dev) {
    int err;

    assert(mixer && dev);

    if ((err = snd_mixer_attach(mixer, dev)) < 0) {
        pa_log_warn("Unable to attach to mixer %s: %s", dev, snd_strerror(err));
        return -1;
    }

    if ((err = snd_mixer_selem_register(mixer, NULL, NULL)) < 0) {
        pa_log_warn("Unable to register mixer: %s", snd_strerror(err));
        return -1;
    }

    if ((err = snd_mixer_load(mixer)) < 0) {
        pa_log_warn("Unable to load mixer: %s", snd_strerror(err));
        return -1;
    }

    return 0;
}

snd_mixer_elem_t *pa_alsa_find_elem(snd_mixer_t *mixer, const char *name, const char *fallback) {
    snd_mixer_elem_t *elem;
    snd_mixer_selem_id_t *sid = NULL;
    snd_mixer_selem_id_alloca(&sid);

    assert(mixer);
    assert(name);

    snd_mixer_selem_id_set_name(sid, name);

    if (!(elem = snd_mixer_find_selem(mixer, sid))) {
        pa_log_warn("Cannot find mixer control \"%s\".", snd_mixer_selem_id_get_name(sid));

        if (fallback) {
            snd_mixer_selem_id_set_name(sid, fallback);
            
            if (!(elem = snd_mixer_find_selem(mixer, sid)))
                pa_log_warn("Cannot find fallback mixer control \"%s\".", snd_mixer_selem_id_get_name(sid));
        }
    }

    if (elem)
        pa_log_info("Using mixer control \"%s\".", snd_mixer_selem_id_get_name(sid));

    return elem;
}
