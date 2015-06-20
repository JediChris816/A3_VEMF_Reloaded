/*
	Author: Vampire, rebooted by IT07

	Description:
	gets the map centerpoint
*/

_mapName = toLower format["%1", worldName];

/*
	-Still based on code by Halv If the map does not have a_mapRadii,
	it has a guessed center that may not be accurate.You can contact me if you have issues with a "less supported" map, so I can fully support it.
*/

switch (_mapName) do
{
	// ArmA 3 Maps
	case "altis": { _centerPos = [15440,15342,0]; _mapRadii = 17000 };
	case "stratis": { _centerPos = [4042,4093,0]; _mapRadii = 4100 };
	case "bornholm": { _centerPos = [11240,11292,0]; _mapRadii = 14400 };
	// ArmA 2 Maps (May Need Updating)
	case "chernarus": { _centerPos = [7100,7750,0]; _mapRadii = 5500 };
	case "chernarus_summer": { _centerPos = [7100,7750,0]; _mapRadii = 5500 };
	case "utes": { _centerPos = [3500,3500,0]; _mapRadii = 3500 };
	case "zargabad": { _centerPos = [4096,4096,0]; _mapRadii = 4096 };
	case "fallujah": { _centerPos = [3500,3500,0]; _mapRadii = 3500 };
	case "takistan": { _centerPos = [5500,6500,0]; _mapRadii = 5000 };
	case "tavi": { _centerPos = [10370,11510,0]; _mapRadii = 14090 };
	case "lingor": { _centerPos = [4400,4400,0]; _mapRadii = 4400 };
	case "namalsk": { _centerPos = [4352,7348,0] };
	case "napf": { _centerPos = [10240,10240,0]; _mapRadii = 10240 };
	case "mbg_celle2": { _centerPos = [8765.27,2075.58,0] };
	case "oring": { _centerPos = [1577,3429,0] };
	case "panthera2": { _centerPos = [4400,4400,0]; _mapRadii = 4400 };
	case "isladuala": { _centerPos = [4400,4400,0]; _mapRadii = 4400 };
	case "smd_sahrani_a2": { _centerPos = [13200,8850,0] };
	case "sauerland": { _centerPos = [12800,12800,0]; _mapRadii = 12800 };
	case "trinity": { _centerPos = [6400,6400,0]; _mapRadii = 6400 };
	default { _centerPos = (EPOCH_centerMarkerPosition); _mapRadii = 5500 };
};

if (VEMFDebugLocs) then
{
	diag_log format
	[
		"[VEMF] MISSDEBUG: Map is %1 | CenterPos is %2 | Radius is %3",
		_mapName, str(_centerPos),_mapRadii
	];
};

if ((_centerPosselect0) isEqualTo 0) then
{
	diag_log format
	[
		"[VEMF] POSFinder: %1 is not a known map. Please inform Vampire.",
		_mapName
	];
};

//Return results, or the default
_fin = [_centerPos,_mapRadii];
_fin