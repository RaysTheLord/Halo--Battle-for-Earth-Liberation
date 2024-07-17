/*
    Description:
    Handles score additions for a player kill, called in kill_manager.

    Parameter(s):
        0: OBJECT - Killed unit
        1: OBJECT - Killer

    Returns:
    BOOL
*/

if (!isServer) exitWith {};


waitUntil{!isNil "KP_liberation_playerRanks"};

params ["_killed", "_killer"];

//Get player's index
private _index = [getPlayerUID _killer] call get_player_index;

if (_index == -1) exitWith {false};


//Modifiers for scoring
_airkill = false;
_in_vehicle_modifier = 1;
if (!(_killer isKindOf "Man") && (toLower (typeOf (vehicle _killer))) in KPLIB_allAirVeh_classes) then {
    _airkill = true;
};

if (!(_killer isKindOf "Man") && (toLower (typeOf (vehicle _killer))) in KPLIB_allLandVeh_classes) then  {
    _in_vehicle_modifier = 0.25; //Get a quarter of the xp you would for infantry kills 
};


_base_score = 25;


_score_multiplier = 1;
if !(_killed isKindOf "Man") then {
    if ((toLower (typeOf (vehicle _killed))) in KPLIB_allLandVeh_classes) then {
        _score_multiplier = 1.5;
    };
    if ((toLower (typeOf (vehicle _killed))) in KPLIB_allAirVeh_classes) then {
        _score_multiplier = 2;
    };
};
//special unit logic
_special_units = [opfor_officer, opfor_squad_leader, opfor_rpg, opfor_aa];
if (typeOf _killed in _special_units) then {
    _score_multiplier = 1.5;
};
//Hunter logic
if (["Hunter", typeOf _killed] call BIS_fnc_inString) then {
    _score_multiplier = 5;
};
//TODO: Add melee kill logic

//Final modifier to subtract if not an enemy
_side_modifier = 1;

if (side (group _killed) != GRLIB_side_enemy) then {
    _side_modifier = -1;
};
//Calculate winnings
_final_score = _base_score * _score_multiplier * _in_vehicle_modifier * _side_modifier;

//Add to the score
if !(_airkill) then {
    //Add to normal score
    [getPlayerUID _killer, _final_score] call add_ranked_score;
} else {
    //Add 25% to the normal score and the full amount to airscore
    [getPlayerUID _killer, _final_score * 0.25] call add_ranked_score;
    [getPlayerUID _killer, _final_score] call add_ranked_airscore;
};


true
