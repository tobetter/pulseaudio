/* $Id: packet.c 1426 2007-02-13 15:35:19Z ossman $ */

/***
  This file is part of PulseAudio.

  Copyright 2004-2006 Lennart Poettering

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

#ifdef HAVE_CONFIG_H
#include <config.h>
#endif

#include <assert.h>
#include <stdlib.h>

#include <pulse/xmalloc.h>

#include "packet.h"

pa_packet* pa_packet_new(size_t length) {
    pa_packet *p;

    assert(length);

    p = pa_xmalloc(sizeof(pa_packet)+length);
    p->ref = 1;
    p->length = length;
    p->data = (uint8_t*) (p+1);
    p->type = PA_PACKET_APPENDED;

    return p;
}

pa_packet* pa_packet_new_dynamic(void* data, size_t length) {
    pa_packet *p;

    assert(data);
    assert(length);

    p = pa_xnew(pa_packet, 1);
    p->ref = 1;
    p->length = length;
    p->data = data;
    p->type = PA_PACKET_DYNAMIC;

    return p;
}

pa_packet* pa_packet_ref(pa_packet *p) {
    assert(p);
    assert(p->ref >= 1);

    p->ref++;
    return p;
}

void pa_packet_unref(pa_packet *p) {
    assert(p);
    assert(p->ref >= 1);

    if (--p->ref == 0) {
        if (p->type == PA_PACKET_DYNAMIC)
            pa_xfree(p->data);
        pa_xfree(p);
    }
}
