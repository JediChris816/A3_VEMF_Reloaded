/*
	Author: Vampire, rebooted by IT07

	Description:
	finds cities to spawn AI in

	Returns:
	ARRAY - unknown
*/

private ["_centerLoc","_findRun","_testPos","_hardX","_hardY","_posX","_posY","_feel1","_feel2","_feel3","_feel4","_noWater","_okDis","_isBlack","_plyrNear","_fin"];

// The DayZ "Novy Sobor" bug still exists in Arma 3.
// This means we still need to input our map specific centers.
_centerLoc = call VEMF_fnc_getMapCenter;

// Now we run a loop to check the position against our requirements
_findRun = true;
while { _findRun } do
{
	// Get our Candidate Position
	_testPos = [(_centerLoc select 0),0,(_centerLoc select 1),60,0,20,0] call BIS_fnc_findSafePos;

	// Get values to compare
	_hardX = ((_centerLoc select 0) select 0);
	_hardY = ((_centerLoc select 0) select 1);
	_posX = _testPos select 0;
	_posY = _testPos select 1;

	// Water Feelers. Checks for nearby water within 50meters.
	_feel1 = [_posX, _posY+50, 0]; // North
	_feel2 = [_posX+50, _posY, 0]; // East
	_feel3 = [_posX, _posY-50, 0]; // South
	_feel4 = [_posX-50, _posY, 0]; // West

	// Water Check
	_noWater = (!surfaceIsWater _testPos && !surfaceIsWater _feel1 && !surfaceIsWater _feel2 && !surfaceIsWater _feel3 && !surfaceIsWater _feel4);

	// Check for Mission Separation Distance
	{
		_okDis = true;
		if ((_testPos distance _x) < 1500) exitWith
		{
			// Another Mission is too close
			_okDis = false;
		};
	} forEach VEMFMissionLocs;

	// Blacklist Check
	{
		_isBlack = false;
		if ((_testPos distance (_x select 0)) <= (_x select 1)) exitWith
		{
			// Position is too close to a Blacklisted Location
			_isBlack = true;
		};
	} forEach VEMFBlacklistZones;

	_plyrNear = {isPlayer _x} count (_testPos nearEntities [["Epoch_Male_F", "Epoch_Female_F"], 500]) > 0;

	// Let's Compare all our Requirements
	if ((_posX != _hardX) AND (_posY != _hardY) AND _noWater AND _okDis AND !_isBlack AND !_plyrNear) then
	{
		_findRun = false;
	};

	if (VEMFDebugLocs) then
	{
		diag_log format ["[VEMF]: MISSDEBUG: Pos:[%1,%2] / noWater?:%3 / okDistance?:%4 / isBlackListed:%5 / isPlayerNear:%6", _posX, _posY, _noWater, _okDis, _isBlack, _plyrNear];
	};
	uiSleep 2;
};

_fin = [(_testPos select 0), (_testPos select 1), 0];
_fin