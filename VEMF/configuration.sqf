/*
	Vampire's Epoch Mission Framework Config by Vampire

	If you paid for this script, they are breaking the license terms.
	If you paid to have this installed, I suggest you get a refund.

	VEMF: https://github.com/SMVampire/VEMF
*/

///////////////////////////////////////////////////////////////////
/*                    Mission Config                             */
///////////////////////////////////////////////////////////////////
VEMFDebugLocs = false;
VEMFDebugAI = false;
VEMFDebugFunc = false;

// AI SETTINGS //
VEMFGroupCnt = 5; // How much groups per mission
VEMF_groupSize = 3; // How much units in each group. Better to increase this instead of group count
VEMF_aiSkill = 0.3; // Default: 0.3; good mix between aimbot and regular player skill.

// Crate Loot List
VEMFLootList = [
	"srifle_EBR_F","srifle_DMR_01_F","arifle_Katiba_F","arifle_Katiba_C_F","arifle_Katiba_GL_F","arifle_MXC_F","arifle_MX_F",
	"arifle_MX_GL_F","arifle_MXM_F","arifle_SDAR_F","arifle_TRG21_F","arifle_TRG20_F","arifle_TRG21_GL_F","arifle_Mk20_F",
	"arifle_Mk20C_F","arifle_Mk20_GL_F","arifle_Mk20_plain_F","arifle_Mk20C_plain_F","arifle_Mk20_GL_plain_F","SMG_01_F",
	"SMG_02_F","hgun_PDW2000_F","arifle_MXM_Black_F","arifle_MX_GL_Black_F","arifle_MX_Black_F","arifle_MXC_Black_F",
	"LMG_Mk200_F","arifle_MX_SW_F","LMG_Zafir_F","arifle_MX_SW_Black_F","m249_EPOCH","m249Tan_EPOCH",
	"m16_EPOCH","m16Red_EPOCH","M14_EPOCH","M14Grn_EPOCH","m4a3_EPOCH","AKM_EPOCH","smallbackpack_red_epoch","smallbackpack_green_epoch",
	"smallbackpack_teal_epoch","smallbackpack_pink_epoch","B_AssaultPack_khk",
	"B_AssaultPack_dgtl","B_AssaultPack_rgr","B_AssaultPack_sgg","B_AssaultPack_cbr","B_AssaultPack_mcamo","B_TacticalPack_rgr",
	"B_TacticalPack_mcamo","B_TacticalPack_ocamo","B_TacticalPack_blk","B_TacticalPack_oli","B_FieldPack_khk","B_FieldPack_ocamo",
	"B_FieldPack_oucamo","B_FieldPack_cbr","B_FieldPack_blk","B_Carryall_ocamo","B_Carryall_oucamo","B_Carryall_mcamo","B_Carryall_khk",
	"B_Carryall_cbr","B_Parachute","B_FieldPack_oli","B_Carryall_oli","hgun_ACPC2_F","hgun_Rook40_F","hgun_P07_F","hgun_Pistol_heavy_01_F","hgun_Pistol_heavy_02_F","ruger_pistol_epoch",
	"1911_pistol_epoch","hgun_Pistol_Signal_F","FAK","ItemSodaRbull","ItemSodaOrangeSherbet","ItemSodaPurple","ItemSodaMocha","ItemSodaBurst","ItemTrout","ItemSeaBass",
	"FoodBioMeat","FoodMeeps","FoodSnooter","FoodWalkNSons","ItemTopaz","ItemOnyx","ItemSapphire","ItemEmerald","ItemRuby",
	"JackKit","EnergyPack","EnergyPackLg","WhiskeyNoodle"
];

// Blacklist Crate Loot
VEMFCrateBlacklist = [
	"DemoCharge_Remote_Mag", "SatchelCharge_Remote_Mag", "ATMine_Range_Mag",
	"ClaymoreDirectionalMine_Remote_Mag", "APERSMine_Range_Mag",
	"APERSBoundingMine_Range_Mag", "SLAMDirectionalMine_Wire_Mag",
	"APERSTripMine_Wire_Mag","ChainSaw","srifle_DMR_03_spotter_F"
];

