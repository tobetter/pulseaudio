/* $Id: daemon-conf.c 1286 2006-08-19 01:20:13Z lennart $ */

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

#include <errno.h>
#include <stdio.h>
#include <string.h>
#include <assert.h>
#include <unistd.h>

#include <pulse/xmalloc.h>

#include <pulsecore/core-error.h>
#include <pulsecore/core-util.h>
#include <pulsecore/strbuf.h>
#include <pulsecore/conf-parser.h>
#include <pulsecore/resampler.h>

#include "daemon-conf.h"

#ifndef OS_IS_WIN32
# define PATH_SEP "/"
#else
# define PATH_SEP "\\"
#endif

#define DEFAULT_SCRIPT_FILE PA_DEFAULT_CONFIG_DIR PATH_SEP "default.pa"
#define DEFAULT_SCRIPT_FILE_USER PATH_SEP "default.pa"
#define DEFAULT_CONFIG_FILE PA_DEFAULT_CONFIG_DIR PATH_SEP "daemon.conf"
#define DEFAULT_CONFIG_FILE_USER PATH_SEP "daemon.conf"

#define ENV_SCRIPT_FILE "PULSE_SCRIPT"
#define ENV_CONFIG_FILE "PULSE_CONFIG"
#define ENV_DL_SEARCH_PATH "PULSE_DLPATH"

static const pa_daemon_conf default_conf = {
    .cmd = PA_CMD_DAEMON,
    .daemonize = 0,
    .fail = 1,
    .high_priority = 0,
    .disallow_module_loading = 0,
    .exit_idle_time = -1,
    .module_idle_time = 20,
    .scache_idle_time = 20,
    .auto_log_target = 1,
    .script_commands = NULL,
    .dl_search_path = NULL,
    .default_script_file = NULL,
    .log_target = PA_LOG_SYSLOG,
    .log_level = PA_LOG_NOTICE,
    .resample_method = PA_RESAMPLER_SRC_SINC_FASTEST,
    .config_file = NULL,
    .use_pid_file = 1,
    .system_instance = 0,
    .no_cpu_limit = 0,
    .disable_shm = 0
#ifdef HAVE_SYS_RESOURCE_H
    , .rlimit_as = { .value = 0, .is_set = 0 },
    .rlimit_core = { .value = 0, .is_set = 0 },
    .rlimit_data = { .value = 0, .is_set = 0 },
    .rlimit_fsize = { .value = 0, .is_set = 0 },
    .rlimit_nofile = { .value = 200, .is_set = 1 },
    .rlimit_stack = { .value = 0, .is_set = 0 }
#ifdef RLIMIT_NPROC
    , .rlimit_nproc = { .value = 0, .is_set = 0 }
#endif
#ifdef RLIMIT_MEMLOCK
    , .rlimit_memlock = { .value = 0, .is_set = 1 }
#endif
#endif
};

pa_daemon_conf* pa_daemon_conf_new(void) {
    FILE *f;
    pa_daemon_conf *c = pa_xmemdup(&default_conf, sizeof(default_conf));

    if ((f = pa_open_config_file(DEFAULT_SCRIPT_FILE, DEFAULT_SCRIPT_FILE_USER, ENV_SCRIPT_FILE, &c->default_script_file, "r")))
        fclose(f);

    c->dl_search_path = pa_xstrdup(PA_DLSEARCHPATH);
    return c;
}

void pa_daemon_conf_free(pa_daemon_conf *c) {
    assert(c);
    pa_xfree(c->script_commands);
    pa_xfree(c->dl_search_path);
    pa_xfree(c->default_script_file);
    pa_xfree(c->config_file);
    pa_xfree(c);
}

int pa_daemon_conf_set_log_target(pa_daemon_conf *c, const char *string) {
    assert(c && string);

    if (!strcmp(string, "auto"))
        c->auto_log_target = 1;
    else if (!strcmp(string, "syslog")) {
        c->auto_log_target = 0;
        c->log_target = PA_LOG_SYSLOG;
    } else if (!strcmp(string, "stderr")) {
        c->auto_log_target = 0;
        c->log_target = PA_LOG_STDERR;
    } else
        return -1;

    return 0;
}

