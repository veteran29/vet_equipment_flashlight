#include "script_component.hpp"
/*
 * Author: veteran29
 * Reads equipment flashlight attachment config from provided config. Can be used to overwrite configFile data.
 *
 * Arguments:
 * 0: Config to read from <CONFIG>
 *
 * Return Value:
 * None
 *
 * Example:
 * [missionConfigFile] call vetufl_uniform_flashlight_fnc_readEquipmentConfig
 *
 * Public: No
 */

params [
    ["_rootCfg", configFile, [configNull]]
];

{
    TRACE_1("Reading equipment config",_x);
    if (_rootCfg isEqualTo missionConfigFile) then {
        INFO_1("Reading equipment config from description.ext - %1",_x);
    };

    private _flashlightName = getText (_x >> "flashlight");
    if (_flashlightName == "" && {isText (_x >> "flashlight")}) then {
        INFO_1("Disabling flashlight - %1",configName _x);
        GVAR(equipmentHash) set [configName _x, createHashMapFromArray [
            ["flashlight", "<disabled>"],
            ["flashlightModes", []]
        ]];
        continue;
    };

    private _flashlightModes = GVAR(flashlightHash) get _flashlightName;
    if (isNil "_flashlightModes") then {
        WARNING_2("No flashlight '%1' found for %2, using Default",_flashlightName,_x);
        _flashlightName = "Default";
        _flashlightModes = GVAR(flashlightHash) get _flashlightName;
    };

    GVAR(equipmentHash) set [configName _x, createHashMapFromArray [
        ["flashlight", _flashlightName],
        ["flashlightModes", keys _flashlightModes],
        // attachment
        ["attachOffset", [_x >> "attachOffset", "ARRAY", [0,0,0]] call CBA_fnc_getConfigEntry],
        ["attachBone", getText (_x >> "attachBone")],
        ["attachBoneFollow", getNumber (_x >> "attachBoneFollow") > 0],
        ["attachVectorDir", [_x >> "attachVectorDir", "ARRAY", [0,1,0]] call CBA_fnc_getConfigEntry],
        ["attachVectorUp", [_x >> "attachVectorUp", "ARRAY", [0,0,1]] call CBA_fnc_getConfigEntry]
    ]];
} forEach ("isClass (configfile >> 'CfgWeapons' >> configName _x)" configClasses (_rootCfg >> 'CFG_EQUIPMENT'));
