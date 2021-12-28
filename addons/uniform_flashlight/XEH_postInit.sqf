#include "script_component.hpp"

#ifdef DEBUG_MODE_FULL
[
    ['draw PREFIX', 'Enable debug draw of PREFIX - COMPONENT'],
    {}
] call (uiNamespace getVariable ['afm_debug_console_fnc_addButton', {}]);
#endif

[] call FUNC(initActions);
