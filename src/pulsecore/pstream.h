#ifndef foopstreamhfoo
#define foopstreamhfoo

/* $Id: pstream.h 1266 2006-08-18 19:55:18Z lennart $ */

/***
  This file is part of PulseAudio.
 
  PulseAudio is free software; you can redistribute it and/or modify
  it under the terms of the GNU Lesser General Public License as
  published by the Free Software Foundation; either version 2.1 of the
  License, or (at your option) any later version.
 
  PulseAudio is distributed in the hope that it will be useful, but
  WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
  Lesser General Public License for more details.
 
  You should have received a copy of the GNU Lesser General Public
  License along with PulseAudio; if not, write to the Free Software
  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
  USA.
***/

#include <inttypes.h>

#include <pulse/mainloop-api.h>
#include <pulse/def.h>

#include <pulsecore/packet.h>
#include <pulsecore/memblock.h>
#include <pulsecore/iochannel.h>
#include <pulsecore/memchunk.h>
#include <pulsecore/creds.h>

typedef struct pa_pstream pa_pstream;

typedef void (*pa_pstream_packet_cb_t)(pa_pstream *p, pa_packet *packet, const pa_creds *creds, void *userdata);
typedef void (*pa_pstream_memblock_cb_t)(pa_pstream *p, uint32_t channel, int64_t offset, pa_seek_mode_t seek, const pa_memchunk *chunk, void *userdata);
typedef void (*pa_pstream_notify_cb_t)(pa_pstream *p, void *userdata);

pa_pstream* pa_pstream_new(pa_mainloop_api *m, pa_iochannel *io, pa_mempool *p);
void pa_pstream_unref(pa_pstream*p);
pa_pstream* pa_pstream_ref(pa_pstream*p);

void pa_pstream_send_packet(pa_pstream*p, pa_packet *packet, const pa_creds *creds);
void pa_pstream_send_memblock(pa_pstream*p, uint32_t channel, int64_t offset, pa_seek_mode_t seek, const pa_memchunk *chunk);

void pa_pstream_set_recieve_packet_callback(pa_pstream *p, pa_pstream_packet_cb_t cb, void *userdata);
void pa_pstream_set_recieve_memblock_callback(pa_pstream *p, pa_pstream_memblock_cb_t cb, void *userdata);
void pa_pstream_set_drain_callback(pa_pstream *p, pa_pstream_notify_cb_t cb, void *userdata);

void pa_pstream_set_die_callback(pa_pstream *p, pa_pstream_notify_cb_t cb, void *userdata);

int pa_pstream_is_pending(pa_pstream *p);

void pa_pstream_use_shm(pa_pstream *p, int enable);

void pa_pstream_close(pa_pstream *p);

#endif
