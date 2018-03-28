dnl $Id: module-defs.h.m4 1033 2006-06-19 21:53:48Z lennart $
changecom(`/*', `*/')dnl
define(`module_name', patsubst(patsubst(patsubst(fname, `-symdef.h$'), `^.*/'), `[^0-9a-zA-Z]', `_'))dnl
define(`c_symbol', patsubst(module_name, `[^0-9a-zA-Z]', `_'))dnl
define(`c_macro', patsubst(module_name, `[^0-9a-zA-Z]', `'))dnl
define(`incmacro', `foo'c_macro`symdeffoo')dnl
define(`gen_symbol', `#define $1 'module_name`_LTX_$1')dnl
#ifndef incmacro
#define incmacro

#include <pulsecore/core.h>
#include <pulsecore/module.h>

gen_symbol(pa__init)
gen_symbol(pa__done)
gen_symbol(pa__get_author)
gen_symbol(pa__get_description)
gen_symbol(pa__get_usage)
gen_symbol(pa__get_version)

int pa__init(struct pa_core *c, struct pa_module*m);
void pa__done(struct pa_core *c, struct pa_module*m);

const char* pa__get_author(void);
const char* pa__get_description(void);
const char* pa__get_usage(void);
const char* pa__get_version(void);

#endif
