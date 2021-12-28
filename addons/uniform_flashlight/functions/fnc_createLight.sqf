#include "script_component.hpp"
/*
 * Author: veteran29
 * Creates light from given config name.
 *
 * Arguments:
 * 0: Light class <STRING>
 *
 * Return Value:
 * Light <OBJECT>
 *
 * Example:
 * ["Default", "White"] call vetufl_uniform_flashlight_fnc_createLight;
 *
 * Public: Yes
 */

params [
    ["_lightType", "", [""]],
    ["_lightMode", "", [""]]
];

private _lightConfig = configFile >> QUOTE(CFG_FLASHLIGHTS) >> _lightType >> _lightMode;
if (isNull _lightConfig) exitWith {
    ERROR_1("Could not create the light from given parameters - %1",_this);
    objNull
};

private _light = "#lightreflector" createVehicleLocal [0,0,0];

// refactor into HashMap
_light setLightColor ([_lightConfig >> "color", "ARRAY", [0.5, 0.5, 0.5]] call CBA_fnc_getConfigEntry);
_light setLightAmbient ([_lightConfig >> "colorAmbient", "ARRAY", [0.1, 0.1, 0.1]] call CBA_fnc_getConfigEntry);
_light setLightIntensity ([_lightConfig >> "intensity", "NUMBER", 1000] call CBA_fnc_getConfigEntry);

_light setLightUseFlare (getNumber (_lightConfig >> "flare") > 0);
_light setLightFlareSize ([_lightConfig >> "flareSize", "NUMBER", 0.1] call CBA_fnc_getConfigEntry);
_light setLightFlareMaxDistance ([_lightConfig >> "flareDistance", "NUMBER", 15] call CBA_fnc_getConfigEntry);

_light setLightDayLight (getNumber (_lightConfig >> "dayLight") > 0);
_light setLightIR (getNumber (_lightConfig >> "infrared") > 0);

_light setLightConePars ([_lightConfig >> "lightConeParse", "ARRAY", [65, 35, 1]] call CBA_fnc_getConfigEntry);
_light setLightAttenuation ([_lightConfig >> "lightAttenuation", "ARRAY", [1.5, 2, 2, 0, 10, 35]] call CBA_fnc_getConfigEntry);

_light // return
