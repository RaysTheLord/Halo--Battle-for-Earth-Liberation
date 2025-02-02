/*
    Description:
    Sets the score of a player.
    
    Parameter(s):
        0: STRING - Steam UID of the player
        1: NUMBER - New score

    Returns:
    BOOL
*/

params ["_uid", "_score"];

private _index = [_uid] call get_player_index;

//Return -1 if not found
if (_index == -1) exitWith {false};

//Else set the score
KP_liberation_playerRanks select _index set [4, _score];

true