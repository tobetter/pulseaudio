/* $Id: modinfo.c 1272 2006-08-18 21:38:40Z lennart $ */

/***
  This file is part of PulseAudio.
 
  PulseAudio is free software; you can redistribute it and/or modify
  it under the terms of the GNU Lesser General Public License as
  published by the Free Software Foundation; either version 2 of the
  License, or (at your option) any later version.
 
  PulseAudio is distributed in the hope that it will be useful, but
  WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
  General Public License for more details.
 
  You should have received a copy of the GNU Lesser General Public
  License along with PulseAudio; if not, write to the Free Software
  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
  USA.
***/

#ifdef HAVE_CONFIG_H
#include <config.h>
#endif

#include <ltdl.h>
#include <assert.h>

#include <pulse/xmalloc.h>

#include <pulsecore/core-util.h>
#include <pulsecore/log.h>

#include "modinfo.h"

#define PA_SYMBOL_AUTHOR "pa__get_author"
#define PA_SYMBOL_DESCRIPTION "pa__get_description"
#define PA_SYMBOL_USAGE "pa__get_usage"
#define PA_SYMBOL_VERSION "pa__get_version"

/* lt_dlsym() violates ISO C, so confide the breakage into this function to
 * avoid warnings. */
typedef void (*fnptr)(void);
static inline fnptr lt_dlsym_fn(lt_dlhandle handle, const char *symbol) {
    return (fnptr) (long) lt_dlsym(handle, symbol);
}

pa_modinfo *pa_modinfo_get_by_handle(lt_dlhandle dl) {
    pa_modinfo *i;
    const char* (*func)(void);
    assert(dl);

    i = pa_xnew0(pa_modinfo, 1);

    if ((func = (const char* (*)(void)) lt_dlsym_fn(dl, PA_SYMBOL_AUTHOR)))
        i->author = pa_xstrdup(func());

    if ((func = (const char* (*)(void)) lt_dlsym_fn(dl, PA_SYMBOL_DESCRIPTION)))
        i->description = pa_xstrdup(func());

    if ((func = (const char* (*)(void)) lt_dlsym_fn(dl, PA_SYMBOL_USAGE)))
        i->usage = pa_xstrdup(func());

    if ((func = (const char* (*)(void)) lt_dlsym_fn(dl, PA_SYMBOL_VERSION)))
        i->version = pa_xstrdup(func());

    return i;
}

pa_modinfo *pa_modinfo_get_by_name(const char *name) {
    lt_dlhandle dl;
    pa_modinfo *i;
    assert(name);

    if (!(dl = lt_dlopenext(name))) {
        pa_log("Failed to open module \"%s\": %s", name, lt_dlerror());
        return NULL;
    }

    i = pa_modinfo_get_by_handle(dl);
    lt_dlclose(dl);

    return i;
}

void pa_modinfo_free(pa_modinfo *i) {
    assert(i);
    pa_xfree(i->author);
    pa_xfree(i->description);
    pa_xfree(i->usage);
    pa_xfree(i->version);
    pa_xfree(i);
}
