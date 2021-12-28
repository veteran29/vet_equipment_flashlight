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

[
    "#All",
    "CLOTHES",
    "Enable Flashlight",
    nil,
    nil,
    {
        params ["", "", "_item"];

        isClass (configFile >> QUOTE(CFG_EQUIPMENT) >> _item) // return
    },
    {
        params ["_unit", "", "_item"];

        [_unit, _item] call FUNC(enable);
    }
] call CBA_fnc_addItemContextMenuOption
