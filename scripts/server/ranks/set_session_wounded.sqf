/*
    Description:
    Sets the score of a player.
    
    Parameter(s):
        0: STRING - Steam UID of the player
        1: BOOL - If the player was wounded in this session (used for Purple Heart tracking).

    Returns:
    BOOL
*/

params ["_uid", "_wounded"];

private _index = [_uid] call get_player_index;

//Return -1 if not found
if (_index == -1) exitWith {false};

//Else set the score
KP_liberation_playerRanks select _index set [8, _wounded];

true