/* $Id: protocol-native.c 1303 2006-08-19 23:06:45Z lennart $ */

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

#include <string.h>
#include <stdio.h>
#include <assert.h>
#include <stdlib.h>
#include <unistd.h>

#include <pulse/timeval.h>
#include <pulse/version.h>
#include <pulse/utf8.h>
#include <pulse/util.h>
#include <pulse/xmalloc.h>

#include <pulsecore/native-common.h>
#include <pulsecore/packet.h>
#include <pulsecore/client.h>
#include <pulsecore/source-output.h>
#include <pulsecore/sink-input.h>
#include <pulsecore/pstream.h>
#include <pulsecore/tagstruct.h>
#include <pulsecore/pdispatch.h>
#include <pulsecore/pstream-util.h>
#include <pulsecore/authkey.h>
#include <pulsecore/namereg.h>
#include <pulsecore/core-scache.h>
#include <pulsecore/core-subscribe.h>
#include <pulsecore/log.h>
#include <pulsecore/autoload.h>
#include <pulsecore/authkey-prop.h>
#include <pulsecore/strlist.h>
#include <pulsecore/props.h>
#include <pulsecore/sample-util.h>
#include <pulsecore/llist.h>
#include <pulsecore/creds.h>
#include <pulsecore/core-util.h>
#include <pulsecore/ipacl.h>

#include "protocol-native.h"

/* Kick a client if it doesn't authenticate within this time */
#define AUTH_TIMEOUT 60

/* Don't accept more connection than this */
#define MAX_CONNECTIONS 64

#define MAX_MEMBLOCKQ_LENGTH (4*1024*1024) /* 4MB */

struct connection;
struct pa_protocol_native;

struct record_stream {
    struct connection *connection;
    uint32_t index;
    pa_source_output *source_output;
    pa_memblockq *memblockq;
    size_t fragment_size;
};

struct playback_stream {
    int type;
    struct connection *connection;
    uint32_t index;
    pa_sink_input *sink_input;
    pa_memblockq *memblockq;
    size_t requested_bytes;
    int drain_request;
    uint32_t drain_tag;
    uint32_t syncid;
    int underrun;

    /* Sync group members */
    PA_LLIST_FIELDS(struct playback_stream);
};

struct upload_stream {
    int type;
    struct connection *connection;
    uint32_t index;
    pa_memchunk memchunk;
    size_t length;
    char *name;
    pa_sample_spec sample_spec;
    pa_channel_map channel_map;
};

struct output_stream {
    int type;
};

enum {
    UPLOAD_STREAM,
    PLAYBACK_STREAM
};

struct connection {
    int authorized;
    uint32_t version;
    pa_protocol_native *protocol;
    pa_client *client;
    pa_pstream *pstream;
    pa_pdispatch *pdispatch;
    pa_idxset *record_streams, *output_streams;
    uint32_t rrobin_index;
    pa_subscription *subscription;
    pa_time_event *auth_timeout_event;
};

struct pa_protocol_native {
    pa_module *module;
    int public;
    pa_core *core;
    pa_socket_server *server;
    pa_idxset *connections;
    uint8_t auth_cookie[PA_NATIVE_COOKIE_LENGTH];
    int auth_cookie_in_property;
#ifdef HAVE_CREDS
    char *auth_group;
#endif
    pa_ip_acl *auth_ip_acl;
};

static int sink_input_peek_cb(pa_sink_input *i, pa_memchunk *chunk);
static void sink_input_drop_cb(pa_sink_input *i, const pa_memchunk *chunk, size_t length);
static void sink_input_kill_cb(pa_sink_input *i);
static pa_usec_t sink_input_get_latency_cb(pa_sink_input *i);

static void request_bytes(struct playback_stream*s);

static void source_output_kill_cb(pa_source_output *o);
static void source_output_push_cb(pa_source_output *o, const pa_memchunk *chunk);
static pa_usec_t source_output_get_latency_cb(pa_source_output *o);

static void command_exit(pa_pdispatch *pd, uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata);
static void command_create_playback_stream(pa_pdispatch *pd, uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata);
static void command_drain_playback_stream(pa_pdispatch *pd, uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata);
static void command_create_record_stream(pa_pdispatch *pd, uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata);
static void command_delete_stream(pa_pdispatch *pd, uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata);
static void command_auth(pa_pdispatch *pd, uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata);
static void command_set_client_name(pa_pdispatch *pd, uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata);
static void command_lookup(pa_pdispatch *pd, uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata);
static void command_stat(pa_pdispatch *pd, uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata);
static void command_get_playback_latency(pa_pdispatch *pd, uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata);
static void command_get_record_latency(pa_pdispatch *pd, uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata);
static void command_create_upload_stream(pa_pdispatch *pd, uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata);
static void command_finish_upload_stream(pa_pdispatch *pd, uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata);
static void command_play_sample(pa_pdispatch *pd, uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata);
static void command_remove_sample(pa_pdispatch *pd, uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata);
static void command_get_info(pa_pdispatch *pd, uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata);
static void command_get_info_list(pa_pdispatch *pd, uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata);
static void command_get_server_info(pa_pdispatch *pd, uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata);
static void command_subscribe(pa_pdispatch *pd, uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata);
static void command_set_volume(pa_pdispatch *pd, uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata);
static void command_set_mute(pa_pdispatch *pd, uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata);
static void command_cork_playback_stream(pa_pdispatch *pd, uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata);
static void command_flush_playback_stream(pa_pdispatch *pd, uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata);
static void command_trigger_or_prebuf_playback_stream(pa_pdispatch *pd, uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata);
static void command_set_default_sink_or_source(pa_pdispatch *pd, uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata);
static void command_set_stream_name(pa_pdispatch *pd, uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata);
static void command_kill(pa_pdispatch *pd, uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata);
static void command_load_module(pa_pdispatch *pd, uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata);
static void command_unload_module(pa_pdispatch *pd, uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata);
static void command_add_autoload(pa_pdispatch *pd, uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata);
static void command_remove_autoload(pa_pdispatch *pd, uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata);
static void command_get_autoload_info(pa_pdispatch *pd, uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata);
static void command_get_autoload_info_list(pa_pdispatch *pd, uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata);
static void command_cork_record_stream(pa_pdispatch *pd, uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata);
static void command_flush_record_stream(pa_pdispatch *pd, uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata);
static void command_move_stream(pa_pdispatch *pd, uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata);

static const pa_pdispatch_cb_t command_table[PA_COMMAND_MAX] = {
    [PA_COMMAND_ERROR] = NULL,
    [PA_COMMAND_TIMEOUT] = NULL,
    [PA_COMMAND_REPLY] = NULL,
    [PA_COMMAND_CREATE_PLAYBACK_STREAM] = command_create_playback_stream,
    [PA_COMMAND_DELETE_PLAYBACK_STREAM] = command_delete_stream,
    [PA_COMMAND_DRAIN_PLAYBACK_STREAM] = command_drain_playback_stream,
    [PA_COMMAND_CREATE_RECORD_STREAM] = command_create_record_stream,
    [PA_COMMAND_DELETE_RECORD_STREAM] = command_delete_stream,
    [PA_COMMAND_AUTH] = command_auth,
    [PA_COMMAND_REQUEST] = NULL,
    [PA_COMMAND_EXIT] = command_exit,
    [PA_COMMAND_SET_CLIENT_NAME] = command_set_client_name,
    [PA_COMMAND_LOOKUP_SINK] = command_lookup,
    [PA_COMMAND_LOOKUP_SOURCE] = command_lookup,
    [PA_COMMAND_STAT] = command_stat,
    [PA_COMMAND_GET_PLAYBACK_LATENCY] = command_get_playback_latency,
    [PA_COMMAND_GET_RECORD_LATENCY] = command_get_record_latency,
    [PA_COMMAND_CREATE_UPLOAD_STREAM] = command_create_upload_stream,
    [PA_COMMAND_DELETE_UPLOAD_STREAM] = command_delete_stream,
    [PA_COMMAND_FINISH_UPLOAD_STREAM] = command_finish_upload_stream,
    [PA_COMMAND_PLAY_SAMPLE] = command_play_sample,
    [PA_COMMAND_REMOVE_SAMPLE] = command_remove_sample,
    [PA_COMMAND_GET_SINK_INFO] = command_get_info,
    [PA_COMMAND_GET_SOURCE_INFO] = command_get_info,
    [PA_COMMAND_GET_CLIENT_INFO] = command_get_info,
    [PA_COMMAND_GET_MODULE_INFO] = command_get_info,
    [PA_COMMAND_GET_SINK_INPUT_INFO] = command_get_info,
    [PA_COMMAND_GET_SOURCE_OUTPUT_INFO] = command_get_info,
    [PA_COMMAND_GET_SAMPLE_INFO] = command_get_info,
    [PA_COMMAND_GET_SINK_INFO_LIST] = command_get_info_list,
    [PA_COMMAND_GET_SOURCE_INFO_LIST] = command_get_info_list,
    [PA_COMMAND_GET_MODULE_INFO_LIST] = command_get_info_list,
    [PA_COMMAND_GET_CLIENT_INFO_LIST] = command_get_info_list,
    [PA_COMMAND_GET_SINK_INPUT_INFO_LIST] = command_get_info_list,
    [PA_COMMAND_GET_SOURCE_OUTPUT_INFO_LIST] = command_get_info_list,
    [PA_COMMAND_GET_SAMPLE_INFO_LIST] = command_get_info_list,
    [PA_COMMAND_GET_SERVER_INFO] = command_get_server_info,
    [PA_COMMAND_SUBSCRIBE] = command_subscribe,

    [PA_COMMAND_SET_SINK_VOLUME] = command_set_volume,
    [PA_COMMAND_SET_SINK_INPUT_VOLUME] = command_set_volume,
    [PA_COMMAND_SET_SOURCE_VOLUME] = command_set_volume,
    
    [PA_COMMAND_SET_SINK_MUTE] = command_set_mute,
    [PA_COMMAND_SET_SOURCE_MUTE] = command_set_mute,

    [PA_COMMAND_CORK_PLAYBACK_STREAM] = command_cork_playback_stream,
    [PA_COMMAND_FLUSH_PLAYBACK_STREAM] = command_flush_playback_stream,
    [PA_COMMAND_TRIGGER_PLAYBACK_STREAM] = command_trigger_or_prebuf_playback_stream,
    [PA_COMMAND_PREBUF_PLAYBACK_STREAM] = command_trigger_or_prebuf_playback_stream,
    
    [PA_COMMAND_CORK_RECORD_STREAM] = command_cork_record_stream,
    [PA_COMMAND_FLUSH_RECORD_STREAM] = command_flush_record_stream,
    
    [PA_COMMAND_SET_DEFAULT_SINK] = command_set_default_sink_or_source,
    [PA_COMMAND_SET_DEFAULT_SOURCE] = command_set_default_sink_or_source,
    [PA_COMMAND_SET_PLAYBACK_STREAM_NAME] = command_set_stream_name, 
    [PA_COMMAND_SET_RECORD_STREAM_NAME] = command_set_stream_name,
    [PA_COMMAND_KILL_CLIENT] = command_kill,
    [PA_COMMAND_KILL_SINK_INPUT] = command_kill,
    [PA_COMMAND_KILL_SOURCE_OUTPUT] = command_kill,
    [PA_COMMAND_LOAD_MODULE] = command_load_module,
    [PA_COMMAND_UNLOAD_MODULE] = command_unload_module,
    [PA_COMMAND_GET_AUTOLOAD_INFO] = command_get_autoload_info,
    [PA_COMMAND_GET_AUTOLOAD_INFO_LIST] = command_get_autoload_info_list,
    [PA_COMMAND_ADD_AUTOLOAD] = command_add_autoload,
    [PA_COMMAND_REMOVE_AUTOLOAD] = command_remove_autoload,

    [PA_COMMAND_MOVE_SINK_INPUT] = command_move_stream,
    [PA_COMMAND_MOVE_SOURCE_OUTPUT] = command_move_stream
};

/* structure management */

static struct upload_stream* upload_stream_new(
    struct connection *c,
    const pa_sample_spec *ss,
    const pa_channel_map *map,
    const char *name, size_t length) {
    
    struct upload_stream *s;
    assert(c && ss && name && length);
    
    s = pa_xnew(struct upload_stream, 1);
    s->type = UPLOAD_STREAM;
    s->connection = c;
    s->sample_spec = *ss;
    s->channel_map = *map;
    s->name = pa_xstrdup(name);

    s->memchunk.memblock = NULL;
    s->memchunk.index = 0;
    s->memchunk.length = 0;

    s->length = length;
    
    pa_idxset_put(c->output_streams, s, &s->index);
    return s;
}

static void upload_stream_free(struct upload_stream *o) {
    assert(o && o->connection);

    pa_idxset_remove_by_data(o->connection->output_streams, o, NULL);

    pa_xfree(o->name);
    
    if (o->memchunk.memblock)
        pa_memblock_unref(o->memchunk.memblock);
    
    pa_xfree(o);
}