// Min & Max Mission Times (Will Be Made Better)
// Time is in Minutes
// Min Must Be Less Than Max
VEMFMinMissTime = 2;
VEMFMaxMissTime = 5;

// Timeout (No Players Near)
// Time in minutes
VEMFTimeoutTime = 20;

// Enable Timeout?
// In false waits forever
VEMFTimeout = true;

// Announce to Last Killer or to Near Players?
// Distance in Meters. 0 for Last Killer option.
VEMFMissEndAnn = 2000;

// Mission Name Array
VEMFMissionArray = ["DynamicTownInvasion"];

// Custom Addon Array (Don't Touch Unless You're Positive)
// What is your addon script name?
// Example: Caves.sqf
VEMFAddon = [""];

// Blacklist Zone Array -- missions will not spawn in these areas
// format: [[x,y,z],radius]
// Ex: [[06325,07807,0],300] //Starry Sobor
VEMFBlacklistZones = [
	[[0,0,0],50]
];

///////////////////////////////////////////////////////////////////
/*                       AI Config                               */
///////////////////////////////////////////////////////////////////

// Generate Dynamic Weapon List?
// If True WeaponLists Below Ignored
// Recommended to Use With Blacklist
VEMFDynWeapons = true;

// Required Kill Percentage
// Example 0.80 (80%)
VEMFRequiredKillPercent = 1;

// Blacklisted Weapons
VEMFWepBlack = [
	"ChainSaw",
	"Hatchet",
	"speargun_epoch",
	"MultiGun",
	"m107Tan_EPOCH",
	"m107_EPOCH",
	"srifle_GM6_F",
	"srifle_LRR_F",
	"srifle_DMR_03_spotter_F"
];

// AI Backpack list
VEMFbackPackList = [
	"smallbackpack_red_epoch","smallbackpack_green_epoch","smallbackpack_teal_epoch","smallbackpack_pink_epoch","B_AssaultPack_khk",
	"B_AssaultPack_dgtl","B_AssaultPack_rgr","B_AssaultPack_sgg","B_AssaultPack_cbr","B_AssaultPack_mcamo","B_TacticalPack_rgr",
	"B_TacticalPack_mcamo","B_TacticalPack_ocamo","B_TacticalPack_blk","B_TacticalPack_oli","B_FieldPack_khk","B_FieldPack_ocamo",
	"B_FieldPack_oucamo","B_FieldPack_cbr","B_FieldPack_blk","B_Carryall_ocamo","B_Carryall_oucamo","B_Carryall_mcamo","B_Carryall_khk",
	"B_Carryall_cbr","B_Parachute","B_FieldPack_oli","B_Carryall_oli"
];

// AI Headgear Array
// 39-70, 74-92, Festives
// Below are default ones
/*
VEMFHeadgearList = [
	"H_39_EPOCH","H_40_EPOCH","H_41_EPOCH","H_42_EPOCH","H_43_EPOCH","H_44_EPOCH","H_45_EPOCH","H_46_EPOCH","H_47_EPOCH","H_48_EPOCH",
	"H_49_EPOCH","H_50_EPOCH","H_51_EPOCH","H_52_EPOCH","H_53_EPOCH","H_54_EPOCH","H_55_EPOCH","H_56_EPOCH","H_57_EPOCH","H_58_EPOCH",
	"H_59_EPOCH","H_60_EPOCH","H_61_EPOCH","H_62_EPOCH","H_63_EPOCH","H_64_EPOCH","H_65_EPOCH","H_66_EPOCH","H_67_EPOCH","H_68_EPOCH",
	"H_69_EPOCH","H_70_EPOCH","H_74_EPOCH","H_75_EPOCH","H_76_EPOCH","H_77_EPOCH","H_78_EPOCH","H_79_EPOCH","H_80_EPOCH","H_81_EPOCH",
	"H_82_EPOCH","H_83_EPOCH","H_84_EPOCH","H_85_EPOCH","H_86_EPOCH","H_87_EPOCH","H_88_EPOCH","H_89_EPOCH","H_90_EPOCH","H_91_EPOCH",
	"H_92_EPOCH",
	"wolf_mask_epoch","pkin_mask_epoch"
];
*/

