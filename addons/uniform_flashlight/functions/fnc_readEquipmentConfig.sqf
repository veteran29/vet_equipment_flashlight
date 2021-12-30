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

    private _flashlightName = getText (_x >> "flashLight");
    if (_flashlightName == "") then {
        TRACE_1("Disabling flashlight",configName _x);
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
        ["flashlightModes", keys _flashlightModes]
    ]];
} forEach ("isClass (configfile >> 'CfgWeapons' >> configName _x)" configClasses (_rootCfg >> 'CFG_EQUIPMENT'));
