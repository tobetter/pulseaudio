/***
  This file is part of PulseAudio.

  Copyright 2009 Tanu Kaskinen

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

#include <dbus/dbus.h>

#include <pulsecore/core-util.h>
#include <pulsecore/dbus-util.h>
#include <pulsecore/protocol-dbus.h>

#include "iface-card-profile.h"

#include "iface-card.h"

#define OBJECT_NAME "card"

static void handle_get_index(DBusConnection *conn, DBusMessage *msg, void *userdata);
static void handle_get_name(DBusConnection *conn, DBusMessage *msg, void *userdata);
static void handle_get_driver(DBusConnection *conn, DBusMessage *msg, void *userdata);
static void handle_get_owner_module(DBusConnection *conn, DBusMessage *msg, void *userdata);
static void handle_get_sinks(DBusConnection *conn, DBusMessage *msg, void *userdata);
static void handle_get_sources(DBusConnection *conn, DBusMessage *msg, void *userdata);
static void handle_get_profiles(DBusConnection *conn, DBusMessage *msg, void *userdata);
static void handle_get_active_profile(DBusConnection *conn, DBusMessage *msg, void *userdata);
static void handle_set_active_profile(DBusConnection *conn, DBusMessage *msg, DBusMessageIter *iter, void *userdata);
static void handle_get_property_list(DBusConnection *conn, DBusMessage *msg, void *userdata);

static void handle_get_all(DBusConnection *conn, DBusMessage *msg, void *userdata);

static void handle_get_profile_by_name(DBusConnection *conn, DBusMessage *msg, void *userdata);

struct pa_dbusiface_card {
    pa_dbusiface_core *core;

    pa_card *card;
    char *path;
    pa_hashmap *profiles;
    uint32_t next_profile_index;
    pa_card_profile *active_profile;
    pa_proplist *proplist;

    pa_dbus_protocol *dbus_protocol;
    pa_subscription *subscription;
};

enum property_handler_index {
    PROPERTY_HANDLER_INDEX,
    PROPERTY_HANDLER_NAME,
    PROPERTY_HANDLER_DRIVER,
    PROPERTY_HANDLER_OWNER_MODULE,
    PROPERTY_HANDLER_SINKS,
    PROPERTY_HANDLER_SOURCES,
    PROPERTY_HANDLER_PROFILES,
    PROPERTY_HANDLER_ACTIVE_PROFILE,
    PROPERTY_HANDLER_PROPERTY_LIST,
    PROPERTY_HANDLER_MAX
};

static pa_dbus_property_handler property_handlers[PROPERTY_HANDLER_MAX] = {
    [PROPERTY_HANDLER_INDEX]          = { .property_name = "Index",         .type = "u",      .get_cb = handle_get_index,          .set_cb = NULL },
    [PROPERTY_HANDLER_NAME]           = { .property_name = "Name",          .type = "s",      .get_cb = handle_get_name,           .set_cb = NULL },
    [PROPERTY_HANDLER_DRIVER]         = { .property_name = "Driver",        .type = "s",      .get_cb = handle_get_driver,         .set_cb = NULL },
    [PROPERTY_HANDLER_OWNER_MODULE]   = { .property_name = "OwnerModule",   .type = "o",      .get_cb = handle_get_owner_module,   .set_cb = NULL },
    [PROPERTY_HANDLER_SINKS]          = { .property_name = "Sinks",         .type = "ao",     .get_cb = handle_get_sinks,          .set_cb = NULL },
    [PROPERTY_HANDLER_SOURCES]        = { .property_name = "Sources",       .type = "ao",     .get_cb = handle_get_sources,        .set_cb = NULL },
    [PROPERTY_HANDLER_PROFILES]       = { .property_name = "Profiles",      .type = "ao",     .get_cb = handle_get_profiles,       .set_cb = NULL },
    [PROPERTY_HANDLER_ACTIVE_PROFILE] = { .property_name = "ActiveProfile", .type = "o",      .get_cb = handle_get_active_profile, .set_cb = handle_set_active_profile },
    [PROPERTY_HANDLER_PROPERTY_LIST]  = { .property_name = "PropertyList",  .type = "a{say}", .get_cb = handle_get_property_list,  .set_cb = NULL }
};

enum method_handler_index {
    METHOD_HANDLER_GET_PROFILE_BY_NAME,
    METHOD_HANDLER_MAX
};

static pa_dbus_arg_info get_profile_by_name_args[] = { { "name", "s", "in" }, { "profile", "o", "out" } };

static pa_dbus_method_handler method_handlers[METHOD_HANDLER_MAX] = {
    [METHOD_HANDLER_GET_PROFILE_BY_NAME] = {
        .method_name = "GetProfileByName",
        .arguments = get_profile_by_name_args,
        .n_arguments = sizeof(get_profile_by_name_args) / sizeof(pa_dbus_arg_info),
        .receive_cb = handle_get_profile_by_name }
};

enum signal_index {
    SIGNAL_ACTIVE_PROFILE_UPDATED,
    SIGNAL_PROPERTY_LIST_UPDATED,
    SIGNAL_MAX
};

static pa_dbus_arg_info active_profile_updated_args[] = { { "profile",       "o",      NULL } };
static pa_dbus_arg_info property_list_updated_args[] =  { { "property_list", "a{say}", NULL } };

static pa_dbus_signal_info signals[SIGNAL_MAX] = {
    [SIGNAL_ACTIVE_PROFILE_UPDATED] = { .name = "ActiveProfileUpdated", .arguments = active_profile_updated_args, .n_arguments = 1 },
    [SIGNAL_PROPERTY_LIST_UPDATED]  = { .name = "PropertyListUpdated",  .arguments = property_list_updated_args,  .n_arguments = 1 }
};

static pa_dbus_interface_info card_interface_info = {
    .name = PA_DBUSIFACE_CARD_INTERFACE,
    .method_handlers = method_handlers,
    .n_method_handlers = METHOD_HANDLER_MAX,
    .property_handlers = property_handlers,
    .n_property_handlers = PROPERTY_HANDLER_MAX,
    .get_all_properties_cb = handle_get_all,
    .signals = signals,
    .n_signals = SIGNAL_MAX
};

static void handle_get_index(DBusConnection *conn, DBusMessage *msg, void *userdata) {
    pa_dbusiface_card *c = userdata;
    dbus_uint32_t idx;

    pa_assert(conn);
    pa_assert(msg);
    pa_assert(c);

    idx = c->card->index;

    pa_dbus_send_basic_variant_reply(conn, msg, DBUS_TYPE_UINT32, &idx);
}

static void handle_get_name(DBusConnection *conn, DBusMessage *msg, void *userdata) {
    pa_dbusiface_card *c = userdata;

    pa_assert(conn);
    pa_assert(msg);
    pa_assert(c);

    pa_dbus_send_basic_variant_reply(conn, msg, DBUS_TYPE_STRING, &c->card->name);
}

static void handle_get_driver(DBusConnection *conn, DBusMessage *msg, void *userdata) {
    pa_dbusiface_card *c = userdata;

    pa_assert(conn);
    pa_assert(msg);
    pa_assert(c);

    pa_dbus_send_basic_variant_reply(conn, msg, DBUS_TYPE_STRING, &c->card->driver);
}

static void handle_get_owner_module(DBusConnection *conn, DBusMessage *msg, void *userdata) {
    pa_dbusiface_card *c = userdata;
    const char *owner_module;

    pa_assert(conn);
    pa_assert(msg);
    pa_assert(c);

    if (!c->card->module) {
        pa_dbus_send_error(conn, msg, PA_DBUS_ERROR_NO_SUCH_PROPERTY, "Card %s doesn't have an owner module.", c->card->name);
        return;
    }

    owner_module = pa_dbusiface_core_get_module_path(c->core, c->card->module);

    pa_dbus_send_basic_variant_reply(conn, msg, DBUS_TYPE_OBJECT_PATH, &owner_module);
}

/* The caller frees the array, but not the strings. */
static const char **get_sinks(pa_dbusiface_card *c, unsigned *n) {
    const char **sinks = NULL;
    unsigned i = 0;
    uint32_t idx = 0;
    pa_sink *sink = NULL;

    pa_assert(c);
    pa_assert(n);

    *n = pa_idxset_size(c->card->sinks);

    if (*n == 0)
        return NULL;

    sinks = pa_xnew(const char *, *n);

    PA_IDXSET_FOREACH(sink, c->card->sinks, idx) {
        sinks[i] = pa_dbusiface_core_get_sink_path(c->core, sink);
        ++i;
    }

    return sinks;
}

