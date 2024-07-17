/*
    Description:
    Adds airscore to existing player.
    
    Parameter(s):
        0: STRING - Steam UID of the player
        1: NUMBER - Airscore to add

    Returns:
    BOOL
*/

params ["_uid", "_airscore"];

private _index = [_uid] call get_player_index;

//Return -1 if not found
if (_index == -1) exitWith {false};

//First, figure out final total
_current_airscore = [_uid] call get_ranked_airscore;
_new_airscore = _current_airscore + _score;

if (_new_airscore < 0) then { _new_airscore = 0 };

//Also figure out totals for medal score
_current_medal_score = [_uid] call get_medal_airscore;
_new_medal_score = _current_medal_score + _score;
if (_new_medal_score < 0) then { _new_medal_score = 0 };
//Set medal score
[_uid, _new_medal_score] call set_medal_airscore;

//TODO: Add in medal logic


//Finally, set the airscore
[_uid, _new_airscore] call set_ranked_airscore