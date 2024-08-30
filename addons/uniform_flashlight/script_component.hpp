#define COMPONENT equipment_flashlight
#include "\z\vetufl\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE

#include "\z\vetufl\addons\main\script_macros.hpp"

#include "\a3\ui_f\hpp\defineResincl.inc"

#define CREATE_EVENT_ID(var) (format [QGVAR(createLight_%1), hashValue var])

#define CFG_EQUIPMENT DOUBLES(PREFIX,CfgEquipment)
#define CFG_FLASHLIGHTS DOUBLES(PREFIX,CfgFlashlights)

// Returns mode of the currently enabled flashlight - [<flashlightClass>, <modeClass>]
#define GET_LIGHT_MODE(var) (var getVariable [QGVAR(lightData), []])
// Returns equipment that provides currently enabled flashlight - [<flashlightItem>, <itemSlot>]
#define GET_LIGHT_EQUIPMENT(var) (var getVariable [QGVAR(lightEquipment), []])