static void handle_get_sinks(DBusConnection *conn, DBusMessage *msg, void *userdata) {
    pa_dbusiface_card *c = userdata;
    const char **sinks;
    unsigned n_sinks;

    pa_assert(conn);
    pa_assert(msg);
    pa_assert(c);

    sinks = get_sinks(c, &n_sinks);

    pa_dbus_send_basic_array_variant_reply(conn, msg, DBUS_TYPE_OBJECT_PATH, sinks, n_sinks);

    pa_xfree(sinks);
}

/* The caller frees the array, but not the strings. */
static const char **get_sources(pa_dbusiface_card *c, unsigned *n) {
    const char **sources = NULL;
    unsigned i = 0;
    uint32_t idx = 0;
    pa_source *source = NULL;

    pa_assert(c);
    pa_assert(n);

    *n = pa_idxset_size(c->card->sources);

    if (*n == 0)
        return NULL;

    sources = pa_xnew(const char *, *n);

    PA_IDXSET_FOREACH(source, c->card->sinks, idx) {
        sources[i] = pa_dbusiface_core_get_source_path(c->core, source);
        ++i;
    }

    return sources;
}

static void handle_get_sources(DBusConnection *conn, DBusMessage *msg, void *userdata) {
    pa_dbusiface_card *c = userdata;
    const char **sources;
    unsigned n_sources;

    pa_assert(conn);
    pa_assert(msg);
    pa_assert(c);

    sources = get_sources(c, &n_sources);

    pa_dbus_send_basic_array_variant_reply(conn, msg, DBUS_TYPE_OBJECT_PATH, sources, n_sources);

    pa_xfree(sources);
}

