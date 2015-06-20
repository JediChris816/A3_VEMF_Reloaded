/*
	Author: VAMPIRE, rebooted by IT07

	Description:
	removes duplicate entries in array

	Returns:
	ARRAY - new array without duplicates
*/
private ["_array","_tmpArr"];

_array = _this select 0;
_tmpArr = _this select 0;

{
	_array = _array - [_x];
	_array = _array + [_x];
} forEach _tmpArr;

_array