static struct record_stream* record_stream_new(
    struct connection *c,
    pa_source *source,
    const pa_sample_spec *ss,
    const pa_channel_map *map,
    const char *name,
    size_t maxlength,
    size_t fragment_size) {
    
    struct record_stream *s;
    pa_source_output *source_output;
    size_t base;
    pa_source_output_new_data data;
    
    assert(c && ss && name && maxlength);

    pa_source_output_new_data_init(&data);
    data.source = source;
    data.driver = __FILE__;
    data.name = name;
    pa_source_output_new_data_set_sample_spec(&data, ss);
    pa_source_output_new_data_set_channel_map(&data, map);
    data.module = c->protocol->module;
    data.client = c->client;
    
    if (!(source_output = pa_source_output_new(c->protocol->core, &data, 0)))
        return NULL;

    s = pa_xnew(struct record_stream, 1);
    s->connection = c;
    s->source_output = source_output;
    s->source_output->push = source_output_push_cb;
    s->source_output->kill = source_output_kill_cb;
    s->source_output->get_latency = source_output_get_latency_cb;
    s->source_output->userdata = s;

    s->memblockq = pa_memblockq_new(
            0,
            maxlength,
            0,
            base = pa_frame_size(ss),
            1,
            0,
            NULL);
    assert(s->memblockq);

    s->fragment_size = (fragment_size/base)*base;
    if (!s->fragment_size)
        s->fragment_size = base;

    pa_idxset_put(c->record_streams, s, &s->index);
    return s;
}

static void record_stream_free(struct record_stream* r) {
    assert(r && r->connection);

    pa_idxset_remove_by_data(r->connection->record_streams, r, NULL);
    pa_source_output_disconnect(r->source_output);
    pa_source_output_unref(r->source_output);
    pa_memblockq_free(r->memblockq);
    pa_xfree(r);
}

static struct playback_stream* playback_stream_new(
        struct connection *c,
        pa_sink *sink,
        const pa_sample_spec *ss,
        const pa_channel_map *map,
        const char *name,
        size_t maxlength,
        size_t tlength,
        size_t prebuf,
        size_t minreq,
        pa_cvolume *volume,
        uint32_t syncid) {
    
    struct playback_stream *s, *ssync;
    pa_sink_input *sink_input;
    pa_memblock *silence;
    uint32_t idx;
    int64_t start_index;
    pa_sink_input_new_data data;
    
    assert(c && ss && name && maxlength);

    /* Find syncid group */
    for (ssync = pa_idxset_first(c->output_streams, &idx); ssync; ssync = pa_idxset_next(c->output_streams, &idx)) {
        
        if (ssync->type != PLAYBACK_STREAM)
            continue;

        if (ssync->syncid == syncid)
            break;
    }

    /* Synced streams must connect to the same sink */
    if (ssync)
        sink = ssync->sink_input->sink;

    pa_sink_input_new_data_init(&data);
    data.sink = sink;
    data.driver = __FILE__;
    data.name = name;
    pa_sink_input_new_data_set_sample_spec(&data, ss);
    pa_sink_input_new_data_set_channel_map(&data, map);
    pa_sink_input_new_data_set_volume(&data, volume);
    data.module = c->protocol->module;
    data.client = c->client;

    if (!(sink_input = pa_sink_input_new(c->protocol->core, &data, 0)))
        return NULL;
    
    s = pa_xnew(struct playback_stream, 1);
    s->type = PLAYBACK_STREAM;
    s->connection = c;
    s->syncid = syncid;
    s->sink_input = sink_input;
    s->underrun = 1;
    
    s->sink_input->peek = sink_input_peek_cb;
    s->sink_input->drop = sink_input_drop_cb;
    s->sink_input->kill = sink_input_kill_cb;
    s->sink_input->get_latency = sink_input_get_latency_cb;
    s->sink_input->userdata = s;

    if (ssync) {
        /* Sync id found, now find head of list */
        PA_LLIST_FIND_HEAD(struct playback_stream, ssync, &ssync);

        /* Prepend ourselves */
        PA_LLIST_PREPEND(struct playback_stream, ssync, s);

        /* Set our start index to the current read index of the other grozp member(s) */
        assert(ssync->next);
        start_index = pa_memblockq_get_read_index(ssync->next->memblockq);
    } else {
        /* This ia a new sync group */
        PA_LLIST_INIT(struct playback_stream, s);
        start_index = 0;
    }
    
    silence = pa_silence_memblock_new(c->protocol->core->mempool, ss, 0);
    
    s->memblockq = pa_memblockq_new(
            start_index,
            maxlength,
            tlength,
            pa_frame_size(ss),
            prebuf,
            minreq,
            silence);

    pa_memblock_unref(silence);
    
    s->requested_bytes = 0;
    s->drain_request = 0;
    
    pa_idxset_put(c->output_streams, s, &s->index);

    return s;
}

static void playback_stream_free(struct playback_stream* p) {
    struct playback_stream *head;
    assert(p && p->connection);

    if (p->drain_request)
        pa_pstream_send_error(p->connection->pstream, p->drain_tag, PA_ERR_NOENTITY);

    PA_LLIST_FIND_HEAD(struct playback_stream, p, &head);
    PA_LLIST_REMOVE(struct playback_stream, head, p);

    pa_idxset_remove_by_data(p->connection->output_streams, p, NULL);
    pa_sink_input_disconnect(p->sink_input);
    pa_sink_input_unref(p->sink_input);
    pa_memblockq_free(p->memblockq);
    pa_xfree(p);
}

static void connection_free(struct connection *c) {
    struct record_stream *r;
    struct output_stream *o;
    assert(c && c->protocol);

    pa_idxset_remove_by_data(c->protocol->connections, c, NULL);
    while ((r = pa_idxset_first(c->record_streams, NULL)))
        record_stream_free(r);
    pa_idxset_free(c->record_streams, NULL, NULL);

    while ((o = pa_idxset_first(c->output_streams, NULL)))
        if (o->type == PLAYBACK_STREAM)
            playback_stream_free((struct playback_stream*) o);
        else
            upload_stream_free((struct upload_stream*) o);
    pa_idxset_free(c->output_streams, NULL, NULL);

    pa_pdispatch_unref(c->pdispatch);
    pa_pstream_close(c->pstream);
    pa_pstream_unref(c->pstream);
    pa_client_free(c->client);

    if (c->subscription)
        pa_subscription_free(c->subscription);

    if (c->auth_timeout_event)
        c->protocol->core->mainloop->time_free(c->auth_timeout_event);
    
    pa_xfree(c);
}

static void request_bytes(struct playback_stream *s) {
    pa_tagstruct *t;
    size_t l;
    assert(s);

    if (!(l = pa_memblockq_missing(s->memblockq)))
        return;
    
    if (l <= s->requested_bytes)
        return;

    l -= s->requested_bytes;

    if (l < pa_memblockq_get_minreq(s->memblockq))
        return;
    
    s->requested_bytes += l;

    t = pa_tagstruct_new(NULL, 0);
    assert(t);
    pa_tagstruct_putu32(t, PA_COMMAND_REQUEST);
    pa_tagstruct_putu32(t, (uint32_t) -1); /* tag */
    pa_tagstruct_putu32(t, s->index);
    pa_tagstruct_putu32(t, l);
    pa_pstream_send_tagstruct(s->connection->pstream, t);

/*     pa_log("Requesting %u bytes", l);  */
}

static void send_memblock(struct connection *c) {
    uint32_t start;
    struct record_stream *r;

    start = PA_IDXSET_INVALID;
    for (;;) {
        pa_memchunk chunk;
        
        if (!(r = pa_idxset_rrobin(c->record_streams, &c->rrobin_index)))
            return;

        if (start == PA_IDXSET_INVALID)
            start = c->rrobin_index;
        else if (start == c->rrobin_index)
            return;

        if (pa_memblockq_peek(r->memblockq,  &chunk) >= 0) {
            pa_memchunk schunk = chunk;
            
            if (schunk.length > r->fragment_size)
                schunk.length = r->fragment_size;

            pa_pstream_send_memblock(c->pstream, r->index, 0, PA_SEEK_RELATIVE, &schunk);
            pa_memblockq_drop(r->memblockq, &chunk, schunk.length);
            pa_memblock_unref(schunk.memblock);
            
            return;
        }
    }
}

static void send_playback_stream_killed(struct playback_stream *p) {
    pa_tagstruct *t;
    assert(p);

    t = pa_tagstruct_new(NULL, 0);
    pa_tagstruct_putu32(t, PA_COMMAND_PLAYBACK_STREAM_KILLED);
    pa_tagstruct_putu32(t, (uint32_t) -1); /* tag */
    pa_tagstruct_putu32(t, p->index);
    pa_pstream_send_tagstruct(p->connection->pstream, t);
}

static void send_record_stream_killed(struct record_stream *r) {
    pa_tagstruct *t;
    assert(r);

    t = pa_tagstruct_new(NULL, 0);
    pa_tagstruct_putu32(t, PA_COMMAND_RECORD_STREAM_KILLED);
    pa_tagstruct_putu32(t, (uint32_t) -1); /* tag */
    pa_tagstruct_putu32(t, r->index);
    pa_pstream_send_tagstruct(r->connection->pstream, t);
}

/*** sinkinput callbacks ***/

static int sink_input_peek_cb(pa_sink_input *i, pa_memchunk *chunk) {
    struct playback_stream *s;
    assert(i && i->userdata && chunk);
    s = i->userdata;

    if (pa_memblockq_get_length(s->memblockq) <= 0 && !s->underrun) {
        pa_tagstruct *t;

        /* Report that we're empty */

        t = pa_tagstruct_new(NULL, 0);
        pa_tagstruct_putu32(t, PA_COMMAND_UNDERFLOW);
        pa_tagstruct_putu32(t, (uint32_t) -1); /* tag */
        pa_tagstruct_putu32(t, s->index);
        pa_pstream_send_tagstruct(s->connection->pstream, t);

        s->underrun = 1;
    }
    
    if (pa_memblockq_peek(s->memblockq, chunk) < 0) {
/*         pa_log("peek: failure");    */
        return -1;
    }

/*     pa_log("peek: %u", chunk->length);    */
    
    return 0;
}

static void sink_input_drop_cb(pa_sink_input *i, const pa_memchunk *chunk, size_t length) {
    struct playback_stream *s;
    assert(i && i->userdata && length);
    s = i->userdata;

    pa_memblockq_drop(s->memblockq, chunk, length);

    request_bytes(s);

    if (s->drain_request && !pa_memblockq_is_readable(s->memblockq)) {
        pa_pstream_send_simple_ack(s->connection->pstream, s->drain_tag);
        s->drain_request = 0;
    }

/*     pa_log("after_drop: %u %u", pa_memblockq_get_length(s->memblockq), pa_memblockq_is_readable(s->memblockq));   */
}

static void sink_input_kill_cb(pa_sink_input *i) {
    assert(i && i->userdata);
    send_playback_stream_killed((struct playback_stream *) i->userdata);
    playback_stream_free((struct playback_stream *) i->userdata);
}

static pa_usec_t sink_input_get_latency_cb(pa_sink_input *i) {
    struct playback_stream *s;
    assert(i && i->userdata);
    s = i->userdata;

    /*pa_log("get_latency: %u", pa_memblockq_get_length(s->memblockq));*/
    
    return pa_bytes_to_usec(pa_memblockq_get_length(s->memblockq), &s->sink_input->sample_spec);
}

/*** source_output callbacks ***/

static void source_output_push_cb(pa_source_output *o, const pa_memchunk *chunk) {
    struct record_stream *s;
    assert(o && o->userdata && chunk);
    s = o->userdata;
    
    if (pa_memblockq_push_align(s->memblockq, chunk) < 0) {
        pa_log_warn("Failed to push data into output queue.");
        return;
    } 
        
    if (!pa_pstream_is_pending(s->connection->pstream))
        send_memblock(s->connection);
}

static void source_output_kill_cb(pa_source_output *o) {
    assert(o && o->userdata);
    send_record_stream_killed((struct record_stream *) o->userdata);
    record_stream_free((struct record_stream *) o->userdata);
}

static pa_usec_t source_output_get_latency_cb(pa_source_output *o) {
    struct record_stream *s;
    assert(o && o->userdata);
    s = o->userdata;

    /*pa_log("get_latency: %u", pa_memblockq_get_length(s->memblockq));*/
    
    return pa_bytes_to_usec(pa_memblockq_get_length(s->memblockq), &o->sample_spec);
}

/*** pdispatch callbacks ***/

static void protocol_error(struct connection *c) {
    pa_log("protocol error, kicking client");
    connection_free(c);
}

#define CHECK_VALIDITY(pstream, expression, tag, error) do { \
if (!(expression)) { \
    pa_pstream_send_error((pstream), (tag), (error)); \
    return; \
} \
} while(0);

