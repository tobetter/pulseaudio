#ifndef foomodinfohfoo
#define foomodinfohfoo

/* $Id: modinfo.h 1036 2006-06-19 22:11:49Z lennart $ */

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

/* Some functions for reading module meta data from PulseAudio modules */

typedef struct pa_modinfo {
    char *author;
    char *description;
    char *usage;
    char *version;
} pa_modinfo;

/* Read meta data from an libtool handle */
pa_modinfo *pa_modinfo_get_by_handle(lt_dlhandle dl);

/* Read meta data from a module file */
pa_modinfo *pa_modinfo_get_by_name(const char *name);

/* Free meta data */
void pa_modinfo_free(pa_modinfo *i);

#endif
