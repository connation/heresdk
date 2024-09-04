// Copyright (c) 2018-2024 HERE Global B.V. and its affiliate(s).
// All rights reserved.
//
// This software and other materials contain proprietary information
// controlled by HERE and are protected by applicable copyright legislation.
// Any use and utilization of this software and other materials and
// disclosure to any third parties is conditional upon having a separate
// agreement with HERE for the access, use, utilization or disclosure of this
// software. In the absence of such agreement, the use of the software is not
// allowed.
//

import 'dart:ffi';
import 'package:here_sdk/src/_library_context.dart' as __lib;

/// A road sign type classifying road signs that can appear along a road.
///
/// Some signs are standardized and look the same in all countries, e.g. [RoadSignType.stopSign].
/// In general, the visual appearance of the road signs can differ across countries.
/// Some road signs can be combined with other signs, like `WeatherType` signs. The road sign will be always shown topmost.
enum RoadSignType {
    /// Unknown road sign type
    unknown,
    /// A sign indicating the starting of a no overtaking zone. Example: [Start of no overtaking sign](https://en.wikipedia.org/wiki/Prohibitory_traffic_sign#No_overtaking_or_passing_signs)
    startOfNoOvertaking,
    /// A sign indicating the ending of a no overtaking zone. Example: [End of no overtaking sign](https://en.wikipedia.org/wiki/Prohibitory_traffic_sign#End_of_overtaking_signs)
    endOfNoOvertaking,
    /// A sign indicating an extra lane for overtaking. Example: [Protected overtaking extra lane sign](https://en.wikipedia.org/wiki/Passing_lane#/media/File:MUTCD_R4-3.svg)
    protectedOvertakingExtraLane,
    /// A sign indicating an extra lane for overtaking on the right side. Example: [Protected overtaking extra lane on the right side sign](https://en.wikipedia.org/wiki/Passing_lane#/media/File:MUTCD_R4-16.svg)
    protectedOvertakingExtraLaneRightSide,
    /// A sign indicating an extra lane for overtaking on the left side. Example: [Protected overtaking extra lane on the left side sign](https://en.wikipedia.org/wiki/Road_signs_in_Australia#/media/File:Australia_road_sign_R6-29.svg)
    protectedOvertakingExtraLaneLeftSide,
    /// A sign indicating merging of the right lane. Example: [Merge right lane sign](https://en.wikipedia.org/wiki/Road_signs_in_the_United_States#/media/File:MUTCD_W4-3R.svg)
    laneMergeRight,
    /// A sign indicating merging of the left lane. Example: [Merge left lane sign](https://en.wikipedia.org/wiki/Road_signs_in_Mauritius#/media/File:Mauritius_Road_Signs_-_Warning_Sign_-_Traffic_Merging_From_Left_Behind.svg)
    laneMergeLeft,
    /// A sign indicating merging of the center lane. Example: [Merge center lane sign](https://en.wikipedia.org/wiki/Road_signs_in_the_United_States#/media/File:Roadsign_lane_drop_ahead.svg)
    laneMergeCenter,
    /// A sign indicating a protected railway crossing. Example: [Protected railway crossing sign](https://en.wikipedia.org/wiki/File:Australia_road_sign_W7-4.svg)
    railwayCrossingProtected,
    /// A sign indicating an unprotected railway crossing. Example: [Protected railway crossing sign](https://en.wikipedia.org/wiki/File:Australia_road_sign_W7-7-L.svg)
    railwayCrossingUnprotected,
    /// A sign indicating a narrowing road. Example: [Road narrows sign](https://en.wikipedia.org/wiki/File:Australia_road_sign_W4-3.svg)
    roadNarrows,
    /// A sign indicating a sharp curve to the left. Example: [Sharp curve left sign](https://en.wikipedia.org/wiki/File:UK_traffic_sign_512L.svg)
    sharpCurveLeft,
    /// A sign indicating a sharp curve to the right. Example: [Sharp curve right sign](https://en.wikipedia.org/wiki/File:UK_traffic_sign_512.svg)
    sharpCurveRight,
    /// A sign indicating a winding road starting left. Example: [Winding road starting left sign](https://en.wikipedia.org/wiki/File:UK_traffic_sign_513.svg)
    windingRoadStartingLeft,
    /// A sign indicating a winding road starting right. Example: [Winding road starting right sign](https://en.wikipedia.org/wiki/File:UK_traffic_sign_513R.svg)
    windingRoadStartingRight,
    /// A sign indicating no overtaking trucks. Example: [No overtaking trucks sign](https://en.wikipedia.org/wiki/File:Vorschriftszeichen_4c.svg)
    startOfNoOvertakingTrucks,
    /// A sign indicating the end of no overtaking trucks zone. Example: [End of no overtaking trucks sign](https://en.wikipedia.org/wiki/File:Vorschriftszeichen_4d.svg)
    endOfNoOvertakingTrucks,
    /// A sign indicating a steep hill upwards. Example: [Steep hills upwards sign](https://en.wikipedia.org/wiki/File:Argentina_MSV_2017_road_sign_P-9(b).svg)
    steepHillUpwards,
    /// A sign indicating a steep hill downward. Example: [Steep hills downwards sign](https://en.wikipedia.org/wiki/File:Argentina_MSV_2017_road_sign_P-9(a).svg)
    steepHillDownwards,
    /// A sign indicating a stop. Example: [Stop sign](https://en.wikipedia.org/wiki/File:IE_road_sign_RUS-027.svg)
    stopSign,
    /// A sign indicating lateral winds. Example: [Lateral winds sign](https://en.wikipedia.org/wiki/File:Australia_road_sign_W5-226.svg)
    lateralWind,
    /// A sign indicating a general warning. Example: [General warning sign](https://en.wikipedia.org/wiki/File:Hong_Kong_road_sign_240.svg)
    generalWarningSign,
    /// A sign indicating risk of grounding. Example: [Risk of grounding sign](https://en.wikipedia.org/wiki/File:Croatia_road_sign_A31.svg)
    riskOfGrounding,
    /// A sign indicating a general curve. Example: [General curve sign](https://en.wikipedia.org/wiki/File:Italian_traffic_signs_-_curva_pericolosa_a_sinistra.svg)
    generalCurve,
    /// A sign indicating the end of all restrictions. Example: [End of all restrictions sign](https://en.wikipedia.org/wiki/File:Estonia_road_sign_374.svg)
    endOfAllRestrictions,
    /// A sign indicating a general hill. Example: [General hill sign](https://en.wikipedia.org/wiki/Road_signs_in_the_United_States#/media/File:MUTCD_W7-1A.svg)
    generalHill,
    /// A sign indicating animal crossing. Example: [Animal crossing sign](https://en.wikipedia.org/wiki/File:Gefahrenzeichen_13b.svg)
    animalCrossing,
    /// A sign indicating icy conditions. Example: [Icy conditions sign](https://en.wikipedia.org/wiki/File:EE_traffic_sign-185.png)
    icyConditions,
    /// A sign indicating slippery road. Example: [Slippery road sign](https://en.wikipedia.org/wiki/File:Argentina_MSV_2017_road_sign_P-12.svg)
    slipperyRoad,
    /// A sign indicating falling rocks. Example: [Falling rocks sign](https://en.wikipedia.org/wiki/File:Moldova_road_sign_1.25.2.svg)
    fallingRocks,
    /// A sign indicating school zone. Example: [School zone sign](https://en.wikipedia.org/wiki/File:Mauritius_Road_Signs_-_Warning_Sign_-_Children.svg)
    schoolZone,
    /// A sign indicating a tramway crossing. Example: [Tramway crossing sign](https://en.wikipedia.org/wiki/File:Australia_road_sign_W5-41.svg)
    tramwayCrossing,
    /// A sign indicating congestion hazard. Example: [Congestion hazard sign](https://en.wikipedia.org/wiki/File:Czech_Republic_road_sign_A_23.svg)
    congestionHazard,
    /// A sign indicating accident hazard. Example: [Accident hazard sign](https://en.wikipedia.org/wiki/Road_signs_in_France#/media/File:France_road_sign_AK31.svg)
    accidentHazard,
    /// A sign indicating priority over oncoming traffic. Example: [Priority over oncoming traffic sign](https://en.wikipedia.org/wiki/File:Zeichen_308_-_Vorrang_vor_dem_Gegenverkehr,_StVO_1992.svg)
    priorityOverOncomingTraffic,
    /// A sign indicating yielding to oncoming traffic. Example: [Yield to oncoming traffic sign](https://en.wikipedia.org/wiki/File:Moldova_road_sign_2.5.svg)
    yieldToOncomingTraffic,
    /// A sign indicating crossing with priority from the right. Example: [Crossing with priority from the right sign](https://en.wikipedia.org/wiki/Road_signs_in_France#/media/File:France_road_sign_AB1.svg)
    crossingWithPriorityFromTheRight,
    /// A sign indicating pedestrian crossing. Example: [Pedestrian crossing sign](https://en.wikipedia.org/wiki/File:Estonia_road_sign_171.svg)
    pedestrianCrossing,
    /// A sign indicating yielding. Example: [Yield sign](https://en.wikipedia.org/wiki/File:Ontario_Wb-1A.svg)
    yield,
    /// A sign indicating a double hairpin. Example: [Double hairpin sign](https://en.wikipedia.org/wiki/Road_signs_in_Australia#/media/File:Australia_road_sign_W1-7-L.svg)
    doubleHairpin,
    /// A sign indicating a triple hairpin. Example: [Triple hairpin sign](https://en.wikipedia.org/wiki/Road_signs_in_Italy#/media/File:Italian_traffic_signs_-_doppia_curva_sx.svg)
    tripleHairpin,
    /// A sign indicating embankment. Example: [Embankment sign](https://en.wikipedia.org/wiki/File:EE_traffic_sign-138.png)
    embankment,
    /// A sign indicating two way traffic. Example: [Two way traffic sign](https://en.wikipedia.org/wiki/File:Gefahrenzeichen_14.svg)
    twoWayTraffic,
    /// A sign indicating urban area. Example: [Urban area sign](https://en.wikipedia.org/wiki/Road_signs_in_Italy#/media/File:Italian_traffic_signs_-_preavviso_intersezione.svg)
    urbanArea,
    /// A sign indicating a hump bridge. Example: [Hump bridge sign](https://en.wikipedia.org/wiki/Road_signs_in_the_United_Kingdom#/media/File:UK_traffic_sign_528.svg)
    humpBridge,
    /// A sign indicating uneven road. Example: [Uneven road sign](https://en.wikipedia.org/wiki/File:IE_road_sign_W-133.svg)
    unevenRoad,
    /// A sign indicating a flood area. Example: [Flood area sign](https://en.wikipedia.org/wiki/Road_signs_in_Italy#/media/File:Italian_traffic_signs_-_zona_soggetta_ad_allagamento.svg)
    floodArea,
    /// A sign indicating an obstacle. Example: [Obstacle sign](https://en.wikipedia.org/wiki/Warning_sign#/media/File:Belgian_road_sign_A51.svg)
    obstacle,
    /// A sign indicating restriction for horning. Example: [Horn sign](https://en.wikipedia.org/wiki/File:EE_traffic_sign-355.png)
    hornSign,
    /// A sign indicating no engine brake. Example: [No engine brake sign](https://commons.wikimedia.org/wiki/File:Canada_Avoid_Engine_Brake_Sign.svg)
    noEngineBrake,
    /// A sign indicating the end of no engine brake zone. Example: No examples available.
    endOfNoEngineBrake,
    /// A sign indicating no idling. Example: [No idling sign](https://en.wikipedia.org/wiki/Idle_reduction#/media/File:Idle_free_zone_-_turn_engine_off_sign.jpg)
    noIdling,
    /// A sign indicating truck rollover. Example: [Truck rollover sign](https://en.wikipedia.org/wiki/Road_signs_in_the_United_States#/media/File:MUTCD_W1-13L.svg)
    truckRollover,
    /// A sign indicating the use of low gear. Example: [Low gear sign](https://en.wikipedia.org/wiki/Road_signs_in_the_Philippines#/media/File:Philippines_road_sign_S1-3.svg)
    lowGear,
    /// A sign indicating the use of low gear. Example: No examples available.
    endOfLowGear,
    /// A sign indicating bicycles crossing. Example: [Bicycle crossing sign](https://en.wikipedia.org/wiki/File:Australia_road_sign_W6-7-FYG.svg)
    bicycleCrossing,
    /// A sign indicating yielding to bicycles. Example: [Yield to bicycles sign](https://en.wikipedia.org/wiki/File:MK_road_sign_302.2.svg)
    yieldToBicycles,
    /// A sign indicating no towed caravan allowed. Example: [No towed caravan allowed sign](https://en.wikipedia.org/wiki/Road_signs_in_the_United_Kingdom#/media/File:UK_traffic_sign_622.7.svg)
    noTowedCaravanAllowed,
    /// A sign indicating no towed trailer allowed. Example: [No towed trailer allowed sign](https://en.wikipedia.org/wiki/Road_signs_in_Sweden#/media/File:Sweden_road_sign_C6.svg)
    noTowedTrailerAllowed,
    /// A sign indicating no camper or motorhome allowed. Example: No examples available.
    noCamperOrMotorhomeAllowed,
    /// A sign indicating no turning on red permitted. Example: [No turn on red sign](https://en.wikipedia.org/wiki/Turn_on_red#/media/File:CA-QC_road_sign_P-115-1.svg)
    noTurnOnRed,
    /// A sign indicating turning on red permitted. Example: [Turn permitted on red sign](https://en.wikipedia.org/wiki/Turn_on_red#/media/File:Chile_road_sign_RA-2.svg)
    turnPermittedOnRed,
    /// A sign indicating turning left with the specified vehicle type requires a two stage maneuver.
    twoStageLeft,
    /// A sign indicating turning right with the specified vehicle type requires a two stage maneuver.
    twoStageRight
}

