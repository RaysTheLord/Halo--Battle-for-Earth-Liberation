/*
    Needed Mods:
    - None

    Optional Mods:
    - None
*/

/* Classnames of the guerilla faction which is friendly or hostile, depending on the civil reputation
Unlike normal liberation, they will spawn as-is and have different unit types between tiers */

//IMPORTANT: For the time being, INDFOR does not have WBK shielding!  Try not to mix WBK units with normal units here.

//OFFICER POOLS: Each tier has a pool.  These are the leaders of each guerilla group, and they spawn in pairs.
t1_officer_pool = ["WBK_EliteMainWeap_2"];
t2_officer_pool = ["WBK_EliteMainWeap_2", "WBK_EliteMainWeap_3", "WBK_EliteMainWeap_1", "WBK_EliteMainWeap_4"];
t3_officer_pool = ["WBK_EliteMainWeap_2", "WBK_EliteMainWeap_3", "WBK_EliteMainWeap_1", "WBK_EliteMainWeap_4", "WBK_EliteMainWeap_5", "WBK_EliteMainWeap_9", "IMS_Elite_Melee_1", "IMS_Elite_Melee_2"];

//GRUNT POOLS: These are the low-ranking guerilla units that spawn more numerously under the leadership of officers.
grunts_pool = ["OPTREW_Grunt_4"];

//HUNTER POOL: Special heavy units that may spawn as part of the group.  You can set the chance they spawn as a percent (which is per-tier, meaning tier 3 will have 3 * hunter_chance to spawn)
hunter_pool = ["OPTREW_Hunter_1"];
hunter_chance = 5;

// Armed vehicles
KP_liberation_guerilla_vehicles = [
    "OPTRE_FC_AA_Wraith_Needle_IND",
    "OPTRE_FC_Ghost_Ultra", 
    "OPTRE_FC_Spectre_AA_Needler", 
    "OPTRE_FC_Spectre_AI_Needler", 
    "OPTRE_FC_Spectre_AT_Needler"
];
