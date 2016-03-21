#ifndef foocorehfoo
#define foocorehfoo

/***
  This file is part of PulseAudio.

  Copyright 2004-2006 Lennart Poettering

  PulseAudio is free software; you can redistribute it and/or modify
  it under the terms of the GNU Lesser General Public License as published
  by the Free Software Foundation; either version 2.1 of the License,
  or (at your option) any later version.

  PulseAudio is distributed in the hope that it will be useful, but
  WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
  General Public License for more details.

  You should have received a copy of the GNU Lesser General Public License
  along with PulseAudio; if not, see <http://www.gnu.org/licenses/>.
***/

#include <pulsecore/typedefs.h>
#include <pulse/mainloop-api.h>
#include <pulse/sample.h>
#include <pulsecore/cpu.h>

/* This is a bitmask that encodes the cause why a sink/source is
 * suspended. */
typedef enum pa_suspend_cause {
    PA_SUSPEND_USER = 1,         /* Exposed to the user via some protocol */
    PA_SUSPEND_APPLICATION = 2,  /* Used by the device reservation logic */
    PA_SUSPEND_IDLE = 4,         /* Used by module-suspend-on-idle */
    PA_SUSPEND_SESSION = 8,      /* Used by module-hal for mark inactive sessions */
    PA_SUSPEND_PASSTHROUGH = 16, /* Used to suspend monitor sources when the sink is in passthrough mode */
    PA_SUSPEND_INTERNAL = 32,    /* This is used for short period server-internal suspends, such as for sample rate updates */
    PA_SUSPEND_ALL = 0xFFFF      /* Magic cause that can be used to resume forcibly */
} pa_suspend_cause_t;

#include <pulsecore/idxset.h>
#include <pulsecore/hashmap.h>
#include <pulsecore/memblock.h>
#include <pulsecore/resampler.h>
#include <pulsecore/llist.h>
#include <pulsecore/hook-list.h>
#include <pulsecore/asyncmsgq.h>
#include <pulsecore/sample-util.h>
#include <pulsecore/sink.h>
#include <pulsecore/source.h>
#include <pulsecore/core-subscribe.h>
#include <pulsecore/msgobject.h>

typedef enum pa_server_type {
    PA_SERVER_TYPE_UNSET,
    PA_SERVER_TYPE_USER,
    PA_SERVER_TYPE_SYSTEM,
    PA_SERVER_TYPE_NONE
} pa_server_type_t;

typedef enum pa_core_state {
    PA_CORE_STARTUP,
    PA_CORE_RUNNING,
    PA_CORE_SHUTDOWN
} pa_core_state_t;

typedef enum pa_core_hook {
    PA_CORE_HOOK_SINK_NEW,
    PA_CORE_HOOK_SINK_FIXATE,
    PA_CORE_HOOK_SINK_PUT,
    PA_CORE_HOOK_SINK_UNLINK,
    PA_CORE_HOOK_SINK_UNLINK_POST,
    PA_CORE_HOOK_SINK_STATE_CHANGED,
    PA_CORE_HOOK_SINK_PROPLIST_CHANGED,
    PA_CORE_HOOK_SINK_PORT_CHANGED,
    PA_CORE_HOOK_SINK_FLAGS_CHANGED,
    PA_CORE_HOOK_SINK_VOLUME_CHANGED,
    PA_CORE_HOOK_SINK_MUTE_CHANGED,
    PA_CORE_HOOK_SOURCE_NEW,
    PA_CORE_HOOK_SOURCE_FIXATE,
    PA_CORE_HOOK_SOURCE_PUT,
    PA_CORE_HOOK_SOURCE_UNLINK,
    PA_CORE_HOOK_SOURCE_UNLINK_POST,
    PA_CORE_HOOK_SOURCE_STATE_CHANGED,
    PA_CORE_HOOK_SOURCE_PROPLIST_CHANGED,
    PA_CORE_HOOK_SOURCE_PORT_CHANGED,
    PA_CORE_HOOK_SOURCE_FLAGS_CHANGED,
    PA_CORE_HOOK_SOURCE_VOLUME_CHANGED,
    PA_CORE_HOOK_SOURCE_MUTE_CHANGED,
    PA_CORE_HOOK_SINK_INPUT_NEW,
    PA_CORE_HOOK_SINK_INPUT_FIXATE,
    PA_CORE_HOOK_SINK_INPUT_PUT,
    PA_CORE_HOOK_SINK_INPUT_UNLINK,
    PA_CORE_HOOK_SINK_INPUT_UNLINK_POST,
    PA_CORE_HOOK_SINK_INPUT_MOVE_START,
    PA_CORE_HOOK_SINK_INPUT_MOVE_FINISH,
    PA_CORE_HOOK_SINK_INPUT_MOVE_FAIL,
    PA_CORE_HOOK_SINK_INPUT_STATE_CHANGED,
    PA_CORE_HOOK_SINK_INPUT_PROPLIST_CHANGED,
    PA_CORE_HOOK_SINK_INPUT_VOLUME_CHANGED,
    PA_CORE_HOOK_SINK_INPUT_MUTE_CHANGED,
    PA_CORE_HOOK_SINK_INPUT_SEND_EVENT,
    PA_CORE_HOOK_SOURCE_OUTPUT_NEW,
    PA_CORE_HOOK_SOURCE_OUTPUT_FIXATE,
    PA_CORE_HOOK_SOURCE_OUTPUT_PUT,
    PA_CORE_HOOK_SOURCE_OUTPUT_UNLINK,
    PA_CORE_HOOK_SOURCE_OUTPUT_UNLINK_POST,
    PA_CORE_HOOK_SOURCE_OUTPUT_MOVE_START,
    PA_CORE_HOOK_SOURCE_OUTPUT_MOVE_FINISH,
    PA_CORE_HOOK_SOURCE_OUTPUT_MOVE_FAIL,
    PA_CORE_HOOK_SOURCE_OUTPUT_STATE_CHANGED,
    PA_CORE_HOOK_SOURCE_OUTPUT_PROPLIST_CHANGED,
    PA_CORE_HOOK_SOURCE_OUTPUT_VOLUME_CHANGED,
    PA_CORE_HOOK_SOURCE_OUTPUT_MUTE_CHANGED,
    PA_CORE_HOOK_SOURCE_OUTPUT_SEND_EVENT,
    PA_CORE_HOOK_CLIENT_NEW,
    PA_CORE_HOOK_CLIENT_PUT,
    PA_CORE_HOOK_CLIENT_UNLINK,
    PA_CORE_HOOK_CLIENT_PROPLIST_CHANGED,
    PA_CORE_HOOK_CLIENT_SEND_EVENT,
    PA_CORE_HOOK_CARD_NEW,
    PA_CORE_HOOK_CARD_PUT,
    PA_CORE_HOOK_CARD_UNLINK,
    PA_CORE_HOOK_CARD_PROFILE_CHANGED,
    PA_CORE_HOOK_CARD_PROFILE_CHANGING,
    PA_CORE_HOOK_CARD_PROFILE_ADDED,
    PA_CORE_HOOK_CARD_PROFILE_AVAILABLE_CHANGED,
    PA_CORE_HOOK_PORT_AVAILABLE_CHANGED,
    PA_CORE_HOOK_PORT_LATENCY_OFFSET_CHANGED,
    PA_CORE_HOOK_DEFAULT_SINK_CHANGED,
    PA_CORE_HOOK_DEFAULT_SOURCE_CHANGED,
    PA_CORE_HOOK_MODULE_NEW,
    PA_CORE_HOOK_MODULE_PROPLIST_CHANGED,
    PA_CORE_HOOK_MODULE_UNLINK,
    PA_CORE_HOOK_SAMPLE_CACHE_NEW,
    PA_CORE_HOOK_SAMPLE_CACHE_CHANGED,
    PA_CORE_HOOK_SAMPLE_CACHE_UNLINK,
    PA_CORE_HOOK_MAX
} pa_core_hook_t;

