#include "script_component.hpp"
/*
 * Author: veteran29
 * Reads flashlight config data from configFile and missionConfigFile.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [configFile] call vetufl_uniform_flashlight_fnc_readFlashlightConfig
 *
 * Public: No
 */

#define GET_CFG_OR_DEFAULT(key,type) ([_this >> key, type, GVAR(flashlightHash) get "Default" get key] call CBA_fnc_getConfigEntry)

private _fnc_readMode = {
    createHashMapFromArray [
        ["color", GET_CFG_OR_DEFAULT("color","ARRAY")],
        ["colorAmbient", GET_CFG_OR_DEFAULT("colorAmbient","ARRAY")],
        ["intensity", GET_CFG_OR_DEFAULT("intensity","NUMBER")],

        ["flare", GET_CFG_OR_DEFAULT("flare","NUMBER") > 0],
        ["flareSize", GET_CFG_OR_DEFAULT("flareSize","NUMBER")],
        ["flareDistance", GET_CFG_OR_DEFAULT("flareDistance","NUMBER")],

        ["dayLight", GET_CFG_OR_DEFAULT("dayLight","NUMBER") > 0],
        ["infrared", GET_CFG_OR_DEFAULT("infrared","NUMBER") > 0],

        ["lightConePars", GET_CFG_OR_DEFAULT("lightConePars","ARRAY")],
        ["lightAttenuation", GET_CFG_OR_DEFAULT("color","ARRAY")]
    ]
};

// read configFile
{
    TRACE_1("Reading flashlight config",_x);

    private _modes = "true" configClasses _x;
    private _modesHash = createHashMapFromArray (_modes apply {[configName _x, _x call _fnc_readMode]});

    GVAR(flashlightHash) set [configName _x, _modesHash];
} forEach ("true" configClasses (configFile >> 'CFG_FLASHLIGHTS'));

// read missionConfigFile
{
    INFO_1("Reading flashlight config from description.ext - %1",_x);
    // prevent overwriting of default values via description.ext
    if (configName _x == "Default") then {continue};

    private _modes = "true" configClasses _x;
    private _modesHash = createHashMapFromArray (_modes apply {[configName _x, _x call _fnc_readMode]});

    GVAR(flashlightHash) set [configName _x, _modesHash];
} forEach ("true" configClasses (missionConfigFile >> 'CFG_FLASHLIGHTS'));
