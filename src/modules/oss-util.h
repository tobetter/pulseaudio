#ifndef fooossutilhfoo
#define fooossutilhfoo

/* $Id: oss-util.h 1033 2006-06-19 21:53:48Z lennart $ */

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
#include <pulse/volume.h>

int pa_oss_open(const char *device, int *mode, int* pcaps);
int pa_oss_auto_format(int fd, pa_sample_spec *ss);

int pa_oss_set_fragments(int fd, int frags, int frag_size);

int pa_oss_get_pcm_volume(int fd, const pa_sample_spec *ss, pa_cvolume *volume);
int pa_oss_set_pcm_volume(int fd, const pa_sample_spec *ss, const pa_cvolume *volume);

int pa_oss_get_input_volume(int fd, const pa_sample_spec *ss, pa_cvolume *volume);
int pa_oss_set_input_volume(int fd, const pa_sample_spec *ss, const pa_cvolume *volume);

int pa_oss_get_hw_description(const char *dev, char *name, size_t l);

#endif
