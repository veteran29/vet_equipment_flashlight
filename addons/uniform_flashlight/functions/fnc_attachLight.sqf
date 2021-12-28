#include "script_component.hpp"
/*
 * Author: veteran29
 * Attach light to the unit based on the specified equipment config.
 *
 * Arguments:
 * 0: Unit to attach light to <OBJECT>
 * 1: Light to attach <OBJECT>
 * 2: Equipment class <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_unit, _light, "H_HelmetSpecB"] call vetufl_uniform_flashlight_fnc_attachLight
 *
 * Public: No
 */

params ["_unit", "_light", "_equipment"];

if (isNull _light) exitWith {
    ERROR_1("Light is null, unable to attach - '%1'",_unit);
};

private _equipmentConfig = configFile >> QUOTE(CFG_EQUIPMENT) >> _equipment;
TRACE_4("Attaching light",_unit,_light,_equipment,_equipmentConfig);

_light attachTo [
    _unit,
    [_equipmentConfig >> "attachOffset", "ARRAY", [0,0,0]] call CBA_fnc_getConfigEntry,
    getText (_equipmentConfig >> "attachBone"),
    getNumber (_equipmentConfig >> "attachBoneFollow") > 0
];

_light setVectorDirAndUp [
    [_equipmentConfig >> "attachVectorDir", "ARRAY", [0,0,0]] call CBA_fnc_getConfigEntry,
    [_equipmentConfig >> "attachVectorUp", "ARRAY", [0,0,0]] call CBA_fnc_getConfigEntry
];

_unit setVariable [QGVAR(light), _light];

nil
