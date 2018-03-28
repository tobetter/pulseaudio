/* $Id: dllmain.c 1033 2006-06-19 21:53:48Z lennart $ */

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

#ifdef OS_IS_WIN32

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include <windows.h>

extern pa_set_root(HANDLE handle);

BOOL WINAPI DllMain(HINSTANCE hinstDLL, DWORD fdwReason, LPVOID lpvReserved) {
    WSADATA data;

    switch (fdwReason) {

    case DLL_PROCESS_ATTACH:
        if (!pa_set_root(hinstDLL))
            return FALSE;
        WSAStartup(MAKEWORD(2, 0), &data);
        break;

    case DLL_PROCESS_DETACH:
        WSACleanup();
        break;

    }
    return TRUE;
}

#endif /* OS_IS_WIN32 */
