/*
	Author: VAMPIRE, rebooted by IT07

	Description:
	finds houses

	Returns:
	ARRAY - list of house positions
*/

private ["_pos","_cnt","_houseArr","_fin","_loop","_bNum","_tmpArr","_bPos"];

// CenterPOS and House Count
_pos = _this select 0;
_cnt = _this select 1;

// Get Nearby Houses in Array
_houseArr = nearestObjects [_pos, ["house"], 200];
{
	if (str(getPos _x) == "[0,0,0]") then
	{
		// Not a Valid House
		_houseArr = _houseArr - [_x];
	};

	if (str(_x buildingPos 0) == "[0,0,0]") then
	{
		_houseArr = _houseArr - [_x];
	};
} forEach _houseArr;

// Randomize Valid Houses
if (count _houseArr > 20) then
{
	_houseArr resize 20;
};

_houseArr = _houseArr call BIS_fnc_arrayShuffle;

// Only return the amount of houses we wanted
_houseArr resize _cnt;
_fin = [];
{
	// Keep locations separated by house for unit groups
	_loop = true;
	_bNum = 0;
	_tmpArr = [];
	while { _loop } do
	{
		_bPos = _x buildingPos _bNum;
		if (str _bPos == "[0,0,0]") then
		{
			// All Positions Found
			_loop = false;
		} else
			{
				_tmpArr = _tmpArr + [_bPos];
				_bNum = _bNum + 1;
			};
	};

	_fin = _fin + [_tmpArr];
} forEach _houseArr;

if (VEMFDebugFunc) then
{
	diag_log format ["[VEMF]: HousePos: %1", str(_fin)];
};

// Returns in the following format
// Nested Array = [[HousePos1,Pos2,Pos3],[Pos1,Pos2],[Pos1,Pos2]];
_fin