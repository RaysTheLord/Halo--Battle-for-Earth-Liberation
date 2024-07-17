/*
    Description:
    Adds score to existing player.  Also handles rank up when adding scores.
    
    Parameter(s):
        0: STRING - Steam UID of the player
        1: NUMBER - Score to add

    Returns:
    BOOL
*/

private _ranks = ["PRIVATE", "CORPORAL", "SERGEANT", "LIEUTENANT", "CAPTAIN", "MAJOR", "COLONEL"];
private _score_ranks = [0, 500, 1500, 2500, 3500, 5000, 7500];

params ["_uid", "_score"];

private _index = [_uid] call get_player_index;

//Return -1 if not found
if (_index == -1) exitWith {false};

//First, figure out final total
_current_score = [_uid] call get_ranked_score;
_new_score = _current_score + _score;

if (_new_score < 0) then { _new_score = 0 };

//Also figure out totals for medal score
_current_medal_score = [_uid] call get_medal_score;
_new_medal_score = _current_medal_score + _score;
if (_new_medal_score < 0) then { _new_medal_score = 0 };
//Set medal score
[_uid, _new_medal_score] call set_medal_score;

//Set rank
for "_i" from 0 to ((count _ranks) - 2) do {
    if (_new_score >= (_score_ranks select _i) && _new_score < (_score_ranks select _i + 1)) then {
        [_uid, _i] call set_ranked_rank;
    };
};

_final_index = ((count _ranks) - 1);
if (_new_score >= (_score_ranks select _final_index)) then {
    [_uid, _final_index] call set_ranked_rank;
};

//TODO: Add in medal logic

//Finally, set the score
[_uid, _new_score] call set_ranked_score