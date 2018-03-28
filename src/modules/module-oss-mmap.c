/* $Id: module-oss-mmap.c 1316 2006-08-22 11:41:14Z ossman $ */

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

#include <sys/soundcard.h>
#include <sys/ioctl.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <stdio.h>
#include <assert.h>
#include <errno.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>
#include <limits.h>

#ifdef HAVE_SYS_MMAN_H
#include <sys/mman.h>
#endif

#include <pulse/xmalloc.h>
#include <pulse/util.h>

#include <pulsecore/core-error.h>
#include <pulsecore/iochannel.h>
#include <pulsecore/sink.h>
#include <pulsecore/source.h>
#include <pulsecore/module.h>
#include <pulsecore/sample-util.h>
#include <pulsecore/core-util.h>
#include <pulsecore/modargs.h>
#include <pulsecore/log.h>

#include "oss-util.h"
#include "module-oss-mmap-symdef.h"

PA_MODULE_AUTHOR("Lennart Poettering")
PA_MODULE_DESCRIPTION("OSS Sink/Source (mmap)")
PA_MODULE_VERSION(PACKAGE_VERSION)
PA_MODULE_USAGE(
        "sink_name=<name for the sink> "
        "source_name=<name for the source> "
        "device=<OSS device> "
        "record=<enable source?> "
        "playback=<enable sink?> "
        "format=<sample format> "
        "channels=<number of channels> "
        "rate=<sample rate> "
        "fragments=<number of fragments> "
        "fragment_size=<fragment size> "
        "channel_map=<channel map>")

struct userdata {
    pa_sink *sink;
    pa_source *source;
    pa_core *core;
    pa_sample_spec sample_spec;

    size_t in_fragment_size, out_fragment_size;
    unsigned in_fragments, out_fragments;
    unsigned out_blocks_saved, in_blocks_saved;

    int fd;

    void *in_mmap, *out_mmap;
    size_t in_mmap_length, out_mmap_length;

    pa_io_event *io_event;

    pa_memblock **in_memblocks, **out_memblocks;
    unsigned out_current, in_current;
    pa_module *module;
};

static const char* const valid_modargs[] = {
    "sink_name",
    "source_name",
    "device",
    "record",
    "playback",
    "fragments",
    "fragment_size",
    "format",
    "rate",
    "channels",
    "channel_map",
    NULL
};

#define DEFAULT_DEVICE "/dev/dsp"
#define DEFAULT_NFRAGS 12
#define DEFAULT_FRAGSIZE 1024

static void update_usage(struct userdata *u) {
   pa_module_set_used(u->module, 
                      (u->sink ? pa_sink_used_by(u->sink) : 0) +
                      (u->source ? pa_source_used_by(u->source) : 0));
}

static void clear_up(struct userdata *u) {
    assert(u);

    if (u->sink) {
        pa_sink_disconnect(u->sink);
        pa_sink_unref(u->sink);
        u->sink = NULL;
    }
    
    if (u->source) {
        pa_source_disconnect(u->source);
        pa_source_unref(u->source);
        u->source = NULL;
    }

    if (u->in_mmap && u->in_mmap != MAP_FAILED) {
        munmap(u->in_mmap, u->in_mmap_length);
        u->in_mmap = NULL;
    }
    
    if (u->out_mmap && u->out_mmap != MAP_FAILED) {
        munmap(u->out_mmap, u->out_mmap_length);
        u->out_mmap = NULL;
    }
    
    if (u->io_event) {
        u->core->mainloop->io_free(u->io_event);
        u->io_event = NULL;
    }

    if (u->fd >= 0) {
        close(u->fd);
        u->fd = -1;
    }
}

static void out_fill_memblocks(struct userdata *u, unsigned n) {
    assert(u && u->out_memblocks);
    
    while (n > 0) {
        pa_memchunk chunk;
        
        if (u->out_memblocks[u->out_current])
            pa_memblock_unref_fixed(u->out_memblocks[u->out_current]);
            
        chunk.memblock = u->out_memblocks[u->out_current] =
            pa_memblock_new_fixed(
                    u->core->mempool,
                    (uint8_t*) u->out_mmap+u->out_fragment_size*u->out_current,
                    u->out_fragment_size,
                    1);
        assert(chunk.memblock);
        chunk.length = chunk.memblock->length;
        chunk.index = 0;
        
        pa_sink_render_into_full(u->sink, &chunk);
            
        u->out_current++;
        while (u->out_current >= u->out_fragments)
            u->out_current -= u->out_fragments;
        
        n--;
    }
}

