#ifndef foonamereghfoo
#define foonamereghfoo

/* $Id: namereg.h 1230 2006-08-12 17:59:10Z lennart $ */

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

#define PA_NAME_MAX 128

typedef enum pa_namereg_type {
    PA_NAMEREG_SINK,
    PA_NAMEREG_SOURCE,
    PA_NAMEREG_SAMPLE
} pa_namereg_type_t;

void pa_namereg_free(pa_core *c);

const char *pa_namereg_register(pa_core *c, const char *name, pa_namereg_type_t type, void *data, int fail);
void pa_namereg_unregister(pa_core *c, const char *name);
void* pa_namereg_get(pa_core *c, const char *name, pa_namereg_type_t type, int autoload);
int pa_namereg_set_default(pa_core*c, const char *name, pa_namereg_type_t type);

const char *pa_namereg_get_default_sink_name(pa_core *c);
const char *pa_namereg_get_default_source_name(pa_core *c);

#endif
