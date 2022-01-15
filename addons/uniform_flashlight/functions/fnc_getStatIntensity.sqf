#include "script_component.hpp"
/*
 * Author: veteran29
 * Get maximum intensity stat of the item flashlight.
 *
 * Arguments:
 * 0: Item config <CONFIG>
 *
 * Return Value:
 * Intensity <NUMBER>
 *
 * Public: No
 */

params ["_itemCfg"];

private _cfg = configName _itemCfg call FUNC(getEquipmentConfig);
if (isNull _cfg) exitWith {-1};

private _itemHash = GVAR(equipmentHash) get (configName _cfg);
private _modes = _itemHash get 'flashlightModes';

private _max = 0;
{
    private _intensity = GVAR(flashlightHash) get (_itemHash get "flashlight") get _x get "intensity";
    _max = _max max _intensity;
} foreach _modes;

_max
