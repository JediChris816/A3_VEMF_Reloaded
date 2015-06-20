/*
	Author: VAMPIRE, rebooted by IT07

	Description:
	waits for player to be nearby
*/

private ["_pos","_rad","_time"];

_pos = _this select 0;
_rad = _this select 1;
_time = diag_tickTime;

while {true} do
{
	if ((count(_pos nearEntities [["Epoch_Male_F", "Epoch_Female_F"], _rad])) > 0) exitWith
	{
		true
	};

	if (VEMFTimeout && {(diag_tickTime - _time) > (VEMFTimeoutTime * 60)}) exitWith
	{
		false; // Put PVBC code here in the future
	};
	uiSleep 5;
};