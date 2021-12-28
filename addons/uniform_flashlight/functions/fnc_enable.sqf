#include "script_component.hpp"
/*
 * Author: veteran29
 * Enable unit equipment flashlight.
 *
 * Arguments:
 * 0: Unit <ARRAY>
 *
 * Return Value:
 * Light was enabled <BOOL>
 *
 * Example:
 * [player] call vetufl_uniform_flashlight_fnc_enable
 *
 * Public: No
 */

params [
    ["_unit", objNull, [objNull]],
    ["_item", "", [""]]
];

if (isNull _unit) exitWith {false};

[QGVAR(createLight), [_unit, _item, ["Default", "White"]], CREATE_EVENT_ID(_unit)] call CBA_fnc_globalEventJIP;

true
