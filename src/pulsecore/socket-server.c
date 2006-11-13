/* $Id: socket-server.c 1272 2006-08-18 21:38:40Z lennart $ */

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

#include <stdlib.h>
#include <assert.h>
#include <errno.h>
#include <string.h>
#include <sys/types.h>
#include <stdio.h>
#include <unistd.h>
#include <sys/stat.h>

#ifdef HAVE_SYS_SOCKET_H
#include <sys/socket.h>
#endif
#ifdef HAVE_SYS_UN_H
#include <sys/un.h>
#ifndef SUN_LEN
#define SUN_LEN(ptr) \
    ((size_t)(((struct sockaddr_un *) 0)->sun_path) + strlen((ptr)->sun_path))
#endif
#endif
#ifdef HAVE_ARPA_INET_H
#include <arpa/inet.h>
#endif
#ifdef HAVE_NETINET_IN_H
#include <netinet/in.h>
#endif

#ifdef HAVE_LIBWRAP
#include <tcpd.h>
#endif

#ifndef HAVE_INET_NTOP
#include "inet_ntop.h"
#endif

#ifndef HAVE_INET_PTON
#include "inet_pton.h"
#endif

#include "winsock.h"

#include <pulse/xmalloc.h>
#include <pulse/util.h>

#include <pulsecore/socket-util.h>
#include <pulsecore/core-util.h>
#include <pulsecore/log.h>
#include <pulsecore/core-error.h>

#include "socket-server.h"

struct pa_socket_server {
    int ref;
    int fd;
    char *filename;
    char *tcpwrap_service;

    void (*on_connection)(pa_socket_server*s, pa_iochannel *io, void *userdata);
    void *userdata;

    pa_io_event *io_event;
    pa_mainloop_api *mainloop;
    enum { SOCKET_SERVER_GENERIC, SOCKET_SERVER_IPV4, SOCKET_SERVER_UNIX, SOCKET_SERVER_IPV6 } type;
};

static void callback(pa_mainloop_api *mainloop, pa_io_event *e, int fd, PA_GCC_UNUSED pa_io_event_flags_t f, void *userdata) {
    pa_socket_server *s = userdata;
    pa_iochannel *io;
    int nfd;
    assert(s && s->mainloop == mainloop && s->io_event == e && e && fd >= 0 && fd == s->fd);

    pa_socket_server_ref(s);
    
    if ((nfd = accept(fd, NULL, NULL)) < 0) {
        pa_log("accept(): %s", pa_cstrerror(errno));
        goto finish;
    }

    pa_fd_set_cloexec(nfd, 1);
    
    if (!s->on_connection) {
        close(nfd);
        goto finish;
    }

#ifdef HAVE_LIBWRAP

    if (s->tcpwrap_service) {
        struct request_info req;

        request_init(&req, RQ_DAEMON, s->tcpwrap_service, RQ_FILE, nfd, NULL);
        fromhost(&req);
        if (!hosts_access(&req)) {
            pa_log_warn("TCP connection refused by tcpwrap.");
            close(nfd);
            goto finish;
        }

        pa_log_info("TCP connection accepted by tcpwrap.");
    }
#endif
    
    /* There should be a check for socket type here */
    if (s->type == SOCKET_SERVER_IPV4) 
        pa_socket_tcp_low_delay(fd);
    else
        pa_socket_low_delay(fd);
    
    io = pa_iochannel_new(s->mainloop, nfd, nfd);
    assert(io);
    s->on_connection(s, io, s->userdata);

finish:
    pa_socket_server_unref(s);
}

pa_socket_server* pa_socket_server_new(pa_mainloop_api *m, int fd) {
    pa_socket_server *s;
    assert(m && fd >= 0);
    
    s = pa_xmalloc(sizeof(pa_socket_server));
    s->ref = 1;
    s->fd = fd;
    s->filename = NULL;
    s->on_connection = NULL;
    s->userdata = NULL;
    s->tcpwrap_service = NULL;

    s->mainloop = m;
    s->io_event = m->io_new(m, fd, PA_IO_EVENT_INPUT, callback, s);
    assert(s->io_event);

    s->type = SOCKET_SERVER_GENERIC;
    
    return s;
}