static void do_write(struct userdata *u) {
    struct count_info info;
    assert(u && u->sink);

    update_usage(u);
    
    if (ioctl(u->fd, SNDCTL_DSP_GETOPTR, &info) < 0) {
        pa_log("SNDCTL_DSP_GETOPTR: %s", pa_cstrerror(errno));

        clear_up(u);
        pa_module_unload_request(u->module);
        return;
    }

    info.blocks += u->out_blocks_saved;
    u->out_blocks_saved = 0;
    
    if (!info.blocks)
        return;
    
    out_fill_memblocks(u, info.blocks);
}

static void in_post_memblocks(struct userdata *u, unsigned n) {
    assert(u && u->in_memblocks);
    
    while (n > 0) {
        pa_memchunk chunk;
        
        if (!u->in_memblocks[u->in_current]) {
            chunk.memblock = u->in_memblocks[u->in_current] = pa_memblock_new_fixed(u->core->mempool, (uint8_t*) u->in_mmap+u->in_fragment_size*u->in_current, u->in_fragment_size, 1);
            chunk.length = chunk.memblock->length;
            chunk.index = 0;
            
            pa_source_post(u->source, &chunk);
        }

        u->in_current++;
        while (u->in_current >= u->in_fragments)
            u->in_current -= u->in_fragments;
        
        n--;
    }
}

static void in_clear_memblocks(struct userdata*u, unsigned n) {
    unsigned i = u->in_current;
    assert(u && u->in_memblocks);

    if (n > u->in_fragments)
        n = u->in_fragments;
    
    while (n > 0) {
        if (u->in_memblocks[i]) {
            pa_memblock_unref_fixed(u->in_memblocks[i]);
            u->in_memblocks[i] = NULL;
        }

        i++;
        while (i >= u->in_fragments)
            i -= u->in_fragments;

        n--;
    }
}

static void do_read(struct userdata *u) {
    struct count_info info;
    assert(u && u->source);

    update_usage(u);
    
    if (ioctl(u->fd, SNDCTL_DSP_GETIPTR, &info) < 0) {
        pa_log("SNDCTL_DSP_GETIPTR: %s", pa_cstrerror(errno));

        clear_up(u);
        pa_module_unload_request(u->module);
        return;
    }

    info.blocks += u->in_blocks_saved;
    u->in_blocks_saved = 0;
        
    if (!info.blocks)
        return;
    
    in_post_memblocks(u, info.blocks);
    in_clear_memblocks(u, u->in_fragments/2);
}

static void io_callback(pa_mainloop_api *m, pa_io_event *e, PA_GCC_UNUSED int fd, pa_io_event_flags_t f, void *userdata) {
    struct userdata *u = userdata;
    assert (u && u->core->mainloop == m && u->io_event == e);

    if (f & PA_IO_EVENT_ERROR) {
        clear_up(u);
        pa_module_unload_request(u->module);
        return;
    }

    if (f & PA_IO_EVENT_INPUT)
        do_read(u);
    if (f & PA_IO_EVENT_OUTPUT)
        do_write(u);
}

static pa_usec_t sink_get_latency_cb(pa_sink *s) {
    struct userdata *u = s->userdata;
    struct count_info info;
    size_t bpos, n, total;
    assert(s && u);

    if (ioctl(u->fd, SNDCTL_DSP_GETOPTR, &info) < 0) {
        pa_log("SNDCTL_DSP_GETOPTR: %s", pa_cstrerror(errno));
        return 0;
    }

    u->out_blocks_saved += info.blocks;

    total = u->out_fragments * u->out_fragment_size;
    bpos = ((u->out_current + u->out_blocks_saved) * u->out_fragment_size) % total;

    if (bpos <= (size_t) info.ptr)
        n = total - (info.ptr - bpos);
    else
        n = bpos - info.ptr;

/*     pa_log("n = %u, bpos = %u, ptr = %u, total=%u, fragsize = %u, n_frags = %u\n", n, bpos, (unsigned) info.ptr, total, u->out_fragment_size, u->out_fragments); */
    
    return pa_bytes_to_usec(n, &s->sample_spec);
}

