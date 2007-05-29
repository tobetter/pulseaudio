/* $Id: oss-util.c 1426 2007-02-13 15:35:19Z ossman $ */

/***
  This file is part of PulseAudio.

  Copyright 2004-2006 Lennart Poettering
  Copyright 2006 Pierre Ossman <ossman@cendio.se> for Cendio AB

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

#include <assert.h>
#include <sys/soundcard.h>
#include <sys/ioctl.h>
#include <stdio.h>
#include <errno.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

#include <pulsecore/core-error.h>
#include <pulsecore/core-util.h>
#include <pulsecore/log.h>

#include "oss-util.h"

int pa_oss_open(const char *device, int *mode, int* pcaps) {
    int fd = -1;
    int caps;

    assert(device && mode && (*mode == O_RDWR || *mode == O_RDONLY || *mode == O_WRONLY));

    if(!pcaps)
        pcaps = &caps;

    if (*mode == O_RDWR) {
        if ((fd = open(device, O_RDWR|O_NDELAY)) >= 0) {
            int dcaps, *tcaps;
            ioctl(fd, SNDCTL_DSP_SETDUPLEX, 0);

            tcaps = pcaps ? pcaps : &dcaps;

            if (ioctl(fd, SNDCTL_DSP_GETCAPS, tcaps) < 0) {
                pa_log("SNDCTL_DSP_GETCAPS: %s", pa_cstrerror(errno));
                goto fail;
            }

            if (*tcaps & DSP_CAP_DUPLEX)
                goto success;

            pa_log_warn("'%s' doesn't support full duplex", device);

            close(fd);
        }

        if ((fd = open(device, (*mode = O_WRONLY)|O_NDELAY)) < 0) {
            if ((fd = open(device, (*mode = O_RDONLY)|O_NDELAY)) < 0) {
                pa_log("open('%s'): %s", device, pa_cstrerror(errno));
                goto fail;
            }
        }
    } else {
        if ((fd = open(device, *mode|O_NDELAY)) < 0) {
            pa_log("open('%s'): %s", device, pa_cstrerror(errno));
            goto fail;
        }
    }

success:

    *pcaps = 0;

    if (ioctl(fd, SNDCTL_DSP_GETCAPS, pcaps) < 0) {
        pa_log("SNDCTL_DSP_GETCAPS: %s", pa_cstrerror(errno));
        goto fail;
    }

    pa_log_debug("capabilities:%s%s%s%s%s%s%s%s%s%s%s%s%s%s",
                 *pcaps & DSP_CAP_BATCH ? " BATCH" : "",
#ifdef DSP_CAP_BIND
                 *pcaps & DSP_CAP_BIND ? " BIND" : "",
#else
		 "",
#endif
                 *pcaps & DSP_CAP_COPROC ? " COPROC" : "",
                 *pcaps & DSP_CAP_DUPLEX ? " DUPLEX" : "",
#ifdef DSP_CAP_FREERATE
                 *pcaps & DSP_CAP_FREERATE ? " FREERATE" : "",
#else
                 "",
#endif
#ifdef DSP_CAP_INPUT
                 *pcaps & DSP_CAP_INPUT ? " INPUT" : "",
#else
                 "",
#endif
                 *pcaps & DSP_CAP_MMAP ? " MMAP" : "",
#ifdef DSP_CAP_MODEM
                 *pcaps & DSP_CAP_MODEM ? " MODEM" : "",
#else
                 "",
#endif
#ifdef DSP_CAP_MULTI
                 *pcaps & DSP_CAP_MULTI ? " MULTI" : "",
#else
		 "",
#endif
#ifdef DSP_CAP_OUTPUT
                 *pcaps & DSP_CAP_OUTPUT ? " OUTPUT" : "",
#else
                 "",
#endif
                 *pcaps & DSP_CAP_REALTIME ? " REALTIME" : "",
#ifdef DSP_CAP_SHADOW
                 *pcaps & DSP_CAP_SHADOW ? " SHADOW" : "",
#else
                 "",
#endif
#ifdef DSP_CAP_VIRTUAL
                 *pcaps & DSP_CAP_VIRTUAL ? " VIRTUAL" : "",
#else
                 "",
#endif
                 *pcaps & DSP_CAP_TRIGGER ? " TRIGGER" : "");

    pa_fd_set_cloexec(fd, 1);

    return fd;

fail:
    if (fd >= 0)
        close(fd);
    return -1;
}

int pa_oss_auto_format(int fd, pa_sample_spec *ss) {
    int format, channels, speed, reqformat;
    pa_sample_format_t orig_format;

    static const int format_trans[PA_SAMPLE_MAX] = {
        [PA_SAMPLE_U8] = AFMT_U8,
        [PA_SAMPLE_ALAW] = AFMT_A_LAW,
        [PA_SAMPLE_ULAW] = AFMT_MU_LAW,
        [PA_SAMPLE_S16LE] = AFMT_S16_LE,
        [PA_SAMPLE_S16BE] = AFMT_S16_BE,
        [PA_SAMPLE_FLOAT32LE] = AFMT_QUERY, /* not supported */
        [PA_SAMPLE_FLOAT32BE] = AFMT_QUERY, /* not supported */
    };

    assert(fd >= 0 && ss);

    orig_format = ss->format;

    reqformat = format = format_trans[ss->format];
    if (reqformat == AFMT_QUERY || ioctl(fd, SNDCTL_DSP_SETFMT, &format) < 0 || format != reqformat) {
        format = AFMT_S16_NE;
        if (ioctl(fd, SNDCTL_DSP_SETFMT, &format) < 0 || format != AFMT_S16_NE) {
            int f = AFMT_S16_NE == AFMT_S16_LE ? AFMT_S16_BE : AFMT_S16_LE;
            format = f;
            if (ioctl(fd, SNDCTL_DSP_SETFMT, &format) < 0 || format != f) {
                format = AFMT_U8;
                if (ioctl(fd, SNDCTL_DSP_SETFMT, &format) < 0 || format != AFMT_U8) {
                    pa_log("SNDCTL_DSP_SETFMT: %s", format != AFMT_U8 ? "No supported sample format" : pa_cstrerror(errno));
                    return -1;
                } else
                    ss->format = PA_SAMPLE_U8;
            } else
                ss->format = f == AFMT_S16_LE ? PA_SAMPLE_S16LE : PA_SAMPLE_S16BE;
        } else
            ss->format = PA_SAMPLE_S16NE;
    }

    if (orig_format != ss->format)
        pa_log_warn("device doesn't support sample format %s, changed to %s.",
               pa_sample_format_to_string(orig_format),
               pa_sample_format_to_string(ss->format));

    channels = ss->channels;
    if (ioctl(fd, SNDCTL_DSP_CHANNELS, &channels) < 0) {
        pa_log("SNDCTL_DSP_CHANNELS: %s", pa_cstrerror(errno));
        return -1;
    }
    assert(channels > 0);

    if (ss->channels != channels) {
        pa_log_warn("device doesn't support %i channels, using %i channels.", ss->channels, channels);
        ss->channels = channels;
    }

    speed = ss->rate;
    if (ioctl(fd, SNDCTL_DSP_SPEED, &speed) < 0) {
        pa_log("SNDCTL_DSP_SPEED: %s", pa_cstrerror(errno));
        return -1;
    }
    assert(speed > 0);

    if (ss->rate != (unsigned) speed) {
        pa_log_warn("device doesn't support %i Hz, changed to %i Hz.", ss->rate, speed);

        /* If the sample rate deviates too much, we need to resample */
        if (speed < ss->rate*.95 || speed > ss->rate*1.05)
            ss->rate = speed;
    }

    return 0;
}

