#include "script_component.hpp"
/*
 * Author: <author>
 * Function description
 *
 * Arguments:
 * 0: Objects <ARRAY>
 * 1: All <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[bob, ted], false] call vetufl_uniform_flashlight_fnc_example
 *
 * Public: No
 */

TRACE_1("asdasd",_this);

params ["_itemCfg"];

private _cfg = _itemCfg;
while {!isNull _cfg} do {
    if (!isNil {GVAR(equipmentHash) get configName _cfg}) exitWith {};
    _cfg = inheritsFrom _cfg;
};

if (isNull _cfg) exitWith {-1};

private _itemHash = GVAR(equipmentHash) get (configName _cfg);
private _modes = _itemHash get 'flashlightModes';

private _max = 0;
{
    private _intensity = GVAR(flashlightHash) get (_itemHash get "flashlight") get _x get "intensity";
    _max = _max max _intensity;
} foreach _modes;

_max
