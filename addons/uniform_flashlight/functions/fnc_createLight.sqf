#include "script_component.hpp"
/*
 * Author: veteran29
 * Creates light from given mode.
 *
 * Arguments:
 * 0: Light class <STRING>
 * !: Light mode class <STRING>
 *
 * Return Value:
 * Light <OBJECT>
 *
 * Example:
 * ["Default", "White"] call vetufl_equipment_flashlight_fnc_createLight;
 *
 * Public: Yes
 */

params [
    ["_lightType", "", [""]],
    ["_lightMode", "", [""]]
];

private _lightConfig = GVAR(flashlightHash) get _lightType get _lightMode;
if (isNil "_lightConfig") exitWith {
    ERROR_1("Could not create the light from given parameters - %1",_this);
    objNull
};

private _light = "#lightreflector" createVehicleLocal [0,0,0];

// refactor into HashMap
_light setLightColor (_lightConfig get "color");
_light setLightAmbient (_lightConfig get "colorAmbient");
_light setLightIntensity (_lightConfig get "intensity");

_light setLightUseFlare (_lightConfig get "flare" > 0);
_light setLightFlareSize (_lightConfig get "flareSize");
_light setLightFlareMaxDistance (_lightConfig get "flareDistance");

_light setLightDayLight (_lightConfig get "dayLight" > 0);
_light setLightIR (_lightConfig get "infrared" > 0);

_light setLightConePars (_lightConfig get "lightConePars");
_light setLightAttenuation (_lightConfig get "lightAttenuation");

_light // return
