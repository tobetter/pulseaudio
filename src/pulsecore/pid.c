/* $Id: pid.c 1272 2006-08-18 21:38:40Z lennart $ */

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

#include <fcntl.h>
#include <unistd.h>
#include <errno.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <string.h>
#include <stdio.h>
#include <assert.h>
#include <stdlib.h>
#include <limits.h>
#include <signal.h>

#ifdef HAVE_WINDOWS_H
#include <windows.h>
#endif

#include <pulse/xmalloc.h>

#include <pulsecore/core-error.h>
#include <pulsecore/core-util.h>
#include <pulsecore/log.h>

#include "pid.h"

/* Read the PID data from the file descriptor fd, and return it. If no
 * pid could be read, return 0, on failure (pid_t) -1 */
static pid_t read_pid(const char *fn, int fd) {
    ssize_t r;
    char t[20], *e;
    uint32_t pid;

    assert(fn && fd >= 0);

    if ((r = pa_loop_read(fd, t, sizeof(t)-1, NULL)) < 0) {
        pa_log_warn("WARNING: failed to read PID file '%s': %s",
            fn, pa_cstrerror(errno));
        return (pid_t) -1;
    }

    if (r == 0)
        return (pid_t) 0;
    
    t[r] = 0;
    if ((e = strchr(t, '\n')))
        *e = 0;

    if (pa_atou(t, &pid) < 0) {
        pa_log("WARNING: failed to parse PID file '%s'", fn);
        return (pid_t) -1;
    }

    return (pid_t) pid;
}

static int open_pid_file(const char *fn, int mode) {
    int fd = -1;
    
    for (;;) {
        struct stat st;
        
        if ((fd = open(fn, mode, S_IRUSR|S_IWUSR)) < 0) {
            if (mode != O_RDONLY || errno != ENOENT)
                pa_log_warn("WARNING: failed to open PID file '%s': %s",
                    fn, pa_cstrerror(errno));
            goto fail;
        }

        /* Try to lock the file. If that fails, go without */
        if (pa_lock_fd(fd, 1) < 0)
            goto fail;
        
        if (fstat(fd, &st) < 0) {
            pa_log_warn("WARNING: failed to fstat() PID file '%s': %s",
                fn, pa_cstrerror(errno));
            goto fail;
        }

        /* Does the file still exist in the file system? When ye, w're done, otherwise restart */
        if (st.st_nlink >= 1)
            break;

        if (pa_lock_fd(fd, 0) < 0)
            goto fail;

        if (close(fd) < 0) {
            pa_log_warn("WARNING: failed to close file '%s': %s",
                fn, pa_cstrerror(errno));
            goto fail;
        }

        fd = -1;
    }

    return fd;

fail:

    if (fd >= 0) {
        pa_lock_fd(fd, 0);
        close(fd);
    }

    return -1;
}

/* Create a new PID file for the current process. */
int pa_pid_file_create(void) {
    int fd = -1;
    int ret = -1;
    char fn[PATH_MAX];
    char t[20];
    pid_t pid;
    size_t l;

#ifdef OS_IS_WIN32
    HANDLE process;
#endif

    pa_runtime_path("pid", fn, sizeof(fn));

    if ((fd = open_pid_file(fn, O_CREAT|O_RDWR)) < 0)
        goto fail;

    if ((pid = read_pid(fn, fd)) == (pid_t) -1)
        pa_log("corrupt PID file, overwriting.");
    else if (pid > 0) {
#ifdef OS_IS_WIN32
        if ((process = OpenProcess(PROCESS_QUERY_INFORMATION, FALSE, pid)) != NULL) {
            CloseHandle(process);
#else
        if (kill(pid, 0) >= 0 || errno != ESRCH) {
#endif
            pa_log("daemon already running.");
            goto fail;
        }

        pa_log("stale PID file, overwriting.");
    }

    /* Overwrite the current PID file */
    if (lseek(fd, 0, SEEK_SET) == (off_t) -1 || ftruncate(fd, 0) < 0) {
        pa_log("failed to truncate PID file '%s': %s",
            fn, pa_cstrerror(errno));
        goto fail;
    }
    
    snprintf(t, sizeof(t), "%lu\n", (unsigned long) getpid());
    l = strlen(t);
    
    if (pa_loop_write(fd, t, l, NULL) != (ssize_t) l) {
        pa_log("failed to write PID file.");
        goto fail;
    }

    ret = 0;
    
fail:
    if (fd >= 0) {
        pa_lock_fd(fd, 0);
        close(fd);
    }
    
    return ret;
}

/* Remove the PID file, if it is ours */
int pa_pid_file_remove(void) {
    int fd = -1;
    char fn[PATH_MAX];
    int ret = -1;
    pid_t pid;

    pa_runtime_path("pid", fn, sizeof(fn));

    if ((fd = open_pid_file(fn, O_RDWR)) < 0) {
        pa_log_warn("WARNING: failed to open PID file '%s': %s",
            fn, pa_cstrerror(errno));
        goto fail;
    }

    if ((pid = read_pid(fn, fd)) == (pid_t) -1)
        goto fail;

    if (pid != getpid()) {
        pa_log("WARNING: PID file '%s' not mine!", fn);
        goto fail;
    }

    if (ftruncate(fd, 0) < 0) {
        pa_log_warn("WARNING: failed to truncate PID file '%s': %s",
            fn, pa_cstrerror(errno));
        goto fail;
    }

#ifdef OS_IS_WIN32
    pa_lock_fd(fd, 0);
    close(fd);
    fd = -1;
#endif

    if (unlink(fn) < 0) {
        pa_log_warn("WARNING: failed to remove PID file '%s': %s",
            fn, pa_cstrerror(errno));
        goto fail;
    }

    ret = 0;
    
fail:

    if (fd >= 0) {
        pa_lock_fd(fd, 0);
        close(fd);
    }

    return ret;
}

/* Check whether the daemon is currently running, i.e. if a PID file
 * exists and the PID therein too. Returns 0 on succcess, -1
 * otherwise. If pid is non-NULL and a running daemon was found,
 * return its PID therein */
int pa_pid_file_check_running(pid_t *pid) {
    return pa_pid_file_kill(0, pid);
}

#ifndef OS_IS_WIN32

/* Kill a current running daemon. Return non-zero on success, -1
 * otherwise. If successful *pid contains the PID of the daemon
 * process. */
int pa_pid_file_kill(int sig, pid_t *pid) {
    int fd = -1;
    char fn[PATH_MAX];
    int ret = -1;
    pid_t _pid;

    if (!pid)
        pid = &_pid;
    
    pa_runtime_path("pid", fn, sizeof(fn));
    
    if ((fd = open_pid_file(fn, O_RDONLY)) < 0)
        goto fail;
    
    if ((*pid = read_pid(fn, fd)) == (pid_t) -1)
        goto fail;

    ret = kill(*pid, sig);
    
fail:
    
    if (fd >= 0) {
        pa_lock_fd(fd, 0);
        close(fd);
    }

    return ret;
    
}

#else /* OS_IS_WIN32 */

int pa_pid_file_kill(int sig, pid_t *pid) {
    return -1;
}

#endif
