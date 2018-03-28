/***
  This file is part of PulseAudio.

  Copyright 2004-2006 Lennart Poettering
  Copyright 2004 Joe Marcus Clarke
  Copyright 2006-2007 Pierre Ossman <ossman@cendio.se> for Cendio AB

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

#ifdef HAVE_CONFIG_H
#include <config.h>
#endif

#include <stdarg.h>
#include <stdlib.h>
#include <signal.h>
#include <errno.h>
#include <string.h>
#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#include <limits.h>
#include <time.h>
#include <ctype.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/time.h>
#include <dirent.h>
#include <regex.h>
#include <langinfo.h>
#include <sys/utsname.h>

#ifdef HAVE_STRTOF_L
#include <locale.h>
#endif

#ifdef HAVE_SCHED_H
#include <sched.h>
#endif

#ifdef HAVE_SYS_RESOURCE_H
#include <sys/resource.h>
#endif

#ifdef HAVE_SYS_CAPABILITY_H
#include <sys/capability.h>
#endif

#ifdef HAVE_SYS_MMAN_H
#include <sys/mman.h>
#endif

#ifdef HAVE_PTHREAD
#include <pthread.h>
#endif

#ifdef HAVE_NETDB_H
#include <netdb.h>
#endif

#ifdef HAVE_WINDOWS_H
#include <windows.h>
#endif

#ifdef HAVE_PWD_H
#include <pwd.h>
#endif

#ifdef HAVE_GRP_H
#include <grp.h>
#endif

#ifdef HAVE_LIBSAMPLERATE
#include <samplerate.h>
#endif

#ifdef __APPLE__
#include <xlocale.h>
#endif

#include <pulse/xmalloc.h>
#include <pulse/util.h>
#include <pulse/utf8.h>

#include <pulsecore/core-error.h>
#include <pulsecore/winsock.h>
#include <pulsecore/log.h>
#include <pulsecore/macro.h>
#include <pulsecore/thread.h>
#include <pulsecore/strbuf.h>

#include "core-util.h"

/* Not all platforms have this */
#ifndef MSG_NOSIGNAL
#define MSG_NOSIGNAL 0
#endif

#ifdef OS_IS_WIN32

#define PULSE_ROOTENV "PULSE_ROOT"

int pa_set_root(HANDLE handle) {
    char library_path[MAX_PATH + sizeof(PULSE_ROOTENV) + 1], *sep;

    strcpy(library_path, PULSE_ROOTENV "=");

    /* FIXME: Needs to set errno */

    if (!GetModuleFileName(handle, library_path + sizeof(PULSE_ROOTENV), MAX_PATH))
        return 0;

    sep = strrchr(library_path, PA_PATH_SEP_CHAR);
    if (sep)
        *sep = '\0';

    if (_putenv(library_path) < 0)
        return 0;

    return 1;
}

#endif

/** Make a file descriptor nonblock. Doesn't do any error checking */
void pa_make_fd_nonblock(int fd) {

#ifdef O_NONBLOCK
    int v;
    pa_assert(fd >= 0);

    pa_assert_se((v = fcntl(fd, F_GETFL)) >= 0);

    if (!(v & O_NONBLOCK))
        pa_assert_se(fcntl(fd, F_SETFL, v|O_NONBLOCK) >= 0);

#elif defined(OS_IS_WIN32)
    u_long arg = 1;
    if (ioctlsocket(fd, FIONBIO, &arg) < 0) {
        pa_assert_se(WSAGetLastError() == WSAENOTSOCK);
        pa_log_warn("Only sockets can be made non-blocking!");
    }
#else
    pa_log_warn("Non-blocking I/O not supported.!");
#endif

}

/* Set the FD_CLOEXEC flag for a fd */
void pa_make_fd_cloexec(int fd) {

#ifdef FD_CLOEXEC
    int v;
    pa_assert(fd >= 0);

    pa_assert_se((v = fcntl(fd, F_GETFD, 0)) >= 0);

    if (!(v & FD_CLOEXEC))
        pa_assert_se(fcntl(fd, F_SETFD, v|FD_CLOEXEC) >= 0);
#endif

}

/** Creates a directory securely */
int pa_make_secure_dir(const char* dir, mode_t m, uid_t uid, gid_t gid) {
    struct stat st;
    int r, saved_errno;

    pa_assert(dir);

#ifdef OS_IS_WIN32
    r = mkdir(dir);
#else
    {
    mode_t u;
    u = umask((~m) & 0777);
    r = mkdir(dir, m);
    umask(u);
    }
#endif

    if (r < 0 && errno != EEXIST)
        return -1;

#ifdef HAVE_CHOWN
    if (uid == (uid_t)-1)
        uid = getuid();
    if (gid == (gid_t)-1)
        gid = getgid();
    (void) chown(dir, uid, gid);
#endif

#ifdef HAVE_CHMOD
    chmod(dir, m);
#endif

#ifdef HAVE_LSTAT
    if (lstat(dir, &st) < 0)
#else
    if (stat(dir, &st) < 0)
#endif
        goto fail;

#ifndef OS_IS_WIN32
    if (!S_ISDIR(st.st_mode) ||
        (st.st_uid != uid) ||
        (st.st_gid != gid) ||
        ((st.st_mode & 0777) != m)) {
        errno = EACCES;
        goto fail;
    }
#else
    pa_log_warn("Secure directory creation not supported on Win32.");
#endif

    return 0;

fail:
    saved_errno = errno;
    rmdir(dir);
    errno = saved_errno;

    return -1;
}

/* Return a newly allocated sting containing the parent directory of the specified file */
char *pa_parent_dir(const char *fn) {
    char *slash, *dir = pa_xstrdup(fn);

    if ((slash = (char*) pa_path_get_filename(dir)) == dir) {
        pa_xfree(dir);
        errno = ENOENT;
        return NULL;
    }

    *(slash-1) = 0;
    return dir;
}

/* Creates a the parent directory of the specified path securely */
int pa_make_secure_parent_dir(const char *fn, mode_t m, uid_t uid, gid_t gid) {
    int ret = -1;
    char *dir;

    if (!(dir = pa_parent_dir(fn)))
        goto finish;

    if (pa_make_secure_dir(dir, m, uid, gid) < 0)
        goto finish;

    ret = 0;

finish:
    pa_xfree(dir);
    return ret;
}

/** Platform independent read function. Necessary since not all
 * systems treat all file descriptors equal. If type is
 * non-NULL it is used to cache the type of the fd. This is
 * useful for making sure that only a single syscall is executed per
 * function call. The variable pointed to should be initialized to 0
 * by the caller. */
ssize_t pa_read(int fd, void *buf, size_t count, int *type) {

#ifdef OS_IS_WIN32

    if (!type || *type == 0) {
        ssize_t r;

        if ((r = recv(fd, buf, count, 0)) >= 0)
            return r;

        if (WSAGetLastError() != WSAENOTSOCK) {
            errno = WSAGetLastError();
            return r;
        }

        if (type)
            *type = 1;
    }

#endif

    return read(fd, buf, count);
}

/** Similar to pa_read(), but handles writes */
ssize_t pa_write(int fd, const void *buf, size_t count, int *type) {

    if (!type || *type == 0) {
        ssize_t r;

        if ((r = send(fd, buf, count, MSG_NOSIGNAL)) >= 0)
            return r;

#ifdef OS_IS_WIN32
        if (WSAGetLastError() != WSAENOTSOCK) {
            errno = WSAGetLastError();
            return r;
        }
#else
        if (errno != ENOTSOCK)
            return r;
#endif

        if (type)
            *type = 1;
    }

    return write(fd, buf, count);
}

/** Calls read() in a loop. Makes sure that as much as 'size' bytes,
 * unless EOF is reached or an error occured */
ssize_t pa_loop_read(int fd, void*data, size_t size, int *type) {
    ssize_t ret = 0;
    int _type;

    pa_assert(fd >= 0);
    pa_assert(data);
    pa_assert(size);

    if (!type) {
        _type = 0;
        type = &_type;
    }

    while (size > 0) {
        ssize_t r;

        if ((r = pa_read(fd, data, size, type)) < 0)
            return r;

        if (r == 0)
            break;

        ret += r;
        data = (uint8_t*) data + r;
        size -= (size_t) r;
    }

    return ret;
}