/* The core structure of PulseAudio. Every PulseAudio daemon contains
 * exactly one of these. It is used for storing kind of global
 * variables for the daemon. */

struct pa_core {
    pa_msgobject parent;

    pa_core_state_t state;

    /* A random value which may be used to identify this instance of
     * PulseAudio. Not cryptographically secure in any way. */
    uint32_t cookie;

    pa_mainloop_api *mainloop;

    /* idxset of all kinds of entities */
    pa_idxset *clients, *cards, *sinks, *sources, *sink_inputs, *source_outputs, *modules, *scache;

    /* Some hashmaps for all sorts of entities */
    pa_hashmap *namereg, *shared;

    /* The default sink/source */
    pa_source *default_source;
    pa_sink *default_sink;

    pa_channel_map default_channel_map;
    pa_sample_spec default_sample_spec;
    uint32_t alternate_sample_rate;
    unsigned default_n_fragments, default_fragment_size_msec;
    unsigned deferred_volume_safety_margin_usec;
    int deferred_volume_extra_delay_usec;
    unsigned lfe_crossover_freq;

    pa_defer_event *module_defer_unload_event;
    pa_hashmap *modules_pending_unload; /* pa_module -> pa_module (hashmap-as-a-set) */

    pa_defer_event *subscription_defer_event;
    PA_LLIST_HEAD(pa_subscription, subscriptions);
    PA_LLIST_HEAD(pa_subscription_event, subscription_event_queue);
    pa_subscription_event *subscription_event_last;

    /* The mempool is used for data we write to, it's readonly for the client.
       The rw_mempool is used for data writable by both server and client (and
       can be NULL in some cases). */
    pa_mempool *mempool, *rw_mempool;
    pa_silence_cache silence_cache;

    pa_time_event *exit_event;
    pa_time_event *scache_auto_unload_event;

    int exit_idle_time, scache_idle_time;

    bool flat_volumes:1;
    bool disallow_module_loading:1;
    bool disallow_exit:1;
    bool running_as_daemon:1;
    bool realtime_scheduling:1;
    bool disable_remixing:1;
    bool disable_lfe_remixing:1;
    bool deferred_volume:1;

    pa_resample_method_t resample_method;
    int realtime_priority;

    pa_server_type_t server_type;
    pa_cpu_info cpu_info;

    /* hooks */
    pa_hook hooks[PA_CORE_HOOK_MAX];
};

PA_DECLARE_PUBLIC_CLASS(pa_core);
#define PA_CORE(o) pa_core_cast(o)

enum {
    PA_CORE_MESSAGE_UNLOAD_MODULE,
    PA_CORE_MESSAGE_MAX
};

pa_core* pa_core_new(pa_mainloop_api *m, bool shared, size_t shm_size);

/* Check whether no one is connected to this core */
void pa_core_check_idle(pa_core *c);

int pa_core_exit(pa_core *c, bool force, int retval);

void pa_core_maybe_vacuum(pa_core *c);

/* wrapper for c->mainloop->time_*() RT time events */
pa_time_event* pa_core_rttime_new(pa_core *c, pa_usec_t usec, pa_time_event_cb_t cb, void *userdata);
void pa_core_rttime_restart(pa_core *c, pa_time_event *e, pa_usec_t usec);

#endif