static pa_usec_t source_get_latency_cb(pa_source *s) {
    struct userdata *u = s->userdata;
    struct count_info info;
    size_t bpos, n, total;
    assert(s && u);

    if (ioctl(u->fd, SNDCTL_DSP_GETIPTR, &info) < 0) {
        pa_log("SNDCTL_DSP_GETIPTR: %s", pa_cstrerror(errno));
        return 0;
    }

    u->in_blocks_saved += info.blocks;

    total = u->in_fragments * u->in_fragment_size;
    bpos = ((u->in_current + u->in_blocks_saved) * u->in_fragment_size) % total;

    if (bpos <= (size_t) info.ptr)
        n = info.ptr - bpos;
    else
        n = (u->in_fragments * u->in_fragment_size) - bpos + info.ptr;

/*     pa_log("n = %u, bpos = %u, ptr = %u, total=%u, fragsize = %u, n_frags = %u\n", n, bpos, (unsigned) info.ptr, total, u->in_fragment_size, u->in_fragments);  */
    
    return pa_bytes_to_usec(n, &s->sample_spec);
}

static int sink_get_hw_volume(pa_sink *s) {
    struct userdata *u = s->userdata;

    if (pa_oss_get_pcm_volume(u->fd, &s->sample_spec, &s->hw_volume) < 0) {
        pa_log_info("device doesn't support reading mixer settings: %s", pa_cstrerror(errno));
        s->get_hw_volume = NULL;
        return -1;
    }

    return 0;
}

static int sink_set_hw_volume(pa_sink *s) {
    struct userdata *u = s->userdata;

    if (pa_oss_set_pcm_volume(u->fd, &s->sample_spec, &s->hw_volume) < 0) {
        pa_log_info("device doesn't support writing mixer settings: %s", pa_cstrerror(errno));
        s->set_hw_volume = NULL;
        return -1;
    }

    return 0;
}

static int source_get_hw_volume(pa_source *s) {
    struct userdata *u = s->userdata;

    if (pa_oss_get_input_volume(u->fd, &s->sample_spec, &s->hw_volume) < 0) {
        pa_log_info("device doesn't support reading mixer settings: %s", pa_cstrerror(errno));
        s->get_hw_volume = NULL;
        return -1;
    }

    return 0;
}

static int source_set_hw_volume(pa_source *s) {
    struct userdata *u = s->userdata;

    if (pa_oss_set_input_volume(u->fd, &s->sample_spec, &s->hw_volume) < 0) {
        pa_log_info("device doesn't support writing mixer settings: %s", pa_cstrerror(errno));
        s->set_hw_volume = NULL;
        return -1;
    }

    return 0;
}