static pa_tagstruct *reply_new(uint32_t tag) {
    pa_tagstruct *reply;
    
    reply = pa_tagstruct_new(NULL, 0);
    pa_tagstruct_putu32(reply, PA_COMMAND_REPLY);
    pa_tagstruct_putu32(reply, tag);
    return reply;
}

static void command_create_playback_stream(PA_GCC_UNUSED pa_pdispatch *pd, PA_GCC_UNUSED uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata) {
    struct connection *c = userdata;
    struct playback_stream *s;
    uint32_t maxlength, tlength, prebuf, minreq, sink_index, syncid;
    const char *name, *sink_name;
    pa_sample_spec ss;
    pa_channel_map map;
    pa_tagstruct *reply;
    pa_sink *sink = NULL;
    pa_cvolume volume;
    int corked;
    
    assert(c && t && c->protocol && c->protocol->core);
    
    if (pa_tagstruct_get(
            t,
            PA_TAG_STRING, &name,
            PA_TAG_SAMPLE_SPEC, &ss,
            PA_TAG_CHANNEL_MAP, &map,
            PA_TAG_U32, &sink_index,
            PA_TAG_STRING, &sink_name,
            PA_TAG_U32, &maxlength,
            PA_TAG_BOOLEAN, &corked,
            PA_TAG_U32, &tlength,
            PA_TAG_U32, &prebuf,
            PA_TAG_U32, &minreq,
            PA_TAG_U32, &syncid,
            PA_TAG_CVOLUME, &volume,
            PA_TAG_INVALID) < 0 ||
        !pa_tagstruct_eof(t) ||
        !name) {
        protocol_error(c);
        return;
    }

    CHECK_VALIDITY(c->pstream, c->authorized, tag, PA_ERR_ACCESS);
    CHECK_VALIDITY(c->pstream, name && pa_utf8_valid(name), tag, PA_ERR_INVALID);
    CHECK_VALIDITY(c->pstream, sink_index != PA_INVALID_INDEX || !sink_name || (*sink_name && pa_utf8_valid(name)), tag, PA_ERR_INVALID);
    CHECK_VALIDITY(c->pstream, pa_channel_map_valid(&map), tag, PA_ERR_INVALID);
    CHECK_VALIDITY(c->pstream, pa_sample_spec_valid(&ss), tag, PA_ERR_INVALID);
    CHECK_VALIDITY(c->pstream, pa_cvolume_valid(&volume), tag, PA_ERR_INVALID);
    CHECK_VALIDITY(c->pstream, map.channels == ss.channels && volume.channels == ss.channels, tag, PA_ERR_INVALID);
    CHECK_VALIDITY(c->pstream, maxlength > 0 && maxlength <= MAX_MEMBLOCKQ_LENGTH, tag, PA_ERR_INVALID);

    if (sink_index != PA_INVALID_INDEX) {
        sink = pa_idxset_get_by_index(c->protocol->core->sinks, sink_index);
        CHECK_VALIDITY(c->pstream, sink, tag, PA_ERR_NOENTITY);
    } else if (sink_name) {
        sink = pa_namereg_get(c->protocol->core, sink_name, PA_NAMEREG_SINK, 1);
        CHECK_VALIDITY(c->pstream, sink, tag, PA_ERR_NOENTITY);
    }

    s = playback_stream_new(c, sink, &ss, &map, name, maxlength, tlength, prebuf, minreq, &volume, syncid);
    CHECK_VALIDITY(c->pstream, s, tag, PA_ERR_INVALID);

    pa_sink_input_cork(s->sink_input, corked);
    
    reply = reply_new(tag);
    pa_tagstruct_putu32(reply, s->index);
    assert(s->sink_input);
    pa_tagstruct_putu32(reply, s->sink_input->index);
    pa_tagstruct_putu32(reply, s->requested_bytes = pa_memblockq_missing(s->memblockq));

    if (c->version >= 9) {
        /* Since 0.9 we support sending the buffer metrics back to the client */

        pa_tagstruct_putu32(reply, (uint32_t) pa_memblockq_get_maxlength(s->memblockq));
        pa_tagstruct_putu32(reply, (uint32_t) pa_memblockq_get_tlength(s->memblockq));
        pa_tagstruct_putu32(reply, (uint32_t) pa_memblockq_get_prebuf(s->memblockq));
        pa_tagstruct_putu32(reply, (uint32_t) pa_memblockq_get_minreq(s->memblockq));
    }
    
    pa_pstream_send_tagstruct(c->pstream, reply);
    request_bytes(s);
}

static void command_delete_stream(PA_GCC_UNUSED pa_pdispatch *pd, uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata) {
    struct connection *c = userdata;
    uint32_t channel;
    assert(c && t);
    
    if (pa_tagstruct_getu32(t, &channel) < 0 ||
        !pa_tagstruct_eof(t)) {
        protocol_error(c);
        return;
    }

    CHECK_VALIDITY(c->pstream, c->authorized, tag, PA_ERR_ACCESS);

    if (command == PA_COMMAND_DELETE_PLAYBACK_STREAM) {
        struct playback_stream *s;
        if (!(s = pa_idxset_get_by_index(c->output_streams, channel)) || (s->type != PLAYBACK_STREAM)) {
            pa_pstream_send_error(c->pstream, tag, PA_ERR_EXIST);
            return;
        }

        playback_stream_free(s);
    } else if (command == PA_COMMAND_DELETE_RECORD_STREAM) {
        struct record_stream *s;
        if (!(s = pa_idxset_get_by_index(c->record_streams, channel))) {
            pa_pstream_send_error(c->pstream, tag, PA_ERR_EXIST);
            return;
        }

        record_stream_free(s);
    } else {
        struct upload_stream *s;
        assert(command == PA_COMMAND_DELETE_UPLOAD_STREAM);
        if (!(s = pa_idxset_get_by_index(c->output_streams, channel)) || (s->type != UPLOAD_STREAM)) {
            pa_pstream_send_error(c->pstream, tag, PA_ERR_EXIST);
            return;
        }

        upload_stream_free(s);
    }
            
    pa_pstream_send_simple_ack(c->pstream, tag);
}

static void command_create_record_stream(PA_GCC_UNUSED pa_pdispatch *pd, PA_GCC_UNUSED uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata) {
    struct connection *c = userdata;
    struct record_stream *s;
    uint32_t maxlength, fragment_size;
    uint32_t source_index;
    const char *name, *source_name;
    pa_sample_spec ss;
    pa_channel_map map;
    pa_tagstruct *reply;
    pa_source *source = NULL;
    int corked;
    assert(c && t && c->protocol && c->protocol->core);
    
    if (pa_tagstruct_gets(t, &name) < 0 ||
        pa_tagstruct_get_sample_spec(t, &ss) < 0 ||
        pa_tagstruct_get_channel_map(t, &map) < 0 ||
        pa_tagstruct_getu32(t, &source_index) < 0 ||
        pa_tagstruct_gets(t, &source_name) < 0 ||
        pa_tagstruct_getu32(t, &maxlength) < 0 ||
        pa_tagstruct_get_boolean(t, &corked) < 0 ||
        pa_tagstruct_getu32(t, &fragment_size) < 0 ||
        !pa_tagstruct_eof(t)) {
        protocol_error(c);
        return;
    }

    CHECK_VALIDITY(c->pstream, c->authorized, tag, PA_ERR_ACCESS);
    CHECK_VALIDITY(c->pstream, name && pa_utf8_valid(name), tag, PA_ERR_INVALID);
    CHECK_VALIDITY(c->pstream, pa_sample_spec_valid(&ss), tag, PA_ERR_INVALID);
    CHECK_VALIDITY(c->pstream, pa_channel_map_valid(&map), tag, PA_ERR_INVALID);
    CHECK_VALIDITY(c->pstream, source_index != PA_INVALID_INDEX || !source_name || (*source_name && pa_utf8_valid(source_name)), tag, PA_ERR_INVALID);
    CHECK_VALIDITY(c->pstream, map.channels == ss.channels, tag, PA_ERR_INVALID);
    CHECK_VALIDITY(c->pstream, maxlength <= MAX_MEMBLOCKQ_LENGTH, tag, PA_ERR_INVALID);

    if (source_index != PA_INVALID_INDEX) {
        source = pa_idxset_get_by_index(c->protocol->core->sources, source_index);
        CHECK_VALIDITY(c->pstream, source, tag, PA_ERR_NOENTITY);
    } else if (source_name) {
        source = pa_namereg_get(c->protocol->core, source_name, PA_NAMEREG_SOURCE, 1);
        CHECK_VALIDITY(c->pstream, source, tag, PA_ERR_NOENTITY);
    } 
    
    s = record_stream_new(c, source, &ss, &map, name, maxlength, fragment_size);
    CHECK_VALIDITY(c->pstream, s, tag, PA_ERR_INVALID);
    
    pa_source_output_cork(s->source_output, corked);
    
    reply = reply_new(tag);
    pa_tagstruct_putu32(reply, s->index);
    assert(s->source_output);
    pa_tagstruct_putu32(reply, s->source_output->index);

    if (c->version >= 9) {
        /* Since 0.9 we support sending the buffer metrics back to the client */

        pa_tagstruct_putu32(reply, (uint32_t) pa_memblockq_get_maxlength(s->memblockq));
        pa_tagstruct_putu32(reply, (uint32_t) s->fragment_size);
    }
    
    pa_pstream_send_tagstruct(c->pstream, reply);
}

static void command_exit(PA_GCC_UNUSED pa_pdispatch *pd, PA_GCC_UNUSED uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata) {
    struct connection *c = userdata;
    assert(c && t);
    
    if (!pa_tagstruct_eof(t)) {
        protocol_error(c);
        return;
    }

    CHECK_VALIDITY(c->pstream, c->authorized, tag, PA_ERR_ACCESS);
    
    assert(c->protocol && c->protocol->core && c->protocol->core->mainloop);
    c->protocol->core->mainloop->quit(c->protocol->core->mainloop, 0);
    pa_pstream_send_simple_ack(c->pstream, tag); /* nonsense */
}

static void command_auth(PA_GCC_UNUSED pa_pdispatch *pd, PA_GCC_UNUSED uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata) {
    struct connection *c = userdata;
    const void*cookie;
    pa_tagstruct *reply;
    assert(c && t);

    if (pa_tagstruct_getu32(t, &c->version) < 0 ||
        pa_tagstruct_get_arbitrary(t, &cookie, PA_NATIVE_COOKIE_LENGTH) < 0 ||
        !pa_tagstruct_eof(t)) {
        protocol_error(c);
        return;
    }

    /* Minimum supported version */
    if (c->version < 8) {
        pa_pstream_send_error(c->pstream, tag, PA_ERR_VERSION);
        return;
    }

    if (!c->authorized) {
        int success = 0;
        
#ifdef HAVE_CREDS
        const pa_creds *creds;

        if ((creds = pa_pdispatch_creds(pd))) {
            if (creds->uid == getuid())
                success = 1;
            else if (c->protocol->auth_group) {
                int r;
                gid_t gid;

                if ((gid = pa_get_gid_of_group(c->protocol->auth_group)) == (gid_t) -1)
                    pa_log_warn("failed to get GID of group '%s'", c->protocol->auth_group);
                else if (gid == creds->gid)
                    success = 1;
                    
                if (!success) {
                    if ((r = pa_uid_in_group(creds->uid, c->protocol->auth_group)) < 0)
                        pa_log_warn("failed to check group membership.");
                    else if (r > 0)
                        success = 1;
                }
            }
                
            pa_log_info("Got credentials: uid=%lu gid=%lu success=%i",
                        (unsigned long) creds->uid,
                        (unsigned long) creds->gid,
                        success);

            if (c->version >= 10 &&
                pa_mempool_is_shared(c->protocol->core->mempool) &&
                creds->uid == getuid()) {

                pa_pstream_use_shm(c->pstream, 1);
                pa_log_info("Enabled SHM for new connection");
            }
                
        }
#endif

        if (!success && memcmp(c->protocol->auth_cookie, cookie, PA_NATIVE_COOKIE_LENGTH) == 0)
            success = 1;

        if (!success) {
            pa_log_warn("Denied access to client with invalid authorization data.");
            pa_pstream_send_error(c->pstream, tag, PA_ERR_ACCESS);
            return;
        }
        
        c->authorized = 1;
        if (c->auth_timeout_event) {
            c->protocol->core->mainloop->time_free(c->auth_timeout_event);
            c->auth_timeout_event = NULL;
        }
    }

    reply = reply_new(tag);
    pa_tagstruct_putu32(reply, PA_PROTOCOL_VERSION);

#ifdef HAVE_CREDS
{
    /* SHM support is only enabled after both sides made sure they are the same user. */
    
    pa_creds ucred;

    ucred.uid = getuid();
    ucred.gid = getgid();
    
    pa_pstream_send_tagstruct_with_creds(c->pstream, reply, &ucred);
}
#else
    pa_pstream_send_tagstruct(c->pstream, reply);
#endif
}