/** Similar to pa_loop_read(), but wraps write() */
ssize_t pa_loop_write(int fd, const void*data, size_t size, int *type) {
    ssize_t ret = 0;
    int _type;

    pa_assert(fd >= 0);
    pa_assert(data);
    pa_assert(size);

    if (!type) {
        _type = 0;
        type = &_type;
    }

    while (size > 0) {
        ssize_t r;

        if ((r = pa_write(fd, data, size, type)) < 0)
            return r;

        if (r == 0)
            break;

        ret += r;
        data = (const uint8_t*) data + r;
        size -= (size_t) r;
    }

    return ret;
}

/** Platform independent read function. Necessary since not all
 * systems treat all file descriptors equal. */
int pa_close(int fd) {

#ifdef OS_IS_WIN32
    int ret;

    if ((ret = closesocket(fd)) == 0)
        return 0;

    if (WSAGetLastError() != WSAENOTSOCK) {
        errno = WSAGetLastError();
        return ret;
    }
#endif

    for (;;) {
        int r;

        if ((r = close(fd)) >= 0)
            return r;

        if (errno != EINTR)
            return r;
    }
}

/* Print a warning messages in case that the given signal is not
 * blocked or trapped */
void pa_check_signal_is_blocked(int sig) {
#ifdef HAVE_SIGACTION
    struct sigaction sa;
    sigset_t set;

    /* If POSIX threads are supported use thread-aware
     * pthread_sigmask() function, to check if the signal is
     * blocked. Otherwise fall back to sigprocmask() */

#ifdef HAVE_PTHREAD
    if (pthread_sigmask(SIG_SETMASK, NULL, &set) < 0) {
#endif
        if (sigprocmask(SIG_SETMASK, NULL, &set) < 0) {
            pa_log("sigprocmask(): %s", pa_cstrerror(errno));
            return;
        }
#ifdef HAVE_PTHREAD
    }
#endif

    if (sigismember(&set, sig))
        return;

    /* Check whether the signal is trapped */

    if (sigaction(sig, NULL, &sa) < 0) {
        pa_log("sigaction(): %s", pa_cstrerror(errno));
        return;
    }

    if (sa.sa_handler != SIG_DFL)
        return;

    pa_log_warn("%s is not trapped. This might cause malfunction!", pa_sig2str(sig));
#else /* HAVE_SIGACTION */
    pa_log_warn("%s might not be trapped. This might cause malfunction!", pa_sig2str(sig));
#endif
}

/* The following function is based on an example from the GNU libc
 * documentation. This function is similar to GNU's asprintf(). */
char *pa_sprintf_malloc(const char *format, ...) {
    size_t  size = 100;
    char *c = NULL;

    pa_assert(format);

    for(;;) {
        int r;
        va_list ap;

        c = pa_xrealloc(c, size);

        va_start(ap, format);
        r = vsnprintf(c, size, format, ap);
        va_end(ap);

        c[size-1] = 0;

        if (r > -1 && (size_t) r < size)
            return c;

        if (r > -1)    /* glibc 2.1 */
            size = (size_t) r+1;
        else           /* glibc 2.0 */
            size *= 2;
    }
}

/* Same as the previous function, but use a va_list instead of an
 * ellipsis */
char *pa_vsprintf_malloc(const char *format, va_list ap) {
    size_t  size = 100;
    char *c = NULL;

    pa_assert(format);

    for(;;) {
        int r;
        va_list aq;

        c = pa_xrealloc(c, size);

        va_copy(aq, ap);
        r = vsnprintf(c, size, format, aq);
        va_end(aq);

        c[size-1] = 0;

        if (r > -1 && (size_t) r < size)
            return c;

        if (r > -1)    /* glibc 2.1 */
            size = (size_t) r+1;
        else           /* glibc 2.0 */
            size *= 2;
    }
}

/* Similar to OpenBSD's strlcpy() function */
char *pa_strlcpy(char *b, const char *s, size_t l) {
    pa_assert(b);
    pa_assert(s);
    pa_assert(l > 0);

    strncpy(b, s, l);
    b[l-1] = 0;
    return b;
}

/* Make the current thread a realtime thread, and acquire the highest
 * rtprio we can get that is less or equal the specified parameter. If
 * the thread is already realtime, don't do anything. */
int pa_make_realtime(int rtprio) {

#ifdef _POSIX_PRIORITY_SCHEDULING
    struct sched_param sp;
    int r, policy;

    memset(&sp, 0, sizeof(sp));
    policy = 0;

    if ((r = pthread_getschedparam(pthread_self(), &policy, &sp)) != 0) {
        pa_log("pthread_getschedgetparam(): %s", pa_cstrerror(r));
        return -1;
    }

    if (policy == SCHED_FIFO && sp.sched_priority >= rtprio) {
        pa_log_info("Thread already being scheduled with SCHED_FIFO with priority %i.", sp.sched_priority);
        return 0;
    }

    sp.sched_priority = rtprio;
    if ((r = pthread_setschedparam(pthread_self(), SCHED_FIFO, &sp)) != 0) {

        while (sp.sched_priority > 1) {
            sp.sched_priority --;

            if ((r = pthread_setschedparam(pthread_self(), SCHED_FIFO, &sp)) == 0) {
                pa_log_info("Successfully enabled SCHED_FIFO scheduling for thread, with priority %i, which is lower than the requested %i.", sp.sched_priority, rtprio);
                return 0;
            }
        }

        pa_log_warn("pthread_setschedparam(): %s", pa_cstrerror(r));
        return -1;
    }

    pa_log_info("Successfully enabled SCHED_FIFO scheduling for thread, with priority %i.", sp.sched_priority);
    return 0;
#else

    errno = ENOTSUP;
    return -1;
#endif
}

/* This is merely used for giving the user a hint. This is not correct
 * for anything security related */
pa_bool_t pa_can_realtime(void) {

    if (geteuid() == 0)
        return TRUE;

#if defined(HAVE_SYS_RESOURCE_H) && defined(RLIMIT_RTPRIO)
    {
        struct rlimit rl;

        if (getrlimit(RLIMIT_RTPRIO, &rl) >= 0)
            if (rl.rlim_cur > 0 || rl.rlim_cur == RLIM_INFINITY)
                return TRUE;
    }
#endif

#if defined(HAVE_SYS_CAPABILITY_H) && defined(CAP_SYS_NICE)
    {
        cap_t cap;

        if ((cap = cap_get_proc())) {
            cap_flag_value_t flag = CAP_CLEAR;

            if (cap_get_flag(cap, CAP_SYS_NICE, CAP_EFFECTIVE, &flag) >= 0)
                if (flag == CAP_SET) {
                    cap_free(cap);
                    return TRUE;
                }

            cap_free(cap);
        }
    }
#endif

    return FALSE;
}

/* This is merely used for giving the user a hint. This is not correct
 * for anything security related */
pa_bool_t pa_can_high_priority(void) {

    if (geteuid() == 0)
        return TRUE;

#if defined(HAVE_SYS_RESOURCE_H) && defined(RLIMIT_RTPRIO)
    {
        struct rlimit rl;

        if (getrlimit(RLIMIT_NICE, &rl) >= 0)
            if (rl.rlim_cur >= 21 || rl.rlim_cur == RLIM_INFINITY)
                return TRUE;
    }
#endif

#if defined(HAVE_SYS_CAPABILITY_H) && defined(CAP_SYS_NICE)
    {
        cap_t cap;

        if ((cap = cap_get_proc())) {
            cap_flag_value_t flag = CAP_CLEAR;

            if (cap_get_flag(cap, CAP_SYS_NICE, CAP_EFFECTIVE, &flag) >= 0)
                if (flag == CAP_SET) {
                    cap_free(cap);
                    return TRUE;
                }

            cap_free(cap);
        }
    }
#endif

    return FALSE;
}

/* Raise the priority of the current process as much as possible that
 * is <= the specified nice level..*/
