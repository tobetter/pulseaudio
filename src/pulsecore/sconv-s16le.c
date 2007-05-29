/* $Id: sconv-s16le.c 1426 2007-02-13 15:35:19Z ossman $ */

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

#include <assert.h>
#include <inttypes.h>

#include <liboil/liboilfuncs.h>

#include <pulsecore/sconv.h>
#include <pulsecore/log.h>

#include "endianmacros.h"

#include "sconv-s16le.h"

#ifndef INT16_FROM
#define INT16_FROM INT16_FROM_LE
#endif

#ifndef INT16_TO
#define INT16_TO INT16_TO_LE
#endif

#ifndef SWAP_WORDS
#ifdef WORDS_BIGENDIAN
#define SWAP_WORDS 1
#else
#define SWAP_WORDS 0
#endif
#endif

void pa_sconv_s16le_to_float32ne(unsigned n, const void *a, float *b) {
    const int16_t *ca = a;

    assert(a);
    assert(b);

#if SWAP_WORDS == 1

    for (; n > 0; n--) {
        int16_t s = *(ca++);
        *(b++) = ((float) INT16_FROM(s))/0x7FFF;
    }

#else
{
    static const double add = 0, factor = 1.0/0x7FFF;
    oil_scaleconv_f32_s16(b, ca, n, &add, &factor);
}
#endif
}

void pa_sconv_s16le_from_float32ne(unsigned n, const float *a, void *b) {
    int16_t *cb = b;

    assert(a);
    assert(b);

#if SWAP_WORDS == 1

    for (; n > 0; n--) {
        int16_t s;
        float v = *(a++);

        if (v > 1)
            v = 1;

        if (v < -1)
            v = -1;

        s = (int16_t) (v * 0x7FFF);
        *(cb++) = INT16_TO(s);
    }

#else
{
    static const double add = 0, factor = 0x7FFF;
    oil_scaleconv_s16_f32(cb, a, n, &add, &factor);
}
#endif
}
