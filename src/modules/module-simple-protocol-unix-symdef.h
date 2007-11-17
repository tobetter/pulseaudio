#ifndef foomodulesimpleprotocolunixsymdeffoo
#define foomodulesimpleprotocolunixsymdeffoo

#include <pulsecore/core.h>
#include <pulsecore/module.h>

#define pa__init module_simple_protocol_unix_LTX_pa__init
#define pa__done module_simple_protocol_unix_LTX_pa__done
#define pa__get_author module_simple_protocol_unix_LTX_pa__get_author
#define pa__get_description module_simple_protocol_unix_LTX_pa__get_description
#define pa__get_usage module_simple_protocol_unix_LTX_pa__get_usage
#define pa__get_version module_simple_protocol_unix_LTX_pa__get_version

int pa__init(pa_module*m);
void pa__done(pa_module*m);

const char* pa__get_author(void);
const char* pa__get_description(void);
const char* pa__get_usage(void);
const char* pa__get_version(void);

#endif
