#ifndef fooavahiwrapperhfoo
#define fooavahiwrapperhfoo

/* $Id: avahi-wrap.h 1069 2006-07-13 17:33:44Z lennart $ */

/***
  This file is part of PulseAudio.
 
  PulseAudio is free software; you can redistribute it and/or modify
  it under the terms of the GNU Lesser General Public License as
  published by the Free Software Foundation; either version 2 of the
  License, or (at your option) any later version.
 
  PulseAudio is distributed in the hope that it will be useful, but
  WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
  General Public License for more details.
 
  You should have received a copy of the GNU Lesser General Public
  License along with PulseAudio; if not, write to the Free Software
  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
  USA.
***/

#include <avahi-client/client.h>

#include <pulse/mainloop-api.h>

AvahiPoll* pa_avahi_poll_new(pa_mainloop_api *api);
void pa_avahi_poll_free(AvahiPoll *p);

#endif
