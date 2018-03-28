#ifndef fooclicommandhfoo
#define fooclicommandhfoo

/* $Id: cli-command.h 1033 2006-06-19 21:53:48Z lennart $ */

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

#include <pulsecore/strbuf.h>
#include <pulsecore/core.h>

/* Execute a single CLI command. Write the results to the string
 * buffer *buf. If *fail is non-zero the function will return -1 when
 * one or more of the executed commands failed. *fail
 * may be modified by the function call. */
int pa_cli_command_execute_line(pa_core *c, const char *s, pa_strbuf *buf, int *fail);

/* Execute a whole file of CLI commands */
int pa_cli_command_execute_file(pa_core *c, const char *fn, pa_strbuf *buf, int *fail);

/* Split the specified string into lines and run pa_cli_command_execute_line() for each. */
int pa_cli_command_execute(pa_core *c, const char *s, pa_strbuf *buf, int *fail);

#endif
