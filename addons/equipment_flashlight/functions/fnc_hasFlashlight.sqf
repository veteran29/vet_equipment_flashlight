#include "script_component.hpp"
/*
 * Author: veteran29
 * Check if given item class has flashlight.
 *
 * Arguments:
 * 0: Item class <STRING>
 *
 * Return Value:
 * Has flashlight <BOOL>
 *
 * Example:
 * ["H_HelmetSpecB"] call vetufl_equipment_flashlight_fnc_hasFlashlight
 *
 * Public: Yes
 */

params ["_item"];

!isNull (_item call FUNC(getEquipmentConfig))
