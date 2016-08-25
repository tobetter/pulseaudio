/***
    This file is part of PulseAudio.

    Copyright 2016 Canonical Ltd.
    Written by Simon Fels <simon.fels@canonical.com>

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

#ifdef HAVE_CONFIG_H
#include <config.h>
#endif

#include <sys/apparmor.h>
#include <errno.h>

#include <pulsecore/i18n.h>
#include <pulsecore/core.h>
#include <pulsecore/module.h>
#include <pulse/xmalloc.h>
#include <pulsecore/fdsem.h>
#include <pulsecore/thread.h>
#include <pulsecore/core-util.h>
#include <pulse/mainloop-api.h>

#include "module-snappy-policy-symdef.h"

#define SNAP_LABEL_PREFIX           "snap."
#define SNAP_LABEL_PREFIX_LENGTH    5

PA_MODULE_AUTHOR("Simon Fels");
PA_MODULE_DESCRIPTION("Ubuntu Snappy policy management");
PA_MODULE_VERSION(PACKAGE_VERSION);
PA_MODULE_LOAD_ONCE(true);

struct userdata {
    pa_core *core;
    pa_hook_slot *connect_hook_slot;
};

static pa_hook_result_t connect_record_hook(pa_core *core, pa_access_data *d, struct userdata *u) {
    pa_client *client = pa_idxset_get_by_index(u->core->clients, d->client_index);
    if (!client)
        return PA_HOOK_OK;

    char *label = NULL;
    char *mode = NULL;
    if (aa_gettaskcon(client->creds.pid, &label, &mode) < 0) {
        pa_log_warn("Failed to retrieve apparmor security label for pid %u: %s",
                    client->creds.pid, strerror(-errno));
        return PA_HOOK_OK;
    }

    pa_hook_result_t decision = PA_HOOK_OK;

    // We only cancel the attempt of the client to start audio recording
    // when we could successfully determine that the request is coming
    // from an app which is part of a snap. Otherwise we continue to
    // work as normal.
    if (label && strncmp(SNAP_LABEL_PREFIX, label, SNAP_LABEL_PREFIX_LENGTH) == 0)
        decision = PA_HOOK_CANCEL;

    free(label);

    return decision;
}

int pa__init(pa_module *m) {
    struct userdata *u;
    u = pa_xnew0(struct userdata, 1);
    u->core = m->core;

    m->userdata = u;
    u->connect_hook_slot = pa_hook_connect(&m->core->access[PA_ACCESS_HOOK_CONNECT_RECORD],
        PA_HOOK_NORMAL, (pa_hook_cb_t) connect_record_hook, u);

    return 0;
}

void pa__done(pa_module *m) {
    struct userdata *u = m->userdata;
    if (u) {
        if (u->connect_hook_slot)
            pa_hook_slot_free(u->connect_hook_slot);
        pa_xfree(u);
    }
}
