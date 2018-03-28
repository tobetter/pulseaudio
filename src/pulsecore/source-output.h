#ifndef foosourceoutputhfoo
#define foosourceoutputhfoo

/* $Id: source-output.h 1250 2006-08-13 19:55:17Z lennart $ */

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

#include <inttypes.h>

typedef struct pa_source_output pa_source_output;

#include <pulse/sample.h>
#include <pulsecore/source.h>
#include <pulsecore/memblockq.h>
#include <pulsecore/resampler.h>
#include <pulsecore/module.h>
#include <pulsecore/client.h>

typedef enum {
    PA_SOURCE_OUTPUT_RUNNING,
    PA_SOURCE_OUTPUT_CORKED,
    PA_SOURCE_OUTPUT_DISCONNECTED
} pa_source_output_state_t;

typedef enum pa_source_output_flags {
    PA_SOURCE_OUTPUT_NO_HOOKS = 1
} pa_source_output_flags_t;

struct pa_source_output {
    int ref;
    uint32_t index;
    pa_source_output_state_t state;
    
    char *name, *driver;                  /* may be NULL */
    pa_module *module;                    /* may be NULL */

    pa_source *source;
    pa_client *client;                    /* may be NULL */

    pa_sample_spec sample_spec;
    pa_channel_map channel_map;
    
    void (*push)(pa_source_output *o, const pa_memchunk *chunk);
    void (*kill)(pa_source_output* o);              /* may be NULL */
    pa_usec_t (*get_latency) (pa_source_output *o); /* may be NULL */

    pa_resampler* resampler;              /* may be NULL */
    pa_resample_method_t resample_method;
    
    void *userdata;
};

typedef struct pa_source_output_new_data {
    const char *name, *driver;
    pa_module *module;
    pa_client *client;

    pa_source *source;

    pa_sample_spec sample_spec;
    int sample_spec_is_set;
    pa_channel_map channel_map;
    int channel_map_is_set;

    pa_resample_method_t resample_method;
} pa_source_output_new_data;

pa_source_output_new_data* pa_source_output_new_data_init(pa_source_output_new_data *data);
void pa_source_output_new_data_set_sample_spec(pa_source_output_new_data *data, const pa_sample_spec *spec);
void pa_source_output_new_data_set_channel_map(pa_source_output_new_data *data, const pa_channel_map *map);
void pa_source_output_new_data_set_volume(pa_source_output_new_data *data, const pa_cvolume *volume);

pa_source_output* pa_source_output_new(
        pa_core *core,
        pa_source_output_new_data *data,
        pa_source_output_flags_t flags);

void pa_source_output_unref(pa_source_output* o);
pa_source_output* pa_source_output_ref(pa_source_output *o);

/* To be called by the implementing module only */
void pa_source_output_disconnect(pa_source_output*o);

/* External code may request disconnection with this funcion */
void pa_source_output_kill(pa_source_output*o);

void pa_source_output_push(pa_source_output *o, const pa_memchunk *chunk);

void pa_source_output_set_name(pa_source_output *i, const char *name);

pa_usec_t pa_source_output_get_latency(pa_source_output *i);

void pa_source_output_cork(pa_source_output *i, int b);

pa_resample_method_t pa_source_output_get_resample_method(pa_source_output *o);

int pa_source_output_move_to(pa_source_output *o, pa_source *dest);

#endif
