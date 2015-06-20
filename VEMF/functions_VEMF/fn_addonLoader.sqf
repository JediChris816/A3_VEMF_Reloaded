/*
	Author: Vampire

	Description:
	runs addon scripts
*/

[] spawn
{
	VEMFLock = false;
	if (isNil "VEMFLock") then
	{
		VEMFLock = true;
	};

	if not(VEMFLock or isNil"VEMFAddon") then
	{
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
};
diag_log "[VEMF] addonLoader booted!";