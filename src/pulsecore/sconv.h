#ifndef foosconvhfoo
#define foosconvhfoo

/* $Id: sconv.h 1033 2006-06-19 21:53:48Z lennart $ */

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

#include <pulse/sample.h>

typedef void (*pa_convert_to_float32ne_func_t)(unsigned n, const void *a, float *b);
typedef void (*pa_convert_from_float32ne_func_t)(unsigned n, const float *a, void *b);

pa_convert_to_float32ne_func_t pa_get_convert_to_float32ne_function(pa_sample_format_t f);
pa_convert_from_float32ne_func_t pa_get_convert_from_float32ne_function(pa_sample_format_t f);

#endif