int pa_raise_priority(int nice_level) {

#ifdef HAVE_SYS_RESOURCE_H
    if (setpriority(PRIO_PROCESS, 0, nice_level) < 0) {
        int n;

        for (n = nice_level+1; n < 0; n++) {

            if (setpriority(PRIO_PROCESS, 0, n) == 0) {
                pa_log_info("Successfully acquired nice level %i, which is lower than the requested %i.", n, nice_level);
                return 0;
            }
        }

        pa_log_warn("setpriority(): %s", pa_cstrerror(errno));
        return -1;
    }

    pa_log_info("Successfully gained nice level %i.", nice_level);
#endif

#ifdef OS_IS_WIN32
    if (nice_level < 0) {
        if (!SetPriorityClass(GetCurrentProcess(), HIGH_PRIORITY_CLASS)) {
            pa_log_warn("SetPriorityClass() failed: 0x%08X", GetLastError());
            errno = EPERM;
            return .-1;
        } else
            pa_log_info("Successfully gained high priority class.");
    }
#endif

    return 0;
}

/* Reset the priority to normal, inverting the changes made by
 * pa_raise_priority() and pa_make_realtime()*/
void pa_reset_priority(void) {
#ifdef HAVE_SYS_RESOURCE_H
    struct sched_param sp;

    setpriority(PRIO_PROCESS, 0, 0);

    memset(&sp, 0, sizeof(sp));
    pa_assert_se(pthread_setschedparam(pthread_self(), SCHED_OTHER, &sp) == 0);
#endif

#ifdef OS_IS_WIN32
    SetPriorityClass(GetCurrentProcess(), NORMAL_PRIORITY_CLASS);
#endif
}

int pa_match(const char *expr, const char *v) {
    int k;
    regex_t re;
    int r;

    if (regcomp(&re, expr, REG_NOSUB|REG_EXTENDED) != 0) {
        errno = EINVAL;
        return -1;
    }

    if ((k = regexec(&re, v, 0, NULL, 0)) == 0)
        r = 1;
    else if (k == REG_NOMATCH)
        r = 0;
    else
        r = -1;

    regfree(&re);

    if (r < 0)
        errno = EINVAL;

    return r;
}

/* Try to parse a boolean string value.*/
int pa_parse_boolean(const char *v) {
    const char *expr;
    int r;
    pa_assert(v);

    /* First we check language independant */
    if (!strcmp(v, "1") || v[0] == 'y' || v[0] == 'Y' || v[0] == 't' || v[0] == 'T' || !strcasecmp(v, "on"))
        return 1;
    else if (!strcmp(v, "0") || v[0] == 'n' || v[0] == 'N' || v[0] == 'f' || v[0] == 'F' || !strcasecmp(v, "off"))
        return 0;

    /* And then we check language dependant */
    if ((expr = nl_langinfo(YESEXPR)))
        if (expr[0])
            if ((r = pa_match(expr, v)) > 0)
                return 1;

    if ((expr = nl_langinfo(NOEXPR)))
        if (expr[0])
            if ((r = pa_match(expr, v)) > 0)
                return 0;

    errno = EINVAL;
    return -1;
}

/* Split the specified string wherever one of the strings in delimiter
 * occurs. Each time it is called returns a newly allocated string
 * with pa_xmalloc(). The variable state points to, should be
 * initiallized to NULL before the first call. */
char *pa_split(const char *c, const char *delimiter, const char**state) {
    const char *current = *state ? *state : c;
    size_t l;

    if (!*current)
        return NULL;

    l = strcspn(current, delimiter);
    *state = current+l;

    if (**state)
        (*state)++;

    return pa_xstrndup(current, l);
}

/* What is interpreted as whitespace? */
#define WHITESPACE " \t\n"

/* Split a string into words. Otherwise similar to pa_split(). */
char *pa_split_spaces(const char *c, const char **state) {
    const char *current = *state ? *state : c;
    size_t l;

    if (!*current || *c == 0)
        return NULL;

    current += strspn(current, WHITESPACE);
    l = strcspn(current, WHITESPACE);

    *state = current+l;

    return pa_xstrndup(current, l);
}

PA_STATIC_TLS_DECLARE(signame, pa_xfree);

/* Return the name of an UNIX signal. Similar to Solaris sig2str() */
const char *pa_sig2str(int sig) {
    char *t;

    if (sig <= 0)
        goto fail;

#ifdef NSIG
    if (sig >= NSIG)
        goto fail;
#endif

#ifdef HAVE_SIG2STR
    {
        char buf[SIG2STR_MAX];

        if (sig2str(sig, buf) == 0) {
            pa_xfree(PA_STATIC_TLS_GET(signame));
            t = pa_sprintf_malloc("SIG%s", buf);
            PA_STATIC_TLS_SET(signame, t);
            return t;
        }
    }
#else

    switch(sig) {
#ifdef SIGHUP
        case SIGHUP:    return "SIGHUP";
#endif
        case SIGINT:    return "SIGINT";
#ifdef SIGQUIT
        case SIGQUIT:   return "SIGQUIT";
#endif
        case SIGILL:    return "SIGULL";
#ifdef SIGTRAP
        case SIGTRAP:   return "SIGTRAP";
#endif
        case SIGABRT:   return "SIGABRT";
#ifdef SIGBUS
        case SIGBUS:    return "SIGBUS";
#endif
        case SIGFPE:    return "SIGFPE";
#ifdef SIGKILL
        case SIGKILL:   return "SIGKILL";
#endif
#ifdef SIGUSR1
        case SIGUSR1:   return "SIGUSR1";
#endif
        case SIGSEGV:   return "SIGSEGV";
#ifdef SIGUSR2
        case SIGUSR2:   return "SIGUSR2";
#endif
#ifdef SIGPIPE
        case SIGPIPE:   return "SIGPIPE";
#endif
#ifdef SIGALRM
        case SIGALRM:   return "SIGALRM";
#endif
        case SIGTERM:   return "SIGTERM";
#ifdef SIGSTKFLT
        case SIGSTKFLT: return "SIGSTKFLT";
#endif
#ifdef SIGCHLD
        case SIGCHLD:   return "SIGCHLD";
#endif
#ifdef SIGCONT
        case SIGCONT:   return "SIGCONT";
#endif
#ifdef SIGSTOP
        case SIGSTOP:   return "SIGSTOP";
#endif
#ifdef SIGTSTP
        case SIGTSTP:   return "SIGTSTP";
#endif
#ifdef SIGTTIN
        case SIGTTIN:   return "SIGTTIN";
#endif
#ifdef SIGTTOU
        case SIGTTOU:   return "SIGTTOU";
#endif
#ifdef SIGURG
        case SIGURG:    return "SIGURG";
#endif
#ifdef SIGXCPU
        case SIGXCPU:   return "SIGXCPU";
#endif
#ifdef SIGXFSZ
        case SIGXFSZ:   return "SIGXFSZ";
#endif
#ifdef SIGVTALRM
        case SIGVTALRM: return "SIGVTALRM";
#endif
#ifdef SIGPROF
        case SIGPROF:   return "SIGPROF";
#endif
#ifdef SIGWINCH
        case SIGWINCH:  return "SIGWINCH";
#endif
#ifdef SIGIO
        case SIGIO:     return "SIGIO";
#endif
#ifdef SIGPWR
        case SIGPWR:    return "SIGPWR";
#endif
#ifdef SIGSYS
        case SIGSYS:    return "SIGSYS";
#endif
    }

#ifdef SIGRTMIN
    if (sig >= SIGRTMIN && sig <= SIGRTMAX) {
        pa_xfree(PA_STATIC_TLS_GET(signame));
        t = pa_sprintf_malloc("SIGRTMIN+%i", sig - SIGRTMIN);
        PA_STATIC_TLS_SET(signame, t);
        return t;
    }
#endif

#endif

fail:

    pa_xfree(PA_STATIC_TLS_GET(signame));
    t = pa_sprintf_malloc("SIG%i", sig);
    PA_STATIC_TLS_SET(signame, t);
    return t;
}

#ifdef HAVE_GRP_H

/* Check whether the specified GID and the group name match */
static int is_group(gid_t gid, const char *name) {
    struct group group, *result = NULL;
    long n;
    void *data;
    int r = -1;

#ifdef HAVE_GETGRGID_R
#ifdef _SC_GETGR_R_SIZE_MAX
    n = sysconf(_SC_GETGR_R_SIZE_MAX);
#else
    n = -1;
#endif
    if (n <= 0)
        n = 512;

    data = pa_xmalloc((size_t) n);

    errno = 0;
    if (getgrgid_r(gid, &group, data, (size_t) n, &result) < 0 || !result) {
        pa_log("getgrgid_r(%u): %s", (unsigned) gid, pa_cstrerror(errno));

        if (!errno)
            errno = ENOENT;

        goto finish;
    }

    r = strcmp(name, result->gr_name) == 0;

finish:
    pa_xfree(data);
#else
    /* XXX Not thread-safe, but needed on OSes (e.g. FreeBSD 4.X) that do not
     * support getgrgid_r. */

    errno = 0;
    if (!(result = getgrgid(gid))) {
        pa_log("getgrgid(%u): %s", gid, pa_cstrerror(errno));

        if (!errno)
            errno = ENOENT;

        goto finish;
    }

    r = strcmp(name, result->gr_name) == 0;

finish:
#endif

    return r;
}