static int simple_log2(int v) {
    int k = 0;

    for (;;) {
        v >>= 1;
        if (!v) break;
        k++;
    }

    return k;
}

int pa_oss_set_fragments(int fd, int nfrags, int frag_size) {
    int arg;
    arg = ((int) nfrags << 16) | simple_log2(frag_size);

    if (ioctl(fd, SNDCTL_DSP_SETFRAGMENT, &arg) < 0) {
        pa_log("SNDCTL_DSP_SETFRAGMENT: %s", pa_cstrerror(errno));
        return -1;
    }

    return 0;
}

static int pa_oss_get_volume(int fd, int mixer, const pa_sample_spec *ss, pa_cvolume *volume) {
    char cv[PA_CVOLUME_SNPRINT_MAX];
    unsigned vol;

    assert(fd >= 0);
    assert(ss);
    assert(volume);

    if (ioctl(fd, mixer, &vol) < 0)
        return -1;

    volume->values[0] = ((vol & 0xFF) * PA_VOLUME_NORM) / 100;

    if ((volume->channels = ss->channels) >= 2)
        volume->values[1] = (((vol >> 8) & 0xFF) * PA_VOLUME_NORM) / 100;

    pa_log_debug("Read mixer settings: %s", pa_cvolume_snprint(cv, sizeof(cv), volume));
    return 0;
}

