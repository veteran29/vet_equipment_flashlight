#include "script_component.hpp"
/*
 * Author: veteran29
 * "Hides" the light attached to the unit by setting it intensity to 0.
 *
 * Arguments:
 * 0: Unit with the light <OBJECT>
 * 1: Hide the light <BOOL>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params [
    ["_unit", objNull, [objNull]],
    ["_hide", true, [false]]
];

private _light = _unit getVariable [QGVAR(light), objNull];

if (_hide) then {
    _light setLightIntensity 0;
} else {
    (_unit getVariable [QGVAR(lightData), []]) params ["_lightType", "_lightMode"];
    _light setLightIntensity (GVAR(flashlightHash) get _lightType get _lightMode get "intensity");
};

nil