int pa_daemon_conf_set_log_level(pa_daemon_conf *c, const char *string) {
    uint32_t u;
    assert(c && string);

    if (pa_atou(string, &u) >= 0) {
        if (u >= PA_LOG_LEVEL_MAX)
            return -1;

        c->log_level = (pa_log_level_t) u;
    } else if (pa_startswith(string, "debug"))
        c->log_level = PA_LOG_DEBUG;
    else if (pa_startswith(string, "info"))
        c->log_level = PA_LOG_INFO;
    else if (pa_startswith(string, "notice"))
        c->log_level = PA_LOG_NOTICE;
    else if (pa_startswith(string, "warn"))
        c->log_level = PA_LOG_WARN;
    else if (pa_startswith(string, "err"))
        c->log_level = PA_LOG_ERROR;
    else
        return -1;

    return 0;
}

int pa_daemon_conf_set_resample_method(pa_daemon_conf *c, const char *string) {
    int m;
    assert(c && string);

    if ((m = pa_parse_resample_method(string)) < 0)
        return -1;

    c->resample_method = m;
    return 0;
}

static int parse_log_target(const char *filename, unsigned line, const char *lvalue, const char *rvalue, void *data, PA_GCC_UNUSED void *userdata) {
    pa_daemon_conf *c = data;
    assert(filename && lvalue && rvalue && data);

    if (pa_daemon_conf_set_log_target(c, rvalue) < 0) {
        pa_log("[%s:%u] Invalid log target '%s'.", filename, line, rvalue);
        return -1;
    }

    return 0;
}

static int parse_log_level(const char *filename, unsigned line, const char *lvalue, const char *rvalue, void *data, PA_GCC_UNUSED void *userdata) {
    pa_daemon_conf *c = data;
    assert(filename && lvalue && rvalue && data);

    if (pa_daemon_conf_set_log_level(c, rvalue) < 0) {
        pa_log("[%s:%u] Invalid log level '%s'.", filename, line, rvalue);
        return -1;
    }

    return 0;
}

static int parse_resample_method(const char *filename, unsigned line, const char *lvalue, const char *rvalue, void *data, PA_GCC_UNUSED void *userdata) {
    pa_daemon_conf *c = data;
    assert(filename && lvalue && rvalue && data);

    if (pa_daemon_conf_set_resample_method(c, rvalue) < 0) {
        pa_log("[%s:%u] Inavalid resample method '%s'.", filename, line, rvalue);
        return -1;
    }

    return 0;
}

static int parse_rlimit(const char *filename, unsigned line, const char *lvalue, const char *rvalue, void *data, PA_GCC_UNUSED void *userdata) {
#ifdef HAVE_SYS_RESOURCE_H
    struct pa_rlimit *r = data;
    assert(filename);
    assert(lvalue);
    assert(rvalue);
    assert(r);

    if (rvalue[strspn(rvalue, "\t ")] == 0) {
        /* Empty string */
        r->is_set = 0;
        r->value = 0;
    } else {
        int32_t k;
        if (pa_atoi(rvalue, &k) < 0) {
            pa_log("[%s:%u] Inavalid rlimit '%s'.", filename, line, rvalue);
            return -1;
        }
        r->is_set = k >= 0;
        r->value = k >= 0 ? (rlim_t) k : 0;
    }
#else
    pa_log_warn("[%s:%u] rlimit not supported on this platform.", filename, line);
#endif

    return 0;
}