static int pa_oss_set_volume(int fd, int mixer, const pa_sample_spec *ss, const pa_cvolume *volume) {
    char cv[PA_CVOLUME_SNPRINT_MAX];
    unsigned vol;
    pa_volume_t l, r;

    l = volume->values[0] > PA_VOLUME_NORM ? PA_VOLUME_NORM : volume->values[0];

    vol = (l*100)/PA_VOLUME_NORM;

    if (ss->channels >= 2) {
        r = volume->values[1] > PA_VOLUME_NORM ? PA_VOLUME_NORM : volume->values[1];
        vol |= ((r*100)/PA_VOLUME_NORM) << 8;
    }

    if (ioctl(fd, mixer, &vol) < 0)
        return -1;

    pa_log_debug("Wrote mixer settings: %s", pa_cvolume_snprint(cv, sizeof(cv), volume));
    return 0;
}

int pa_oss_get_pcm_volume(int fd, const pa_sample_spec *ss, pa_cvolume *volume) {
    return pa_oss_get_volume(fd, SOUND_MIXER_READ_PCM, ss, volume);
}

int pa_oss_set_pcm_volume(int fd, const pa_sample_spec *ss, const pa_cvolume *volume) {
    return pa_oss_set_volume(fd, SOUND_MIXER_WRITE_PCM, ss, volume);
}

int pa_oss_get_input_volume(int fd, const pa_sample_spec *ss, pa_cvolume *volume) {
    return pa_oss_get_volume(fd, SOUND_MIXER_READ_IGAIN, ss, volume);
}

int pa_oss_set_input_volume(int fd, const pa_sample_spec *ss, const pa_cvolume *volume) {
    return pa_oss_set_volume(fd, SOUND_MIXER_WRITE_IGAIN, ss, volume);
}

int pa_oss_get_hw_description(const char *dev, char *name, size_t l) {
    FILE *f;
    const char *e = NULL;
    int n, r = -1;
    int b = 0;

    if (strncmp(dev, "/dev/dsp", 8) == 0)
        e = dev+8;
    else if (strncmp(dev, "/dev/adsp", 9) == 0)
        e = dev+9;
    else
        return -1;

    if (*e == 0)
        n = 0;
    else if (*e >= '0' && *e <= '9' && *(e+1) == 0)
        n = *e - '0';
    else
        return -1;

    if (!(f = fopen("/dev/sndstat", "r")) &&
        !(f = fopen("/proc/sndstat", "r")) &&
        !(f = fopen("/proc/asound/oss/sndstat", "r"))) {

        if (errno != ENOENT)
            pa_log_warn("failed to open OSS sndstat device: %s", pa_cstrerror(errno));

        return -1;
    }

    while (!feof(f)) {
        char line[64];
        int device;

        if (!fgets(line, sizeof(line), f))
            break;

        line[strcspn(line, "\r\n")] = 0;

        if (!b) {
            b = strcmp(line, "Audio devices:") == 0;
            continue;
        }

        if (line[0] == 0)
            break;

        if (sscanf(line, "%i: ", &device) != 1)
            continue;

        if (device == n) {
            char *k = strchr(line, ':');
            assert(k);
            k++;
            k += strspn(k, " ");

            if (pa_endswith(k, " (DUPLEX)"))
                k[strlen(k)-9] = 0;

            pa_strlcpy(name, k, l);
            r = 0;
            break;
        }
    }

    fclose(f);
    return r;
}