static void command_set_client_name(PA_GCC_UNUSED pa_pdispatch *pd, PA_GCC_UNUSED uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata) {
    struct connection *c = userdata;
    const char *name;
    assert(c && t);

    if (pa_tagstruct_gets(t, &name) < 0 ||
        !pa_tagstruct_eof(t)) {
        protocol_error(c);
        return;
    }

    CHECK_VALIDITY(c->pstream, name && pa_utf8_valid(name), tag, PA_ERR_INVALID);
    
    pa_client_set_name(c->client, name);
    pa_pstream_send_simple_ack(c->pstream, tag);
}

static void command_lookup(PA_GCC_UNUSED pa_pdispatch *pd, uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata) {
    struct connection *c = userdata;
    const char *name;
    uint32_t idx = PA_IDXSET_INVALID;
    assert(c && t);

    if (pa_tagstruct_gets(t, &name) < 0 ||
        !pa_tagstruct_eof(t)) {
        protocol_error(c);
        return;
    }

    CHECK_VALIDITY(c->pstream, c->authorized, tag, PA_ERR_ACCESS);
    CHECK_VALIDITY(c->pstream, name && *name && pa_utf8_valid(name), tag, PA_ERR_INVALID);

    if (command == PA_COMMAND_LOOKUP_SINK) {
        pa_sink *sink;
        if ((sink = pa_namereg_get(c->protocol->core, name, PA_NAMEREG_SINK, 1)))
            idx = sink->index;
    } else {
        pa_source *source;
        assert(command == PA_COMMAND_LOOKUP_SOURCE);
        if ((source = pa_namereg_get(c->protocol->core, name, PA_NAMEREG_SOURCE, 1)))
            idx = source->index;
    }

    if (idx == PA_IDXSET_INVALID)
        pa_pstream_send_error(c->pstream, tag, PA_ERR_NOENTITY);
    else {
        pa_tagstruct *reply;
        reply = reply_new(tag);
        pa_tagstruct_putu32(reply, idx);
        pa_pstream_send_tagstruct(c->pstream, reply);
    }
}

static void command_drain_playback_stream(PA_GCC_UNUSED pa_pdispatch *pd, PA_GCC_UNUSED uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata) {
    struct connection *c = userdata;
    uint32_t idx;
    struct playback_stream *s;
    assert(c && t);

    if (pa_tagstruct_getu32(t, &idx) < 0 ||
        !pa_tagstruct_eof(t)) {
        protocol_error(c);
        return;
    }

    CHECK_VALIDITY(c->pstream, c->authorized, tag, PA_ERR_ACCESS);
    s = pa_idxset_get_by_index(c->output_streams, idx);
    CHECK_VALIDITY(c->pstream, s, tag, PA_ERR_NOENTITY);
    CHECK_VALIDITY(c->pstream, s->type == PLAYBACK_STREAM, tag, PA_ERR_NOENTITY);
    
    s->drain_request = 0;

    pa_memblockq_prebuf_disable(s->memblockq);
    
    if (!pa_memblockq_is_readable(s->memblockq)) {
/*         pa_log("immediate drain: %u", pa_memblockq_get_length(s->memblockq));  */
        pa_pstream_send_simple_ack(c->pstream, tag);
    } else {
/*         pa_log("slow drain triggered");  */
        s->drain_request = 1;
        s->drain_tag = tag;

        pa_sink_notify(s->sink_input->sink);
    }
} 

static void command_stat(PA_GCC_UNUSED pa_pdispatch *pd, PA_GCC_UNUSED uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata) {
    struct connection *c = userdata;
    pa_tagstruct *reply;
    const pa_mempool_stat *stat;
    assert(c && t);

    if (!pa_tagstruct_eof(t)) {
        protocol_error(c);
        return;
    }

    CHECK_VALIDITY(c->pstream, c->authorized, tag, PA_ERR_ACCESS);

    stat = pa_mempool_get_stat(c->protocol->core->mempool);
    
    reply = reply_new(tag);
    pa_tagstruct_putu32(reply, stat->n_allocated);
    pa_tagstruct_putu32(reply, stat->allocated_size);
    pa_tagstruct_putu32(reply, stat->n_accumulated);
    pa_tagstruct_putu32(reply, stat->accumulated_size);
    pa_tagstruct_putu32(reply, pa_scache_total_size(c->protocol->core));
    pa_pstream_send_tagstruct(c->pstream, reply);
}

static void command_get_playback_latency(PA_GCC_UNUSED pa_pdispatch *pd, PA_GCC_UNUSED uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata) {
    struct connection *c = userdata;
    pa_tagstruct *reply;
    struct playback_stream *s;
    struct timeval tv, now;
    uint32_t idx;
    pa_usec_t latency;
    assert(c && t);
    
    if (pa_tagstruct_getu32(t, &idx) < 0 ||
        pa_tagstruct_get_timeval(t, &tv) < 0 ||
        !pa_tagstruct_eof(t)) {
        protocol_error(c);
        return;
    }

    CHECK_VALIDITY(c->pstream, c->authorized, tag, PA_ERR_ACCESS);
    s = pa_idxset_get_by_index(c->output_streams, idx);
    CHECK_VALIDITY(c->pstream, s, tag, PA_ERR_NOENTITY);
    CHECK_VALIDITY(c->pstream, s->type == PLAYBACK_STREAM, tag, PA_ERR_NOENTITY);

    reply = reply_new(tag);

    latency = pa_sink_get_latency(s->sink_input->sink);
    if (s->sink_input->resampled_chunk.memblock)
        latency += pa_bytes_to_usec(s->sink_input->resampled_chunk.length, &s->sink_input->sample_spec);
    pa_tagstruct_put_usec(reply, latency);
    
    pa_tagstruct_put_usec(reply, 0);
    pa_tagstruct_put_boolean(reply, s->sink_input->state == PA_SINK_INPUT_RUNNING);
    pa_tagstruct_put_timeval(reply, &tv);
    pa_tagstruct_put_timeval(reply, pa_gettimeofday(&now));
    pa_tagstruct_puts64(reply, pa_memblockq_get_write_index(s->memblockq));
    pa_tagstruct_puts64(reply, pa_memblockq_get_read_index(s->memblockq));
    pa_pstream_send_tagstruct(c->pstream, reply);
}

static void command_get_record_latency(PA_GCC_UNUSED pa_pdispatch *pd, PA_GCC_UNUSED uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata) {
    struct connection *c = userdata;
    pa_tagstruct *reply;
    struct record_stream *s;
    struct timeval tv, now;
    uint32_t idx;
    assert(c && t);

    if (pa_tagstruct_getu32(t, &idx) < 0 ||
        pa_tagstruct_get_timeval(t, &tv) < 0 ||
        !pa_tagstruct_eof(t)) {
        protocol_error(c);
        return;
    }

    CHECK_VALIDITY(c->pstream, c->authorized, tag, PA_ERR_ACCESS);
    s = pa_idxset_get_by_index(c->record_streams, idx);
    CHECK_VALIDITY(c->pstream, s, tag, PA_ERR_NOENTITY);

    reply = reply_new(tag);
    pa_tagstruct_put_usec(reply, s->source_output->source->monitor_of ? pa_sink_get_latency(s->source_output->source->monitor_of) : 0);
    pa_tagstruct_put_usec(reply, pa_source_get_latency(s->source_output->source));
    pa_tagstruct_put_boolean(reply, 0);
    pa_tagstruct_put_timeval(reply, &tv);
    pa_tagstruct_put_timeval(reply, pa_gettimeofday(&now));
    pa_tagstruct_puts64(reply, pa_memblockq_get_write_index(s->memblockq));
    pa_tagstruct_puts64(reply, pa_memblockq_get_read_index(s->memblockq));
    pa_pstream_send_tagstruct(c->pstream, reply);
}

static void command_create_upload_stream(PA_GCC_UNUSED pa_pdispatch *pd, PA_GCC_UNUSED uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata) {
    struct connection *c = userdata;
    struct upload_stream *s;
    uint32_t length;
    const char *name;
    pa_sample_spec ss;
    pa_channel_map map;
    pa_tagstruct *reply;
    assert(c && t && c->protocol && c->protocol->core);
    
    if (pa_tagstruct_gets(t, &name) < 0 || 
        pa_tagstruct_get_sample_spec(t, &ss) < 0 ||
        pa_tagstruct_get_channel_map(t, &map) < 0 ||
        pa_tagstruct_getu32(t, &length) < 0 ||
        !pa_tagstruct_eof(t)) {
        protocol_error(c);
        return;
    }

    CHECK_VALIDITY(c->pstream, c->authorized, tag, PA_ERR_ACCESS);
    CHECK_VALIDITY(c->pstream, pa_sample_spec_valid(&ss), tag, PA_ERR_INVALID);
    CHECK_VALIDITY(c->pstream, pa_channel_map_valid(&map), tag, PA_ERR_INVALID);
    CHECK_VALIDITY(c->pstream, map.channels == ss.channels, tag, PA_ERR_INVALID);
    CHECK_VALIDITY(c->pstream, (length % pa_frame_size(&ss)) == 0 && length > 0, tag, PA_ERR_INVALID);
    CHECK_VALIDITY(c->pstream, length <= PA_SCACHE_ENTRY_SIZE_MAX, tag, PA_ERR_TOOLARGE);
    CHECK_VALIDITY(c->pstream, name && *name && pa_utf8_valid(name), tag, PA_ERR_INVALID);
    
    s = upload_stream_new(c, &ss, &map, name, length);
    CHECK_VALIDITY(c->pstream, s, tag, PA_ERR_INVALID);
    
    reply = reply_new(tag);
    pa_tagstruct_putu32(reply, s->index);
    pa_tagstruct_putu32(reply, length);
    pa_pstream_send_tagstruct(c->pstream, reply);
}

static void command_finish_upload_stream(PA_GCC_UNUSED pa_pdispatch *pd, PA_GCC_UNUSED uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata) {
    struct connection *c = userdata;
    uint32_t channel;
    struct upload_stream *s;
    uint32_t idx;
    assert(c && t);
    
    if (pa_tagstruct_getu32(t, &channel) < 0 ||
        !pa_tagstruct_eof(t)) {
        protocol_error(c);
        return;
    }

    CHECK_VALIDITY(c->pstream, c->authorized, tag, PA_ERR_ACCESS);

    s = pa_idxset_get_by_index(c->output_streams, channel);
    CHECK_VALIDITY(c->pstream, s, tag, PA_ERR_NOENTITY);
    CHECK_VALIDITY(c->pstream, s->type == UPLOAD_STREAM, tag, PA_ERR_NOENTITY);

    if (pa_scache_add_item(c->protocol->core, s->name, &s->sample_spec, &s->channel_map, &s->memchunk, &idx) < 0)
        pa_pstream_send_error(c->pstream, tag, PA_ERR_INTERNAL);
    else
        pa_pstream_send_simple_ack(c->pstream, tag);
    
    upload_stream_free(s);
}

static void command_play_sample(PA_GCC_UNUSED pa_pdispatch *pd, PA_GCC_UNUSED uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata) {
    struct connection *c = userdata;
    uint32_t sink_index;
    pa_volume_t volume;
    pa_sink *sink;
    const char *name, *sink_name;
    assert(c && t);

    if (pa_tagstruct_getu32(t, &sink_index) < 0 ||
        pa_tagstruct_gets(t, &sink_name) < 0 ||
        pa_tagstruct_getu32(t, &volume) < 0 ||
        pa_tagstruct_gets(t, &name) < 0 ||
        !pa_tagstruct_eof(t)) {
        protocol_error(c);
        return;
    }
    
    CHECK_VALIDITY(c->pstream, c->authorized, tag, PA_ERR_ACCESS);
    CHECK_VALIDITY(c->pstream, sink_index != PA_INVALID_INDEX || !sink_name || (*sink_name && pa_utf8_valid(name)), tag, PA_ERR_INVALID);
    CHECK_VALIDITY(c->pstream, name && *name && pa_utf8_valid(name), tag, PA_ERR_INVALID);

    if (sink_index != PA_INVALID_INDEX)
        sink = pa_idxset_get_by_index(c->protocol->core->sinks, sink_index);
    else
        sink = pa_namereg_get(c->protocol->core, sink_name, PA_NAMEREG_SINK, 1);

    CHECK_VALIDITY(c->pstream, sink, tag, PA_ERR_NOENTITY);

    if (pa_scache_play_item(c->protocol->core, name, sink, volume) < 0) {
        pa_pstream_send_error(c->pstream, tag, PA_ERR_NOENTITY);
        return;
    }

    pa_pstream_send_simple_ack(c->pstream, tag);
}

static void command_remove_sample(PA_GCC_UNUSED pa_pdispatch *pd, PA_GCC_UNUSED uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata) {
    struct connection *c = userdata;
    const char *name;
    assert(c && t);

    if (pa_tagstruct_gets(t, &name) < 0 ||
        !pa_tagstruct_eof(t)) {
        protocol_error(c);
        return;
    }

    CHECK_VALIDITY(c->pstream, c->authorized, tag, PA_ERR_ACCESS);
    CHECK_VALIDITY(c->pstream, name && *name && pa_utf8_valid(name), tag, PA_ERR_INVALID);

    if (pa_scache_remove_item(c->protocol->core, name) < 0) {
        pa_pstream_send_error(c->pstream, tag, PA_ERR_NOENTITY);
        return;
    }

    pa_pstream_send_simple_ack(c->pstream, tag);
}