int pa__init(pa_core *c, pa_module*m) {
    struct audio_buf_info info;
    struct userdata *u = NULL;
    const char *p;
    int nfrags, frag_size;
    int mode, caps;
    int enable_bits = 0, zero = 0;
    int playback = 1, record = 1;
    pa_modargs *ma = NULL;
    char hwdesc[64], *t;
    pa_channel_map map;
    const char *name;
    char *name_buf = NULL;
    int namereg_fail;

    assert(c);
    assert(m);

    m->userdata = u = pa_xnew0(struct userdata, 1);
    u->module = m;
    u->fd = -1;
    u->core = c;

    if (!(ma = pa_modargs_new(m->argument, valid_modargs))) {
        pa_log("failed to parse module arguments.");
        goto fail;
    }
    
    if (pa_modargs_get_value_boolean(ma, "record", &record) < 0 || pa_modargs_get_value_boolean(ma, "playback", &playback) < 0) {
        pa_log("record= and playback= expect numeric arguments.");
        goto fail;
    }

    if (!playback && !record) {
        pa_log("neither playback nor record enabled for device.");
        goto fail;
    }

    mode = (playback&&record) ? O_RDWR : (playback ? O_WRONLY : (record ? O_RDONLY : 0));

    nfrags = DEFAULT_NFRAGS;
    frag_size = DEFAULT_FRAGSIZE;
    if (pa_modargs_get_value_s32(ma, "fragments", &nfrags) < 0 || pa_modargs_get_value_s32(ma, "fragment_size", &frag_size) < 0) {
        pa_log("failed to parse fragments arguments");
        goto fail;
    }

    u->sample_spec = c->default_sample_spec;
    if (pa_modargs_get_sample_spec_and_channel_map(ma, &u->sample_spec, &map, PA_CHANNEL_MAP_OSS) < 0) {
        pa_log("failed to parse sample specification or channel map");
        goto fail;
    }

    if ((u->fd = pa_oss_open(p = pa_modargs_get_value(ma, "device", DEFAULT_DEVICE), &mode, &caps)) < 0)
        goto fail;

    if (!(caps & DSP_CAP_MMAP) || !(caps & DSP_CAP_TRIGGER)) {
        pa_log("OSS device not mmap capable.");
        goto fail;
    }

    pa_log_info("device opened in %s mode.", mode == O_WRONLY ? "O_WRONLY" : (mode == O_RDONLY ? "O_RDONLY" : "O_RDWR"));

    if (pa_oss_get_hw_description(p, hwdesc, sizeof(hwdesc)) >= 0)
        pa_log_info("hardware name is '%s'.", hwdesc);
    else
        hwdesc[0] = 0;

    if (nfrags >= 2 && frag_size >= 1)
        if (pa_oss_set_fragments(u->fd, nfrags, frag_size) < 0)
            goto fail;
    
    if (pa_oss_auto_format(u->fd, &u->sample_spec) < 0)
        goto fail;

    if (mode != O_WRONLY) {
        if (ioctl(u->fd, SNDCTL_DSP_GETISPACE, &info) < 0) {
            pa_log("SNDCTL_DSP_GETISPACE: %s", pa_cstrerror(errno));
            goto fail;
        }

        pa_log_info("input -- %u fragments of size %u.", info.fragstotal, info.fragsize);
        u->in_mmap_length = (u->in_fragment_size = info.fragsize) * (u->in_fragments = info.fragstotal);

        if ((u->in_mmap = mmap(NULL, u->in_mmap_length, PROT_READ, MAP_SHARED, u->fd, 0)) == MAP_FAILED) {
            if (mode == O_RDWR) {
                pa_log("mmap failed for input. Changing to O_WRONLY mode.");
                mode = O_WRONLY;
            } else {
                pa_log("mmap(): %s", pa_cstrerror(errno));
                goto fail;
            }
        } else {
            if ((name = pa_modargs_get_value(ma, "source_name", NULL)))
                namereg_fail = 1;
            else {
                name = name_buf = pa_sprintf_malloc("oss_input.%s", pa_path_get_filename(p));
                namereg_fail = 0;
            }

            if (!(u->source = pa_source_new(c, __FILE__, name, namereg_fail, &u->sample_spec, &map)))
                goto fail;
            
            u->source->userdata = u;
            u->source->get_latency = source_get_latency_cb;
            u->source->get_hw_volume = source_get_hw_volume;
            u->source->set_hw_volume = source_set_hw_volume;
            pa_source_set_owner(u->source, m);
            pa_source_set_description(u->source, t = pa_sprintf_malloc("OSS PCM/mmap() on %s%s%s%s",
                                                                       p,
                                                                       hwdesc[0] ? " (" : "",
                                                                       hwdesc[0] ? hwdesc : "",
                                                                       hwdesc[0] ? ")" : ""));
            pa_xfree(t);
            u->source->is_hardware = 1;
            
            u->in_memblocks = pa_xnew0(pa_memblock*, u->in_fragments);
            
            enable_bits |= PCM_ENABLE_INPUT;
        }
    }

    pa_xfree(name_buf);
    name_buf = NULL;
    
    if (mode != O_RDONLY) {
        if (ioctl(u->fd, SNDCTL_DSP_GETOSPACE, &info) < 0) {
            pa_log("SNDCTL_DSP_GETOSPACE: %s", pa_cstrerror(errno));
            goto fail;
        }
        
        pa_log_info("output -- %u fragments of size %u.", info.fragstotal, info.fragsize);
        u->out_mmap_length = (u->out_fragment_size = info.fragsize) * (u->out_fragments = info.fragstotal);

        if ((u->out_mmap = mmap(NULL, u->out_mmap_length, PROT_WRITE, MAP_SHARED, u->fd, 0))  == MAP_FAILED) {
            if (mode == O_RDWR) {
                pa_log("mmap filed for output. Changing to O_RDONLY mode.");
                mode = O_RDONLY;
            } else {
                pa_log("mmap(): %s", pa_cstrerror(errno));
                goto fail;
            }
        } else {
            pa_silence_memory(u->out_mmap, u->out_mmap_length, &u->sample_spec);

            if ((name = pa_modargs_get_value(ma, "sink_name", NULL)))
                namereg_fail = 1;
            else {
                name = name_buf = pa_sprintf_malloc("oss_output.%s", pa_path_get_filename(p));
                namereg_fail = 0;
            }
            
            if (!(u->sink = pa_sink_new(c, __FILE__, name, namereg_fail, &u->sample_spec, &map)))
                goto fail;

            u->sink->get_latency = sink_get_latency_cb;
            u->sink->get_hw_volume = sink_get_hw_volume;
            u->sink->set_hw_volume = sink_set_hw_volume;
            u->sink->userdata = u;
            pa_sink_set_owner(u->sink, m);
            pa_sink_set_description(u->sink, t = pa_sprintf_malloc("OSS PCM/mmap() on %s%s%s%s",
                                                                   p,
                                                                   hwdesc[0] ? " (" : "",
                                                                   hwdesc[0] ? hwdesc : "",
                                                                   hwdesc[0] ? ")" : ""));
            pa_xfree(t);
            
            u->sink->is_hardware = 1;
            u->out_memblocks = pa_xmalloc0(sizeof(struct memblock *)*u->out_fragments);
            
            enable_bits |= PCM_ENABLE_OUTPUT;
        }
    }

    pa_xfree(name_buf);
    name_buf = NULL;
    
    zero = 0;
    if (ioctl(u->fd, SNDCTL_DSP_SETTRIGGER, &zero) < 0) {
        pa_log("SNDCTL_DSP_SETTRIGGER: %s", pa_cstrerror(errno));
        goto fail;
    }
    
    if (ioctl(u->fd, SNDCTL_DSP_SETTRIGGER, &enable_bits) < 0) {
        pa_log("SNDCTL_DSP_SETTRIGGER: %s", pa_cstrerror(errno));
        goto fail;
    }
        
    assert(u->source || u->sink);

    u->io_event = c->mainloop->io_new(c->mainloop, u->fd, (u->source ? PA_IO_EVENT_INPUT : 0) | (u->sink ? PA_IO_EVENT_OUTPUT : 0), io_callback, u);
    assert(u->io_event);

    pa_modargs_free(ma);

    /* Read mixer settings */
    if (u->source)
        source_get_hw_volume(u->source);
    if (u->sink)
        sink_get_hw_volume(u->sink);
    
    return 0;

fail:
    pa__done(c, m);

    if (ma)
        pa_modargs_free(ma);

    pa_xfree(name_buf);
    
    return -1;
}

void pa__done(pa_core *c, pa_module*m) {
    struct userdata *u;
    
    assert(c);
    assert(m);

    if (!(u = m->userdata))
        return;

    clear_up(u);

    if (u->out_memblocks) {
        unsigned i;
        for (i = 0; i < u->out_fragments; i++)
            if (u->out_memblocks[i])
                pa_memblock_unref_fixed(u->out_memblocks[i]);
        pa_xfree(u->out_memblocks);
    }

    if (u->in_memblocks) {
        unsigned i;
        for (i = 0; i < u->in_fragments; i++)
            if (u->in_memblocks[i])
                pa_memblock_unref_fixed(u->in_memblocks[i]);
        pa_xfree(u->in_memblocks);
    }
    
    pa_xfree(u);
}