int pa_daemon_conf_load(pa_daemon_conf *c, const char *filename) {
    int r = -1;
    FILE *f = NULL;
    
    pa_config_item table[] = {
        { "daemonize",               pa_config_parse_bool,    NULL },
        { "fail",                    pa_config_parse_bool,    NULL },
        { "high-priority",           pa_config_parse_bool,    NULL },
        { "disallow-module-loading", pa_config_parse_bool,    NULL },
        { "exit-idle-time",          pa_config_parse_int,     NULL },
        { "module-idle-time",        pa_config_parse_int,     NULL },
        { "scache-idle-time",        pa_config_parse_int,     NULL },
        { "dl-search-path",          pa_config_parse_string,  NULL },
        { "default-script-file",     pa_config_parse_string,  NULL },
        { "log-target",              parse_log_target,        NULL },
        { "log-level",               parse_log_level,         NULL },
        { "verbose",                 parse_log_level,         NULL },
        { "resample-method",         parse_resample_method,   NULL },
        { "use-pid-file",            pa_config_parse_bool,    NULL },
        { "system-instance",         pa_config_parse_bool,    NULL },
        { "no-cpu-limit",            pa_config_parse_bool,    NULL },
        { "disable-shm",             pa_config_parse_bool,    NULL },
#ifdef HAVE_SYS_RESOURCE_H
        { "rlimit-as",               parse_rlimit,            NULL },
        { "rlimit-core",             parse_rlimit,            NULL },
        { "rlimit-data",             parse_rlimit,            NULL },
        { "rlimit-fsize",            parse_rlimit,            NULL },
        { "rlimit-nofile",           parse_rlimit,            NULL },
        { "rlimit-stack",            parse_rlimit,            NULL },
#ifdef RLIMIT_NPROC
        { "rlimit-nproc",            parse_rlimit,            NULL },
#endif
#ifdef RLIMIT_MEMLOCK
        { "rlimit-memlock",          parse_rlimit,            NULL },
#endif
#endif
        { NULL,                      NULL,                    NULL },
    };
    
    table[0].data = &c->daemonize;
    table[1].data = &c->fail;
    table[2].data = &c->high_priority;
    table[3].data = &c->disallow_module_loading;
    table[4].data = &c->exit_idle_time;
    table[5].data = &c->module_idle_time;
    table[6].data = &c->scache_idle_time;
    table[7].data = &c->dl_search_path;
    table[8].data = &c->default_script_file;
    table[9].data = c;
    table[10].data = c;
    table[11].data = c;
    table[12].data = c;
    table[13].data = &c->use_pid_file;
    table[14].data = &c->system_instance;
    table[15].data = &c->no_cpu_limit;
    table[16].data = &c->disable_shm;
#ifdef HAVE_SYS_RESOURCE_H
    table[17].data = &c->rlimit_as;
    table[18].data = &c->rlimit_core;
    table[19].data = &c->rlimit_data;
    table[20].data = &c->rlimit_fsize;
    table[21].data = &c->rlimit_nofile;
    table[22].data = &c->rlimit_stack;
#ifdef RLIMIT_NPROC
    table[23].data = &c->rlimit_nproc;
#endif
#ifdef RLIMIT_MEMLOCK
#ifndef RLIMIT_NPROC
#error "Houston, we have a numbering problem!"
#endif
    table[24].data = &c->rlimit_memlock;
#endif
#endif
    
    
    pa_xfree(c->config_file);
    c->config_file = NULL;

    f = filename ?
        fopen(c->config_file = pa_xstrdup(filename), "r") :
        pa_open_config_file(DEFAULT_CONFIG_FILE, DEFAULT_CONFIG_FILE_USER, ENV_CONFIG_FILE, &c->config_file, "r");

    if (!f && errno != ENOENT) {
        pa_log("WARNING: failed to open configuration file '%s': %s", c->config_file, pa_cstrerror(errno));
        goto finish;
    }

    r = f ? pa_config_parse(c->config_file, f, table, NULL) : 0;
    
finish:
    if (f)
        fclose(f);
    
    return r;
}

int pa_daemon_conf_env(pa_daemon_conf *c) {
    char *e;

    if ((e = getenv(ENV_DL_SEARCH_PATH))) {
        pa_xfree(c->dl_search_path);
        c->dl_search_path = pa_xstrdup(e);
    }
    if ((e = getenv(ENV_SCRIPT_FILE))) {
        pa_xfree(c->default_script_file);
        c->default_script_file = pa_xstrdup(e);
    }

    return 0;
}

