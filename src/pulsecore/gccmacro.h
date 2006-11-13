#ifndef foopulsegccmacrohfoo
#define foopulsegccmacrohfoo

/* $Id: gccmacro.h 1067 2006-07-13 15:52:34Z lennart $ */

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

#ifdef __GNUC__
#define PA_GCC_PRINTF_ATTR(a,b) __attribute__ ((format (printf, a, b)))
#else
/** If we're in GNU C, use some magic for detecting invalid format strings */
#define PA_GCC_PRINTF_ATTR(a,b)
#endif

#if defined(__GNUC__) && (__GNUC__ >= 4)
#define PA_GCC_SENTINEL __attribute__ ((sentinel))
#else
/** Macro for usage of GCC's sentinel compilation warnings */
#define PA_GCC_SENTINEL
#endif

#ifdef __GNUC__
#define PA_GCC_NORETURN __attribute__((noreturn))
#else
/** Macro for no-return functions */
#define PA_GCC_NORETURN
#endif

#ifdef __GNUC__
#define PA_GCC_UNUSED __attribute__ ((unused))
#else
/** Macro for not used parameter */
#define PA_GCC_UNUSED
#endif

#endif