/* Check the current user is member of the specified group */
int pa_own_uid_in_group(const char *name, gid_t *gid) {
    GETGROUPS_T *gids, tgid;
    long n = sysconf(_SC_NGROUPS_MAX);
    int r = -1, i, k;

    pa_assert(n > 0);

    gids = pa_xmalloc(sizeof(GETGROUPS_T) * (size_t) n);

    if ((n = getgroups((int) n, gids)) < 0) {
        pa_log("getgroups(): %s", pa_cstrerror(errno));
        goto finish;
    }

    for (i = 0; i < n; i++) {

        if ((k = is_group(gids[i], name)) < 0)
            goto finish;
        else if (k > 0) {
            *gid = gids[i];
            r = 1;
            goto finish;
        }
    }

    if ((k = is_group(tgid = getgid(), name)) < 0)
        goto finish;
    else if (k > 0) {
        *gid = tgid;
        r = 1;
        goto finish;
    }

    r = 0;

finish:

    pa_xfree(gids);
    return r;
}

/* Check whether the specifc user id is a member of the specified group */
int pa_uid_in_group(uid_t uid, const char *name) {
    char *g_buf, *p_buf;
    long g_n, p_n;
    struct group grbuf, *gr;
    char **i;
    int r = -1;

#ifdef _SC_GETGR_R_SIZE_MAX
    g_n = sysconf(_SC_GETGR_R_SIZE_MAX);
#else
    g_n = -1;
#endif
    if (g_n <= 0)
        g_n = 512;

    g_buf = pa_xmalloc((size_t) g_n);

#ifdef _SC_GETPW_R_SIZE_MAX
    p_n = sysconf(_SC_GETPW_R_SIZE_MAX);
#else
    p_n = -1;
#endif
    if (p_n <= 0)
        p_n = 512;

    p_buf = pa_xmalloc((size_t) p_n);

    errno = 0;
#ifdef HAVE_GETGRNAM_R
    if (getgrnam_r(name, &grbuf, g_buf, (size_t) g_n, &gr) != 0 || !gr)
#else
    if (!(gr = getgrnam(name)))
#endif
    {
        if (!errno)
            errno = ENOENT;
        goto finish;
    }

    r = 0;
    for (i = gr->gr_mem; *i; i++) {
        struct passwd pwbuf, *pw;

#ifdef HAVE_GETPWNAM_R
        if (getpwnam_r(*i, &pwbuf, p_buf, (size_t) p_n, &pw) != 0 || !pw)
#else
        if (!(pw = getpwnam(*i)))
#endif
            continue;

        if (pw->pw_uid == uid) {
            r = 1;
            break;
        }
    }

finish:
    pa_xfree(g_buf);
    pa_xfree(p_buf);

    return r;
}

/* Get the GID of a gfiven group, return (gid_t) -1 on failure. */
gid_t pa_get_gid_of_group(const char *name) {
    gid_t ret = (gid_t) -1;
    char *g_buf;
    long g_n;
    struct group grbuf, *gr;

#ifdef _SC_GETGR_R_SIZE_MAX
    g_n = sysconf(_SC_GETGR_R_SIZE_MAX);
#else
    g_n = -1;
#endif
    if (g_n <= 0)
        g_n = 512;

    g_buf = pa_xmalloc((size_t) g_n);

    errno = 0;
#ifdef HAVE_GETGRNAM_R
    if (getgrnam_r(name, &grbuf, g_buf, (size_t) g_n, &gr) != 0 || !gr)
#else
    if (!(gr = getgrnam(name)))
#endif
    {
        if (!errno)
            errno = ENOENT;
        goto finish;
    }

    ret = gr->gr_gid;

finish:
    pa_xfree(g_buf);
    return ret;
}

int pa_check_in_group(gid_t g) {
    gid_t gids[NGROUPS_MAX];
    int r;

    if ((r = getgroups(NGROUPS_MAX, gids)) < 0)
        return -1;

    for (; r > 0; r--)
        if (gids[r-1] == g)
            return 1;

    return 0;
}

#else /* HAVE_GRP_H */

int pa_own_uid_in_group(const char *name, gid_t *gid) {
    errno = ENOSUP;
    return -1;

}

int pa_uid_in_group(uid_t uid, const char *name) {
    errno = ENOSUP;
    return -1;
}

gid_t pa_get_gid_of_group(const char *name) {
    errno = ENOSUP;
    return (gid_t) -1;
}

int pa_check_in_group(gid_t g) {
    errno = ENOSUP;
    return -1;
}

#endif

/* Lock or unlock a file entirely.
  (advisory on UNIX, mandatory on Windows) */
int pa_lock_fd(int fd, int b) {
#ifdef F_SETLKW
    struct flock flock;

    /* Try a R/W lock first */

    flock.l_type = (short) (b ? F_WRLCK : F_UNLCK);
    flock.l_whence = SEEK_SET;
    flock.l_start = 0;
    flock.l_len = 0;

    if (fcntl(fd, F_SETLKW, &flock) >= 0)
        return 0;

    /* Perhaps the file descriptor qas opened for read only, than try again with a read lock. */
    if (b && errno == EBADF) {
        flock.l_type = F_RDLCK;
        if (fcntl(fd, F_SETLKW, &flock) >= 0)
            return 0;
    }

    pa_log("%slock: %s", !b? "un" : "", pa_cstrerror(errno));
#endif

#ifdef OS_IS_WIN32
    HANDLE h = (HANDLE)_get_osfhandle(fd);

    if (b && LockFile(h, 0, 0, 0xFFFFFFFF, 0xFFFFFFFF))
        return 0;
    if (!b && UnlockFile(h, 0, 0, 0xFFFFFFFF, 0xFFFFFFFF))
        return 0;

    pa_log("%slock failed: 0x%08X", !b ? "un" : "", GetLastError());

    /* FIXME: Needs to set errno! */
#endif

    return -1;
}

/* Remove trailing newlines from a string */
char* pa_strip_nl(char *s) {
    pa_assert(s);

    s[strcspn(s, "\r\n")] = 0;
    return s;
}

/* Create a temporary lock file and lock it. */
int pa_lock_lockfile(const char *fn) {
    int fd = -1;
    pa_assert(fn);

    for (;;) {
        struct stat st;

        if ((fd = open(fn, O_CREAT|O_RDWR
#ifdef O_NOCTTY
                       |O_NOCTTY
#endif
#ifdef O_NOFOLLOW
                       |O_NOFOLLOW
#endif
                       , S_IRUSR|S_IWUSR)) < 0) {
            pa_log_warn("Failed to create lock file '%s': %s", fn, pa_cstrerror(errno));
            goto fail;
        }

        if (pa_lock_fd(fd, 1) < 0) {
            pa_log_warn("Failed to lock file '%s'.", fn);
            goto fail;
        }

        if (fstat(fd, &st) < 0) {
            pa_log_warn("Failed to fstat() file '%s': %s", fn, pa_cstrerror(errno));
            goto fail;
        }

        /* Check wheter the file has been removed meanwhile. When yes,
         * restart this loop, otherwise, we're done */
        if (st.st_nlink >= 1)
            break;

        if (pa_lock_fd(fd, 0) < 0) {
            pa_log_warn("Failed to unlock file '%s'.", fn);
            goto fail;
        }

        if (pa_close(fd) < 0) {
            pa_log_warn("Failed to close file '%s': %s", fn, pa_cstrerror(errno));
            fd = -1;
            goto fail;
        }

        fd = -1;
    }

    return fd;

fail:

    if (fd >= 0) {
        int saved_errno = errno;
        pa_close(fd);
        errno = saved_errno;
    }

    return -1;
}

