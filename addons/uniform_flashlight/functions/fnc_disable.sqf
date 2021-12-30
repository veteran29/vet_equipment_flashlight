#include "script_component.hpp"
/*
 * Author: veteran29
 * Disable unit equipment flashlight.
 *
 * Arguments:
 * 0: Unit <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call vetufl_uniform_flashlight_fnc_disable
 *
 * Public: Yes
 */

params [
    ["_unit", objNull, [objNull]]
];

[CREATE_EVENT_ID(_unit)] call CBA_fnc_removeGlobalEventJIP;