/* The caller frees the array, but not the strings. */
static const char **get_profiles(pa_dbusiface_card *c, unsigned *n) {
    const char **profiles;
    unsigned i = 0;
    void *state = NULL;
    pa_dbusiface_card_profile *profile;

    pa_assert(c);
    pa_assert(n);

    *n = pa_hashmap_size(c->profiles);

    if (*n == 0)
        return NULL;

    profiles = pa_xnew(const char *, *n);

    PA_HASHMAP_FOREACH(profile, c->profiles, state)
        profiles[i++] = pa_dbusiface_card_profile_get_path(profile);

    return profiles;
}

static void handle_get_profiles(DBusConnection *conn, DBusMessage *msg, void *userdata) {
    pa_dbusiface_card *c = userdata;
    const char **profiles;
    unsigned n_profiles;

    pa_assert(conn);
    pa_assert(msg);
    pa_assert(c);

    profiles = get_profiles(c, &n_profiles);

    pa_dbus_send_basic_array_variant_reply(conn, msg, DBUS_TYPE_OBJECT_PATH, profiles, n_profiles);

    pa_xfree(profiles);
}

static void handle_get_active_profile(DBusConnection *conn, DBusMessage *msg, void *userdata) {
    pa_dbusiface_card *c = userdata;
    const char *active_profile;

    pa_assert(conn);
    pa_assert(msg);
    pa_assert(c);

    if (!c->active_profile) {
        pa_assert(pa_hashmap_isempty(c->profiles));

        pa_dbus_send_error(conn, msg, PA_DBUS_ERROR_NO_SUCH_PROPERTY,
                           "The card %s has no profiles, and therefore there's no active profile either.", c->card->name);
        return;
    }

    active_profile = pa_dbusiface_card_profile_get_path(pa_hashmap_get(c->profiles, c->active_profile->name));

    pa_dbus_send_basic_variant_reply(conn, msg, DBUS_TYPE_OBJECT_PATH, &active_profile);
}