/* Unlock a temporary lcok file */
int pa_unlock_lockfile(const char *fn, int fd) {
    int r = 0;
    pa_assert(fd >= 0);

    if (fn) {
        if (unlink(fn) < 0) {
            pa_log_warn("Unable to remove lock file '%s': %s", fn, pa_cstrerror(errno));
            r = -1;
        }
    }

    if (pa_lock_fd(fd, 0) < 0) {
        pa_log_warn("Failed to unlock file '%s'.", fn);
        r = -1;
    }

    if (pa_close(fd) < 0) {
        pa_log_warn("Failed to close '%s': %s", fn, pa_cstrerror(errno));
        r = -1;
    }

    return r;
}

static char *get_pulse_home(void) {
    char h[PATH_MAX];
    struct stat st;

    if (!pa_get_home_dir(h, sizeof(h))) {
        pa_log_error("Failed to get home directory.");
        return NULL;
    }

    if (stat(h, &st) < 0) {
        pa_log_error("Failed to stat home directory %s: %s", h, pa_cstrerror(errno));
        return NULL;
    }

    if (st.st_uid != getuid()) {
        pa_log_error("Home directory %s not ours.", h);
        errno = EACCES;
        return NULL;
    }

    return pa_sprintf_malloc("%s" PA_PATH_SEP ".pulse", h);
}

char *pa_get_state_dir(void) {
    char *d;

    /* The state directory shall contain dynamic data that should be
     * kept across reboots, and is private to this user */

    if (!(d = pa_xstrdup(getenv("PULSE_STATE_PATH"))))
        if (!(d = get_pulse_home()))
            return NULL;

    /* If PULSE_STATE_PATH and PULSE_RUNTIME_PATH point to the same
     * dir then this will break. */

    if (pa_make_secure_dir(d, 0700U, (uid_t) -1, (gid_t) -1) < 0)  {
        pa_log_error("Failed to create secure directory: %s", pa_cstrerror(errno));
        pa_xfree(d);
        return NULL;
    }

    return d;
}

static char* make_random_dir(mode_t m) {
    static const char table[] =
        "abcdefghijklmnopqrstuvwxyz"
        "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        "0123456789";

    const char *tmpdir;
    char *fn;
    size_t pathlen;

    if (!(tmpdir = getenv("TMPDIR")))
        if (!(tmpdir = getenv("TMP")))
            if (!(tmpdir = getenv("TEMP")))
                tmpdir = getenv("TEMPDIR");

    if (!tmpdir || !pa_is_path_absolute(tmpdir))
        tmpdir = "/tmp";

    fn = pa_sprintf_malloc("%s/pulse-XXXXXXXXXXXX", tmpdir);
    pathlen = strlen(fn);

    for (;;) {
        size_t i;
        int r;
        mode_t u;
        int saved_errno;

        for (i = pathlen - 12; i < pathlen; i++)
            fn[i] = table[rand() % (sizeof(table)-1)];

        u = umask((~m) & 0777);
        r = mkdir(fn, m);

        saved_errno = errno;
        umask(u);
        errno = saved_errno;

        if (r >= 0)
            return fn;

        if (errno != EEXIST) {
            pa_log_error("Failed to create random directory %s: %s", fn, pa_cstrerror(errno));
            pa_xfree(fn);
            return NULL;
        }
    }
}

static int make_random_dir_and_link(mode_t m, const char *k) {
    char *p;

    if (!(p = make_random_dir(m)))
        return -1;

    if (symlink(p, k) < 0) {
        int saved_errno = errno;

        if (errno != EEXIST)
            pa_log_error("Failed to symlink %s to %s: %s", k, p, pa_cstrerror(errno));

        rmdir(p);
        pa_xfree(p);

        errno = saved_errno;
        return -1;
    }

    pa_xfree(p);
    return 0;
}

char *pa_get_runtime_dir(void) {
    char *d, *k = NULL, *p = NULL, *t = NULL, *mid;
    struct stat st;
    mode_t m;

    /* The runtime directory shall contain dynamic data that needs NOT
     * to be kept accross reboots and is usuallly private to the user,
     * except in system mode, where it might be accessible by other
     * users, too. Since we need POSIX locking and UNIX sockets in
     * this directory, we link it to a random subdir in /tmp, if it
     * was not explicitly configured. */

    m = pa_in_system_mode() ? 0755U : 0700U;

    if ((d = getenv("PULSE_RUNTIME_PATH"))) {

        if (pa_make_secure_dir(d, m, (uid_t) -1, (gid_t) -1) < 0)  {
            pa_log_error("Failed to create secure directory: %s", pa_cstrerror(errno));
            goto fail;
        }

        return pa_xstrdup(d);
    }

    if (!(d = get_pulse_home()))
        goto fail;

    if (pa_make_secure_dir(d, m, (uid_t) -1, (gid_t) -1) < 0)  {
        pa_log_error("Failed to create secure directory: %s", pa_cstrerror(errno));
        pa_xfree(d);
        goto fail;
    }

    if (!(mid = pa_machine_id())) {
        pa_xfree(d);
        goto fail;
    }

    k = pa_sprintf_malloc("%s" PA_PATH_SEP "%s:runtime", d, mid);
    pa_xfree(d);
    pa_xfree(mid);

    for (;;) {
        /* OK, first let's check if the "runtime" symlink is already
         * existant */

        if (!(p = pa_readlink(k))) {

            if (errno != ENOENT) {
                pa_log_error("Failed to stat runtime directory %s: %s", k, pa_cstrerror(errno));
                goto fail;
            }

            /* Hmm, so the runtime directory didn't exist yet, so let's
             * create one in /tmp and symlink that to it */

            if (make_random_dir_and_link(0700, k) < 0) {

                /* Mhmm, maybe another process was quicker than us,
                 * let's check if that was valid */
                if (errno == EEXIST)
                    continue;

                goto fail;
            }

            return k;
        }

        /* Make sure that this actually makes sense */
        if (!pa_is_path_absolute(p)) {
            pa_log_error("Path %s in link %s is not absolute.", p, k);
            errno = ENOENT;
            goto fail;
        }

        /* Hmm, so this symlink is still around, make sure nobody fools
         * us */

        if (lstat(p, &st) < 0) {

            if (errno != ENOENT) {
                pa_log_error("Failed to stat runtime directory %s: %s", p, pa_cstrerror(errno));
                goto fail;
            }

        } else {

            if (S_ISDIR(st.st_mode) &&
                (st.st_uid == getuid()) &&
                ((st.st_mode & 0777) == 0700)) {

                pa_xfree(p);
                return k;
            }

            pa_log_info("Hmm, runtime path exists, but points to an invalid directory. Changing runtime directory.");
        }

        pa_xfree(p);
        p = NULL;

        /* Hmm, so the link points to some nonexisting or invalid
         * dir. Let's replace it by a new link. We first create a
         * temporary link and then rename that to allow concurrent
         * execution of this function. */

        t = pa_sprintf_malloc("%s.tmp", k);

        if (make_random_dir_and_link(0700, t) < 0) {

            if (errno != EEXIST) {
                pa_log_error("Failed to symlink %s: %s", t, pa_cstrerror(errno));
                goto fail;
            }

            pa_xfree(t);
            t = NULL;

            /* Hmm, someone lese was quicker then us. Let's give
             * him some time to finish, and retry. */
            pa_msleep(10);
            continue;
        }

        /* OK, we succeeded in creating the temporary symlink, so
         * let's rename it */
        if (rename(t, k) < 0) {
            pa_log_error("Failed to rename %s to %s: %s", t, k, pa_cstrerror(errno));
            goto fail;
        }

        pa_xfree(t);
        return k;
    }

fail:
    pa_xfree(p);
    pa_xfree(k);
    pa_xfree(t);

    return NULL;
}

/* Try to open a configuration file. If "env" is specified, open the
 * value of the specified environment variable. Otherwise look for a
 * file "local" in the home directory or a file "global" in global
 * file system. If "result" is non-NULL, a pointer to a newly
 * allocated buffer containing the used configuration file is
 * stored there.*/
