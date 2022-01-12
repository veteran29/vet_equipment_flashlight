#include "script_component.hpp"
/*
 * Author: veteran29
 * Check if given item class has flashlight.
 *
 * Arguments:
 * 0: Item class <STRING>
 *
 * Return Value:
 * Has flashlight <BOOL>
 *
 * Example:
 * ["H_HelmetSpecB"] call vetufl_uniform_flashlight_fnc_hasFlashlight
 *
 * Public: Yes
 */

params ["_item"];

private _cfg = _item call CBA_fnc_getItemConfig;
while {!isNull _cfg} do {
    if (!isNil {GVAR(equipmentHash) get configName _cfg}) exitWith {};
    _cfg = inheritsFrom _cfg;
};

!isNull _cfg
