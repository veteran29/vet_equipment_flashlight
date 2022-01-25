#include "script_component.hpp"
/*
 * Author: veteran29
 * Init actions for managing the flashlights.
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

#ifdef DEBUG_MODE_FULL
    #define ENABLE_MODE_TEXT (format ["%1 > %2", _item, _flashlightMode])
#else
    #define ENABLE_MODE_TEXT (format [LLSTRING(Enable_Mode), _flashlightMode])
#endif

// create equipment actions
{
    private _item = _x;
    private _flashlight = _y get "flashlight";

    // create action for every flashlight mode
    {
        private _flashlightMode = _x;
        [
            _item,
            "CLOTHES",
            ENABLE_MODE_TEXT,
            nil,
            nil,
            [{true}, {
                params ["", "", "_itemAction", "", "_params"];
                _params params ["_item"];

                _item == configName (_itemAction call FUNC(getEquipmentConfig)) // return
            }],
            {
                params ["_unit", "", "_item", "_slot", "_params"];
                _params params ["", "_mode"];

                [_unit, [_item, _slot], _mode] call FUNC(enable);

                false // close menu
            },
            false,
            [_item, [_flashlight, _flashlightMode]]
        ] call CBA_fnc_addItemContextMenuOption
    } forEach (_y get "flashlightModes");

} forEach GVAR(equipmentHash);

// disable light action
[
    "#Equipment",
    "CLOTHES",
    LLSTRING(Disable),
    nil,
    nil,
    [{true}, {
        params ["_unit", "", "_item"];

        (_unit getVariable [QGVAR(lightEquipment), []] param [0, ""]) == _item
    }],
    {
        params ["_unit"];
        _unit call FUNC(disable);
    }
] call CBA_fnc_addItemContextMenuOption;
