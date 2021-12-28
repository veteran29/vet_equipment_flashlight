#define COMPONENT uniform_flashlight
#include "\z\vetufl\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE

#include "\z\vetufl\addons\main\script_macros.hpp"

#define CREATE_EVENT_ID(var) (format [QGVAR(createLight_%1), hashValue var])

#define CFG_EQUIPMENT DOUBLES(PREFIX,CfgEquipment)
#define CFG_FLASHLIGHTS DOUBLES(PREFIX,CfgFlashlights)
