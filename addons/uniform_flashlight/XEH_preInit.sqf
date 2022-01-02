#include "script_component.hpp"
ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

GVAR(flashlightHash) = createHashMap;
[] call FUNC(readFlashlightConfig);

GVAR(equipmentHash) = createHashMap;
[configFile] call FUNC(readEquipmentConfig);
[missionConfigFile] call FUNC(readEquipmentConfig);

[QGVAR(createLight), {
    params ["_unit", "_equipment", "_lightData"];

    // there can be only one light attached to the unit
    [QGVAR(removeLight), _unit] call CBA_fnc_localEvent;

    private _light = _lightData call FUNC(createLight);
    [_unit, _light, _equipment] call FUNC(attachLight);

    _unit setVariable [QGVAR(lightData), _lightData];
    [_unit, !(_unit in _unit)] call FUNC(hideLight);

}] call CBA_fnc_addEventHandler;

[QGVAR(removeLight), {
    params ["_unit"];

    private _light = _unit getVariable [QGVAR(light), objNull];

    detach _light;
    deleteVehicle _light;

    _unit setVariable [QGVAR(light), nil];
    _unit setVariable [QGVAR(lightData), nil];
}] call CBA_fnc_addEventHandler;

["CAManBase", "GetInMan", {
    params ["_unit"];

    [_unit, true] call FUNC(hideLight);
}] call CBA_fnc_addClassEventHandler;

["CAManBase", "GetOutMan", {
    params ["_unit"];

    [_unit, false] call FUNC(hideLight);
}] call CBA_fnc_addClassEventHandler;

ADDON = true;
