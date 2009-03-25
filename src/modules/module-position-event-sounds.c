/***
  This file is part of PulseAudio.

  Copyright 2006 Lennart Poettering

  PulseAudio is free software; you can redistribute it and/or modify
  it under the terms of the GNU Lesser General Public License as published
  by the Free Software Foundation; either version 2.1 of the License,
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

#include <unistd.h>
#include <string.h>
#include <errno.h>
#include <sys/types.h>
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

#include <pulse/xmalloc.h>
#include <pulse/volume.h>
#include <pulse/channelmap.h>

#include <pulsecore/core-error.h>
#include <pulsecore/module.h>
#include <pulsecore/core-util.h>
#include <pulsecore/modargs.h>
#include <pulsecore/log.h>
#include <pulsecore/sink-input.h>

#include "module-position-event-sounds-symdef.h"

PA_MODULE_AUTHOR("Lennart Poettering");
PA_MODULE_DESCRIPTION("Position event sounds between L and R depending on the position on screen of the widget triggering them.");
PA_MODULE_VERSION(PACKAGE_VERSION);
PA_MODULE_LOAD_ONCE(TRUE);

static const char* const valid_modargs[] = {
    NULL
};

struct userdata {
    pa_hook_slot *sink_input_fixate_hook_slot;
};

static pa_hook_result_t sink_input_fixate_hook_callback(pa_core *core, pa_sink_input_new_data *data, struct userdata *u) {
    const char *hpos;
    double f;
    char t[PA_CVOLUME_SNPRINT_MAX];
    pa_cvolume v;

    pa_assert(data);

    if (!(hpos = pa_proplist_gets(data->proplist, PA_PROP_EVENT_MOUSE_HPOS)))
        return PA_HOOK_OK;

    if (pa_atod(hpos, &f) < 0) {
        pa_log_warn("Failed to parse "PA_PROP_EVENT_MOUSE_HPOS" property '%s'.", hpos);
        return PA_HOOK_OK;
    }

    if (f < 0.0 || f > 1.0) {
        pa_log_warn("Property "PA_PROP_EVENT_MOUSE_HPOS" out of range %0.2f", f);
        return PA_HOOK_OK;
    }

    pa_log_debug("Positioning event sound '%s' at %0.2f.", pa_strnull(pa_proplist_gets(data->proplist, PA_PROP_EVENT_ID)), f);

    pa_cvolume_reset(&v, data->sample_spec.channels);
    pa_cvolume_set_balance(&v, &data->channel_map, f*2.0-1.0);

    pa_log_debug("Final volume factor %s.", pa_cvolume_snprint(t, sizeof(t), &v));

    pa_sink_input_new_data_apply_volume_factor(data, &v);

    return PA_HOOK_OK;
}

int pa__init(pa_module*m) {
    pa_modargs *ma = NULL;
    struct userdata *u;

    pa_assert(m);

    if (!(ma = pa_modargs_new(m->argument, valid_modargs))) {
        pa_log("Failed to parse module arguments");
        goto fail;
    }

    m->userdata = u = pa_xnew(struct userdata, 1);
    u->sink_input_fixate_hook_slot = pa_hook_connect(&m->core->hooks[PA_CORE_HOOK_SINK_INPUT_FIXATE], PA_HOOK_EARLY, (pa_hook_cb_t) sink_input_fixate_hook_callback, u);

    pa_modargs_free(ma);

    return 0;

fail:
    pa__done(m);

    if (ma)
        pa_modargs_free(ma);

    return  -1;
}

void pa__done(pa_module*m) {
    struct userdata* u;

    pa_assert(m);

    if (!(u = m->userdata))
        return;

    if (u->sink_input_fixate_hook_slot)
        pa_hook_slot_free(u->sink_input_fixate_hook_slot);

    pa_xfree(u);
}