static void handle_set_active_profile(DBusConnection *conn, DBusMessage *msg, DBusMessageIter *iter, void *userdata) {
    pa_dbusiface_card *c = userdata;
    const char *new_active_path;
    pa_dbusiface_card_profile *new_active;
    int r;

    pa_assert(conn);
    pa_assert(msg);
    pa_assert(iter);
    pa_assert(c);

    if (!c->active_profile) {
        pa_assert(pa_hashmap_isempty(c->profiles));

        pa_dbus_send_error(conn, msg, PA_DBUS_ERROR_NO_SUCH_PROPERTY,
                           "The card %s has no profiles, and therefore there's no active profile either.",
                           c->card->name);
        return;
    }

    dbus_message_iter_get_basic(iter, &new_active_path);

    if (!(new_active = pa_hashmap_get(c->profiles, new_active_path))) {
        pa_dbus_send_error(conn, msg, PA_DBUS_ERROR_NOT_FOUND, "%s: No such profile.", new_active_path);
        return;
    }

    if ((r = pa_card_set_profile(c->card, pa_dbusiface_card_profile_get_name(new_active), TRUE)) < 0) {
        pa_dbus_send_error(conn, msg, DBUS_ERROR_FAILED,
                           "Internal error in PulseAudio: pa_card_set_profile() failed with error code %i.", r);
        return;
    }

    pa_dbus_send_empty_reply(conn, msg);
}

static void handle_get_property_list(DBusConnection *conn, DBusMessage *msg, void *userdata) {
    pa_dbusiface_card *c = userdata;

    pa_assert(conn);
    pa_assert(msg);
    pa_assert(c);

    pa_dbus_send_proplist_variant_reply(conn, msg, c->proplist);
}

