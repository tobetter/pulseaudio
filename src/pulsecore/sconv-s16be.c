/* $Id: sconv-s16be.c 1033 2006-06-19 21:53:48Z lennart $ */

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

#ifdef HAVE_CONFIG_H
#include <config.h>
#endif

#include "endianmacros.h"

#define INT16_FROM INT16_FROM_BE
#define INT16_TO INT16_TO_BE

#define pa_sconv_s16le_to_float32ne pa_sconv_s16be_to_float32ne
#define pa_sconv_s16le_from_float32ne pa_sconv_s16be_from_float32ne

#ifdef WORDS_BIGENDIAN
#define SWAP_WORDS 0
#else
#define SWAP_WORDS 1
#endif

#include "sconv-s16le.h"
#include "sconv-s16le.c"
