/* $Id: module-combine.c 1333 2006-08-26 19:00:22Z lennart $ */

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

#include <assert.h>
#include <stdio.h>

#include <pulse/timeval.h>
#include <pulse/xmalloc.h>

#include <pulsecore/module.h>
#include <pulsecore/llist.h>
#include <pulsecore/sink.h>
#include <pulsecore/sink-input.h>
#include <pulsecore/memblockq.h>
#include <pulsecore/log.h>
#include <pulsecore/core-util.h>
#include <pulsecore/modargs.h>
#include <pulsecore/namereg.h>

#include "module-combine-symdef.h"

PA_MODULE_AUTHOR("Lennart Poettering")
PA_MODULE_DESCRIPTION("Combine multiple sinks to one")
PA_MODULE_VERSION(PACKAGE_VERSION)
PA_MODULE_USAGE(
        "sink_name=<name for the sink> "
        "master=<master sink> "
        "slaves=<slave sinks> "
        "adjust_time=<seconds> "
        "resample_method=<method> "
        "format=<sample format> "
        "channels=<number of channels> "
        "rate=<sample rate> "
        "channel_map=<channel map> ")

#define DEFAULT_SINK_NAME "combined"
#define MEMBLOCKQ_MAXLENGTH (1024*170)
#define RENDER_SIZE (1024*10)

#define DEFAULT_ADJUST_TIME 20

static const char* const valid_modargs[] = {
    "sink_name",
    "master",
    "slaves",
    "adjust_time",
    "resample_method",
    "format",
    "channels",
    "rate",
    "channel_map",
    NULL
};

struct output {
    struct userdata *userdata;
    pa_sink_input *sink_input;
    size_t counter;
    pa_memblockq *memblockq;
    pa_usec_t total_latency;
    PA_LLIST_FIELDS(struct output);
};

struct userdata {
    pa_module *module;
    pa_core *core;
    pa_sink *sink;
    unsigned n_outputs;
    struct output *master;
    pa_time_event *time_event;
    uint32_t adjust_time;
    
    PA_LLIST_HEAD(struct output, outputs);
};

static void output_free(struct output *o);
static void clear_up(struct userdata *u);

static void update_usage(struct userdata *u) {
    pa_module_set_used(u->module, u->sink ? pa_sink_used_by(u->sink) : 0);
}

static void adjust_rates(struct userdata *u) {
    struct output *o;
    pa_usec_t max_sink_latency = 0, min_total_latency = (pa_usec_t) -1, target_latency;
    uint32_t base_rate;
    assert(u && u->sink);

    for (o = u->outputs; o; o = o->next) {
        uint32_t sink_latency = o->sink_input->sink ? pa_sink_get_latency(o->sink_input->sink) : 0;
        
        o->total_latency = sink_latency + pa_sink_input_get_latency(o->sink_input);
        
        if (sink_latency > max_sink_latency)
            max_sink_latency = sink_latency;

        if (o->total_latency < min_total_latency)
            min_total_latency = o->total_latency;
    }

    assert(min_total_latency != (pa_usec_t) -1);

    target_latency = max_sink_latency > min_total_latency ? max_sink_latency : min_total_latency;
    
    pa_log_info("[%s] target latency is %0.0f usec.", u->sink->name, (float) target_latency);

    base_rate = u->sink->sample_spec.rate;

    for (o = u->outputs; o; o = o->next) {
        uint32_t r = base_rate; 
        
        if (o->total_latency < target_latency)
            r -= (uint32_t) (((((double) target_latency - o->total_latency))/u->adjust_time)*r/ 1000000);
        else if (o->total_latency > target_latency)
            r += (uint32_t) (((((double) o->total_latency - target_latency))/u->adjust_time)*r/ 1000000);

        if (r < (uint32_t) (base_rate*0.9) || r > (uint32_t) (base_rate*1.1))
            pa_log_warn("[%s] sample rates too different, not adjusting (%u vs. %u).", o->sink_input->name, base_rate, r);
        else {
            pa_log_info("[%s] new rate is %u Hz; ratio is %0.3f; latency is %0.0f usec.", o->sink_input->name, r, (double) r / base_rate, (float) o->total_latency);
            pa_sink_input_set_rate(o->sink_input, r);
        }
    }
}

static void request_memblock(struct userdata *u) {
    pa_memchunk chunk;
    struct output *o;
    assert(u && u->sink);

    update_usage(u);
    
    if (pa_sink_render(u->sink, RENDER_SIZE, &chunk) < 0)
        return;

    for (o = u->outputs; o; o = o->next)
        pa_memblockq_push_align(o->memblockq, &chunk);

    pa_memblock_unref(chunk.memblock);
}

