#include "script_component.hpp"

[] call FUNC(initActions);

// debugging stuff
#ifdef DEBUG_MODE_FULL
    GVAR(debugDraw) = -1;
    // [] call vetufl_equipment_flashlight_fnc_debugDraw
    DFUNC(debugDraw) = {
        params ["_unit"];

        private _light = _unit getVariable [QGVAR(light), objNull];
        if (isNull _light) exitWith {};

        drawIcon3D [
            "\a3\ui_f\data\Map\Markers\Military\dot_CA.paa",
            [1,1,1,0.5],
            _light modelToWorldVisual [0,0,0],
            0.6,
            0.6,
            0,
            "Light"
        ];
        drawLine3D [_light modelToWorldVisual [0,-0.2,0], _light modelToWorldVisual [0,0.45,0], [1,0,0,1]];
    };

    DFUNC(debugDrawToggle) = {
        if (GVAR(debugDraw) != -1) exitWith {
            removeMissionEventHandler ["Draw3D", GVAR(debugDraw)];
            GVAR(debugDraw) = -1;
        };

        GVAR(debugDraw) = addMissionEventHandler ["Draw3D", {
            {
                _x call FUNC(debugDraw);
            } forEach allUnits;
        }];
    };

    // add debug draw toggle button
    [
        ['draw PREFIX', 'Enable debug draw of PREFIX - COMPONENT'],
        {call FUNC(debugDrawToggle)}
    ] call (uiNamespace getVariable ['afm_debug_console_fnc_addButton', {}]);
#endif