static void sink_fill_tagstruct(pa_tagstruct *t, pa_sink *sink) {
    assert(t && sink);
    pa_tagstruct_put(
        t,
        PA_TAG_U32, sink->index,
        PA_TAG_STRING, sink->name,
        PA_TAG_STRING, sink->description,
        PA_TAG_SAMPLE_SPEC, &sink->sample_spec,
        PA_TAG_CHANNEL_MAP, &sink->channel_map,
        PA_TAG_U32, sink->owner ? sink->owner->index : PA_INVALID_INDEX,
        PA_TAG_CVOLUME, pa_sink_get_volume(sink, PA_MIXER_HARDWARE),
        PA_TAG_BOOLEAN, pa_sink_get_mute(sink, PA_MIXER_HARDWARE),
        PA_TAG_U32, sink->monitor_source ? sink->monitor_source->index : PA_INVALID_INDEX,
        PA_TAG_STRING, sink->monitor_source ? sink->monitor_source->name : NULL,
        PA_TAG_USEC, pa_sink_get_latency(sink),
        PA_TAG_STRING, sink->driver,
        PA_TAG_U32,
        (sink->get_hw_volume ? PA_SINK_HW_VOLUME_CTRL : 0) |
        (sink->get_latency ? PA_SINK_LATENCY : 0) |
        (sink->is_hardware ? PA_SINK_HARDWARE : 0),
        PA_TAG_INVALID);
}

static void source_fill_tagstruct(pa_tagstruct *t, pa_source *source) {
    assert(t && source);
    pa_tagstruct_put(
        t,
        PA_TAG_U32, source->index,
        PA_TAG_STRING, source->name,
        PA_TAG_STRING, source->description,
        PA_TAG_SAMPLE_SPEC, &source->sample_spec,
        PA_TAG_CHANNEL_MAP, &source->channel_map,
        PA_TAG_U32, source->owner ? source->owner->index : PA_INVALID_INDEX,
        PA_TAG_CVOLUME, pa_source_get_volume(source, PA_MIXER_HARDWARE),
        PA_TAG_BOOLEAN, pa_source_get_mute(source, PA_MIXER_HARDWARE),
        PA_TAG_U32, source->monitor_of ? source->monitor_of->index : PA_INVALID_INDEX,
        PA_TAG_STRING, source->monitor_of ? source->monitor_of->name : NULL,
        PA_TAG_USEC, pa_source_get_latency(source),
        PA_TAG_STRING, source->driver,
        PA_TAG_U32,
        (source->get_hw_volume ? PA_SOURCE_HW_VOLUME_CTRL : 0) |
        (source->get_latency ? PA_SOURCE_LATENCY : 0) |
        (source->is_hardware ? PA_SOURCE_HARDWARE : 0),
        PA_TAG_INVALID);
}

static void client_fill_tagstruct(pa_tagstruct *t, pa_client *client) {
    assert(t && client);
    pa_tagstruct_putu32(t, client->index);
    pa_tagstruct_puts(t, client->name);
    pa_tagstruct_putu32(t, client->owner ? client->owner->index : PA_INVALID_INDEX);
    pa_tagstruct_puts(t, client->driver);
}

static void module_fill_tagstruct(pa_tagstruct *t, pa_module *module) {
    assert(t && module);
    pa_tagstruct_putu32(t, module->index);
    pa_tagstruct_puts(t, module->name);
    pa_tagstruct_puts(t, module->argument);
    pa_tagstruct_putu32(t, module->n_used);
    pa_tagstruct_put_boolean(t, module->auto_unload);
}

static void sink_input_fill_tagstruct(pa_tagstruct *t, pa_sink_input *s) {
    assert(t && s);
    pa_tagstruct_putu32(t, s->index);
    pa_tagstruct_puts(t, s->name);
    pa_tagstruct_putu32(t, s->module ? s->module->index : PA_INVALID_INDEX);
    pa_tagstruct_putu32(t, s->client ? s->client->index : PA_INVALID_INDEX);
    pa_tagstruct_putu32(t, s->sink->index);
    pa_tagstruct_put_sample_spec(t, &s->sample_spec);
    pa_tagstruct_put_channel_map(t, &s->channel_map);
    pa_tagstruct_put_cvolume(t, &s->volume);
    pa_tagstruct_put_usec(t, pa_sink_input_get_latency(s));
    pa_tagstruct_put_usec(t, pa_sink_get_latency(s->sink));
    pa_tagstruct_puts(t, pa_resample_method_to_string(pa_sink_input_get_resample_method(s)));
    pa_tagstruct_puts(t, s->driver);
}

static void source_output_fill_tagstruct(pa_tagstruct *t, pa_source_output *s) {
    assert(t && s);
    pa_tagstruct_putu32(t, s->index);
    pa_tagstruct_puts(t, s->name);
    pa_tagstruct_putu32(t, s->module ? s->module->index : PA_INVALID_INDEX);
    pa_tagstruct_putu32(t, s->client ? s->client->index : PA_INVALID_INDEX);
    pa_tagstruct_putu32(t, s->source->index);
    pa_tagstruct_put_sample_spec(t, &s->sample_spec);
    pa_tagstruct_put_channel_map(t, &s->channel_map);
    pa_tagstruct_put_usec(t, pa_source_output_get_latency(s));
    pa_tagstruct_put_usec(t, pa_source_get_latency(s->source));
    pa_tagstruct_puts(t, pa_resample_method_to_string(pa_source_output_get_resample_method(s)));
    pa_tagstruct_puts(t, s->driver);
}

static void scache_fill_tagstruct(pa_tagstruct *t, pa_scache_entry *e) {
    assert(t && e);
    pa_tagstruct_putu32(t, e->index);
    pa_tagstruct_puts(t, e->name);
    pa_tagstruct_put_cvolume(t, &e->volume);
    pa_tagstruct_put_usec(t, pa_bytes_to_usec(e->memchunk.length, &e->sample_spec));
    pa_tagstruct_put_sample_spec(t, &e->sample_spec);
    pa_tagstruct_put_channel_map(t, &e->channel_map);
    pa_tagstruct_putu32(t, e->memchunk.length);
    pa_tagstruct_put_boolean(t, e->lazy);
    pa_tagstruct_puts(t, e->filename);
}

static void command_get_info(PA_GCC_UNUSED pa_pdispatch *pd, uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata) {
    struct connection *c = userdata;
    uint32_t idx;
    pa_sink *sink = NULL;
    pa_source *source = NULL;
    pa_client *client = NULL;
    pa_module *module = NULL;
    pa_sink_input *si = NULL;
    pa_source_output *so = NULL;
    pa_scache_entry *sce = NULL;
    const char *name;
    pa_tagstruct *reply;
    assert(c && t);

    if (pa_tagstruct_getu32(t, &idx) < 0 ||
        (command != PA_COMMAND_GET_CLIENT_INFO &&
         command != PA_COMMAND_GET_MODULE_INFO &&
         command != PA_COMMAND_GET_SINK_INPUT_INFO &&
         command != PA_COMMAND_GET_SOURCE_OUTPUT_INFO &&
         pa_tagstruct_gets(t, &name) < 0) ||
        !pa_tagstruct_eof(t)) {
        protocol_error(c);
        return;
    }

    CHECK_VALIDITY(c->pstream, c->authorized, tag, PA_ERR_ACCESS);
    CHECK_VALIDITY(c->pstream, idx != PA_INVALID_INDEX || !name || (*name && pa_utf8_valid(name)), tag, PA_ERR_INVALID);

    if (command == PA_COMMAND_GET_SINK_INFO) {
        if (idx != PA_INVALID_INDEX)
            sink = pa_idxset_get_by_index(c->protocol->core->sinks, idx);
        else
            sink = pa_namereg_get(c->protocol->core, name, PA_NAMEREG_SINK, 1);
    } else if (command == PA_COMMAND_GET_SOURCE_INFO) {
        if (idx != PA_INVALID_INDEX)
            source = pa_idxset_get_by_index(c->protocol->core->sources, idx);
        else
            source = pa_namereg_get(c->protocol->core, name, PA_NAMEREG_SOURCE, 1);
    } else if (command == PA_COMMAND_GET_CLIENT_INFO)
        client = pa_idxset_get_by_index(c->protocol->core->clients, idx);
    else if (command == PA_COMMAND_GET_MODULE_INFO) 
        module = pa_idxset_get_by_index(c->protocol->core->modules, idx);
    else if (command == PA_COMMAND_GET_SINK_INPUT_INFO)
        si = pa_idxset_get_by_index(c->protocol->core->sink_inputs, idx);
    else if (command == PA_COMMAND_GET_SOURCE_OUTPUT_INFO)
        so = pa_idxset_get_by_index(c->protocol->core->source_outputs, idx);
    else {
        assert(command == PA_COMMAND_GET_SAMPLE_INFO);
        if (idx != PA_INVALID_INDEX)
            sce = pa_idxset_get_by_index(c->protocol->core->scache, idx);
        else
            sce = pa_namereg_get(c->protocol->core, name, PA_NAMEREG_SAMPLE, 0);
    }
            
    if (!sink && !source && !client && !module && !si && !so && !sce) {
        pa_pstream_send_error(c->pstream, tag, PA_ERR_NOENTITY);
        return;
    }

    reply = reply_new(tag);
    if (sink)
        sink_fill_tagstruct(reply, sink);
    else if (source)
        source_fill_tagstruct(reply, source);
    else if (client)
        client_fill_tagstruct(reply, client);
    else if (module)
        module_fill_tagstruct(reply, module);
    else if (si)
        sink_input_fill_tagstruct(reply, si);
    else if (so)
        source_output_fill_tagstruct(reply, so);
    else
        scache_fill_tagstruct(reply, sce);
    pa_pstream_send_tagstruct(c->pstream, reply);
}

static void command_get_info_list(PA_GCC_UNUSED pa_pdispatch *pd, uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata) {
    struct connection *c = userdata;
    pa_idxset *i;
    uint32_t idx;
    void *p;
    pa_tagstruct *reply;
    assert(c && t);

    if (!pa_tagstruct_eof(t)) {
        protocol_error(c);
        return;
    }

    CHECK_VALIDITY(c->pstream, c->authorized, tag, PA_ERR_ACCESS);

    reply = reply_new(tag);

    if (command == PA_COMMAND_GET_SINK_INFO_LIST)
        i = c->protocol->core->sinks;
    else if (command == PA_COMMAND_GET_SOURCE_INFO_LIST)
        i = c->protocol->core->sources;
    else if (command == PA_COMMAND_GET_CLIENT_INFO_LIST)
        i = c->protocol->core->clients;
    else if (command == PA_COMMAND_GET_MODULE_INFO_LIST)
        i = c->protocol->core->modules;
    else if (command == PA_COMMAND_GET_SINK_INPUT_INFO_LIST)
        i = c->protocol->core->sink_inputs;
    else if (command == PA_COMMAND_GET_SOURCE_OUTPUT_INFO_LIST)
        i = c->protocol->core->source_outputs;
    else {
        assert(command == PA_COMMAND_GET_SAMPLE_INFO_LIST);
        i = c->protocol->core->scache;
    }

    if (i) {
        for (p = pa_idxset_first(i, &idx); p; p = pa_idxset_next(i, &idx)) {
            if (command == PA_COMMAND_GET_SINK_INFO_LIST)
                sink_fill_tagstruct(reply, p);
            else if (command == PA_COMMAND_GET_SOURCE_INFO_LIST)
                source_fill_tagstruct(reply, p);
            else if (command == PA_COMMAND_GET_CLIENT_INFO_LIST)
                client_fill_tagstruct(reply, p);
            else if (command == PA_COMMAND_GET_MODULE_INFO_LIST)
                module_fill_tagstruct(reply, p);
            else if (command == PA_COMMAND_GET_SINK_INPUT_INFO_LIST)
                sink_input_fill_tagstruct(reply, p);
            else if (command == PA_COMMAND_GET_SOURCE_OUTPUT_INFO_LIST) 
                source_output_fill_tagstruct(reply, p);
            else {
                assert(command == PA_COMMAND_GET_SAMPLE_INFO_LIST);
                scache_fill_tagstruct(reply, p);
            }
        }
    }
    
    pa_pstream_send_tagstruct(c->pstream, reply);
}

