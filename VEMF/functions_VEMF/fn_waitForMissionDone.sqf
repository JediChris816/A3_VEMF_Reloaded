/*
	Author: VAMPIRE, rebooted by IT07

	Description:
	waits for mission to be done
*/
private ["_objective","_unitArrayName","_numSpawned","_numKillReq","_missDone"];

    _objective = _this select 0;
    _unitArrayName = _this select 1;

    call compile format["_numSpawned = count %1;",_unitArrayName];
    _numKillReq = ceil(VEMFRequiredKillPercent * _numSpawned);

	diag_log format["[VEMF]: (%3) Waiting for %1/%2 Units or Less to be Alive and a Player to be Near the Objective.", (_numSpawned - _numKillReq), _numSpawned, _unitArrayName];

	_missDone = false;
    call compile format["
		while {true} do {
			if (count %1 <= (_numSpawned - _numKillReq)) then {
				if ((count(_objective nearEntities [['Epoch_Male_F', 'Epoch_Female_F'], 150])) > 0) then {
					_missDone = true;
				};
			};
			if (_missDone) exitWith {};
			uiSleep 5;
		};
	", _unitArrayName];

	diag_log format ["[VEMF]: WaitMissComp: Waiting Over. %1 Completed.", _unitArrayName];