pa_socket_server* pa_socket_server_ref(pa_socket_server *s) {
    assert(s && s->ref >= 1);
    s->ref++;
    return s;
}

#ifdef HAVE_SYS_UN_H

pa_socket_server* pa_socket_server_new_unix(pa_mainloop_api *m, const char *filename) {
    int fd = -1;
    struct sockaddr_un sa;
    pa_socket_server *s;
    
    assert(m && filename);

    if ((fd = socket(PF_UNIX, SOCK_STREAM, 0)) < 0) {
        pa_log("socket(): %s", pa_cstrerror(errno));
        goto fail;
    }

    pa_fd_set_cloexec(fd, 1);

    sa.sun_family = AF_UNIX;
    strncpy(sa.sun_path, filename, sizeof(sa.sun_path)-1);
    sa.sun_path[sizeof(sa.sun_path) - 1] = 0;

    pa_socket_low_delay(fd);

    if (bind(fd, (struct sockaddr*) &sa, SUN_LEN(&sa)) < 0) {
        pa_log("bind(): %s", pa_cstrerror(errno));
        goto fail;
    }

    /* Allow access from all clients. Sockets like this one should
     * always be put inside a directory with proper access rights,
     * because not all OS check the access rights on the socket
     * inodes. */
    chmod(filename, 0777);
    
    if (listen(fd, 5) < 0) {
        pa_log("listen(): %s", pa_cstrerror(errno));
        goto fail;
    }

    s = pa_socket_server_new(m, fd);
    assert(s);

    s->filename = pa_xstrdup(filename);
    s->type = SOCKET_SERVER_UNIX;
    
    return s;
                                                                                                                                                                         
fail:
    if (fd >= 0)
        close(fd);

    return NULL;
}

#else /* HAVE_SYS_UN_H */

pa_socket_server* pa_socket_server_new_unix(pa_mainloop_api *m, const char *filename) {
    return NULL;
}

#endif /* HAVE_SYS_UN_H */

pa_socket_server* pa_socket_server_new_ipv4(pa_mainloop_api *m, uint32_t address, uint16_t port, const char *tcpwrap_service) {
    pa_socket_server *ss;
    int fd = -1;
    struct sockaddr_in sa;
    int on = 1;

    assert(m && port);

    if ((fd = socket(PF_INET, SOCK_STREAM, 0)) < 0) {
        pa_log("socket(PF_INET): %s", pa_cstrerror(errno));
        goto fail;
    }

    pa_fd_set_cloexec(fd, 1);

#ifdef SO_REUSEADDR
    if (setsockopt(fd, SOL_SOCKET, SO_REUSEADDR, &on, sizeof(on)) < 0)
        pa_log("setsockopt(): %s", pa_cstrerror(errno));
#endif

    pa_socket_tcp_low_delay(fd);
    
    memset(&sa, 0, sizeof(sa));
    sa.sin_family = AF_INET;
    sa.sin_port = htons(port);
    sa.sin_addr.s_addr = htonl(address);

    if (bind(fd, (struct sockaddr *) &sa, sizeof(sa)) < 0) {
        pa_log("bind(): %s", pa_cstrerror(errno));
        goto fail;
    }

    if (listen(fd, 5) < 0) {
        pa_log("listen(): %s", pa_cstrerror(errno));
        goto fail;
    }

    if ((ss = pa_socket_server_new(m, fd))) {
        ss->type = SOCKET_SERVER_IPV4;
        ss->tcpwrap_service = pa_xstrdup(tcpwrap_service);
    }

    return ss;
    
fail:
    if (fd >= 0)
        close(fd);

    return NULL;
}

