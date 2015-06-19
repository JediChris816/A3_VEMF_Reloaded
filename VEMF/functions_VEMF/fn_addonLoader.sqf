/*
	VEMF Addon Loader by Vampire
	Runs addon scripts.

	If you're fancy enough you can include folder names Dev's.
	You have to keep your addons looping if required, this script doesn't keep them running.

	Examples:
		Caves.sqf
		\VEMF\Addons\Caves\init.sqf
*/
[] spawn
{
	
	VEMFLock = false;
	if (isNil "VEMFLock") then {VEMFLock = true;};
	if (VEMFLock || isNil "VEMFAddon") exitWith {};
	{
		if (_x != "") then 
		{
			// Let's run the addon
			call compile preprocessFileLineNumbers format ["\VEMF\Addons\%1", _x];
		};
	} forEach VEMFAddon;
	
	VEMFLock = true;
	VEMFAddon = nil;
};
diag_log "[VEMF] addonLoader booted!";