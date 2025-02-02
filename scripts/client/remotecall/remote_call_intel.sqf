if (isDedicated) exitWith {};

params ["_notiftype", ["_obj_position", getpos player]];

switch (_notiftype) do {
    case 0: {["lib_intel_prisoner"] call BIS_fnc_showNotification;};
    case 1: {["lib_intel_document"] call BIS_fnc_showNotification;};
    case 2: {
        waitUntil {!isNil "secondary_objective_position_marker"};
        waitUntil {count secondary_objective_position_marker > 0};
        waitUntil {secondary_objective_position_marker distance zeropos > 1000};
        ["lib_intel_fob", [markertext ([10000, secondary_objective_position_marker] call KPLIB_fnc_getNearestSector)]] call BIS_fnc_showNotification;
        _secondary_marker = createMarkerLocal ["secondarymarker", secondary_objective_position_marker];
        _secondary_marker setMarkerColorLocal GRLIB_color_enemy_bright;
        _secondary_marker setMarkerTypeLocal "hd_unknown";

        _secondary_marker_zone = createMarkerLocal ["secondarymarkerzone", secondary_objective_position_marker];
        _secondary_marker_zone setMarkerColorLocal GRLIB_color_enemy_bright;
        _secondary_marker_zone setMarkerShapeLocal "ELLIPSE";
        _secondary_marker_zone setMarkerBrushLocal "FDiagonal";
        _secondary_marker_zone setMarkerSizeLocal [1500,1500];
    };
    case 3: {
        ["lib_secondary_fob_destroyed"] call BIS_fnc_showNotification;
        deleteMarkerLocal "secondarymarker";
        deleteMarkerLocal "secondarymarkerzone";
        secondary_objective_position_marker = [];
    };
    case 4: {["lib_intel_convoy", [markertext ([10000, _obj_position] call KPLIB_fnc_getNearestSector)]] call BIS_fnc_showNotification;};
    case 5: {["lib_secondary_convoy_destroyed"] call BIS_fnc_showNotification;};
    case 6: {
        waitUntil {!isNil "secondary_objective_position_marker"};
        waitUntil {count secondary_objective_position_marker > 0};
        waitUntil {secondary_objective_position_marker distance zeropos > 1000};
        ["lib_intel_sar", [markertext ([10000, secondary_objective_position_marker] call KPLIB_fnc_getNearestSector)]] call BIS_fnc_showNotification;
        _secondary_marker = createMarkerLocal ["secondarymarker", secondary_objective_position_marker];
        _secondary_marker setMarkerColorLocal GRLIB_color_enemy_bright;
        _secondary_marker setMarkerTypeLocal "hd_unknown";

        _secondary_marker_zone = createMarkerLocal ["secondarymarkerzone", secondary_objective_position_marker];
        _secondary_marker_zone setMarkerColorLocal GRLIB_color_enemy_bright;
        _secondary_marker_zone setMarkerShapeLocal "ELLIPSE";
        _secondary_marker_zone setMarkerBrushLocal "FDiagonal";
        _secondary_marker_zone setMarkerSizeLocal [1500,1500];
    };
    case 7: {
        ["lib_intel_sar_failed"] call BIS_fnc_showNotification;
        deleteMarkerLocal "secondarymarker";
        deleteMarkerLocal "secondarymarkerzone";
        secondary_objective_position_marker = [];
    };
    case 8: {
        ["lib_intel_sar_succeeded"] call BIS_fnc_showNotification;
        deleteMarkerLocal "secondarymarker";
        deleteMarkerLocal "secondarymarkerzone";
        secondary_objective_position_marker = [];
    };
    //HVT Kill
    case 9: {
        waitUntil {!isNil "secondary_objective_position_marker"};
        waitUntil {count secondary_objective_position_marker > 0};
        waitUntil {secondary_objective_position_marker distance zeropos > 1000};
        ["lib_intel_hvt", [markertext ([10000, secondary_objective_position_marker] call KPLIB_fnc_getNearestSector)]] call BIS_fnc_showNotification;
        _secondary_marker = createMarkerLocal ["secondarymarker", secondary_objective_position_marker];
        _secondary_marker setMarkerColorLocal GRLIB_color_enemy_bright;
        _secondary_marker setMarkerTypeLocal "hd_unknown";

        _secondary_marker_zone = createMarkerLocal ["secondarymarkerzone", secondary_objective_position_marker];
        _secondary_marker_zone setMarkerColorLocal GRLIB_color_enemy_bright;
        _secondary_marker_zone setMarkerShapeLocal "ELLIPSE";
        _secondary_marker_zone setMarkerBrushLocal "FDiagonal";
        _secondary_marker_zone setMarkerSizeLocal [1500,1500];
    };	
    case 10: {
        ["lib_secondary_hvt_complete"] call BIS_fnc_showNotification;
        deleteMarkerLocal "secondarymarker";
        deleteMarkerLocal "secondarymarkerzone";
        secondary_objective_position_marker = [];
    };	
    //VIP RESCUE
    case 11: {
        waitUntil {!isNil "secondary_objective_position_marker"};
        waitUntil {count secondary_objective_position_marker > 0};
        waitUntil {secondary_objective_position_marker distance zeropos > 1000};
        ["lib_intel_vip", [markertext ([10000, secondary_objective_position_marker] call KPLIB_fnc_getNearestSector)]] call BIS_fnc_showNotification;
        _secondary_marker = createMarkerLocal ["secondarymarker", secondary_objective_position_marker];
        _secondary_marker setMarkerColorLocal GRLIB_color_enemy_bright;
        _secondary_marker setMarkerTypeLocal "hd_unknown";

        _secondary_marker_zone = createMarkerLocal ["secondarymarkerzone", secondary_objective_position_marker];
        _secondary_marker_zone setMarkerColorLocal GRLIB_color_enemy_bright;
        _secondary_marker_zone setMarkerShapeLocal "ELLIPSE";
        _secondary_marker_zone setMarkerBrushLocal "FDiagonal";
        _secondary_marker_zone setMarkerSizeLocal [1500,1500];
    };	
    case 12: {
        ["lib_secondary_vip_complete"] call BIS_fnc_showNotification;
        deleteMarkerLocal "secondarymarker";
        deleteMarkerLocal "secondarymarkerzone";
        secondary_objective_position_marker = [];
    };	
    case 13: {
        ["lib_secondary_vip_failed"] call BIS_fnc_showNotification;
        deleteMarkerLocal "secondarymarker";
        deleteMarkerLocal "secondarymarkerzone";
        secondary_objective_position_marker = [];
    };	

    default {[format ["remote_call_intel.sqf -> no valid value for _notiftype: %1", _notiftype], "ERROR"] remoteExecCall ["KPLIB_fnc_log", 2];};
};
