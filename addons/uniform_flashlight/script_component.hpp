#define COMPONENT uniform_flashlight
#include "\z\vetufl\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE

#include "\z\vetufl\addons\main\script_macros.hpp"

#include "\a3\ui_f\hpp\defineResincl.inc"

#define CREATE_EVENT_ID(var) (format [QGVAR(createLight_%1), hashValue var])

#define CFG_EQUIPMENT DOUBLES(PREFIX,CfgEquipment)
#define CFG_FLASHLIGHTS DOUBLES(PREFIX,CfgFlashlights)
