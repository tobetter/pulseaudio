/* $Id: mainloop-signal.c 1272 2006-08-18 21:38:40Z lennart $ */

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

#include <stdio.h>
#include <assert.h>
#include <signal.h>
#include <errno.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>

#ifdef HAVE_WINDOWS_H
#include <windows.h>
#endif

#include <pulsecore/core-error.h>
#include <pulse/xmalloc.h>

#include <pulsecore/core-util.h>
#include <pulsecore/log.h>
#include <pulsecore/gccmacro.h>

#include "mainloop-signal.h"

struct pa_signal_event {
    int sig;
#ifdef HAVE_SIGACTION
    struct sigaction saved_sigaction;
#else
    void (*saved_handler)(int sig);
#endif
    void (*callback) (pa_mainloop_api*a, pa_signal_event *e, int sig, void *userdata);
    void *userdata;
    void (*destroy_callback) (pa_mainloop_api*a, pa_signal_event*e, void *userdata);
    pa_signal_event *previous, *next;
};

static pa_mainloop_api *api = NULL;
static int signal_pipe[2] = { -1, -1 };
static pa_io_event* io_event = NULL;
static pa_signal_event *signals = NULL;

static void signal_handler(int sig) {
#ifndef HAVE_SIGACTION
    signal(sig, signal_handler);
#endif
    pa_write(signal_pipe[1], &sig, sizeof(sig), NULL);
}

static void dispatch(pa_mainloop_api*a, int sig) {
    pa_signal_event*s;

    for (s = signals; s; s = s->next) 
        if (s->sig == sig) {
            assert(s->callback);
            s->callback(a, s, sig, s->userdata);
            break;
        }
}

static void callback(pa_mainloop_api*a, pa_io_event*e, int fd, pa_io_event_flags_t f, PA_GCC_UNUSED void *userdata) {
    ssize_t r;
    int sig;
    assert(a && e && f == PA_IO_EVENT_INPUT && e == io_event && fd == signal_pipe[0]);

    if ((r = pa_read(signal_pipe[0], &sig, sizeof(sig), NULL)) < 0) {
        if (errno == EAGAIN)
            return;

        pa_log("read(): %s", pa_cstrerror(errno));
        return;
    }
    
    if (r != sizeof(sig)) {
        pa_log("short read()");
        return;
    }

    dispatch(a, sig);
}

int pa_signal_init(pa_mainloop_api *a) {

    assert(!api && a && signal_pipe[0] == -1 && signal_pipe[1] == -1 && !io_event);

    if (pipe(signal_pipe) < 0) {
        pa_log("pipe(): %s", pa_cstrerror(errno));
        return -1;
    }

    pa_make_nonblock_fd(signal_pipe[0]);
    pa_make_nonblock_fd(signal_pipe[1]);
    pa_fd_set_cloexec(signal_pipe[0], 1);
    pa_fd_set_cloexec(signal_pipe[1], 1);

    api = a;

    io_event = api->io_new(api, signal_pipe[0], PA_IO_EVENT_INPUT, callback, NULL);
    assert(io_event);

    return 0;
}

void pa_signal_done(void) {
    assert(api && signal_pipe[0] >= 0 && signal_pipe[1] >= 0 && io_event);

    while (signals)
        pa_signal_free(signals);
    
    api->io_free(io_event);
    io_event = NULL;

    close(signal_pipe[0]);
    close(signal_pipe[1]);
    signal_pipe[0] = signal_pipe[1] = -1;

    api = NULL;
}

pa_signal_event* pa_signal_new(int sig, void (*_callback) (pa_mainloop_api *api, pa_signal_event*e, int sig, void *userdata), void *userdata) {
    pa_signal_event *e = NULL;

#ifdef HAVE_SIGACTION
    struct sigaction sa;
#endif

    assert(sig > 0 && _callback);
    
    for (e = signals; e; e = e->next)
        if (e->sig == sig)
            goto fail;
    
    e = pa_xmalloc(sizeof(pa_signal_event));
    e->sig = sig;
    e->callback = _callback;
    e->userdata = userdata;
    e->destroy_callback = NULL;

#ifdef HAVE_SIGACTION
    memset(&sa, 0, sizeof(sa));
    sa.sa_handler = signal_handler;
    sigemptyset(&sa.sa_mask);
    sa.sa_flags = SA_RESTART;
    
    if (sigaction(sig, &sa, &e->saved_sigaction) < 0)
#else
    if ((e->saved_handler = signal(sig, signal_handler)) == SIG_ERR)
#endif
        goto fail;

    e->previous = NULL;
    e->next = signals;
    signals = e;

    return e;
fail:
    if (e)
        pa_xfree(e);
    return NULL;
}

void pa_signal_free(pa_signal_event *e) {
    assert(e);

    if (e->next)
        e->next->previous = e->previous;
    if (e->previous)
        e->previous->next = e->next;
    else
        signals = e->next;

#ifdef HAVE_SIGACTION
    sigaction(e->sig, &e->saved_sigaction, NULL);
#else
    signal(e->sig, e->saved_handler);
#endif

    if (e->destroy_callback)
        e->destroy_callback(api, e, e->userdata);
    
    pa_xfree(e);
}

void pa_signal_set_destroy(pa_signal_event *e, void (*_callback) (pa_mainloop_api *api, pa_signal_event*e, void *userdata)) {
    assert(e);
    e->destroy_callback = _callback;
}
