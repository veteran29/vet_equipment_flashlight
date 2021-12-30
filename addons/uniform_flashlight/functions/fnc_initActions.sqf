#include "script_component.hpp"
/*
 * Author: veteran29
 * Function description
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call vetufl_uniform_flashlight_fnc_initActions
 *
 * Public: No
 */

// create equipment actions
{
    private _item = _x;
    private _flashlight = _y get "flashlight";
    private _disableInheritance = _y getOrDefault ["disableInheritance", false];

    // create action for every flashlight mode
    {
        private _flashlightMode = _x;
        [
            _item,
            "CLOTHES",
            format ["%2 > %1", _flashlightMode, _item],
            nil,
            nil,
            [{true}, {
                params ["", "", "_itemAction", "", "_params"];
                _params params ["_item", "_mode"];

                private _show = false;
                private _cfg = _itemAction call CBA_fnc_getItemConfig;
                while {!isNull _cfg} do {
                    if (!isNil {GVAR(equipmentHash) get configName _cfg}) exitWith {};
                    _cfg = inheritsFrom _cfg;
                };

                _item == configName _cfg // return
            }],
            {
                params ["_unit", "", "", "", "_params"];
                _params params ["_item", "_mode"];

                [_unit, _item, _mode] call FUNC(enable);

                false // close menu
            },
            false,
            [_item, [_flashlight, _flashlightMode]]
        ] call CBA_fnc_addItemContextMenuOption
    } forEach (_y get "flashlightModes");

} forEach GVAR(equipmentHash);
