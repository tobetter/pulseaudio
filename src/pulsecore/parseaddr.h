#ifndef fooparseaddrhfoo
#define fooparseaddrhfoo

/* $Id: parseaddr.h 1033 2006-06-19 21:53:48Z lennart $ */

/***
  This file is part of PulseAudio.
 
  PulseAudio is free software; you can redistribute it and/or modify
  it under the terms of the GNU Lesser General Public License as
  published by the Free Software Foundation; either version 2.1 of the
  License, or (at your option) any later version.
 
  PulseAudio is distributed in the hope that it will be useful, but
  WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
  Lesser General Public License for more details.
 
  You should have received a copy of the GNU Lesser General Public
  License along with PulseAudio; if not, write to the Free Software
  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
  USA.
***/

#include <inttypes.h>

typedef enum pa_parsed_address_type {
    PA_PARSED_ADDRESS_UNIX,
    PA_PARSED_ADDRESS_TCP4,
    PA_PARSED_ADDRESS_TCP6,
    PA_PARSED_ADDRESS_TCP_AUTO
} pa_parsed_address_type_t;

typedef struct pa_parsed_address {
    pa_parsed_address_type_t type;
    char *path_or_host;
    uint16_t port;
} pa_parsed_address;

int pa_parse_address(const char *a, pa_parsed_address *ret_p);

#endif