static void command_get_server_info(PA_GCC_UNUSED pa_pdispatch *pd, PA_GCC_UNUSED uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata) {
    struct connection *c = userdata;
    pa_tagstruct *reply;
    char txt[256];
    const char *n;
    assert(c && t);

    if (!pa_tagstruct_eof(t)) {
        protocol_error(c);
        return;
    }
    
    CHECK_VALIDITY(c->pstream, c->authorized, tag, PA_ERR_ACCESS);

    reply = reply_new(tag);
    pa_tagstruct_puts(reply, PACKAGE_NAME);
    pa_tagstruct_puts(reply, PACKAGE_VERSION);
    pa_tagstruct_puts(reply, pa_get_user_name(txt, sizeof(txt)));
    pa_tagstruct_puts(reply, pa_get_fqdn(txt, sizeof(txt)));
    pa_tagstruct_put_sample_spec(reply, &c->protocol->core->default_sample_spec);

    n = pa_namereg_get_default_sink_name(c->protocol->core);
    pa_tagstruct_puts(reply, n);
    n = pa_namereg_get_default_source_name(c->protocol->core);
    pa_tagstruct_puts(reply, n);

    pa_tagstruct_putu32(reply, c->protocol->core->cookie);
    
    pa_pstream_send_tagstruct(c->pstream, reply);
}

static void subscription_cb(pa_core *core, pa_subscription_event_type_t e, uint32_t idx, void *userdata) {
    pa_tagstruct *t;
    struct connection *c = userdata;
    assert(c && core);

    t = pa_tagstruct_new(NULL, 0);
    pa_tagstruct_putu32(t, PA_COMMAND_SUBSCRIBE_EVENT);
    pa_tagstruct_putu32(t, (uint32_t) -1);
    pa_tagstruct_putu32(t, e);
    pa_tagstruct_putu32(t, idx);
    pa_pstream_send_tagstruct(c->pstream, t);
}

static void command_subscribe(PA_GCC_UNUSED pa_pdispatch *pd, PA_GCC_UNUSED uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata) {
    struct connection *c = userdata;
    pa_subscription_mask_t m;
    assert(c && t);

    if (pa_tagstruct_getu32(t, &m) < 0 ||
        !pa_tagstruct_eof(t)) {
        protocol_error(c);
        return;
    }

    CHECK_VALIDITY(c->pstream, c->authorized, tag, PA_ERR_ACCESS);
    CHECK_VALIDITY(c->pstream, (m & ~PA_SUBSCRIPTION_MASK_ALL) == 0, tag, PA_ERR_INVALID);
    
    if (c->subscription)
        pa_subscription_free(c->subscription);

    if (m != 0) {
        c->subscription = pa_subscription_new(c->protocol->core, m, subscription_cb, c);
        assert(c->subscription);
    } else
        c->subscription = NULL;

    pa_pstream_send_simple_ack(c->pstream, tag);
}

static void command_set_volume(
        PA_GCC_UNUSED pa_pdispatch *pd,
        uint32_t command,
        uint32_t tag,
        pa_tagstruct *t,
        void *userdata) {
    
    struct connection *c = userdata;
    uint32_t idx;
    pa_cvolume volume;
    pa_sink *sink = NULL;
    pa_source *source = NULL;
    pa_sink_input *si = NULL;
    const char *name = NULL;
    assert(c && t);

    if (pa_tagstruct_getu32(t, &idx) < 0 ||
        (command == PA_COMMAND_SET_SINK_VOLUME && pa_tagstruct_gets(t, &name) < 0) ||
        (command == PA_COMMAND_SET_SOURCE_VOLUME && pa_tagstruct_gets(t, &name) < 0) ||
        pa_tagstruct_get_cvolume(t, &volume) ||
        !pa_tagstruct_eof(t)) {
        protocol_error(c);
        return;
    }
    
    CHECK_VALIDITY(c->pstream, c->authorized, tag, PA_ERR_ACCESS);
    CHECK_VALIDITY(c->pstream, idx != PA_INVALID_INDEX || !name || (*name && pa_utf8_valid(name)), tag, PA_ERR_INVALID);
    CHECK_VALIDITY(c->pstream, pa_cvolume_valid(&volume), tag, PA_ERR_INVALID);

    if (command == PA_COMMAND_SET_SINK_VOLUME) {
        if (idx != PA_INVALID_INDEX)
            sink = pa_idxset_get_by_index(c->protocol->core->sinks, idx);
        else
            sink = pa_namereg_get(c->protocol->core, name, PA_NAMEREG_SINK, 1);
    } else if (command == PA_COMMAND_SET_SOURCE_VOLUME) {
        if (idx != (uint32_t) -1)
            source = pa_idxset_get_by_index(c->protocol->core->sources, idx);
        else
            source = pa_namereg_get(c->protocol->core, name, PA_NAMEREG_SOURCE, 1);
    }  else {
        assert(command == PA_COMMAND_SET_SINK_INPUT_VOLUME);
        si = pa_idxset_get_by_index(c->protocol->core->sink_inputs, idx);
    }

    CHECK_VALIDITY(c->pstream, si || sink || source, tag, PA_ERR_NOENTITY);

    if (sink)
        pa_sink_set_volume(sink, PA_MIXER_HARDWARE, &volume);
    else if (source)
        pa_source_set_volume(source, PA_MIXER_HARDWARE, &volume);
    else if (si)
        pa_sink_input_set_volume(si, &volume);

    pa_pstream_send_simple_ack(c->pstream, tag);
}

static void command_set_mute(
        PA_GCC_UNUSED pa_pdispatch *pd,
        uint32_t command,
        uint32_t tag,
        pa_tagstruct *t,
        void *userdata) {
    
    struct connection *c = userdata;
    uint32_t idx;
    int mute;
    pa_sink *sink = NULL;
    pa_source *source = NULL;
    const char *name = NULL;
    assert(c && t);

    if (pa_tagstruct_getu32(t, &idx) < 0 ||
        pa_tagstruct_gets(t, &name) < 0 ||
        pa_tagstruct_get_boolean(t, &mute) ||
        !pa_tagstruct_eof(t)) {
        protocol_error(c);
        return;
    }
    
    CHECK_VALIDITY(c->pstream, c->authorized, tag, PA_ERR_ACCESS);
    CHECK_VALIDITY(c->pstream, idx != PA_INVALID_INDEX || !name || (*name && pa_utf8_valid(name)), tag, PA_ERR_INVALID);

    if (command == PA_COMMAND_SET_SINK_MUTE) {
        if (idx != PA_INVALID_INDEX)
            sink = pa_idxset_get_by_index(c->protocol->core->sinks, idx);
        else
            sink = pa_namereg_get(c->protocol->core, name, PA_NAMEREG_SINK, 1);
    } else {
        assert(command == PA_COMMAND_SET_SOURCE_MUTE);
        if (idx != (uint32_t) -1)
            source = pa_idxset_get_by_index(c->protocol->core->sources, idx);
        else
            source = pa_namereg_get(c->protocol->core, name, PA_NAMEREG_SOURCE, 1);
    }

    CHECK_VALIDITY(c->pstream, sink || source, tag, PA_ERR_NOENTITY);

    if (sink)
        pa_sink_set_mute(sink, PA_MIXER_HARDWARE, mute);
    else if (source)
        pa_source_set_mute(source, PA_MIXER_HARDWARE, mute);

    pa_pstream_send_simple_ack(c->pstream, tag);
}

static void command_cork_playback_stream(PA_GCC_UNUSED pa_pdispatch *pd, PA_GCC_UNUSED uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata) {
    struct connection *c = userdata;
    uint32_t idx;
    int b;
    struct playback_stream *s, *ssync;
    assert(c && t);

    if (pa_tagstruct_getu32(t, &idx) < 0 ||
        pa_tagstruct_get_boolean(t, &b) < 0 ||
        !pa_tagstruct_eof(t)) {
        protocol_error(c);
        return;
    }

    CHECK_VALIDITY(c->pstream, c->authorized, tag, PA_ERR_ACCESS);
    CHECK_VALIDITY(c->pstream, idx != PA_INVALID_INDEX, tag, PA_ERR_INVALID);
    s = pa_idxset_get_by_index(c->output_streams, idx);
    CHECK_VALIDITY(c->pstream, s, tag, PA_ERR_NOENTITY);
    CHECK_VALIDITY(c->pstream, s->type == PLAYBACK_STREAM, tag, PA_ERR_NOENTITY);

    pa_sink_input_cork(s->sink_input, b);
    pa_memblockq_prebuf_force(s->memblockq);

    /* Do the same for all other members in the sync group */
    for (ssync = s->prev; ssync; ssync = ssync->prev) {
        pa_sink_input_cork(ssync->sink_input, b);
        pa_memblockq_prebuf_force(ssync->memblockq);
    }

    for (ssync = s->next; ssync; ssync = ssync->next) {
        pa_sink_input_cork(ssync->sink_input, b);
        pa_memblockq_prebuf_force(ssync->memblockq);
    }
    
    pa_pstream_send_simple_ack(c->pstream, tag);
} 

static void command_flush_playback_stream(PA_GCC_UNUSED pa_pdispatch *pd, PA_GCC_UNUSED uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata) {
    struct connection *c = userdata;
    uint32_t idx;
    struct playback_stream *s, *ssync;
    assert(c && t);

    if (pa_tagstruct_getu32(t, &idx) < 0 ||
        !pa_tagstruct_eof(t)) {
        protocol_error(c);
        return;
    }

    CHECK_VALIDITY(c->pstream, c->authorized, tag, PA_ERR_ACCESS);
    CHECK_VALIDITY(c->pstream, idx != PA_INVALID_INDEX, tag, PA_ERR_INVALID);
    s = pa_idxset_get_by_index(c->output_streams, idx);
    CHECK_VALIDITY(c->pstream, s, tag, PA_ERR_NOENTITY);
    CHECK_VALIDITY(c->pstream, s->type == PLAYBACK_STREAM, tag, PA_ERR_NOENTITY);

    pa_memblockq_flush(s->memblockq);
    s->underrun = 0;
    
    /* Do the same for all other members in the sync group */
    for (ssync = s->prev; ssync; ssync = ssync->prev) {
        pa_memblockq_flush(ssync->memblockq);
        ssync->underrun = 0;
    }

    for (ssync = s->next; ssync; ssync = ssync->next) {
        pa_memblockq_flush(ssync->memblockq);
        ssync->underrun = 0;
    }
    
    pa_pstream_send_simple_ack(c->pstream, tag);
    pa_sink_notify(s->sink_input->sink);
    request_bytes(s);
    
    for (ssync = s->prev; ssync; ssync = ssync->prev)
        request_bytes(ssync);

    for (ssync = s->next; ssync; ssync = ssync->next)
        request_bytes(ssync);
}

static void command_trigger_or_prebuf_playback_stream(PA_GCC_UNUSED pa_pdispatch *pd, PA_GCC_UNUSED uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata) {
    struct connection *c = userdata;
    uint32_t idx;
    struct playback_stream *s;
    assert(c && t);

    if (pa_tagstruct_getu32(t, &idx) < 0 ||
        !pa_tagstruct_eof(t)) {
        protocol_error(c);
        return;
    }

    CHECK_VALIDITY(c->pstream, c->authorized, tag, PA_ERR_ACCESS);
    CHECK_VALIDITY(c->pstream, idx != PA_INVALID_INDEX, tag, PA_ERR_INVALID);
    s = pa_idxset_get_by_index(c->output_streams, idx);
    CHECK_VALIDITY(c->pstream, s, tag, PA_ERR_NOENTITY);
    CHECK_VALIDITY(c->pstream, s->type == PLAYBACK_STREAM, tag, PA_ERR_NOENTITY);

    switch (command) {
        case PA_COMMAND_PREBUF_PLAYBACK_STREAM:
            pa_memblockq_prebuf_force(s->memblockq);
            break;
            
        case PA_COMMAND_TRIGGER_PLAYBACK_STREAM:
            pa_memblockq_prebuf_disable(s->memblockq);
            break;
            
        default:
            abort();
    }

    pa_sink_notify(s->sink_input->sink);
    pa_pstream_send_simple_ack(c->pstream, tag);
    request_bytes(s);
}

static void command_cork_record_stream(PA_GCC_UNUSED pa_pdispatch *pd, PA_GCC_UNUSED uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata) {
    struct connection *c = userdata;
    uint32_t idx;
    struct record_stream *s;
    int b;
    assert(c && t);

    if (pa_tagstruct_getu32(t, &idx) < 0 ||
        pa_tagstruct_get_boolean(t, &b) < 0 ||
        !pa_tagstruct_eof(t)) {
        protocol_error(c);
        return;
    }

    CHECK_VALIDITY(c->pstream, c->authorized, tag, PA_ERR_ACCESS);
    s = pa_idxset_get_by_index(c->record_streams, idx);
    CHECK_VALIDITY(c->pstream, s, tag, PA_ERR_NOENTITY);

    pa_source_output_cork(s->source_output, b);
    pa_memblockq_prebuf_force(s->memblockq);
    pa_pstream_send_simple_ack(c->pstream, tag);
}

static void command_flush_record_stream(PA_GCC_UNUSED pa_pdispatch *pd, PA_GCC_UNUSED uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata) {
    struct connection *c = userdata;
    uint32_t idx;
    struct record_stream *s;
    assert(c && t);

    if (pa_tagstruct_getu32(t, &idx) < 0 ||
        !pa_tagstruct_eof(t)) {
        protocol_error(c);
        return;
    }

    CHECK_VALIDITY(c->pstream, c->authorized, tag, PA_ERR_ACCESS);
    s = pa_idxset_get_by_index(c->record_streams, idx);
    CHECK_VALIDITY(c->pstream, s, tag, PA_ERR_NOENTITY);

    pa_memblockq_flush(s->memblockq);
    pa_pstream_send_simple_ack(c->pstream, tag);
}