pa_socket_server* pa_socket_server_new_ipv6(pa_mainloop_api *m, const uint8_t address[16], uint16_t port, const char *tcpwrap_service) {
    pa_socket_server *ss;
    int fd = -1;
    struct sockaddr_in6 sa;
    int on = 1;

    assert(m && port);

    if ((fd = socket(PF_INET6, SOCK_STREAM, 0)) < 0) {
        pa_log("socket(PF_INET6): %s", pa_cstrerror(errno));
        goto fail;
    }

    pa_fd_set_cloexec(fd, 1);

#ifdef IPV6_V6ONLY
    if (setsockopt(fd, IPPROTO_IPV6, IPV6_V6ONLY, &on, sizeof(on)) < 0)
        pa_log("setsockopt(IPPROTO_IPV6, IPV6_V6ONLY): %s", pa_cstrerror(errno));
#endif

#ifdef SO_REUSEADDR
    if (setsockopt(fd, SOL_SOCKET, SO_REUSEADDR, &on, sizeof(on)) < 0)
        pa_log("setsockopt(SOL_SOCKET, SO_REUSEADDR, 1): %s", pa_cstrerror(errno));
#endif

    pa_socket_tcp_low_delay(fd);

    memset(&sa, 0, sizeof(sa));
    sa.sin6_family = AF_INET6;
    sa.sin6_port = htons(port);
    memcpy(sa.sin6_addr.s6_addr, address, 16);

    if (bind(fd, (struct sockaddr *) &sa, sizeof(sa)) < 0) {
        pa_log("bind(): %s", pa_cstrerror(errno));
        goto fail;
    }

    if (listen(fd, 5) < 0) {
        pa_log("listen(): %s", pa_cstrerror(errno));
        goto fail;
    }

    if ((ss = pa_socket_server_new(m, fd))) {
        ss->type = SOCKET_SERVER_IPV6;
        ss->tcpwrap_service = pa_xstrdup(tcpwrap_service);
    }
    
    return ss;
    
fail:
    if (fd >= 0)
        close(fd);

    return NULL;
}

pa_socket_server* pa_socket_server_new_ipv4_loopback(pa_mainloop_api *m, uint16_t port, const char *tcpwrap_service) {
    assert(m);
    assert(port > 0);

    return pa_socket_server_new_ipv4(m, INADDR_LOOPBACK, port, tcpwrap_service);
}

pa_socket_server* pa_socket_server_new_ipv6_loopback(pa_mainloop_api *m, uint16_t port, const char *tcpwrap_service) {
    assert(m);
    assert(port > 0);

    return pa_socket_server_new_ipv6(m, in6addr_loopback.s6_addr, port, tcpwrap_service);
}

pa_socket_server* pa_socket_server_new_ipv4_any(pa_mainloop_api *m, uint16_t port, const char *tcpwrap_service) {
    assert(m);
    assert(port > 0);
    
    return pa_socket_server_new_ipv4(m, INADDR_ANY, port, tcpwrap_service);
}

pa_socket_server* pa_socket_server_new_ipv6_any(pa_mainloop_api *m, uint16_t port, const char *tcpwrap_service) {
    assert(m);
    assert(port > 0);
    
    return pa_socket_server_new_ipv6(m, in6addr_any.s6_addr, port, tcpwrap_service);
}

pa_socket_server* pa_socket_server_new_ipv4_string(pa_mainloop_api *m, const char *name, uint16_t port, const char *tcpwrap_service) {
    struct in_addr ipv4;
    
    assert(m);
    assert(name);
    assert(port > 0);

    if (inet_pton(AF_INET, name, &ipv4) > 0)
        return pa_socket_server_new_ipv4(m, ntohl(ipv4.s_addr), port, tcpwrap_service);

    return NULL;
}

pa_socket_server* pa_socket_server_new_ipv6_string(pa_mainloop_api *m, const char *name, uint16_t port, const char *tcpwrap_service) {
    struct in6_addr ipv6;
    
    assert(m);
    assert(name);
    assert(port > 0);

    if (inet_pton(AF_INET6, name, &ipv6) > 0)
        return pa_socket_server_new_ipv6(m, ipv6.s6_addr, port, tcpwrap_service);

    return NULL;
}