FILE *pa_open_config_file(const char *global, const char *local, const char *env, char **result) {
    const char *fn;
#ifdef OS_IS_WIN32
    char buf[PATH_MAX];

    if (!getenv(PULSE_ROOTENV))
        pa_set_root(NULL);
#endif

    if (env && (fn = getenv(env))) {
        FILE *f;

#ifdef OS_IS_WIN32
        if (!ExpandEnvironmentStrings(fn, buf, PATH_MAX))
            /* FIXME: Needs to set errno! */
            return NULL;
        fn = buf;
#endif

        if ((f = fopen(fn, "r"))) {
            if (result)
                *result = pa_xstrdup(fn);

            return f;
        }

        pa_log_warn("Failed to open configuration file '%s': %s", fn, pa_cstrerror(errno));
        return NULL;
    }

    if (local) {
        const char *e;
        char *lfn;
        char h[PATH_MAX];
        FILE *f;

        if ((e = getenv("PULSE_CONFIG_PATH")))
            fn = lfn = pa_sprintf_malloc("%s" PA_PATH_SEP "%s", e, local);
        else if (pa_get_home_dir(h, sizeof(h)))
            fn = lfn = pa_sprintf_malloc("%s" PA_PATH_SEP ".pulse" PA_PATH_SEP "%s", h, local);
        else
            return NULL;

#ifdef OS_IS_WIN32
        if (!ExpandEnvironmentStrings(lfn, buf, PATH_MAX)) {
            /* FIXME: Needs to set errno! */
            pa_xfree(lfn);
            return NULL;
        }
        fn = buf;
#endif

        if ((f = fopen(fn, "r"))) {
            if (result)
                *result = pa_xstrdup(fn);

            pa_xfree(lfn);
            return f;
        }

        if (errno != ENOENT) {
            pa_log_warn("Failed to open configuration file '%s': %s", fn, pa_cstrerror(errno));
            pa_xfree(lfn);
            return NULL;
        }

        pa_xfree(lfn);
    }

    if (global) {
        FILE *f;

#ifdef OS_IS_WIN32
        if (!ExpandEnvironmentStrings(global, buf, PATH_MAX))
            /* FIXME: Needs to set errno! */
            return NULL;
        global = buf;
#endif

        if ((f = fopen(global, "r"))) {

            if (result)
                *result = pa_xstrdup(global);

            return f;
        }
    }

    errno = ENOENT;
    return NULL;
}

char *pa_find_config_file(const char *global, const char *local, const char *env) {
    const char *fn;
#ifdef OS_IS_WIN32
    char buf[PATH_MAX];

    if (!getenv(PULSE_ROOTENV))
        pa_set_root(NULL);
#endif

    if (env && (fn = getenv(env))) {

#ifdef OS_IS_WIN32
        if (!ExpandEnvironmentStrings(fn, buf, PATH_MAX))
            /* FIXME: Needs to set errno! */
            return NULL;
        fn = buf;
#endif

        if (access(fn, R_OK) == 0)
            return pa_xstrdup(fn);

        pa_log_warn("Failed to access configuration file '%s': %s", fn, pa_cstrerror(errno));
        return NULL;
    }

    if (local) {
        const char *e;
        char *lfn;
        char h[PATH_MAX];

        if ((e = getenv("PULSE_CONFIG_PATH")))
            fn = lfn = pa_sprintf_malloc("%s" PA_PATH_SEP "%s", e, local);
        else if (pa_get_home_dir(h, sizeof(h)))
            fn = lfn = pa_sprintf_malloc("%s" PA_PATH_SEP ".pulse" PA_PATH_SEP "%s", h, local);
        else
            return NULL;

#ifdef OS_IS_WIN32
        if (!ExpandEnvironmentStrings(lfn, buf, PATH_MAX)) {
            /* FIXME: Needs to set errno! */
            pa_xfree(lfn);
            return NULL;
        }
        fn = buf;
#endif

        if (access(fn, R_OK) == 0) {
            char *r = pa_xstrdup(fn);
            pa_xfree(lfn);
            return r;
        }

        if (errno != ENOENT) {
            pa_log_warn("Failed to access configuration file '%s': %s", fn, pa_cstrerror(errno));
            pa_xfree(lfn);
            return NULL;
        }

        pa_xfree(lfn);
    }

    if (global) {
#ifdef OS_IS_WIN32
        if (!ExpandEnvironmentStrings(global, buf, PATH_MAX))
            /* FIXME: Needs to set errno! */
            return NULL;
        global = buf;
#endif

        if (access(global, R_OK) == 0)
            return pa_xstrdup(global);
    }

    errno = ENOENT;

    return NULL;
}

/* Format the specified data as a hexademical string */
char *pa_hexstr(const uint8_t* d, size_t dlength, char *s, size_t slength) {
    size_t i = 0, j = 0;
    const char hex[] = "0123456789abcdef";

    pa_assert(d);
    pa_assert(s);
    pa_assert(slength > 0);

    while (i < dlength && j+3 <= slength) {
        s[j++] = hex[*d >> 4];
        s[j++] = hex[*d & 0xF];

        d++;
        i++;
    }

    s[j < slength ? j : slength] = 0;
    return s;
}

/* Convert a hexadecimal digit to a number or -1 if invalid */
static int hexc(char c) {
    if (c >= '0' && c <= '9')
        return c - '0';

    if (c >= 'A' && c <= 'F')
        return c - 'A' + 10;

    if (c >= 'a' && c <= 'f')
        return c - 'a' + 10;

    errno = EINVAL;
    return -1;
}

/* Parse a hexadecimal string as created by pa_hexstr() to a BLOB */
size_t pa_parsehex(const char *p, uint8_t *d, size_t dlength) {
    size_t j = 0;

    pa_assert(p);
    pa_assert(d);

    while (j < dlength && *p) {
        int b;

        if ((b = hexc(*(p++))) < 0)
            return (size_t) -1;

        d[j] = (uint8_t) (b << 4);

        if (!*p)
            return (size_t) -1;

        if ((b = hexc(*(p++))) < 0)
            return (size_t) -1;

        d[j] |= (uint8_t) b;
        j++;
    }

    return j;
}

/* Returns nonzero when *s starts with *pfx */
pa_bool_t pa_startswith(const char *s, const char *pfx) {
    size_t l;

    pa_assert(s);
    pa_assert(pfx);

    l = strlen(pfx);

    return strlen(s) >= l && strncmp(s, pfx, l) == 0;
}

/* Returns nonzero when *s ends with *sfx */
pa_bool_t pa_endswith(const char *s, const char *sfx) {
    size_t l1, l2;

    pa_assert(s);
    pa_assert(sfx);

    l1 = strlen(s);
    l2 = strlen(sfx);

    return l1 >= l2 && strcmp(s+l1-l2, sfx) == 0;
}

pa_bool_t pa_is_path_absolute(const char *fn) {
    pa_assert(fn);

#ifndef OS_IS_WIN32
    return *fn == '/';
#else
    return strlen(fn) >= 3 && isalpha(fn[0]) && fn[1] == ':' && fn[2] == '\\';
#endif
}

char *pa_make_path_absolute(const char *p) {
    char *r;
    char *cwd;

    pa_assert(p);

    if (pa_is_path_absolute(p))
        return pa_xstrdup(p);

    if (!(cwd = pa_getcwd()))
        return pa_xstrdup(p);

    r = pa_sprintf_malloc("%s" PA_PATH_SEP "%s", cwd, p);
    pa_xfree(cwd);
    return r;
}

/* if fn is null return the PulseAudio run time path in s (~/.pulse)
 * if fn is non-null and starts with / return fn
 * otherwise append fn to the run time path and return it */
static char *get_path(const char *fn, pa_bool_t prependmid, pa_bool_t rt) {
    char *rtp;

    if (pa_is_path_absolute(fn))
        return pa_xstrdup(fn);

    rtp = rt ? pa_get_runtime_dir() : pa_get_state_dir();

    if (!rtp)
        return NULL;

    if (fn) {
        char *r;

        if (prependmid) {
            char *mid;

            if (!(mid = pa_machine_id())) {
                pa_xfree(rtp);
                return NULL;
            }

            r = pa_sprintf_malloc("%s" PA_PATH_SEP "%s:%s", rtp, mid, fn);
            pa_xfree(mid);
        } else
            r = pa_sprintf_malloc("%s" PA_PATH_SEP "%s", rtp, fn);

        pa_xfree(rtp);
        return r;
    } else
        return rtp;
}

char *pa_runtime_path(const char *fn) {
    return get_path(fn, FALSE, TRUE);
}