static void command_set_default_sink_or_source(PA_GCC_UNUSED pa_pdispatch *pd, uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata) {
    struct connection *c = userdata;
    const char *s;
    assert(c && t);

    if (pa_tagstruct_gets(t, &s) < 0 ||
        !pa_tagstruct_eof(t)) {
        protocol_error(c);
        return;
    }

    CHECK_VALIDITY(c->pstream, c->authorized, tag, PA_ERR_ACCESS);
    CHECK_VALIDITY(c->pstream, !s || (*s && pa_utf8_valid(s)), tag, PA_ERR_INVALID);

    pa_namereg_set_default(c->protocol->core, s, command == PA_COMMAND_SET_DEFAULT_SOURCE ? PA_NAMEREG_SOURCE : PA_NAMEREG_SINK);
    pa_pstream_send_simple_ack(c->pstream, tag);
}

static void command_set_stream_name(PA_GCC_UNUSED pa_pdispatch *pd, uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata) {
    struct connection *c = userdata;
    uint32_t idx;
    const char *name;
    assert(c && t);

    if (pa_tagstruct_getu32(t, &idx) < 0 ||
        pa_tagstruct_gets(t, &name) < 0 ||
        !pa_tagstruct_eof(t)) {
        protocol_error(c);
        return;
    }
    
    CHECK_VALIDITY(c->pstream, c->authorized, tag, PA_ERR_ACCESS);
    CHECK_VALIDITY(c->pstream, name && pa_utf8_valid(name), tag, PA_ERR_INVALID);

    if (command == PA_COMMAND_SET_PLAYBACK_STREAM_NAME) {
        struct playback_stream *s;
        
        s = pa_idxset_get_by_index(c->output_streams, idx);
        CHECK_VALIDITY(c->pstream, s, tag, PA_ERR_NOENTITY);
        CHECK_VALIDITY(c->pstream, s->type == PLAYBACK_STREAM, tag, PA_ERR_NOENTITY);

        pa_sink_input_set_name(s->sink_input, name);
        
    } else {
        struct record_stream *s;
        
        s = pa_idxset_get_by_index(c->record_streams, idx);
        CHECK_VALIDITY(c->pstream, s, tag, PA_ERR_NOENTITY);

        pa_source_output_set_name(s->source_output, name);
    }

    pa_pstream_send_simple_ack(c->pstream, tag);
}

static void command_kill(PA_GCC_UNUSED pa_pdispatch *pd, uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata) {
    struct connection *c = userdata;
    uint32_t idx;
    assert(c && t);

    if (pa_tagstruct_getu32(t, &idx) < 0 ||
        !pa_tagstruct_eof(t)) {
        protocol_error(c);
        return;
    }

    CHECK_VALIDITY(c->pstream, c->authorized, tag, PA_ERR_ACCESS);

    if (command == PA_COMMAND_KILL_CLIENT) {
        pa_client *client;
        
        client = pa_idxset_get_by_index(c->protocol->core->clients, idx);
        CHECK_VALIDITY(c->pstream, client, tag, PA_ERR_NOENTITY);
        pa_client_kill(client);
        
    } else if (command == PA_COMMAND_KILL_SINK_INPUT) {
        pa_sink_input *s;
        
        s = pa_idxset_get_by_index(c->protocol->core->sink_inputs, idx);
        CHECK_VALIDITY(c->pstream, s, tag, PA_ERR_NOENTITY);

        pa_sink_input_kill(s);
    } else {
        pa_source_output *s;

        assert(command == PA_COMMAND_KILL_SOURCE_OUTPUT);
        
        s = pa_idxset_get_by_index(c->protocol->core->source_outputs, idx);
        CHECK_VALIDITY(c->pstream, s, tag, PA_ERR_NOENTITY);

        pa_source_output_kill(s);
    }

    pa_pstream_send_simple_ack(c->pstream, tag);
}

static void command_load_module(PA_GCC_UNUSED pa_pdispatch *pd, PA_GCC_UNUSED uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata) {
    struct connection *c = userdata;
    pa_module *m;
    const char *name, *argument;
    pa_tagstruct *reply;
    assert(c && t);

    if (pa_tagstruct_gets(t, &name) < 0 ||
        pa_tagstruct_gets(t, &argument) < 0 ||
        !pa_tagstruct_eof(t)) {
        protocol_error(c);
        return;
    }

    CHECK_VALIDITY(c->pstream, c->authorized, tag, PA_ERR_ACCESS);
    CHECK_VALIDITY(c->pstream, name && *name && pa_utf8_valid(name) && !strchr(name, '/'), tag, PA_ERR_INVALID);
    CHECK_VALIDITY(c->pstream, !argument || pa_utf8_valid(argument), tag, PA_ERR_INVALID);
    
    if (!(m = pa_module_load(c->protocol->core, name, argument))) {
        pa_pstream_send_error(c->pstream, tag, PA_ERR_MODINITFAILED);
        return;
    }

    reply = reply_new(tag);
    pa_tagstruct_putu32(reply, m->index);
    pa_pstream_send_tagstruct(c->pstream, reply);
}

static void command_unload_module(PA_GCC_UNUSED pa_pdispatch *pd, PA_GCC_UNUSED uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata) {
    struct connection *c = userdata;
    uint32_t idx;
    pa_module *m;
    assert(c && t);

    if (pa_tagstruct_getu32(t, &idx) < 0 ||
        !pa_tagstruct_eof(t)) {
        protocol_error(c);
        return;
    }
    
    CHECK_VALIDITY(c->pstream, c->authorized, tag, PA_ERR_ACCESS);
    m = pa_idxset_get_by_index(c->protocol->core->modules, idx);
    CHECK_VALIDITY(c->pstream, m, tag, PA_ERR_NOENTITY);

    pa_module_unload_request(m);
    pa_pstream_send_simple_ack(c->pstream, tag);
}

static void command_add_autoload(PA_GCC_UNUSED pa_pdispatch *pd, PA_GCC_UNUSED uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata) {
    struct connection *c = userdata;
    const char *name, *module, *argument;
    uint32_t type;
    uint32_t idx;
    pa_tagstruct *reply;
    assert(c && t);

    if (pa_tagstruct_gets(t, &name) < 0 || 
        pa_tagstruct_getu32(t, &type) < 0 || 
        pa_tagstruct_gets(t, &module) < 0 || 
        pa_tagstruct_gets(t, &argument) < 0 ||
        !pa_tagstruct_eof(t)) {
        protocol_error(c);
        return;
    }
    
    CHECK_VALIDITY(c->pstream, c->authorized, tag, PA_ERR_ACCESS);
    CHECK_VALIDITY(c->pstream, name && *name && pa_utf8_valid(name), tag, PA_ERR_INVALID);
    CHECK_VALIDITY(c->pstream, type == 0 || type == 1, tag, PA_ERR_INVALID);
    CHECK_VALIDITY(c->pstream, module && *module && pa_utf8_valid(module), tag, PA_ERR_INVALID);
    CHECK_VALIDITY(c->pstream, !argument || pa_utf8_valid(argument), tag, PA_ERR_INVALID);

    if (pa_autoload_add(c->protocol->core, name, type == 0 ? PA_NAMEREG_SINK : PA_NAMEREG_SOURCE, module, argument, &idx) < 0) {
        pa_pstream_send_error(c->pstream, tag, PA_ERR_EXIST);
        return;
    }

    reply = reply_new(tag);
    pa_tagstruct_putu32(reply, idx);
    pa_pstream_send_tagstruct(c->pstream, reply);
}

static void command_remove_autoload(PA_GCC_UNUSED pa_pdispatch *pd, PA_GCC_UNUSED uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata) {
    struct connection *c = userdata;
    const char *name = NULL;
    uint32_t type, idx = PA_IDXSET_INVALID;
    int r;
    assert(c && t);

    if ((pa_tagstruct_getu32(t, &idx) < 0 &&
        (pa_tagstruct_gets(t, &name) < 0 ||
         pa_tagstruct_getu32(t, &type) < 0)) ||
        !pa_tagstruct_eof(t)) {
        protocol_error(c);
        return;
    }
    
    CHECK_VALIDITY(c->pstream, c->authorized, tag, PA_ERR_ACCESS);
    CHECK_VALIDITY(c->pstream, name || idx != PA_IDXSET_INVALID, tag, PA_ERR_INVALID);
    CHECK_VALIDITY(c->pstream, !name || (*name && pa_utf8_valid(name) && (type == 0 || type == 1)), tag, PA_ERR_INVALID);

    if (name) 
        r = pa_autoload_remove_by_name(c->protocol->core, name, type == 0 ? PA_NAMEREG_SINK : PA_NAMEREG_SOURCE);
    else
        r = pa_autoload_remove_by_index(c->protocol->core, idx);

    CHECK_VALIDITY(c->pstream, r >= 0, tag, PA_ERR_NOENTITY);

    pa_pstream_send_simple_ack(c->pstream, tag);
}

static void autoload_fill_tagstruct(pa_tagstruct *t, const pa_autoload_entry *e) {
    assert(t && e);

    pa_tagstruct_putu32(t, e->index);
    pa_tagstruct_puts(t, e->name);
    pa_tagstruct_putu32(t, e->type == PA_NAMEREG_SINK ? 0 : 1);
    pa_tagstruct_puts(t, e->module);
    pa_tagstruct_puts(t, e->argument);
}

static void command_get_autoload_info(PA_GCC_UNUSED pa_pdispatch *pd, PA_GCC_UNUSED uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata) {
    struct connection *c = userdata;
    const pa_autoload_entry *a = NULL;
    uint32_t type, idx;
    const char *name;
    pa_tagstruct *reply;
    assert(c && t);

    if ((pa_tagstruct_getu32(t, &idx) < 0 &&
        (pa_tagstruct_gets(t, &name) < 0 ||
         pa_tagstruct_getu32(t, &type) < 0)) ||
        !pa_tagstruct_eof(t)) {
        protocol_error(c);
        return;
    }

    CHECK_VALIDITY(c->pstream, c->authorized, tag, PA_ERR_ACCESS);
    CHECK_VALIDITY(c->pstream, name || idx != PA_IDXSET_INVALID, tag, PA_ERR_INVALID);
    CHECK_VALIDITY(c->pstream, !name || (*name && (type == 0 || type == 1) && pa_utf8_valid(name)), tag, PA_ERR_INVALID);

    if (name)
        a = pa_autoload_get_by_name(c->protocol->core, name, type == 0 ? PA_NAMEREG_SINK : PA_NAMEREG_SOURCE);
    else
        a = pa_autoload_get_by_index(c->protocol->core, idx);

    CHECK_VALIDITY(c->pstream, a, tag, PA_ERR_NOENTITY);

    reply = reply_new(tag);
    autoload_fill_tagstruct(reply, a);
    pa_pstream_send_tagstruct(c->pstream, reply);
}

static void command_get_autoload_info_list(PA_GCC_UNUSED pa_pdispatch *pd, PA_GCC_UNUSED uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata) {
    struct connection *c = userdata;
    pa_tagstruct *reply;
    assert(c && t);

    if (!pa_tagstruct_eof(t)) {
        protocol_error(c);
        return;
    }
    
    CHECK_VALIDITY(c->pstream, c->authorized, tag, PA_ERR_ACCESS);

    reply = reply_new(tag);

    if (c->protocol->core->autoload_hashmap) {
        pa_autoload_entry *a;
        void *state = NULL;

        while ((a = pa_hashmap_iterate(c->protocol->core->autoload_hashmap, &state, NULL)))
            autoload_fill_tagstruct(reply, a);
    }
    
    pa_pstream_send_tagstruct(c->pstream, reply);
}

