/*
	Dynamic Town Invasion Mission by Vampire
*/
private ["_canTown","_nearPlyr","_grpCnt","_housePos","_sqdPos","_msg","_alert","_winMsg","_crate","_cratePos","_wait"];

if (!isNil "VEMFTownInvaded") exitWith
{
	// Town Already Under Occupation
};

VEMFTownInvaded = true;
diag_log "[VEMF] Mission 'Dynamic Town Invasion' started!";

// Find A Town to Invade
while {true} do
{
	_canTown = call VEMF_fnc_findTown;
	_nearPlyr = {isPlayer _x} count ((_canTown select 1) nearEntities [["Epoch_Male_F", "Epoch_Female_F"], 500]) > 0;

	if (!_nearPlyr) exitWith {
		// No Players Near Else Loop Again
	};
	uiSleep 5;
};

// Group Count
_grpCnt = VEMFGroupCnt;

// We Found a Town with No Players. Let's Invade.
// Format: [POS, HouseCount]
_housePos = [(_canTown select 1), _grpCnt] call VEMF_fnc_findHouses;

_sqdPos = [];
{
	// 4 Units to a Squad. One Squad Leader.
	if (!(count _x <= 4)) then
	{
		_x resize 4;
		_sqdPos = _sqdPos + _x;
	} else
		{
			_sqdPos = _sqdPos + _x;
		};
} forEach _housePos;

// Now we have Unit Positions, We Announce the Mission and Wait
_msgArray =
[
	"Come on they have small dicks you can take them!",
	"I heard they are a bunch of retards go knock them out",
	"If you kill them you'll get a cookie",
	"Free Hello Kitty stickers in the loot crate yaaaay",
	"Sorry mega mindy is offline you will have to do this one mate",
	"Sorry superman is asleep. You are on your own....",
	"Save the poor hostage teddy bears!",
	"They want attention! Go pay them a visit",
	"They forgot their breakfast. They eat .50s...",
	"They have nothing too loose. Except their action figures.",
	"Go teach them sum ballistics!",
	"Make them see the light. Of your flashlight if you have one.",
	"Time to send them to AI heaven. Or hell I dont know...",
	"Give them a chance to see the debug box from the inside LOL"
];

_msg = format ["Douchebags seen in %1!", (_canTown select 0)];
_msg = [_msg, _msgArray select floor random count _msgArray];
_alert = [_msg] call VEMF_fnc_broadCast;

if (!_alert) exitWith
{
	// No Players have a Radio Equipped. Maybe we can try later?
	diag_log format ["[VEMF]: DynTownInv: Mission Ended for No Active Radios."];
	VEMFTownInvaded = nil;
};

// Usage: COORDS, Radius
_wait = [(_canTown select 1),1000] call VEMF_fnc_waitForPlayers;

if (!_wait) exitWith
{
	diag_log format ["[VEMF]: DynTownInv: Mission Ended for Timeout."];
	VEMFTownInvaded = nil;
};

// Player is Near, so Spawn the Units
[(_canTown select 1),_sqdPos,false,1,"VEMFDynInv"] spawn VEMF_fnc_spawnAI;

waitUntil { !isNil "VEMFDynInv" };

// Wait for Mission Completion
[(_canTown select 1),"VEMFDynInv"] call VEMF_fnc_waitForMissionDone;

// Rewards
_winMsg = format ["%1 Liberated!", (_canTown select 0)];
_msg =
[
	"Yaay someone found the Hello Kitty stickers!",
	"Hooraay the teddy bears are saved :D",
	"Yep, they are all sleeping now....",
	"To the debug box! All of them!",
	"They ran away lol",
	"They all started crying!",
	"Something to do with a white flag...",
	"They gave up and started dancing",
	"They had whiskey. Now it is our whiskey.",
	"They got YOLO'd."
];

_winMsg = [_winMsg, _msg select floor random count _msg];
VEMFChatMsg = _winMsg;

if (VEMFMissEndAnn > 0) then
{
	{
		if ((isPlayer _x) && {((_x distance (_canTown select 1)) <= VEMFMissEndAnn)}) then
		{
			(owner (vehicle _x)) publicVariableClient "VEMFChatMsg";
		};
	} forEach playableUnits;
} else
	{
		if (!(isNil "VEMFDynInvKiller")) then
		{
			(owner (vehicle VEMFDynInvKiller)) publicVariableClient "VEMFChatMsg";
		};
	};

VEMFDynKiller = nil;

_boxes = ["Box_IND_AmmoVeh_F","I_CargoNet_01_ammo_F","O_CargoNet_01_ammo_F","B_CargoNet_01_ammo_F","Box_FIA_Ammo_F","I_supplyCrate_F","Box_East_AmmoVeh_F","Box_NATO_AmmoVeh_F"];
_box = _boxes call BIS_fnc_selectRandom;

_crate = createVehicle [_box,(_canTown select 1),[],0,"CAN_COLLIDE"];
_crate setVariable ["VEMFScenery", true];
_cratePos = (_canTown select 1) findEmptyPosition [0,400,(typeOf _crate)];
if ((count _cratePos) > 0) then
{
	_crate setPos _cratePos;
};

[_crate] call VEMF_fnc_loadLoot;
diag_log format ["[VEMF]: DynTownInv: Crate Spawned At: %1 / Grid: %2", (getPosATL _crate), mapGridPosition (getPosATL _crate)];

VEMFDynInv = nil;
VEMFTownInvaded = nil;