/*
	Author: VAMPIRE, rebooted by IT07

	Description:
	loads AI inventory

	Returns:
	BOOLEAN - true if finished
*/

private ["_unit","_fin","_prim","_seco","_pAmmo","_hAmmo","_attachment"];

_unit = _this select 0;
_fin = false;

if (!isNull _unit) then
{
	// Strip Unit
	removeAllWeapons _unit;
	{
		_unit removeMagazine _x;
	} foreach (magazines _unit);

	removeAllItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeGoggles _unit;
	removeHeadGear _unit;

	// Add Uniform
	_unit forceAddUniform (VEMFUniformList call BIS_fnc_selectRandom);

	// Add Headgear
	_unit addHeadGear (VEMFHeadgearList call BIS_fnc_selectRandom);

	// Add Vest (Random 40 Vests)
	/* _vVar = (floor(random 41));
	if (_vVar == 0) then { _vVar = 1; };
	_unit addVest ("V_" + str(_vVar) + "_EPOCH"); */
	_unit addVest (VEMFVestList call BIS_fnc_selectRandom);

	// Add Backpacks yaaay!
	_unit addBackpack (VEMFbackPackList call BIS_fnc_selectRandom);

	// Add Food/Drink
	// 33% Chance
	if ((floor(random(2))) == 1) then
	{
		_unit addMagazine (VEMFitemList call BIS_fnc_selectRandom);
	};

	// Add Weapons & Ammo
	_prim = VEMFRiflesList call BIS_fnc_selectRandom;
	_seco = VEMFPistolsList call BIS_fnc_selectRandom;

	_pAmmo = [] + getArray (configFile >> "cfgWeapons" >> _prim >> "magazines");
	{
		if (isClass(configFile >> "CfgPricing" >> _x)) exitWith
		{
			_unit addMagazine _x;
			_unit addMagazine _x;
			for "_i" from 0 to (floor(random 3)) do
			{
				_unit addMagazine _x;
			};
		};
	} forEach _pAmmo;

	_hAmmo = [] + getArray (configFile >> "cfgWeapons" >> _seco >> "magazines");
	{
		if (isClass(configFile >> "CfgPricing" >> _x)) exitWith
		{
			_unit addMagazine _x;
			_unit addMagazine _x;
			for "_i" from 0 to (floor(random 4)) do
			{
				_unit addMagazine _x;
			};
		};
	} forEach _hAmmo;

	_unit addWeapon _prim;
	_unit selectWeapon _prim;
	_unit addWeapon _seco;

	// Add Grenades for GL Units
	if ((count(getArray (configFile >> "cfgWeapons" >> _prim >> "muzzles"))) > 1) then
	{
		_unit addMagazine "1Rnd_HE_Grenade_shell";
	};

	// 20% Chance Hand Grenade
	// Random Returns 0,1,2,3,4
	if ((floor(random(5))) == 2) then
	{
		_unit addMagazine "HandGrenade";
	};

	// 10% Scope Attachment Chance
	if ((floor(random(10))) == 5) then
	{
		_attachment = (getArray (configFile >> "cfgLootTable" >> "Scopes" >> "items")) call BIS_fnc_selectRandom;
		_unit addPrimaryWeaponItem str(_attachment select 0);
	};

	if (VEMFDebugFunc) then
	{
		diag_log format ["[VEMF]: LoadGear: Uniform: %1 / Vest: %2 / Hat: %3 / Weps: %4 / Mags: %5", (uniform _unit), (vest _unit), (headgear _unit), (weapons _unit), (magazines _unit)];
	};

	_fin = true;
};

_fin