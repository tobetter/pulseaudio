#ifndef fooalsautilhfoo
#define fooalsautilhfoo

/* $Id: alsa-util.h 1033 2006-06-19 21:53:48Z lennart $ */

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

#include <asoundlib.h>

#include <pulse/sample.h>
#include <pulse/mainloop-api.h>

#include <pulse/channelmap.h>

struct pa_alsa_fdlist;

struct pa_alsa_fdlist *pa_alsa_fdlist_new(void);
void pa_alsa_fdlist_free(struct pa_alsa_fdlist *fdl);

int pa_alsa_fdlist_init_pcm(struct pa_alsa_fdlist *fdl, snd_pcm_t *pcm_handle, pa_mainloop_api* m, void (*cb)(void *userdata), void *userdata);
int pa_alsa_fdlist_init_mixer(struct pa_alsa_fdlist *fdl, snd_mixer_t *mixer_handle, pa_mainloop_api* m);

int pa_alsa_set_hw_params(snd_pcm_t *pcm_handle, pa_sample_spec *ss, uint32_t *periods, snd_pcm_uframes_t *period_size);

int pa_alsa_prepare_mixer(snd_mixer_t *mixer, const char *dev);
snd_mixer_elem_t *pa_alsa_find_elem(snd_mixer_t *mixer, const char *name, const char *fallback);

#endif
