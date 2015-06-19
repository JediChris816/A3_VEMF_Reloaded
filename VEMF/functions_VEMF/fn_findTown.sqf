/*
	Author: VAMPIRE, rebooted by IT07

	Description:
	finds a town
*/
private ["_cntr","_townArr","_sRandomTown","_townPos","_townName","_ret"];

	_cntr = (epoch_centerMarkerPosition);

	// Get a list of towns
	// Shouldn't cause lag because of the infrequency it runs (Needs Testing)
	_townArr = nearestLocations [_cntr, ["NameCity","NameCityCapital"], 30000];

	// Pick a random town
	_sRandomTown = _townArr call BIS_fnc_selectRandom;

	// Return Name and POS
	_townPos = [((locationPosition _sRandomTown) select 0), ((locationPosition _sRandomTown) select 1), 0];
	_townName = (text _sRandomTown);

	_ret = [_townName, _townPos];
	_ret