static void socket_server_free(pa_socket_server*s) {
    assert(s);

    if (s->filename) {
        unlink(s->filename);
        pa_xfree(s->filename);
    }

    close(s->fd);

    pa_xfree(s->tcpwrap_service);

    s->mainloop->io_free(s->io_event);
    pa_xfree(s);
}

void pa_socket_server_unref(pa_socket_server *s) {
    assert(s && s->ref >= 1);

    if (!(--(s->ref)))
        socket_server_free(s);
}

void pa_socket_server_set_callback(pa_socket_server*s, void (*on_connection)(pa_socket_server*s, pa_iochannel *io, void *userdata), void *userdata) {
    assert(s && s->ref >= 1);

    s->on_connection = on_connection;
    s->userdata = userdata;
}

char *pa_socket_server_get_address(pa_socket_server *s, char *c, size_t l) {
    assert(s && c && l > 0);
    
    switch (s->type) {
        case SOCKET_SERVER_IPV6: {
            struct sockaddr_in6 sa;
            socklen_t sa_len = sizeof(sa);

            if (getsockname(s->fd, (struct sockaddr*) &sa, &sa_len) < 0) {
                pa_log("getsockname(): %s", pa_cstrerror(errno));
                return NULL;
            }

            if (memcmp(&in6addr_any, &sa.sin6_addr, sizeof(in6addr_any)) == 0) {
                char fqdn[256];
                if (!pa_get_fqdn(fqdn, sizeof(fqdn)))
                    return NULL;
                
                snprintf(c, l, "tcp6:%s:%u", fqdn, (unsigned) ntohs(sa.sin6_port));
                
            } else if (memcmp(&in6addr_loopback, &sa.sin6_addr, sizeof(in6addr_loopback)) == 0) {
                char hn[256];
                if (!pa_get_host_name(hn, sizeof(hn)))
                    return NULL;
                
                snprintf(c, l, "{%s}tcp6:localhost:%u", hn, (unsigned) ntohs(sa.sin6_port));
            } else {
                char ip[INET6_ADDRSTRLEN];
                
                if (!inet_ntop(AF_INET6, &sa.sin6_addr, ip, sizeof(ip))) {
                    pa_log("inet_ntop(): %s", pa_cstrerror(errno));
                    return NULL;
                }
                
                snprintf(c, l, "tcp6:[%s]:%u", ip, (unsigned) ntohs(sa.sin6_port));
            }

            return c;
        }

        case SOCKET_SERVER_IPV4: {
            struct sockaddr_in sa;
            socklen_t sa_len = sizeof(sa);

            if (getsockname(s->fd, (struct sockaddr*) &sa, &sa_len) < 0) {
                pa_log("getsockname(): %s", pa_cstrerror(errno));
                return NULL;
            }

            if (sa.sin_addr.s_addr == INADDR_ANY) {
                char fqdn[256];
                if (!pa_get_fqdn(fqdn, sizeof(fqdn)))
                    return NULL;
                
                snprintf(c, l, "tcp:%s:%u", fqdn, (unsigned) ntohs(sa.sin_port));
            } else if (sa.sin_addr.s_addr == INADDR_LOOPBACK) {
                char hn[256];
                if (!pa_get_host_name(hn, sizeof(hn)))
                    return NULL;
                
                snprintf(c, l, "{%s}tcp:localhost:%u", hn, (unsigned) ntohs(sa.sin_port));
            } else {
                char ip[INET_ADDRSTRLEN];

                if (!inet_ntop(AF_INET, &sa.sin_addr, ip, sizeof(ip))) {
                    pa_log("inet_ntop(): %s", pa_cstrerror(errno));
                    return NULL;
                }
                
                snprintf(c, l, "tcp:[%s]:%u", ip, (unsigned) ntohs(sa.sin_port));

            }
            
            return c;
        }

        case SOCKET_SERVER_UNIX: {
            char hn[256];

            if (!s->filename)
                return NULL;
            
            if (!pa_get_host_name(hn, sizeof(hn)))
                return NULL;

            snprintf(c, l, "{%s}unix:%s", hn, s->filename);
            return c;
        }

        default:
            return NULL;
    }
}
