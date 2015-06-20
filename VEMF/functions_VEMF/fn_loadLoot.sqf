/*
	Author: VAMPIRE, rebooted by IT07

	Description:
	loads loot crate inventory
*/
private ["_crate","_var","_tmp","_kindOf","_report","_cAmmo"];
_crate = _this select 0;

// Delay Cleanup
_crate setVariable ["LAST_CHECK", (diag_tickTime + 1800)];

// Empty Crate
clearWeaponCargoGlobal _crate;
clearMagazineCargoGlobal _crate;
clearBackpackCargoGlobal  _crate;
clearItemCargoGlobal _crate;

_report = [];
// Load Random Loot Amount
for "_i" from 0 to ((floor(random 20)) + 10) do
{
	_var = (VEMFLootList call BIS_fnc_selectRandom);
	if not(_var in VEMFCrateBlacklist) then
	{
		switch (true) do
		{
			case (isClass (configFile >> "CfgWeapons" >> _var)):
			{
				_kindOf = [(configFile >> "CfgWeapons" >> _var),true] call BIS_fnc_returnParents;
				if ("ItemCore" in _kindOf) then
				{
					_crate addItemCargoGlobal [_var,1];
				} else
					{
						_crate addWeaponCargoGlobal [_var,1];
						_cAmmo = [] + getArray (configFile >> "cfgWeapons" >> _var >> "magazines");
						{
							if (isClass(configFile >> "CfgPricing" >> _x)) exitWith
							{
								_crate addMagazineCargoGlobal [_x,2];
							};
						} forEach _cAmmo;
					};
			};

			case (isClass (configFile >> "cfgMagazines" >> _var)):
			{
				_crate addMagazineCargoGlobal [_var,2];
			};

			case ((getText(configFile >> "cfgVehicles" >> _var >>  "vehicleClass")) == "Backpacks"):
			{
				_crate addBackpackCargoGlobal [_var,1];
			};

			default
			{
				_report = _report + [_var];
			};
		};
	};
};

if ((count _report) > 0) then
{
	diag_log format ["[VEMF]: LoadLoot: <Unknown> %1", str _report];
};

if (VEMFDebugFunc) then
{
	diag_log format ["[VEMF]: LoadLoot: Weps: %1 / Mags: %2 / Items: %3 / Bags: %4", (weaponCargo _crate), (magazineCargo _crate), (itemCargo _crate), (backpackCargo _crate)];
};