static void time_callback(pa_mainloop_api*a, pa_time_event* e, PA_GCC_UNUSED const struct timeval *tv, void *userdata) {
    struct userdata *u = userdata;
    struct timeval n;
    assert(u && a && u->time_event == e);

    adjust_rates(u);

    pa_gettimeofday(&n);
    n.tv_sec += u->adjust_time;
    u->sink->core->mainloop->time_restart(e, &n);
}

static int sink_input_peek_cb(pa_sink_input *i, pa_memchunk *chunk) {
    struct output *o = i->userdata;
    assert(i && o && o->sink_input && chunk);

    if (pa_memblockq_peek(o->memblockq, chunk) >= 0)
        return 0;
    
    /* Try harder */
    request_memblock(o->userdata);
    
    return pa_memblockq_peek(o->memblockq, chunk);
}

static void sink_input_drop_cb(pa_sink_input *i, const pa_memchunk *chunk, size_t length) {
    struct output *o = i->userdata;
    assert(i && o && o->sink_input && chunk && length);

    pa_memblockq_drop(o->memblockq, chunk, length);
    o->counter += length;
}

static void sink_input_kill_cb(pa_sink_input *i) {
    struct output *o = i->userdata;
    assert(i && o && o->sink_input);
    pa_module_unload_request(o->userdata->module);
    clear_up(o->userdata);
}

static pa_usec_t sink_input_get_latency_cb(pa_sink_input *i) {
    struct output *o = i->userdata;
    assert(i && o && o->sink_input);
    
    return pa_bytes_to_usec(pa_memblockq_get_length(o->memblockq), &i->sample_spec);
}

static pa_usec_t sink_get_latency_cb(pa_sink *s) {
    struct userdata *u = s->userdata;
    assert(s && u && u->sink && u->master);

    return
        pa_sink_input_get_latency(u->master->sink_input) +
        pa_sink_get_latency(u->master->sink_input->sink);
}

static void sink_notify(pa_sink *s) {
    struct userdata *u;
    struct output *o;
    
    assert(s);
    u = s->userdata;
    assert(u);
    
    for (o = u->outputs; o; o = o->next)
        pa_sink_notify(o->sink_input->sink);
}

static struct output *output_new(struct userdata *u, pa_sink *sink, int resample_method) {
    struct output *o = NULL;
    char t[256];
    pa_sink_input_new_data data;
    
    assert(u && sink && u->sink);
    
    o = pa_xmalloc(sizeof(struct output));
    o->userdata = u;
    
    o->counter = 0;
    o->memblockq = pa_memblockq_new(
            0,
            MEMBLOCKQ_MAXLENGTH,
            MEMBLOCKQ_MAXLENGTH,
            pa_frame_size(&u->sink->sample_spec),
            1,
            0,
            NULL);

    snprintf(t, sizeof(t), "Output stream #%u of sink %s", u->n_outputs+1, u->sink->name);

    pa_sink_input_new_data_init(&data);
    data.sink = sink;
    data.driver = __FILE__;
    data.name = t;
    pa_sink_input_new_data_set_sample_spec(&data, &u->sink->sample_spec);
    pa_sink_input_new_data_set_channel_map(&data, &u->sink->channel_map);
    data.module = u->module;
    
    if (!(o->sink_input = pa_sink_input_new(u->core, &data, PA_SINK_INPUT_VARIABLE_RATE)))
        goto fail;

    o->sink_input->get_latency = sink_input_get_latency_cb;
    o->sink_input->peek = sink_input_peek_cb;
    o->sink_input->drop = sink_input_drop_cb;
    o->sink_input->kill = sink_input_kill_cb;
    o->sink_input->userdata = o;
    
    PA_LLIST_PREPEND(struct output, u->outputs, o);
    u->n_outputs++;
    return o;

fail:

    if (o) {
        if (o->sink_input) {
            pa_sink_input_disconnect(o->sink_input);
            pa_sink_input_unref(o->sink_input);
        }

        if (o->memblockq)
            pa_memblockq_free(o->memblockq);
        
        pa_xfree(o);
    }

    return NULL;
}

static void output_free(struct output *o) {
    assert(o);
    PA_LLIST_REMOVE(struct output, o->userdata->outputs, o);
    o->userdata->n_outputs--;
    pa_memblockq_free(o->memblockq);
    pa_sink_input_disconnect(o->sink_input);
    pa_sink_input_unref(o->sink_input);
    pa_xfree(o);
}