static void handle_get_all(DBusConnection *conn, DBusMessage *msg, void *userdata) {
    pa_dbusiface_card *c = userdata;
    DBusMessage *reply = NULL;
    DBusMessageIter msg_iter;
    DBusMessageIter dict_iter;
    dbus_uint32_t idx;
    const char *owner_module = NULL;
    const char **sinks = NULL;
    unsigned n_sinks = 0;
    const char **sources = NULL;
    unsigned n_sources = 0;
    const char **profiles = NULL;
    unsigned n_profiles = 0;
    const char *active_profile = NULL;

    pa_assert(conn);
    pa_assert(msg);
    pa_assert(c);

    idx = c->card->index;
    if (c->card->module)
        owner_module = pa_dbusiface_core_get_module_path(c->core, c->card->module);
    sinks = get_sinks(c, &n_sinks);
    sources = get_sources(c, &n_sources);
    profiles = get_profiles(c, &n_profiles);
    if (c->active_profile)
        active_profile = pa_dbusiface_card_profile_get_path(pa_hashmap_get(c->profiles, c->active_profile->name));

    pa_assert_se((reply = dbus_message_new_method_return(msg)));

    dbus_message_iter_init_append(reply, &msg_iter);
    pa_assert_se(dbus_message_iter_open_container(&msg_iter, DBUS_TYPE_ARRAY, "{sv}", &dict_iter));

    pa_dbus_append_basic_variant_dict_entry(&dict_iter, property_handlers[PROPERTY_HANDLER_INDEX].property_name, DBUS_TYPE_UINT32, &idx);
    pa_dbus_append_basic_variant_dict_entry(&dict_iter, property_handlers[PROPERTY_HANDLER_NAME].property_name, DBUS_TYPE_STRING, &c->card->name);
    pa_dbus_append_basic_variant_dict_entry(&dict_iter, property_handlers[PROPERTY_HANDLER_DRIVER].property_name, DBUS_TYPE_STRING, &c->card->driver);

    if (owner_module)
        pa_dbus_append_basic_variant_dict_entry(&dict_iter, property_handlers[PROPERTY_HANDLER_OWNER_MODULE].property_name, DBUS_TYPE_OBJECT_PATH, &owner_module);

    pa_dbus_append_basic_array_variant_dict_entry(&dict_iter, property_handlers[PROPERTY_HANDLER_SINKS].property_name, DBUS_TYPE_OBJECT_PATH, sinks, n_sinks);
    pa_dbus_append_basic_array_variant_dict_entry(&dict_iter, property_handlers[PROPERTY_HANDLER_SOURCES].property_name, DBUS_TYPE_OBJECT_PATH, sources, n_sources);
    pa_dbus_append_basic_array_variant_dict_entry(&dict_iter, property_handlers[PROPERTY_HANDLER_PROFILES].property_name, DBUS_TYPE_OBJECT_PATH, profiles, n_profiles);

    if (active_profile)
        pa_dbus_append_basic_variant_dict_entry(&dict_iter, property_handlers[PROPERTY_HANDLER_ACTIVE_PROFILE].property_name, DBUS_TYPE_OBJECT_PATH, &active_profile);

    pa_dbus_append_proplist_variant_dict_entry(&dict_iter, property_handlers[PROPERTY_HANDLER_PROPERTY_LIST].property_name, c->proplist);

    pa_assert_se(dbus_message_iter_close_container(&msg_iter, &dict_iter));

    pa_assert_se(dbus_connection_send(conn, reply, NULL));

    dbus_message_unref(reply);

    pa_xfree(sinks);
    pa_xfree(sources);
    pa_xfree(profiles);
}

static void handle_get_profile_by_name(DBusConnection *conn, DBusMessage *msg, void *userdata) {
    pa_dbusiface_card *c = userdata;
    const char *profile_name = NULL;
    pa_dbusiface_card_profile *profile = NULL;
    const char *profile_path = NULL;

    pa_assert(conn);
    pa_assert(msg);
    pa_assert(c);

    pa_assert_se(dbus_message_get_args(msg, NULL, DBUS_TYPE_STRING, &profile_name, DBUS_TYPE_INVALID));

    if (!(profile = pa_hashmap_get(c->profiles, profile_name))) {
        pa_dbus_send_error(conn, msg, PA_DBUS_ERROR_NOT_FOUND, "%s: No such profile on card %s.", profile_name, c->card->name);
        return;
    }

    profile_path = pa_dbusiface_card_profile_get_path(profile);

    pa_dbus_send_basic_value_reply(conn, msg, DBUS_TYPE_OBJECT_PATH, &profile_path);
}

