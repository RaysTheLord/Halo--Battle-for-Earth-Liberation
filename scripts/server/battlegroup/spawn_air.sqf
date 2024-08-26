params ["_first_objective"];

if (opfor_air isEqualTo []) exitWith {false};

if (typeName _first_objective isEqualTo "STRING") then {
    _first_objective = markerPos _first_objective;
};

private _planes_number = ((floor linearConversion [20, 100, combat_readiness, 1, 3]) min 3) max 0;

private _planes_number = ((floor linearConversion [40, 100, combat_readiness, 1, 3]) min 3) max 0;

if (_planes_number < 1) exitWith {};

private _class = selectRandom opfor_air;
private _spawnPoint = ([sectors_airspawn, [_first_objective], {(markerPos _x) distance _input0}, "ASCEND"] call BIS_fnc_sortBy) select 0;
private _spawnPos = [];
private _plane = objNull;
private _grp = createGroup [GRLIB_side_enemy, true];

for "_i" from 1 to _planes_number do {
    _spawnPos = markerPos _spawnPoint;
    _spawnPos = [(((_spawnPos select 0) + 500) - random 1000), (((_spawnPos select 1) + 500) - random 1000), 200];
    _plane = createVehicle [_class, _spawnPos, [], 0, "FLY"];
    createVehicleCrew _plane;
    
    
    _crew = crew _plane;
    //Replace any Sangheli units with Jackal units as a stopgap measure (CAN REPLACE WITH BRUTES IN THE FUTURE)
    private _replace_crew = false;
    {
        if (["Elite", typeOf _x] call BIS_fnc_inString) then {
            _replace_crew = true;
        };
    } forEach _crew;
    //Add units if Elites
    if (_replace_crew) then {
        _grp1 = createGroup [GRLIB_side_enemy, true];
        _crew_size = count _crew;
        {deleteVehicle _x;} forEach _crew;
        _crew = [];
        
        //STOPGAP UNITS
        _stopgap_units = ["OPTRE_Jackal_Infantry_F", "OPTRE_Jackal_Infantry2_F", "OPTRE_Jackal_SpecOps3_F"];
        
        for "_i" from 1 to _crew_size do {
            _crew pushBack (_grp createUnit [selectRandom _stopgap_units, getPos _plane, [], 0, "NONE"]);
        };
        {_x moveInAny _plane} forEach _crew;
    };

    
    _plane flyInHeight (120 + (random 180));
    _plane addMPEventHandler ["MPKilled", {_this spawn kill_manager}];
    [_plane] call KPLIB_fnc_addObjectInit;
    {_x addMPEventHandler ["MPKilled", {_this spawn kill_manager}];} forEach (crew _plane);
    (crew _plane) joinSilent _grp;
    sleep 1;
};

while {!((waypoints _grp) isEqualTo [])} do {deleteWaypoint ((waypoints _grp) select 0);};
sleep 1;
{_x doFollow leader _grp} forEach (units _grp);
sleep 1;

private _waypoint = _grp addWaypoint [_first_objective, 500];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointSpeed "FULL";
_waypoint setWaypointBehaviour "AWARE";
_waypoint setWaypointCombatMode "RED";

_waypoint = _grp addWaypoint [_first_objective, 500];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointSpeed "FULL";
_waypoint setWaypointBehaviour "AWARE";
_waypoint setWaypointCombatMode "RED";

_waypoint = _grp addWaypoint [_first_objective, 500];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointSpeed "FULL";
_waypoint setWaypointBehaviour "AWARE";
_waypoint setWaypointCombatMode "RED";

for "_i" from 1 to 6 do {
    _waypoint = _grp addWaypoint [_first_objective, 500];
    _waypoint setWaypointType "SAD";
};

_waypoint = _grp addWaypoint [_first_objective, 500];
_waypoint setWaypointType "CYCLE";

_grp setCurrentWaypoint [_grp, 2];
