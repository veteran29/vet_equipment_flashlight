#include "script_component.hpp"
/*
 * Author: veteran29
 * Init arsenal stats and sorts.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
 */

if (!IS_MOD_LOADED(ace_arsenal)) exitWith {};

[
    [[3,4,5,6], []],
    QGVAR(intensity),
    [],
    "Flashlight intensity /loc",
    [false, true],
    [
        {},
        {
            [(_this select 1)] call FUNC(getStatIntensity) // return
        },
        {
            (configName (_this select 1)) call FUNC(hasFlashlight) // return
        }
    ],
    -1
] call ACEFUNC(arsenal,addStat);

[
    [[3,4,5,6], []],
    QGVAR(intensity),
    "Sort by flashlight intensity /loc",
    {
        params ["_itemCfg"];
        (_itemCfg call FUNC(getStatIntensity)) * -1 // return
    }
] call ACEFUNC(arsenal,addSort);