static void clear_up(struct userdata *u) {
    struct output *o;
    assert(u);
    
    if (u->time_event) {
        u->core->mainloop->time_free(u->time_event);
        u->time_event = NULL;
    }
    
    while ((o = u->outputs))
        output_free(o);

    u->master = NULL;
    
    if (u->sink) {
        pa_sink_disconnect(u->sink);
        pa_sink_unref(u->sink);
        u->sink = NULL;
    }
}

int pa__init(pa_core *c, pa_module*m) {
    struct userdata *u;
    pa_modargs *ma = NULL;
    const char *master_name, *slaves, *rm;
    pa_sink *master_sink;
    char *n = NULL;
    const char*split_state;
    struct timeval tv;
    int resample_method = -1;
    pa_sample_spec ss;
    pa_channel_map map;
    
    assert(c && m);

    if (!(ma = pa_modargs_new(m->argument, valid_modargs))) {
        pa_log("failed to parse module arguments");
        goto fail;
    }

    if ((rm = pa_modargs_get_value(ma, "resample_method", NULL))) {
        if ((resample_method = pa_parse_resample_method(rm)) < 0) {
            pa_log("invalid resample method '%s'", rm);
            goto fail;
        }
    }
    
    u = pa_xnew(struct userdata, 1);
    m->userdata = u;
    u->sink = NULL;
    u->n_outputs = 0;
    u->master = NULL;
    u->module = m;
    u->core = c;
    u->time_event = NULL;
    u->adjust_time = DEFAULT_ADJUST_TIME;
    PA_LLIST_HEAD_INIT(struct output, u->outputs);

    if (pa_modargs_get_value_u32(ma, "adjust_time", &u->adjust_time) < 0) {
        pa_log("failed to parse adjust_time value");
        goto fail;
    }
    
    if (!(master_name = pa_modargs_get_value(ma, "master", NULL)) || !(slaves = pa_modargs_get_value(ma, "slaves", NULL))) {
        pa_log("no master or slave sinks specified");
        goto fail;
    }

    if (!(master_sink = pa_namereg_get(c, master_name, PA_NAMEREG_SINK, 1))) {
        pa_log("invalid master sink '%s'", master_name);
        goto fail;
    }

    ss = master_sink->sample_spec;
    if ((pa_modargs_get_sample_spec(ma, &ss) < 0)) {
        pa_log("invalid sample specification.");
        goto fail;
    }

    if (ss.channels == master_sink->sample_spec.channels)
        map = master_sink->channel_map;
    else
        pa_channel_map_init_auto(&map, ss.channels, PA_CHANNEL_MAP_DEFAULT);

    if ((pa_modargs_get_channel_map(ma, &map) < 0)) {
        pa_log("invalid channel map.");
        goto fail;
    }

    if (ss.channels != map.channels) {
        pa_log("channel map and sample specification don't match.");
        goto fail;
    }
    
    if (!(u->sink = pa_sink_new(c, __FILE__, pa_modargs_get_value(ma, "sink_name", DEFAULT_SINK_NAME), 0, &ss, &map))) {
        pa_log("failed to create sink");
        goto fail;
    }

    pa_sink_set_owner(u->sink, m);
    pa_sink_set_description(u->sink, "Combined Sink");
    u->sink->get_latency = sink_get_latency_cb;
    u->sink->notify = sink_notify;
    u->sink->userdata = u;
    
    if (!(u->master = output_new(u, master_sink, resample_method))) {
        pa_log("failed to create master sink input on sink '%s'.", u->sink->name);
        goto fail;
    }
    
    split_state = NULL;
    while ((n = pa_split(slaves, ",", &split_state))) {
        pa_sink *slave_sink;
        
        if (!(slave_sink = pa_namereg_get(c, n, PA_NAMEREG_SINK, 1))) {
            pa_log("invalid slave sink '%s'", n);
            goto fail;
        }

        pa_xfree(n);

        if (!output_new(u, slave_sink, resample_method)) {
            pa_log("failed to create slave sink input on sink '%s'.", slave_sink->name);
            goto fail;
        }
    }
           
    if (u->n_outputs <= 1)
        pa_log_warn("WARNING: no slave sinks specified.");

    if (u->adjust_time > 0) {
        pa_gettimeofday(&tv);
        tv.tv_sec += u->adjust_time;
        u->time_event = c->mainloop->time_new(c->mainloop, &tv, time_callback, u);
    }
    
    pa_modargs_free(ma);
    return 0;    

fail:
    pa_xfree(n);
    
    if (ma)
        pa_modargs_free(ma);

    pa__done(c, m);
    return -1;
}

void pa__done(pa_core *c, pa_module*m) {
    struct userdata *u;
    assert(c && m);

    if (!(u = m->userdata))
        return;

    clear_up(u);
    pa_xfree(u);
}