static void subscription_cb(pa_core *core, pa_subscription_event_type_t t, uint32_t idx, void *userdata) {
    pa_dbusiface_card *c = userdata;
    DBusMessage *signal_msg = NULL;

    pa_assert(core);
    pa_assert((t & PA_SUBSCRIPTION_EVENT_FACILITY_MASK) == PA_SUBSCRIPTION_EVENT_CARD);
    pa_assert(c);

    /* We can't use idx != c->card->index, because the c->card pointer may
     * be stale at this point. */
    if (pa_idxset_get_by_index(core->cards, idx) != c->card)
        return;

    if ((t & PA_SUBSCRIPTION_EVENT_TYPE_MASK) != PA_SUBSCRIPTION_EVENT_CHANGE)
        return;

    if (c->active_profile != c->card->active_profile) {
        const char *object_path;

        c->active_profile = c->card->active_profile;
        object_path = pa_dbusiface_card_profile_get_path(pa_hashmap_get(c->profiles, c->active_profile->name));

        pa_assert_se(signal_msg = dbus_message_new_signal(c->path,
							  PA_DBUSIFACE_CARD_INTERFACE,
							  signals[SIGNAL_ACTIVE_PROFILE_UPDATED].name));
        pa_assert_se(dbus_message_append_args(signal_msg, DBUS_TYPE_OBJECT_PATH, &object_path, DBUS_TYPE_INVALID));

        pa_dbus_protocol_send_signal(c->dbus_protocol, signal_msg);
        dbus_message_unref(signal_msg);
        signal_msg = NULL;
    }

    if (!pa_proplist_equal(c->proplist, c->card->proplist)) {
        DBusMessageIter msg_iter;

        pa_proplist_update(c->proplist, PA_UPDATE_SET, c->card->proplist);

        pa_assert_se(signal_msg = dbus_message_new_signal(c->path,
							  PA_DBUSIFACE_CARD_INTERFACE,
							  signals[SIGNAL_PROPERTY_LIST_UPDATED].name));
        dbus_message_iter_init_append(signal_msg, &msg_iter);
        pa_dbus_append_proplist(&msg_iter, c->proplist);

        pa_dbus_protocol_send_signal(c->dbus_protocol, signal_msg);
        dbus_message_unref(signal_msg);
        signal_msg = NULL;
    }
}

pa_dbusiface_card *pa_dbusiface_card_new(pa_dbusiface_core *core, pa_card *card) {
    pa_dbusiface_card *c = NULL;

    pa_assert(core);
    pa_assert(card);

    c = pa_xnew0(pa_dbusiface_card, 1);
    c->core = core;
    c->card = card;
    c->path = pa_sprintf_malloc("%s/%s%u", PA_DBUS_CORE_OBJECT_PATH, OBJECT_NAME, card->index);
    c->profiles = pa_hashmap_new(pa_idxset_string_hash_func, pa_idxset_string_compare_func);
    c->next_profile_index = 0;
    c->active_profile = NULL;
    c->proplist = pa_proplist_copy(card->proplist);
    c->dbus_protocol = pa_dbus_protocol_get(card->core);
    c->subscription = pa_subscription_new(card->core, PA_SUBSCRIPTION_MASK_CARD, subscription_cb, c);

    if (card->profiles) {
        pa_card_profile *profile;
        void *state = NULL;

        PA_HASHMAP_FOREACH(profile, card->profiles, state) {
            pa_dbusiface_card_profile *p = pa_dbusiface_card_profile_new(c, card->core, profile, c->next_profile_index++);
            pa_hashmap_put(c->profiles, pa_dbusiface_card_profile_get_name(p), p);
        }
        pa_assert_se(c->active_profile = card->active_profile);
    }

    pa_assert_se(pa_dbus_protocol_add_interface(c->dbus_protocol, c->path, &card_interface_info, c) >= 0);

    return c;
}

static void profile_free_cb(void *p, void *userdata) {
    pa_dbusiface_card_profile *profile = p;

    pa_assert(profile);

    pa_dbusiface_card_profile_free(profile);
}

void pa_dbusiface_card_free(pa_dbusiface_card *c) {
    pa_assert(c);

    pa_assert_se(pa_dbus_protocol_remove_interface(c->dbus_protocol, c->path, card_interface_info.name) >= 0);

    pa_hashmap_free(c->profiles, profile_free_cb, NULL);
    pa_proplist_free(c->proplist);
    pa_dbus_protocol_unref(c->dbus_protocol);
    pa_subscription_free(c->subscription);

    pa_xfree(c->path);
    pa_xfree(c);
}

const char *pa_dbusiface_card_get_path(pa_dbusiface_card *c) {
    pa_assert(c);

    return c->path;
}