// RoadSignType "private" section, not exported.

int sdkNavigationRoadsigntypeToFfi(RoadSignType value) {
  switch (value) {
  case RoadSignType.unknown:
    return 0;
  case RoadSignType.startOfNoOvertaking:
    return 1;
  case RoadSignType.endOfNoOvertaking:
    return 2;
  case RoadSignType.protectedOvertakingExtraLane:
    return 3;
  case RoadSignType.protectedOvertakingExtraLaneRightSide:
    return 4;
  case RoadSignType.protectedOvertakingExtraLaneLeftSide:
    return 5;
  case RoadSignType.laneMergeRight:
    return 6;
  case RoadSignType.laneMergeLeft:
    return 7;
  case RoadSignType.laneMergeCenter:
    return 8;
  case RoadSignType.railwayCrossingProtected:
    return 9;
  case RoadSignType.railwayCrossingUnprotected:
    return 10;
  case RoadSignType.roadNarrows:
    return 11;
  case RoadSignType.sharpCurveLeft:
    return 12;
  case RoadSignType.sharpCurveRight:
    return 13;
  case RoadSignType.windingRoadStartingLeft:
    return 14;
  case RoadSignType.windingRoadStartingRight:
    return 15;
  case RoadSignType.startOfNoOvertakingTrucks:
    return 16;
  case RoadSignType.endOfNoOvertakingTrucks:
    return 17;
  case RoadSignType.steepHillUpwards:
    return 18;
  case RoadSignType.steepHillDownwards:
    return 19;
  case RoadSignType.stopSign:
    return 20;
  case RoadSignType.lateralWind:
    return 21;
  case RoadSignType.generalWarningSign:
    return 22;
  case RoadSignType.riskOfGrounding:
    return 23;
  case RoadSignType.generalCurve:
    return 24;
  case RoadSignType.endOfAllRestrictions:
    return 25;
  case RoadSignType.generalHill:
    return 26;
  case RoadSignType.animalCrossing:
    return 27;
  case RoadSignType.icyConditions:
    return 28;
  case RoadSignType.slipperyRoad:
    return 29;
  case RoadSignType.fallingRocks:
    return 30;
  case RoadSignType.schoolZone:
    return 31;
  case RoadSignType.tramwayCrossing:
    return 32;
  case RoadSignType.congestionHazard:
    return 33;
  case RoadSignType.accidentHazard:
    return 34;
  case RoadSignType.priorityOverOncomingTraffic:
    return 35;
  case RoadSignType.yieldToOncomingTraffic:
    return 36;
  case RoadSignType.crossingWithPriorityFromTheRight:
    return 37;
  case RoadSignType.pedestrianCrossing:
    return 38;
  case RoadSignType.yield:
    return 39;
  case RoadSignType.doubleHairpin:
    return 40;
  case RoadSignType.tripleHairpin:
    return 41;
  case RoadSignType.embankment:
    return 42;
  case RoadSignType.twoWayTraffic:
    return 43;
  case RoadSignType.urbanArea:
    return 44;
  case RoadSignType.humpBridge:
    return 45;
  case RoadSignType.unevenRoad:
    return 46;
  case RoadSignType.floodArea:
    return 47;
  case RoadSignType.obstacle:
    return 48;
  case RoadSignType.hornSign:
    return 49;
  case RoadSignType.noEngineBrake:
    return 50;
  case RoadSignType.endOfNoEngineBrake:
    return 51;
  case RoadSignType.noIdling:
    return 52;
  case RoadSignType.truckRollover:
    return 53;
  case RoadSignType.lowGear:
    return 54;
  case RoadSignType.endOfLowGear:
    return 55;
  case RoadSignType.bicycleCrossing:
    return 56;
  case RoadSignType.yieldToBicycles:
    return 57;
  case RoadSignType.noTowedCaravanAllowed:
    return 58;
  case RoadSignType.noTowedTrailerAllowed:
    return 59;
  case RoadSignType.noCamperOrMotorhomeAllowed:
    return 60;
  case RoadSignType.noTurnOnRed:
    return 61;
  case RoadSignType.turnPermittedOnRed:
    return 62;
  case RoadSignType.twoStageLeft:
    return 63;
  case RoadSignType.twoStageRight:
    return 64;
  default:
    throw StateError("Invalid enum value $value for RoadSignType enum.");
  }
}

RoadSignType sdkNavigationRoadsigntypeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return RoadSignType.unknown;
  case 1:
    return RoadSignType.startOfNoOvertaking;
  case 2:
    return RoadSignType.endOfNoOvertaking;
  case 3:
    return RoadSignType.protectedOvertakingExtraLane;
  case 4:
    return RoadSignType.protectedOvertakingExtraLaneRightSide;
  case 5:
    return RoadSignType.protectedOvertakingExtraLaneLeftSide;
  case 6:
    return RoadSignType.laneMergeRight;
  case 7:
    return RoadSignType.laneMergeLeft;
  case 8:
    return RoadSignType.laneMergeCenter;
  case 9:
    return RoadSignType.railwayCrossingProtected;
  case 10:
    return RoadSignType.railwayCrossingUnprotected;
  case 11:
    return RoadSignType.roadNarrows;
  case 12:
    return RoadSignType.sharpCurveLeft;
  case 13:
    return RoadSignType.sharpCurveRight;
  case 14:
    return RoadSignType.windingRoadStartingLeft;
  case 15:
    return RoadSignType.windingRoadStartingRight;
  case 16:
    return RoadSignType.startOfNoOvertakingTrucks;
  case 17:
    return RoadSignType.endOfNoOvertakingTrucks;
  case 18:
    return RoadSignType.steepHillUpwards;
  case 19:
    return RoadSignType.steepHillDownwards;
  case 20:
    return RoadSignType.stopSign;
  case 21:
    return RoadSignType.lateralWind;
  case 22:
    return RoadSignType.generalWarningSign;
  case 23:
    return RoadSignType.riskOfGrounding;
  case 24:
    return RoadSignType.generalCurve;
  case 25:
    return RoadSignType.endOfAllRestrictions;
  case 26:
    return RoadSignType.generalHill;
  case 27:
    return RoadSignType.animalCrossing;
  case 28:
    return RoadSignType.icyConditions;
  case 29:
    return RoadSignType.slipperyRoad;
  case 30:
    return RoadSignType.fallingRocks;
  case 31:
    return RoadSignType.schoolZone;
  case 32:
    return RoadSignType.tramwayCrossing;
  case 33:
    return RoadSignType.congestionHazard;
  case 34:
    return RoadSignType.accidentHazard;
  case 35:
    return RoadSignType.priorityOverOncomingTraffic;
  case 36:
    return RoadSignType.yieldToOncomingTraffic;
  case 37:
    return RoadSignType.crossingWithPriorityFromTheRight;
  case 38:
    return RoadSignType.pedestrianCrossing;
  case 39:
    return RoadSignType.yield;
  case 40:
    return RoadSignType.doubleHairpin;
  case 41:
    return RoadSignType.tripleHairpin;
  case 42:
    return RoadSignType.embankment;
  case 43:
    return RoadSignType.twoWayTraffic;
  case 44:
    return RoadSignType.urbanArea;
  case 45:
    return RoadSignType.humpBridge;
  case 46:
    return RoadSignType.unevenRoad;
  case 47:
    return RoadSignType.floodArea;
  case 48:
    return RoadSignType.obstacle;
  case 49:
    return RoadSignType.hornSign;
  case 50:
    return RoadSignType.noEngineBrake;
  case 51:
    return RoadSignType.endOfNoEngineBrake;
  case 52:
    return RoadSignType.noIdling;
  case 53:
    return RoadSignType.truckRollover;
  case 54:
    return RoadSignType.lowGear;
  case 55:
    return RoadSignType.endOfLowGear;
  case 56:
    return RoadSignType.bicycleCrossing;
  case 57:
    return RoadSignType.yieldToBicycles;
  case 58:
    return RoadSignType.noTowedCaravanAllowed;
  case 59:
    return RoadSignType.noTowedTrailerAllowed;
  case 60:
    return RoadSignType.noCamperOrMotorhomeAllowed;
  case 61:
    return RoadSignType.noTurnOnRed;
  case 62:
    return RoadSignType.turnPermittedOnRed;
  case 63:
    return RoadSignType.twoStageLeft;
  case 64:
    return RoadSignType.twoStageRight;
  default:
    throw StateError("Invalid numeric value $handle for RoadSignType enum.");
  }
}

void sdkNavigationRoadsigntypeReleaseFfiHandle(int handle) {}

final _sdkNavigationRoadsigntypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_navigation_RoadSignType_create_handle_nullable'));
final _sdkNavigationRoadsigntypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadSignType_release_handle_nullable'));
final _sdkNavigationRoadsigntypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadSignType_get_value_nullable'));

Pointer<Void> sdkNavigationRoadsigntypeToFfiNullable(RoadSignType? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationRoadsigntypeToFfi(value);
  final result = _sdkNavigationRoadsigntypeCreateHandleNullable(_handle);
  sdkNavigationRoadsigntypeReleaseFfiHandle(_handle);
  return result;
}

RoadSignType? sdkNavigationRoadsigntypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationRoadsigntypeGetValueNullable(handle);
  final result = sdkNavigationRoadsigntypeFromFfi(_handle);
  sdkNavigationRoadsigntypeReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationRoadsigntypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationRoadsigntypeReleaseHandleNullable(handle);

// End of RoadSignType "private" section.


