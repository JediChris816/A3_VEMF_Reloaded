/*
	VEMF System Functions
	by Vampire
*/

// Temporary Vehicle Setup
// Assume to NOT Work at This Time
// Server "May" Have an AutoSave Loop
/* Disabled Until Later Version
VEMFSetupVic = {
	private ["_vehicle","_vClass","_ranFuel","_config","_textureSelectionIndex","_selections","_colors","_textures","_color","_count"];
	_vehicle = _this select 0;
	_vClass = (typeOf _vehicle);

	waitUntil {(!isNull _vehicle)};

	// Set Vehicle Token
	// Will Delete if Not Set
	_vehicle call EPOCH_server_setVToken;

	// Add to A3 Cleanup
	addToRemainsCollector [_vehicle];

	// Disable Thermal/NV for Vehicle
	_vehicle disableTIEquipment true;

	// Empty Vehicle
	clearWeaponCargoGlobal _vehicle;
	clearMagazineCargoGlobal _vehicle;
	clearBackpackCargoGlobal  _vehicle;
	clearItemCargoGlobal _vehicle;

	// Set the Vehicle Lock Time (0 Seconds)
	// Vehicle Will Spawn Unlocked
	_vehicle lock true;
	_vehicle setVariable["LOCK_OWNER", "-1"];
	_vehicle setVariable["LOCKED_TILL", serverTime];

	// Pick a Random Color if Available
	_config = configFile >> "CfgVehicles" >> _vClass >> "availableColors";
	if (isArray(_config)) then {
		_textureSelectionIndex = configFile >> "CfgVehicles" >> _vClass >> "textureSelectionIndex";
		_selections = if (isArray(_textureSelectionIndex)) then {
			getArray(_textureSelectionIndex)
		} else {
			[0]
		};

		_colors = getArray(_config);
		_textures = _colors select 0;
		_color = floor(random(count _textures));
		_count = (count _colors)-1;
		{
			if (_count >=_forEachIndex) then {
				_textures = _colors select _forEachIndex;
			};
			_vehicle setObjectTextureGlobal [_x,(_textures select _color)];
		} forEach _selections;

		_vehicle setVariable ["VEHICLE_TEXTURE", _color];
	};

	// Set Vehicle Init
	_vehicle call EPOCH_server_vehicleInit;

	// Set a Random Fuel Amount
	_ranFuel = random 1;
	if (_ranFuel < 0.1) then {_ranFuel = 0.1;};
	_vehicle setFuel _ranFuel;
	_vehicle setVelocity [0,0,1];
	_vehicle setDir (round(random 360));

	// If the Vehicle is Temporary, Warn Players
	if (!(VEMFSaveVehicles)) then {
		_vehicle addEventHandler ["GetIn",{
			_nil = ["Warning: Vehicle Will Disappear on Restart!","systemChat",(_this select 2),false,true] call BIS_fnc_MP;
		}];
	};

	true
}; */