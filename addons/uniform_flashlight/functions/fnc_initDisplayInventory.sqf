#define DEBUG_SYNCHRONOUS
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

params ["_display"];

systemChat "Inventory!";

private _uniformSlot = _display displayCtrl IDC_FG_UNIFORM_TEXT;
private _vestSlot = _display displayCtrl IDC_FG_VEST_TEXT;
private _backpackSlot = _display displayCtrl IDC_FG_BACKPACK_TEXT;
private _headgearSlot = _display displayCtrl IDC_FG_HEADGEAR;

{
    private _ctrlSlot = _x;
    private _ctrlIcon = _display ctrlCreate ["RscPicture", -1];
    _ctrlIcon ctrlSetText "\a3\ui_f\data\IGUI\Cfg\VehicleToggles\LightsIconOn_ca.paa";
    // _ctrlIcon ctrlShow false;

    (ctrlPosition _ctrlSlot) params ["_x", "_y", "_w"];
    _iconSize = _w/3;
    _ctrlIcon ctrlSetPosition [
        _x + _w - _iconSize,
        _y,
        _iconSize,
        _iconSize
    ];
    _ctrlIcon ctrlCommit 0;

    _ctrlSlot setVariable [QGVAR(icon), _ctrlIcon];

} forEach [
    _uniformSlot,
    _vestSlot,
    _backpackSlot,
    _headgearSlot
];

// TODO move to function, refresh on light state change
[{
    params ["_display"];

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

}, _display] call CBA_fnc_execNextFrame;