static void command_move_stream(pa_pdispatch *pd, uint32_t command, uint32_t tag, pa_tagstruct *t, void *userdata) {
    struct connection *c = userdata;
    uint32_t idx = PA_INVALID_INDEX, idx_device = PA_INVALID_INDEX;
    const char *name = NULL;
    
    assert(c);
    assert(t);

    if (pa_tagstruct_getu32(t, &idx) < 0 ||
        pa_tagstruct_getu32(t, &idx_device) < 0 ||
        pa_tagstruct_gets(t, &name) < 0 ||
        !pa_tagstruct_eof(t)) {
        protocol_error(c);
        return;
    }
    
    CHECK_VALIDITY(c->pstream, c->authorized, tag, PA_ERR_ACCESS);
    CHECK_VALIDITY(c->pstream, idx != PA_INVALID_INDEX, tag, PA_ERR_INVALID);
    CHECK_VALIDITY(c->pstream, idx_device != PA_INVALID_INDEX || !name || (*name && pa_utf8_valid(name)), tag, PA_ERR_INVALID);

    if (command == PA_COMMAND_MOVE_SINK_INPUT) {
        pa_sink_input *si = NULL;
        pa_sink *sink = NULL;

        si = pa_idxset_get_by_index(c->protocol->core->sink_inputs, idx);
        
        if (idx_device != PA_INVALID_INDEX)
            sink = pa_idxset_get_by_index(c->protocol->core->sinks, idx_device);
        else
            sink = pa_namereg_get(c->protocol->core, name, PA_NAMEREG_SINK, 1);

        CHECK_VALIDITY(c->pstream, si && sink, tag, PA_ERR_NOENTITY);

        if (pa_sink_input_move_to(si, sink, 0) < 0) {
            pa_pstream_send_error(c->pstream, tag, PA_ERR_INVALID);
            return;
        }
    } else {
        pa_source_output *so = NULL;
        pa_source *source;

        so = pa_idxset_get_by_index(c->protocol->core->source_outputs, idx);
        
        if (idx_device != PA_INVALID_INDEX)
            source = pa_idxset_get_by_index(c->protocol->core->sources, idx_device);
        else
            source = pa_namereg_get(c->protocol->core, name, PA_NAMEREG_SOURCE, 1);

        CHECK_VALIDITY(c->pstream, so && source, tag, PA_ERR_NOENTITY);

        if (pa_source_output_move_to(so, source) < 0) {
            pa_pstream_send_error(c->pstream, tag, PA_ERR_INVALID);
            return;
        }
    }
        
    pa_pstream_send_simple_ack(c->pstream, tag);
        
}

/*** pstream callbacks ***/

static void pstream_packet_callback(pa_pstream *p, pa_packet *packet, const pa_creds *creds, void *userdata) {
    struct connection *c = userdata;
    assert(p && packet && packet->data && c);

    if (pa_pdispatch_run(c->pdispatch, packet, creds, c) < 0) {
        pa_log("invalid packet.");
        connection_free(c);
    }
}

static void pstream_memblock_callback(pa_pstream *p, uint32_t channel, int64_t offset, pa_seek_mode_t seek, const pa_memchunk *chunk, void *userdata) {
    struct connection *c = userdata;
    struct output_stream *stream;
    assert(p && chunk && userdata);
    
    if (!(stream = pa_idxset_get_by_index(c->output_streams, channel))) {
        pa_log("client sent block for invalid stream.");
        /* Ignoring */
        return;
    }

    if (stream->type == PLAYBACK_STREAM) {
        struct playback_stream *ps = (struct playback_stream*) stream;
        if (chunk->length >= ps->requested_bytes)
            ps->requested_bytes = 0;
        else
            ps->requested_bytes -= chunk->length;

        pa_memblockq_seek(ps->memblockq, offset, seek);

        if (pa_memblockq_push_align(ps->memblockq, chunk) < 0) {
            pa_tagstruct *t;
            
            pa_log_warn("failed to push data into queue");

            /* Pushing this block into the queue failed, so we simulate
             * it by skipping ahead */
            
            pa_memblockq_seek(ps->memblockq, chunk->length, PA_SEEK_RELATIVE);

            /* Notify the user */
            t = pa_tagstruct_new(NULL, 0);
            pa_tagstruct_putu32(t, PA_COMMAND_OVERFLOW);
            pa_tagstruct_putu32(t, (uint32_t) -1); /* tag */
            pa_tagstruct_putu32(t, ps->index);
            pa_pstream_send_tagstruct(p, t);
        }

        ps->underrun = 0;
            
        pa_sink_notify(ps->sink_input->sink);

    } else {
        struct upload_stream *u = (struct upload_stream*) stream;
        size_t l;
        assert(u->type == UPLOAD_STREAM);

        if (!u->memchunk.memblock) {
            if (u->length == chunk->length) {
                u->memchunk = *chunk;
                pa_memblock_ref(u->memchunk.memblock);
                u->length = 0;
            } else {
                u->memchunk.memblock = pa_memblock_new(c->protocol->core->mempool, u->length);
                u->memchunk.index = u->memchunk.length = 0;
            }
        }
        
        assert(u->memchunk.memblock);
        
        l = u->length; 
        if (l > chunk->length)
            l = chunk->length;

        if (l > 0) {
            memcpy((uint8_t*) u->memchunk.memblock->data + u->memchunk.index + u->memchunk.length,
                   (uint8_t*) chunk->memblock->data+chunk->index, l);
            u->memchunk.length += l;
            u->length -= l;
        }
    }
}

static void pstream_die_callback(pa_pstream *p, void *userdata) {
    struct connection *c = userdata;
    assert(p && c);
    connection_free(c);

/*    pa_log("connection died.");*/
}


static void pstream_drain_callback(pa_pstream *p, void *userdata) {
    struct connection *c = userdata;
    assert(p && c);

    send_memblock(c);
}

/*** client callbacks ***/

static void client_kill_cb(pa_client *c) {
    assert(c && c->userdata);
    connection_free(c->userdata);
}

/*** socket server callbacks ***/

static void auth_timeout(pa_mainloop_api*m, pa_time_event *e, const struct timeval *tv, void *userdata) {
    struct connection *c = userdata;
    assert(m && tv && c && c->auth_timeout_event == e);

    if (!c->authorized)
        connection_free(c);
}

static void on_connection(PA_GCC_UNUSED pa_socket_server*s, pa_iochannel *io, void *userdata) {
    pa_protocol_native *p = userdata;
    struct connection *c;
    char cname[256], pname[128];
    assert(io && p);

    if (pa_idxset_size(p->connections)+1 > MAX_CONNECTIONS) {
        pa_log_warn("Warning! Too many connections (%u), dropping incoming connection.", MAX_CONNECTIONS);
        pa_iochannel_free(io);
        return;
    }

    c = pa_xmalloc(sizeof(struct connection));

    c->authorized = !!p->public;

    if (!c->authorized && p->auth_ip_acl && pa_ip_acl_check(p->auth_ip_acl, pa_iochannel_get_recv_fd(io)) > 0) {
        pa_log_info("Client authenticated by IP ACL.");
        c->authorized = 1;
    }
    
    if (!c->authorized) {
        struct timeval tv;
        pa_gettimeofday(&tv);
        tv.tv_sec += AUTH_TIMEOUT;
        c->auth_timeout_event = p->core->mainloop->time_new(p->core->mainloop, &tv, auth_timeout, c);
    } else
        c->auth_timeout_event = NULL;

    c->version = 8;
    c->protocol = p;
    pa_iochannel_socket_peer_to_string(io, pname, sizeof(pname));
    snprintf(cname, sizeof(cname), "Native client (%s)", pname);
    assert(p->core);
    c->client = pa_client_new(p->core, __FILE__, cname);
    assert(c->client);
    c->client->kill = client_kill_cb;
    c->client->userdata = c;
    c->client->owner = p->module;
    
    c->pstream = pa_pstream_new(p->core->mainloop, io, p->core->mempool);
    assert(c->pstream);

    pa_pstream_set_recieve_packet_callback(c->pstream, pstream_packet_callback, c);
    pa_pstream_set_recieve_memblock_callback(c->pstream, pstream_memblock_callback, c);
    pa_pstream_set_die_callback(c->pstream, pstream_die_callback, c);
    pa_pstream_set_drain_callback(c->pstream, pstream_drain_callback, c);

    c->pdispatch = pa_pdispatch_new(p->core->mainloop, command_table, PA_COMMAND_MAX);
    assert(c->pdispatch);

    c->record_streams = pa_idxset_new(NULL, NULL);
    c->output_streams = pa_idxset_new(NULL, NULL);
    assert(c->record_streams && c->output_streams);

    c->rrobin_index = PA_IDXSET_INVALID;
    c->subscription = NULL;

    pa_idxset_put(p->connections, c, NULL);


#ifdef HAVE_CREDS
    if (pa_iochannel_creds_supported(io))
        pa_iochannel_creds_enable(io);
    
#endif
}

/*** module entry points ***/

static int load_key(pa_protocol_native*p, const char*fn) {
    assert(p);

    p->auth_cookie_in_property = 0;
    
    if (!fn && pa_authkey_prop_get(p->core, PA_NATIVE_COOKIE_PROPERTY_NAME, p->auth_cookie, sizeof(p->auth_cookie)) >= 0) {
        pa_log_info("using already loaded auth cookie.");
        pa_authkey_prop_ref(p->core, PA_NATIVE_COOKIE_PROPERTY_NAME);
        p->auth_cookie_in_property = 1;
        return 0;
    }
    
    if (!fn)
        fn = PA_NATIVE_COOKIE_FILE;

    if (pa_authkey_load_auto(fn, p->auth_cookie, sizeof(p->auth_cookie)) < 0)
        return -1;

    pa_log_info("loading cookie from disk.");

    if (pa_authkey_prop_put(p->core, PA_NATIVE_COOKIE_PROPERTY_NAME, p->auth_cookie, sizeof(p->auth_cookie)) >= 0)
        p->auth_cookie_in_property = 1;
        
    return 0;
}

static pa_protocol_native* protocol_new_internal(pa_core *c, pa_module *m, pa_modargs *ma) {
    pa_protocol_native *p;
    int public = 0;
    const char *acl;
    
    assert(c);
    assert(ma);

    if (pa_modargs_get_value_boolean(ma, "auth-anonymous", &public) < 0) {
        pa_log("auth-anonymous= expects a boolean argument.");
        return NULL;
    }
    
    p = pa_xnew(pa_protocol_native, 1);
    p->core = c;
    p->module = m;
    p->public = public;
    p->server = NULL;
    p->auth_ip_acl = NULL;
    
#ifdef HAVE_CREDS
    {
        int a = 1;
        if (pa_modargs_get_value_boolean(ma, "auth-group-enabled", &a) < 0) {
            pa_log("auth-group-enabled= expects a boolean argument.");
            return NULL;
        }
        p->auth_group = a ? pa_xstrdup(pa_modargs_get_value(ma, "auth-group", c->is_system_instance ? PA_ACCESS_GROUP : NULL)) : NULL;

        if (p->auth_group)
            pa_log_info("Allowing access to group '%s'.", p->auth_group);
    }
#endif


    if ((acl = pa_modargs_get_value(ma, "auth-ip-acl", NULL))) {

        if (!(p->auth_ip_acl = pa_ip_acl_new(acl))) {
            pa_log("Failed to parse IP ACL '%s'", acl);
            goto fail;
        }
    }

    if (load_key(p, pa_modargs_get_value(ma, "cookie", NULL)) < 0)
        goto fail;

    p->connections = pa_idxset_new(NULL, NULL);
    assert(p->connections);

    return p;

fail:
#ifdef HAVE_CREDS
    pa_xfree(p->auth_group);
#endif
    if (p->auth_ip_acl)
        pa_ip_acl_free(p->auth_ip_acl);
    pa_xfree(p);
    return NULL;
}

pa_protocol_native* pa_protocol_native_new(pa_core *core, pa_socket_server *server, pa_module *m, pa_modargs *ma) {
    char t[256];
    pa_protocol_native *p;

    if (!(p = protocol_new_internal(core, m, ma)))
        return NULL;
    
    p->server = server;
    pa_socket_server_set_callback(p->server, on_connection, p);

    if (pa_socket_server_get_address(p->server, t, sizeof(t))) {
        pa_strlist *l;
        l = pa_property_get(core, PA_NATIVE_SERVER_PROPERTY_NAME);
        l = pa_strlist_prepend(l, t);
        pa_property_replace(core, PA_NATIVE_SERVER_PROPERTY_NAME, l);
    }
    
    return p;
}

void pa_protocol_native_free(pa_protocol_native *p) {
    struct connection *c;
    assert(p);

    while ((c = pa_idxset_first(p->connections, NULL)))
        connection_free(c);
    pa_idxset_free(p->connections, NULL, NULL);

    if (p->server) {
        char t[256];
        
        if (pa_socket_server_get_address(p->server, t, sizeof(t))) {
            pa_strlist *l;
            l = pa_property_get(p->core, PA_NATIVE_SERVER_PROPERTY_NAME);
            l = pa_strlist_remove(l, t);

            if (l)
                pa_property_replace(p->core, PA_NATIVE_SERVER_PROPERTY_NAME, l);
            else
                pa_property_remove(p->core, PA_NATIVE_SERVER_PROPERTY_NAME);
        }
        
        pa_socket_server_unref(p->server);
    }

    if (p->auth_cookie_in_property)
        pa_authkey_prop_unref(p->core, PA_NATIVE_COOKIE_PROPERTY_NAME);

    if (p->auth_ip_acl)
        pa_ip_acl_free(p->auth_ip_acl);
    
#ifdef HAVE_CREDS
    pa_xfree(p->auth_group);
#endif
    pa_xfree(p);
}

pa_protocol_native* pa_protocol_native_new_iochannel(pa_core*core, pa_iochannel *io, pa_module *m, pa_modargs *ma) {
    pa_protocol_native *p;

    if (!(p = protocol_new_internal(core, m, ma)))
        return NULL;

    on_connection(NULL, io, p);
    
    return p;
}
