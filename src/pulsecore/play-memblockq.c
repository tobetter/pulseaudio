/* $Id: play-memblockq.c 1237 2006-08-13 16:19:56Z lennart $ */

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

#include <stdlib.h>
#include <assert.h>
#include <stdio.h>
#include <string.h>

#include <pulse/xmalloc.h>

#include <pulsecore/sink-input.h>
#include <pulsecore/gccmacro.h>

#include "play-memblockq.h"

static void sink_input_kill(pa_sink_input *i) {
    pa_memblockq *q;
    assert(i);
    assert(i->userdata);

    q = i->userdata;

    pa_sink_input_disconnect(i);
    pa_sink_input_unref(i);

    pa_memblockq_free(q);
}

static int sink_input_peek(pa_sink_input *i, pa_memchunk *chunk) {
    pa_memblockq *q;
    assert(i);
    assert(chunk);
    assert(i->userdata);

    q = i->userdata;

    return pa_memblockq_peek(q, chunk);
}

static void si_kill(PA_GCC_UNUSED pa_mainloop_api *m, void *i) {
    sink_input_kill(i);
}

static void sink_input_drop(pa_sink_input *i, const pa_memchunk*chunk, size_t length) {
    pa_memblockq *q;
    
    assert(i);
    assert(length > 0);
    assert( i->userdata);
    
    q = i->userdata;

    pa_memblockq_drop(q, chunk, length);

    if (pa_memblockq_get_length(q) <= 0)
        pa_mainloop_api_once(i->sink->core->mainloop, si_kill, i);
}

int pa_play_memblockq(
        pa_sink *sink,
        const char *name,
        const pa_sample_spec *ss,
        const pa_channel_map *map,
        pa_memblockq *q,
        pa_cvolume *volume) {
    
    pa_sink_input *si;
    pa_sink_input_new_data data;

    assert(sink);
    assert(ss);
    assert(q);

    if (pa_memblockq_get_length(q) <= 0) {
        pa_memblockq_free(q);
        return 0;
    }

    if (volume && pa_cvolume_is_muted(volume)) {
        pa_memblockq_free(q);
        return 0;
    }

    pa_sink_input_new_data_init(&data);
    data.sink = sink;
    data.name = name;
    data.driver = __FILE__;
    pa_sink_input_new_data_set_channel_map(&data, map);
    pa_sink_input_new_data_set_sample_spec(&data, ss);
    pa_sink_input_new_data_set_volume(&data, volume);
    
    if (!(si = pa_sink_input_new(sink->core, &data, 0)))
        return -1;

    si->peek = sink_input_peek;
    si->drop = sink_input_drop;
    si->kill = sink_input_kill;
    
    si->userdata = q;

    pa_sink_notify(si->sink);
    
    return 0;
}
