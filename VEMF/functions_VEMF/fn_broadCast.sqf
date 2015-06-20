/*
	Author: VAMPIRE, rebooted by IT07

	Description:
	will alert players

	Returns:
	BOOLEAN - true if sent
*/

_msg = _this select 0;

VEMFChatMsg = _msg;
{
	if (isPlayer _x) then
	{
		(owner _x) publicVariableClient "VEMFChatMsg";
	};
} forEach allUnits;
_sent = true;
_sent