// Use this list if you want to make the AI recognizable
VEMFHeadgearList = [
	"H_47_EPOCH"
];

// AI Uniform Array
VEMFUniformList = [
	"U_O_CombatUniform_ocamo", "U_O_PilotCoveralls", "U_OG_Guerilla1_1", "U_OG_Guerilla2_1", "U_OG_Guerilla2_3",
	"U_OG_Guerilla3_1", "U_OG_Guerilla3_2", "U_OG_leader", "U_C_Poloshirt_stripped", "U_C_Poloshirt_blue", "U_C_Poloshirt_burgundy",
	"U_C_Poloshirt_tricolour", "U_C_Poloshirt_salmon", "U_C_Poloshirt_redwhite", "U_C_Poor_1", "U_C_WorkerCoveralls", "U_C_Journalist",
	"U_OrestesBody", "U_CamoRed_uniform", "U_CamoBrn_uniform", "U_CamoBlue_uniform", "U_Camo_uniform", "U_C_Driver_3", "U_C_Driver_4"
];

// AI Vest Array
VEMFVestList = [
	"V_1_EPOCH","V_2_EPOCH","V_3_EPOCH","V_4_EPOCH","V_5_EPOCH","V_6_EPOCH","V_7_EPOCH","V_8_EPOCH","V_9_EPOCH","V_10_EPOCH",
	"V_11_EPOCH","V_12_EPOCH","V_13_EPOCH","V_14_EPOCH","V_15_EPOCH","V_16_EPOCH","V_17_EPOCH","V_18_EPOCH","V_19_EPOCH","V_20_EPOCH",
	"V_21_EPOCH","V_22_EPOCH","V_23_EPOCH","V_24_EPOCH","V_25_EPOCH","V_26_EPOCH","V_27_EPOCH","V_28_EPOCH","V_29_EPOCH","V_30_EPOCH",
	"V_31_EPOCH","V_32_EPOCH","V_33_EPOCH","V_34_EPOCH","V_35_EPOCH","V_36_EPOCH","V_37_EPOCH","V_38_EPOCH","V_39_EPOCH","V_40_EPOCH"
];

// AI Rifle Array
VEMFRiflesList = [
	"srifle_EBR_F","srifle_DMR_01_F","arifle_Katiba_F","arifle_Katiba_C_F","arifle_Katiba_GL_F","arifle_MXC_F","arifle_MX_F",
	"arifle_MX_GL_F","arifle_MXM_F","arifle_SDAR_F","arifle_TRG21_F","arifle_TRG20_F","arifle_TRG21_GL_F","arifle_Mk20_F",
	"arifle_Mk20C_F","arifle_Mk20_GL_F","arifle_Mk20_plain_F","arifle_Mk20C_plain_F","arifle_Mk20_GL_plain_F","SMG_01_F",
	"SMG_02_F","hgun_PDW2000_F","arifle_MXM_Black_F","arifle_MX_GL_Black_F","arifle_MX_Black_F","arifle_MXC_Black_F","Rollins_F",
	"LMG_Mk200_F","arifle_MX_SW_F","LMG_Zafir_F","arifle_MX_SW_Black_F","m249_EPOCH","m249Tan_EPOCH",
	"m16_EPOCH","m16Red_EPOCH","M14_EPOCH","M14Grn_EPOCH","m4a3_EPOCH","AKM_EPOCH"
];

// AI Pistol Array
VEMFPistolsList = [
	"hgun_ACPC2_F","hgun_Rook40_F","hgun_P07_F","hgun_Pistol_heavy_01_F","hgun_Pistol_heavy_02_F","ruger_pistol_epoch",
	"1911_pistol_epoch","hgun_Pistol_Signal_F"
];

// AI Items array
VEMFitemList = [
	"FAK","ItemSodaRbull","ItemSodaOrangeSherbet","ItemSodaPurple","ItemSodaMocha","ItemSodaBurst","ItemTrout","ItemSeaBass",
	"FoodBioMeat","FoodMeeps","FoodSnooter","FoodWalkNSons","ItemTopaz","ItemOnyx","ItemSapphire","ItemEmerald","ItemRuby",
	"JackKit","EnergyPack","EnergyPackLg","WhiskeyNoodle"
];