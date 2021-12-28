#include "script_component.hpp"
ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

[QGVAR(createLight), {
    params ["_unit", "_equipment", "_lightData"];

    // there can be only one light attached to the unit
    [QGVAR(removeLight), _unit] call CBA_fnc_localEvent;

    private _light = _lightData call FUNC(createLight);
    [_unit, _light, _equipment] call FUNC(attachLight);

}] call CBA_fnc_addEventHandler;

[QGVAR(removeLight), {
    params ["_unit"];

    private _light = _unit getVariable [QGVAR(light), objNull];

    detach _light;
    deleteVehicle _light;
}] call CBA_fnc_addEventHandler;

ADDON = true;