char *pa_state_path(const char *fn, pa_bool_t appendmid) {
    return get_path(fn, appendmid, FALSE);
}

/* Convert the string s to a signed integer in *ret_i */
int pa_atoi(const char *s, int32_t *ret_i) {
    char *x = NULL;
    long l;

    pa_assert(s);
    pa_assert(ret_i);

    errno = 0;
    l = strtol(s, &x, 0);

    if (!x || *x || errno) {
        if (!errno)
            errno = EINVAL;
        return -1;
    }

    if ((int32_t) l != l) {
        errno = ERANGE;
        return -1;
    }

    *ret_i = (int32_t) l;

    return 0;
}

/* Convert the string s to an unsigned integer in *ret_u */
int pa_atou(const char *s, uint32_t *ret_u) {
    char *x = NULL;
    unsigned long l;

    pa_assert(s);
    pa_assert(ret_u);

    errno = 0;
    l = strtoul(s, &x, 0);

    if (!x || *x || errno) {
        if (!errno)
            errno = EINVAL;
        return -1;
    }

    if ((uint32_t) l != l) {
        errno = ERANGE;
        return -1;
    }

    *ret_u = (uint32_t) l;

    return 0;
}

#ifdef HAVE_STRTOF_L
static locale_t c_locale = NULL;

static void c_locale_destroy(void) {
    freelocale(c_locale);
}
#endif

int pa_atod(const char *s, double *ret_d) {
    char *x = NULL;
    double f;

    pa_assert(s);
    pa_assert(ret_d);

    /* This should be locale independent */

#ifdef HAVE_STRTOF_L

    PA_ONCE_BEGIN {

        if ((c_locale = newlocale(LC_ALL_MASK, "C", NULL)))
            atexit(c_locale_destroy);

    } PA_ONCE_END;

    if (c_locale) {
        errno = 0;
        f = strtod_l(s, &x, c_locale);
    } else
#endif
    {
        errno = 0;
        f = strtod(s, &x);
    }

    if (!x || *x || errno) {
        if (!errno)
            errno = EINVAL;
        return -1;
    }

    *ret_d = f;

    return 0;
}

/* Same as snprintf, but guarantees NUL-termination on every platform */
size_t pa_snprintf(char *str, size_t size, const char *format, ...) {
    size_t ret;
    va_list ap;

    pa_assert(str);
    pa_assert(size > 0);
    pa_assert(format);

    va_start(ap, format);
    ret = pa_vsnprintf(str, size, format, ap);
    va_end(ap);

    return ret;
}

/* Same as vsnprintf, but guarantees NUL-termination on every platform */
size_t pa_vsnprintf(char *str, size_t size, const char *format, va_list ap) {
    int ret;

    pa_assert(str);
    pa_assert(size > 0);
    pa_assert(format);

    ret = vsnprintf(str, size, format, ap);

    str[size-1] = 0;

    if (ret < 0)
        return strlen(str);

    if ((size_t) ret > size-1)
        return size-1;

    return (size_t) ret;
}

/* Truncate the specified string, but guarantee that the string
 * returned still validates as UTF8 */
char *pa_truncate_utf8(char *c, size_t l) {
    pa_assert(c);
    pa_assert(pa_utf8_valid(c));

    if (strlen(c) <= l)
        return c;

    c[l] = 0;

    while (l > 0 && !pa_utf8_valid(c))
        c[--l] = 0;

    return c;
}

char *pa_getcwd(void) {
    size_t l = 128;

    for (;;) {
        char *p = pa_xmalloc(l);
        if (getcwd(p, l))
            return p;

        if (errno != ERANGE)
            return NULL;

        pa_xfree(p);
        l *= 2;
    }
}

void *pa_will_need(const void *p, size_t l) {
#ifdef RLIMIT_MEMLOCK
    struct rlimit rlim;
#endif
    const void *a;
    size_t size;
    int r;
    size_t bs;

    pa_assert(p);
    pa_assert(l > 0);

    a = PA_PAGE_ALIGN_PTR(p);
    size = (size_t) ((const uint8_t*) p + l - (const uint8_t*) a);

#ifdef HAVE_POSIX_MADVISE
    if ((r = posix_madvise((void*) a, size, POSIX_MADV_WILLNEED)) == 0) {
        pa_log_debug("posix_madvise() worked fine!");
        return (void*) p;
    }
#endif

    /* Most likely the memory was not mmap()ed from a file and thus
     * madvise() didn't work, so let's misuse mlock() do page this
     * stuff back into RAM. Yeah, let's fuck with the MM!  It's so
     * inviting, the man page of mlock() tells us: "All pages that
     * contain a part of the specified address range are guaranteed to
     * be resident in RAM when the call returns successfully." */

#ifdef RLIMIT_MEMLOCK
    pa_assert_se(getrlimit(RLIMIT_MEMLOCK, &rlim) == 0);

    if (rlim.rlim_cur < PA_PAGE_SIZE) {
        pa_log_debug("posix_madvise() failed (or doesn't exist), resource limits don't allow mlock(), can't page in data: %s", pa_cstrerror(r));
        errno = EPERM;
        return (void*) p;
    }

    bs = PA_PAGE_ALIGN((size_t) rlim.rlim_cur);
#else
    bs = PA_PAGE_SIZE*4;
#endif

    pa_log_debug("posix_madvise() failed (or doesn't exist), trying mlock(): %s", pa_cstrerror(r));

#ifdef HAVE_MLOCK
    while (size > 0 && bs > 0) {

        if (bs > size)
            bs = size;

        if (mlock(a, bs) < 0) {
            bs = PA_PAGE_ALIGN(bs / 2);
            continue;
        }

        pa_assert_se(munlock(a, bs) == 0);

        a = (const uint8_t*) a + bs;
        size -= bs;
    }
#endif

    if (bs <= 0)
        pa_log_debug("mlock() failed too (or doesn't exist), giving up: %s", pa_cstrerror(errno));
    else
        pa_log_debug("mlock() worked fine!");

    return (void*) p;
}

void pa_close_pipe(int fds[2]) {
    pa_assert(fds);

    if (fds[0] >= 0)
        pa_assert_se(pa_close(fds[0]) == 0);

    if (fds[1] >= 0)
        pa_assert_se(pa_close(fds[1]) == 0);

    fds[0] = fds[1] = -1;
}

char *pa_readlink(const char *p) {
    size_t l = 100;

    for (;;) {
        char *c;
        ssize_t n;

        c = pa_xmalloc(l);

        if ((n = readlink(p, c, l-1)) < 0) {
            pa_xfree(c);
            return NULL;
        }

        if ((size_t) n < l-1) {
            c[n] = 0;
            return c;
        }

        pa_xfree(c);
        l *= 2;
    }
}

int pa_close_all(int except_fd, ...) {
    va_list ap;
    unsigned n = 0, i;
    int r, *p;

    va_start(ap, except_fd);

    if (except_fd >= 0)
        for (n = 1; va_arg(ap, int) >= 0; n++)
            ;

    va_end(ap);

    p = pa_xnew(int, n+1);

    va_start(ap, except_fd);

    i = 0;
    if (except_fd >= 0) {
        int fd;
        p[i++] = except_fd;

        while ((fd = va_arg(ap, int)) >= 0)
            p[i++] = fd;
    }
    p[i] = -1;

    va_end(ap);

    r = pa_close_allv(p);
    free(p);

    return r;
}

int pa_close_allv(const int except_fds[]) {
    struct rlimit rl;
    int fd;
    int saved_errno;

#ifdef __linux__

    DIR *d;

    if ((d = opendir("/proc/self/fd"))) {

        struct dirent *de;

        while ((de = readdir(d))) {
            pa_bool_t found;
            long l;
            char *e = NULL;
            int i;

            if (de->d_name[0] == '.')
                continue;

            errno = 0;
            l = strtol(de->d_name, &e, 10);
            if (errno != 0 || !e || *e) {
                closedir(d);
                errno = EINVAL;
                return -1;
            }

            fd = (int) l;

            if ((long) fd != l) {
                closedir(d);
                errno = EINVAL;
                return -1;
            }

            if (fd < 3)
                continue;

            if (fd == dirfd(d))
                continue;

            found = FALSE;
            for (i = 0; except_fds[i] >= 0; i++)
                if (except_fds[i] == fd) {
                    found = TRUE;
                    break;
                }

            if (found)
                continue;

            if (pa_close(fd) < 0) {
                saved_errno = errno;
                closedir(d);
                errno = saved_errno;

                return -1;
            }
        }

        closedir(d);
        return 0;
    }

#endif

    if (getrlimit(RLIMIT_NOFILE, &rl) < 0)
        return -1;

    for (fd = 3; fd < (int) rl.rlim_max; fd++) {
        int i;
        pa_bool_t found;

        found = FALSE;
        for (i = 0; except_fds[i] >= 0; i++)
            if (except_fds[i] == fd) {
                found = TRUE;
                break;
            }

        if (found)
            continue;

        if (pa_close(fd) < 0 && errno != EBADF)
            return -1;
    }

    return 0;
}

