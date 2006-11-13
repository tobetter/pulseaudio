#ifndef fooauthkeyprophfoo
#define fooauthkeyprophfoo

/* $Id: authkey-prop.h 1033 2006-06-19 21:53:48Z lennart $ */

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

#include <pulsecore/core.h>

/* The authkey-prop uses a central property to store a previously
 * loaded cookie in memory. Useful for sharing the same cookie between
 * several modules. */

/* Return the data of the specified authorization key property. Doesn't alter the refernce count of the key */
int pa_authkey_prop_get(pa_core *c, const char *name, void *data, size_t len);

/* Store data in the specified authorization key property. The initial reference count is set to 1 */
int pa_authkey_prop_put(pa_core *c, const char *name, const void *data, size_t len);

/* Increase the reference count of the specified authorization key */
void pa_authkey_prop_ref(pa_core *c, const char *name);

/* Decrease the reference count of the specified authorization key */
void pa_authkey_prop_unref(pa_core *c, const char *name);

#endif
