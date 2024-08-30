#include "script_component.hpp"
/*
 * Author: veteran29
 * Enable unit equipment flashlight.
 *
 * Arguments:
 * 0: Unit <ARRAY>
 * 1: Item to use for attachment <STRING>
 * 2: Flashlight mode <ARRAY>
 *
 * Return Value:
 * Light was enabled <BOOL>
 *
 * Example:
 * [player, "H_HelmetSpecB", ["Default", "IR"]] call vetufl_equipment_flashlight_fnc_enable
 *
 * Public: Yes
 */

params [
    ["_unit", objNull, [objNull]],
    ["_equipment", [], [[]]],
    ["_mode", [], [[]]]
];

if (isNull _unit) exitWith {false};

[QGVAR(createLight), [_unit, _equipment, _mode], CREATE_EVENT_ID(_unit)] call CBA_fnc_globalEventJIP;

[QGVAR(refreshUi)] call CBA_fnc_localEvent;

true
