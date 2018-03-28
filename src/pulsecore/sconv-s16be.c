/* $Id: sconv-s16be.c 1971 2007-10-28 19:13:50Z lennart $ */

/***
  This file is part of PulseAudio.

  Copyright 2004-2006 Lennart Poettering

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

#ifdef HAVE_CONFIG_H
#include <config.h>
#endif

#include "endianmacros.h"

#define INT16_FROM PA_INT16_FROM_BE
#define INT16_TO PA_INT16_TO_BE

#define pa_sconv_s16le_to_float32ne pa_sconv_s16be_to_float32ne
#define pa_sconv_s16le_from_float32ne pa_sconv_s16be_from_float32ne

#define pa_sconv_s16le_to_float32re pa_sconv_s16be_to_float32re
#define pa_sconv_s16le_from_float32re pa_sconv_s16be_from_float32re

#ifdef WORDS_BIGENDIAN
#define SWAP_WORDS 0
#else
#define SWAP_WORDS 1
#endif

#include "sconv-s16le.h"
#include "sconv-s16le.c"