int pa_unblock_sigs(int except, ...) {
    va_list ap;
    unsigned n = 0, i;
    int r, *p;

    va_start(ap, except);

    if (except >= 1)
        for (n = 1; va_arg(ap, int) >= 0; n++)
            ;

    va_end(ap);

    p = pa_xnew(int, n+1);

    va_start(ap, except);

    i = 0;
    if (except >= 1) {
        int sig;
        p[i++] = except;

        while ((sig = va_arg(ap, int)) >= 0)
            p[i++] = sig;
    }
    p[i] = -1;

    va_end(ap);

    r = pa_unblock_sigsv(p);
    pa_xfree(p);

    return r;
}

int pa_unblock_sigsv(const int except[]) {
    int i;
    sigset_t ss;

    if (sigemptyset(&ss) < 0)
        return -1;

    for (i = 0; except[i] > 0; i++)
        if (sigaddset(&ss, except[i]) < 0)
            return -1;

    return sigprocmask(SIG_SETMASK, &ss, NULL);
}

int pa_reset_sigs(int except, ...) {
    va_list ap;
    unsigned n = 0, i;
    int *p, r;

    va_start(ap, except);

    if (except >= 1)
        for (n = 1; va_arg(ap, int) >= 0; n++)
            ;

    va_end(ap);

    p = pa_xnew(int, n+1);

    va_start(ap, except);

    i = 0;
    if (except >= 1) {
        int sig;
        p[i++] = except;

        while ((sig = va_arg(ap, int)) >= 0)
            sig = p[i++];
    }
    p[i] = -1;

    va_end(ap);

    r = pa_reset_sigsv(p);
    pa_xfree(p);

    return r;
}

int pa_reset_sigsv(const int except[]) {
    int sig;

    for (sig = 1; sig < NSIG; sig++) {
        pa_bool_t reset = TRUE;

        switch (sig) {
            case SIGKILL:
            case SIGSTOP:
                reset = FALSE;
                break;

            default: {
                int i;

                for (i = 0; except[i] > 0; i++) {
                    if (sig == except[i]) {
                        reset = FALSE;
                        break;
                    }
                }
            }
        }

        if (reset) {
            struct sigaction sa;

            memset(&sa, 0, sizeof(sa));
            sa.sa_handler = SIG_DFL;

            /* On Linux the first two RT signals are reserved by
             * glibc, and sigaction() will return EINVAL for them. */
            if ((sigaction(sig, &sa, NULL) < 0))
                if (errno != EINVAL)
                    return -1;
        }
    }

    return 0;
}

void pa_set_env(const char *key, const char *value) {
    pa_assert(key);
    pa_assert(value);

    putenv(pa_sprintf_malloc("%s=%s", key, value));
}

pa_bool_t pa_in_system_mode(void) {
    const char *e;

    if (!(e = getenv("PULSE_SYSTEM")))
        return FALSE;

    return !!atoi(e);
}

char *pa_machine_id(void) {
    FILE *f;
    size_t l;

    /* The returned value is supposed be some kind of ascii identifier
     * that is unique and stable across reboots. */

    /* First we try the D-Bus UUID, which is the best option we have,
     * since it fits perfectly our needs and is not as volatile as the
     * hostname which might be set from dhcp. */

    if ((f = fopen(PA_MACHINE_ID, "r"))) {
        char ln[34] = "", *r;

        r = fgets(ln, sizeof(ln)-1, f);
        fclose(f);

        pa_strip_nl(ln);

        if (r && ln[0])
            return pa_xstrdup(ln);
    }

    /* The we fall back to the host name. It supposed to be somewhat
     * unique, at least in a network, but may change. */

    l = 100;
    for (;;) {
        char *c;

        c = pa_xmalloc(l);

        if (!pa_get_host_name(c, l)) {

            if (errno != EINVAL && errno != ENAMETOOLONG)
                break;

        } else if (strlen(c) < l-1) {

            if (*c == 0) {
                pa_xfree(c);
                break;
            }

            return c;
        }

        /* Hmm, the hostname is as long the space we offered the
         * function, we cannot know if it fully fit in, so let's play
         * safe and retry. */

        pa_xfree(c);
        l *= 2;
    }

    /* If no hostname was set we use the POSIX hostid. It's usually
     * the IPv4 address.  Mit not be that stable. */
    return pa_sprintf_malloc("%08lx", (unsigned long) gethostid);
}

char *pa_uname_string(void) {
    struct utsname u;

    pa_assert_se(uname(&u) >= 0);

    return pa_sprintf_malloc("%s %s %s %s", u.sysname, u.machine, u.release, u.version);
}

#ifdef HAVE_VALGRIND_MEMCHECK_H
pa_bool_t pa_in_valgrind(void) {
    static int b = 0;

    /* To make heisenbugs a bit simpler to find we check for $VALGRIND
     * here instead of really checking whether we run in valgrind or
     * not. */

    if (b < 1)
        b = getenv("VALGRIND") ? 2 : 1;

    return b > 1;
}
#endif

unsigned pa_gcd(unsigned a, unsigned b) {

    while (b > 0) {
        unsigned t = b;
        b = a % b;
        a = t;
    }

    return a;
}

void pa_reduce(unsigned *num, unsigned *den) {

    unsigned gcd = pa_gcd(*num, *den);

    if (gcd <= 0)
        return;

    *num /= gcd;
    *den /= gcd;

    pa_assert(pa_gcd(*num, *den) == 1);
}

unsigned pa_ncpus(void) {
    long ncpus;

#ifdef _SC_NPROCESSORS_CONF
    ncpus = sysconf(_SC_NPROCESSORS_CONF);
#else
    ncpus = 1;
#endif

    return ncpus <= 0 ? 1 : (unsigned) ncpus;
}

char *pa_replace(const char*s, const char*a, const char *b) {
    pa_strbuf *sb;
    size_t an;

    pa_assert(s);
    pa_assert(a);
    pa_assert(b);

    an = strlen(a);
    sb = pa_strbuf_new();

    for (;;) {
        const char *p;

        if (!(p = strstr(s, a)))
            break;

        pa_strbuf_putsn(sb, s, p-s);
        pa_strbuf_puts(sb, b);
        s = p + an;
    }

    pa_strbuf_puts(sb, s);

    return pa_strbuf_tostring_free(sb);
}

char *pa_unescape(char *p) {
    char *s, *d;
    pa_bool_t escaped = FALSE;

    for (s = p, d = p; *s; s++) {
        if (!escaped && *s == '\\') {
            escaped = TRUE;
            continue;
        }

        *(d++) = *s;
        escaped = FALSE;
    }

    *d = 0;

    return p;
}

char *pa_realpath(const char *path) {
    char *t;
    pa_assert(path);

    /* We want only abolsute paths */
    if (path[0] != '/') {
        errno = EINVAL;
        return NULL;
    }

#if defined(__GLIBC__) || defined(__APPLE__)
    {
        char *r;

        if (!(r = realpath(path, NULL)))
            return NULL;

        /* We copy this here in case our pa_xmalloc() is not
         * implemented on top of libc malloc() */
        t = pa_xstrdup(r);
        pa_xfree(r);
    }
#elif defined(PATH_MAX)
    {
        char *path_buf;
        path_buf = pa_xmalloc(PATH_MAX);

        if (!(t = realpath(path, path_buf))) {
            pa_xfree(path_buf);
            return NULL;
        }
    }
#else
#error "It's not clear whether this system supports realpath(..., NULL) like GNU libc does. If it doesn't we need a private version of realpath() here."
#endif

    return t;
}
