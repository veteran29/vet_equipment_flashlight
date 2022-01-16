#include "script_component.hpp"
/*
 * Author: veteran29
 * Update inventory display light indicators.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
 */

private _display = uiNamespace getVariable ["RscDisplayInventory", displayNull];
if (isNull _display) exitWith {};

LOG("Updating inventory display");

private _uniformSlot = _display displayCtrl IDC_FG_UNIFORM_TEXT;
private _vestSlot = _display displayCtrl IDC_FG_VEST_TEXT;
private _backpackSlot = _display displayCtrl IDC_FG_BACKPACK_TEXT;
private _headgearSlot = _display displayCtrl IDC_FG_HEADGEAR;

private _unit = call CBA_fnc_currentUnit;
// get slot of the enabled light
private _lightSlot = (_unit getVariable [QGVAR(lightEquipment), []]) param [1, ""];

{
    private _ctrlIcon = _x getVariable QGVAR(icon);
    private _ctrlSlot = _x getVariable "cba_ui_slotType";

    private _classname = "";
    switch (_ctrlSlot) do {
        case "UNIFORM": {
            _classname = uniform _unit;
        };
        case "VEST": {
            _classname = vest _unit;
        };
        case "BACKPACK": {
            _classname = backpack _unit;
        };
        case "HEADGEAR": {
            _classname = headgear _unit;
        };
    };

    _ctrlIcon ctrlShow (_classname call FUNC(hasFlashlight));
    _ctrlIcon ctrlSetTextColor ([[1,0,0, 0.7], [1,1,1,1]] select (_ctrlSlot == _lightSlot));

} forEach [
    _uniformSlot,
    _vestSlot,
    _backpackSlot,
    _headgearSlot
];
