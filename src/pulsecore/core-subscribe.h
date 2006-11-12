#ifndef foocoresubscribehfoo
#define foocoresubscribehfoo

/* $Id: core-subscribe.h 1211 2006-08-12 02:18:24Z lennart $ */

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

typedef struct pa_subscription pa_subscription;
typedef struct pa_subscription_event pa_subscription_event;

#include <pulsecore/core.h>
#include <pulsecore/native-common.h>

typedef void (*pa_subscription_cb_t)(pa_core *c, pa_subscription_event_type_t t, uint32_t idx, void *userdata);

pa_subscription* pa_subscription_new(pa_core *c, pa_subscription_mask_t m,  pa_subscription_cb_t cb, void *userdata);
void pa_subscription_free(pa_subscription*s);
void pa_subscription_free_all(pa_core *c);

void pa_subscription_post(pa_core *c, pa_subscription_event_type_t t, uint32_t idx);

#endif
