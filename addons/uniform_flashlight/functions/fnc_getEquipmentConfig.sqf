#include "script_component.hpp"
/*
 * Author: veteran29
 * Get equipment config for given classname.
 *
 * Arguments:
 * 0: Item class <STRING>
 *
 * Return Value:
 * Equipment config <CONFIG>
 *
 * Example:
 * ["H_HelmetSpecB_paint2"] call vetufl_uniform_flashlight_fnc_getEquipmentConfig
 *
 * Public: Yes
 */

params [["_item", "", ["", configNull]]];

private _cfg = GVAR(equipmentConfigCache) get _item;
if (isNil "_cfg") then {
    _cfg = _item call CBA_fnc_getItemConfig;
    while {!isNull _cfg} do {
        if (!isNil {GVAR(equipmentHash) get configName _cfg}) exitWith {};
        _cfg = inheritsFrom _cfg;
    };

    GVAR(equipmentConfigCache) set [_item, _cfg];
};

_cfg
