/*
	Author: Vampire

	Description:
	runs a loop to launch new missions - will be made more advanced in the future
*/

[] spawn
{
	private ["_timeDiff","_missVar"];
	// Find the Min and Max time
	_timeDiff = ((VEMFMaxMissTime*60) - (VEMFMinMissTime*60));

	while {true} do
	{
		// Wait a Random Amount
		uiSleep ((floor(random(_timeDiff))) + (VEMFMinMissTime*60));
		// Pick A Mission
		if not((count VEMFMissionArray) isEqualTo 0) then
		{
			_missVar = VEMFMissionArray call BIS_fnc_selectRandom;
			// Run It
			[] execVM format ["\VEMF\Missions\%1.sqf",_missVar];
			diag_log format["[VEMF] missionTimer started %1", _missVar];
		};
	};

};

diag_log "[VEMF] missionTimer booted!";