static const char* const log_level_to_string[] = {
    [PA_LOG_DEBUG] = "debug",
    [PA_LOG_INFO] = "info",
    [PA_LOG_NOTICE] = "notice",
    [PA_LOG_WARN] = "warning",
    [PA_LOG_ERROR] = "error"
};

char *pa_daemon_conf_dump(pa_daemon_conf *c) {
    pa_strbuf *s = pa_strbuf_new();

    if (c->config_file)
        pa_strbuf_printf(s, "### Read from configuration file: %s ###\n", c->config_file);

    assert(c->log_level <= PA_LOG_LEVEL_MAX);
    
    pa_strbuf_printf(s, "daemonize = %i\n", !!c->daemonize);
    pa_strbuf_printf(s, "fail = %i\n", !!c->fail);
    pa_strbuf_printf(s, "high-priority = %i\n", !!c->high_priority);
    pa_strbuf_printf(s, "disallow-module-loading = %i\n", !!c->disallow_module_loading);
    pa_strbuf_printf(s, "exit-idle-time = %i\n", c->exit_idle_time);
    pa_strbuf_printf(s, "module-idle-time = %i\n", c->module_idle_time);
    pa_strbuf_printf(s, "scache-idle-time = %i\n", c->scache_idle_time);
    pa_strbuf_printf(s, "dl-search-path = %s\n", c->dl_search_path ? c->dl_search_path : "");
    pa_strbuf_printf(s, "default-script-file = %s\n", c->default_script_file);
    pa_strbuf_printf(s, "log-target = %s\n", c->auto_log_target ? "auto" : (c->log_target == PA_LOG_SYSLOG ? "syslog" : "stderr"));
    pa_strbuf_printf(s, "log-level = %s\n", log_level_to_string[c->log_level]);
    pa_strbuf_printf(s, "resample-method = %s\n", pa_resample_method_to_string(c->resample_method));
    pa_strbuf_printf(s, "use-pid-file = %i\n", c->use_pid_file);
    pa_strbuf_printf(s, "system-instance = %i\n", !!c->system_instance);
    pa_strbuf_printf(s, "no-cpu-limit = %i\n", !!c->no_cpu_limit);
    pa_strbuf_printf(s, "disable_shm = %i\n", !!c->disable_shm);
#ifdef HAVE_SYS_RESOURCE_H
    pa_strbuf_printf(s, "rlimit-as = %li\n", c->rlimit_as.is_set ? (long int) c->rlimit_as.value : -1);
    pa_strbuf_printf(s, "rlimit-core = %li\n", c->rlimit_core.is_set ? (long int) c->rlimit_core.value : -1);
    pa_strbuf_printf(s, "rlimit-data = %li\n", c->rlimit_data.is_set ? (long int) c->rlimit_data.value : -1);
    pa_strbuf_printf(s, "rlimit-fsize = %li\n", c->rlimit_fsize.is_set ? (long int) c->rlimit_fsize.value : -1);
    pa_strbuf_printf(s, "rlimit-nofile = %li\n", c->rlimit_nofile.is_set ? (long int) c->rlimit_nofile.value : -1);
    pa_strbuf_printf(s, "rlimit-stack = %li\n", c->rlimit_stack.is_set ? (long int) c->rlimit_stack.value : -1);
#ifdef RLIMIT_NPROC
    pa_strbuf_printf(s, "rlimit-nproc = %li\n", c->rlimit_nproc.is_set ? (long int) c->rlimit_nproc.value : -1);
#endif
#ifdef RLIMIT_MEMLOCK
    pa_strbuf_printf(s, "rlimit-memlock = %li\n", c->rlimit_memlock.is_set ? (long int) c->rlimit_memlock.value : -1);
#endif
#endif
    
    return pa_strbuf_tostring_free(s);
}
