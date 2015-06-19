/*
	File: VInit.sqf
	Author: Vampire ( http://github.com/SMVampire/VEMF )
	License: Attribution-NonCommercial-ShareAlike 4.0 International
	If you were sold this script it is against the license.
	If you paid to have this installed, I suggest you get your money back.

	Description:
	Starts all the files that need to run to start VEMF.
	All files branch out from here.
*/

// Add Damage Fix until Epoch Fixes it
//[] ExecVM "\VEMF\functions_VEMF\fn_allowDmg.sqf";

_version = "0.34r REBOOT";
diag_log format["[VEMF] %1 booting... loading config...", _version];
_settings = compileFinal preprocessFileLineNumbers "\VEMF\configuration.sqf";
call _settings; // Make sure it is loaded before continuing.
diag_log "[VEMF] Config loaded!";