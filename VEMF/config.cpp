class CfgPatches 
{
	class VEMF
	{
		units[] = {"C_man_1"};
		weapons[] = {};
		requiredAddons[] = {"A3_Data_F","A3_Soft_F","A3_Soft_F_Offroad_01","A3_Characters_F"};
		fileName = "VEMF.pbo";
		author[]= {"Vampire"}; 
	};
};
class cfgFunctions
{
	class VampireMissionFramework
	{
		tag = "VEMF";
		class fn
		{
			file = "\VEMF\functions_VEMF";
			class initVEMF { postInit = 1; };
			class addonLoader { postInit = 1; };
			class aiKilled { };
			class aiWatchdog { postInit = 1; };
			class broadCast { };
			class findHouses { };
			class findTown { };
			class genWeapons { postInit = 1; };
			class getMapCenter { };
			class loadInv { };
			class loadLoot { };
			class localEH { };
			class missionTimer { postInit = 1; };
			class remDup { };
			class rndmPos { };
			class spawnAI { };
			class waitForMissionDone { };
			class waitForPlayers { };
		};
	};
};