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
import 'package:collection/collection.dart';
import 'package:here_sdk/src/_library_context.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/localized_text.dart';
import 'package:here_sdk/src/sdk/navigation/distance_type.dart';
import 'package:here_sdk/src/sdk/navigation/general_warning_road_sign_type.dart';
import 'package:here_sdk/src/sdk/navigation/road_sign_category.dart';
import 'package:here_sdk/src/sdk/navigation/road_sign_type.dart';
import 'package:here_sdk/src/sdk/navigation/road_sign_vehicle_type.dart';
import 'package:here_sdk/src/sdk/navigation/weather_type.dart';
import 'package:here_sdk/src/sdk/routing/segment_reference.dart';

/// A road sign.
///
/// The main field describing the sign is [RoadSignWarning.type]. Some road types are standardized, others can be country specific.
/// A valid road sign contains known [RoadSignWarning.type] or [RoadSignWarning.category].
/// Use [NavigatorInterface.roadSignWarningListener] to get notifications with current road signs.

class RoadSignWarning {
  /// Distance to the road sign in meters.
  double distanceToRoadSignInMeters;

  /// Type of the road sign.
  RoadSignType type;

  /// The main category to which the road sign belongs.
  RoadSignCategory category;

  /// Specifies the general warning to which the road sign belongs.
  GeneralWarningRoadSignType generalWarningType;

  /// Flag indicating if the road sign is a priority sign.
  bool isPrioritySign;

  /// Specifies a list of vehicle types for which the road sign is applicable.
  /// The list will be empty when the road sign is applicable for all vehicles including cars.
  List<RoadSignVehicleType> vehicleTypes;

  /// Specifies the weather type for which the sign is applicable. If weather type is `WeatherType.UNKNOWN`, the sign is actual for all weather types.
  WeatherType weatherType;

  /// Optional value visible on the main sign related to specific road sign types, as it is printed on the local road sign.
  LocalizedText? signValue;

  /// Optional pre-warning in terms of distance, of the upcoming warning or regulation.
  /// The pre-warning information is given as printed on the local road sign.
  LocalizedText? preWarning;

  /// Optional length information during which the warning is applicable.
  /// Usually, this information is shown on a separate shield below the main shield.
  /// For example, a sign may warn on playing children for a length of 100 m, starting from
  /// the location of the warning sign.
  /// The length information (most likely with units) is given as printed on the local road sign.
  LocalizedText? duration;

  /// Optional text visible on the supplemental sign indicating specific
  /// time(s) at which the road sign is applicable.
  /// The time information is given as printed on the local road sign.
  LocalizedText? validityTime;

  /// The reference to the segment where the road sign is located. It can be used to identify the
  /// location of the road sign.
  /// It allows to compare the road sign location with the [MapMatchedLocation.segmentReference]
  /// provided by the [NavigableLocationListener] or with the [Span.segmentReference]
  /// available in the Route's Span.
  /// By combining it with the geometry of the segment, that can be loaded using
  /// [SegmentDataLoader], it is possible to identify the road sign's coordinates.
  SegmentReference roadSignSegment;

  /// The distance type for the warning, e.g. a warning for a new road sign ahead or a warning for
  /// passing a road sign. Since the road sign warning is given relative to a single position on
  /// the route, [DistanceType.reached] will never be given for this warning.
  DistanceType distanceType;

  /// Creates a new instance.

  /// [distanceToRoadSignInMeters] Distance to the road sign in meters.

  /// [type] Type of the road sign.

  /// [category] The main category to which the road sign belongs.

  /// [generalWarningType] Specifies the general warning to which the road sign belongs.

  /// [isPrioritySign] Flag indicating if the road sign is a priority sign.

  /// [vehicleTypes] Specifies a list of vehicle types for which the road sign is applicable.
  /// The list will be empty when the road sign is applicable for all vehicles including cars.

  /// [weatherType] Specifies the weather type for which the sign is applicable. If weather type is `WeatherType.UNKNOWN`, the sign is actual for all weather types.

  /// [signValue] Optional value visible on the main sign related to specific road sign types, as it is printed on the local road sign.

  /// [preWarning] Optional pre-warning in terms of distance, of the upcoming warning or regulation.
  /// The pre-warning information is given as printed on the local road sign.

  /// [duration] Optional length information during which the warning is applicable.
  /// Usually, this information is shown on a separate shield below the main shield.
  /// For example, a sign may warn on playing children for a length of 100 m, starting from
  /// the location of the warning sign.
  /// The length information (most likely with units) is given as printed on the local road sign.

  /// [validityTime] Optional text visible on the supplemental sign indicating specific
  /// time(s) at which the road sign is applicable.
  /// The time information is given as printed on the local road sign.

  /// [roadSignSegment] The reference to the segment where the road sign is located. It can be used to identify the
  /// location of the road sign.
  /// It allows to compare the road sign location with the [MapMatchedLocation.segmentReference]
  /// provided by the [NavigableLocationListener] or with the [Span.segmentReference]
  /// available in the Route's Span.
  /// By combining it with the geometry of the segment, that can be loaded using
  /// [SegmentDataLoader], it is possible to identify the road sign's coordinates.

  /// [distanceType] The distance type for the warning, e.g. a warning for a new road sign ahead or a warning for
  /// passing a road sign. Since the road sign warning is given relative to a single position on
  /// the route, [DistanceType.reached] will never be given for this warning.

  RoadSignWarning._(this.distanceToRoadSignInMeters, this.type, this.category, this.generalWarningType, this.isPrioritySign, this.vehicleTypes, this.weatherType, this.signValue, this.preWarning, this.duration, this.validityTime, this.roadSignSegment, this.distanceType);
  RoadSignWarning(double distanceToRoadSignInMeters, RoadSignType type, RoadSignCategory category, GeneralWarningRoadSignType generalWarningType, bool isPrioritySign, List<RoadSignVehicleType> vehicleTypes, WeatherType weatherType, SegmentReference roadSignSegment, DistanceType distanceType)
    : distanceToRoadSignInMeters = distanceToRoadSignInMeters, type = type, category = category, generalWarningType = generalWarningType, isPrioritySign = isPrioritySign, vehicleTypes = vehicleTypes, weatherType = weatherType, signValue = null, preWarning = null, duration = null, validityTime = null, roadSignSegment = roadSignSegment, distanceType = distanceType;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! RoadSignWarning) return false;
    RoadSignWarning _other = other;
    return distanceToRoadSignInMeters == _other.distanceToRoadSignInMeters &&
        type == _other.type &&
        category == _other.category &&
        generalWarningType == _other.generalWarningType &&
        isPrioritySign == _other.isPrioritySign &&
        DeepCollectionEquality().equals(vehicleTypes, _other.vehicleTypes) &&
        weatherType == _other.weatherType &&
        signValue == _other.signValue &&
        preWarning == _other.preWarning &&
        duration == _other.duration &&
        validityTime == _other.validityTime &&
        roadSignSegment == _other.roadSignSegment &&
        distanceType == _other.distanceType;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + distanceToRoadSignInMeters.hashCode;
    result = 31 * result + type.hashCode;
    result = 31 * result + category.hashCode;
    result = 31 * result + generalWarningType.hashCode;
    result = 31 * result + isPrioritySign.hashCode;
    result = 31 * result + DeepCollectionEquality().hash(vehicleTypes);
    result = 31 * result + weatherType.hashCode;
    result = 31 * result + signValue.hashCode;
    result = 31 * result + preWarning.hashCode;
    result = 31 * result + duration.hashCode;
    result = 31 * result + validityTime.hashCode;
    result = 31 * result + roadSignSegment.hashCode;
    result = 31 * result + distanceType.hashCode;
    return result;
  }
}


// RoadSignWarning "private" section, not exported.

final _sdkNavigationRoadsignwarningCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double, Uint32, Uint32, Uint32, Uint8, Pointer<Void>, Uint32, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Uint32),
    Pointer<Void> Function(double, int, int, int, int, Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, int)
  >('here_sdk_sdk_navigation_RoadSignWarning_create_handle'));
final _sdkNavigationRoadsignwarningReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadSignWarning_release_handle'));
final _sdkNavigationRoadsignwarningGetFielddistanceToRoadSignInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadSignWarning_get_field_distanceToRoadSignInMeters'));
final _sdkNavigationRoadsignwarningGetFieldtype = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadSignWarning_get_field_type'));
final _sdkNavigationRoadsignwarningGetFieldcategory = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadSignWarning_get_field_category'));
final _sdkNavigationRoadsignwarningGetFieldgeneralWarningType = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadSignWarning_get_field_generalWarningType'));
final _sdkNavigationRoadsignwarningGetFieldisPrioritySign = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadSignWarning_get_field_isPrioritySign'));
final _sdkNavigationRoadsignwarningGetFieldvehicleTypes = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadSignWarning_get_field_vehicleTypes'));
final _sdkNavigationRoadsignwarningGetFieldweatherType = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadSignWarning_get_field_weatherType'));
final _sdkNavigationRoadsignwarningGetFieldsignValue = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadSignWarning_get_field_signValue'));
final _sdkNavigationRoadsignwarningGetFieldpreWarning = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadSignWarning_get_field_preWarning'));
final _sdkNavigationRoadsignwarningGetFieldduration = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadSignWarning_get_field_duration'));
final _sdkNavigationRoadsignwarningGetFieldvalidityTime = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadSignWarning_get_field_validityTime'));
final _sdkNavigationRoadsignwarningGetFieldroadSignSegment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadSignWarning_get_field_roadSignSegment'));
final _sdkNavigationRoadsignwarningGetFielddistanceType = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadSignWarning_get_field_distanceType'));



Pointer<Void> sdkNavigationRoadsignwarningToFfi(RoadSignWarning value) {
  final _distanceToRoadSignInMetersHandle = (value.distanceToRoadSignInMeters);
  final _typeHandle = sdkNavigationRoadsigntypeToFfi(value.type);
  final _categoryHandle = sdkNavigationRoadsigncategoryToFfi(value.category);
  final _generalWarningTypeHandle = sdkNavigationGeneralwarningroadsigntypeToFfi(value.generalWarningType);
  final _isPrioritySignHandle = booleanToFfi(value.isPrioritySign);
  final _vehicleTypesHandle = heresdkNavigationBindingslistofSdkNavigationRoadsignvehicletypeToFfi(value.vehicleTypes);
  final _weatherTypeHandle = sdkNavigationWeathertypeToFfi(value.weatherType);
  final _signValueHandle = sdkCoreLocalizedtextToFfiNullable(value.signValue);
  final _preWarningHandle = sdkCoreLocalizedtextToFfiNullable(value.preWarning);
  final _durationHandle = sdkCoreLocalizedtextToFfiNullable(value.duration);
  final _validityTimeHandle = sdkCoreLocalizedtextToFfiNullable(value.validityTime);
  final _roadSignSegmentHandle = sdkRoutingSegmentreferenceToFfi(value.roadSignSegment);
  final _distanceTypeHandle = sdkNavigationDistancetypeToFfi(value.distanceType);
  final _result = _sdkNavigationRoadsignwarningCreateHandle(_distanceToRoadSignInMetersHandle, _typeHandle, _categoryHandle, _generalWarningTypeHandle, _isPrioritySignHandle, _vehicleTypesHandle, _weatherTypeHandle, _signValueHandle, _preWarningHandle, _durationHandle, _validityTimeHandle, _roadSignSegmentHandle, _distanceTypeHandle);
  
  sdkNavigationRoadsigntypeReleaseFfiHandle(_typeHandle);
  sdkNavigationRoadsigncategoryReleaseFfiHandle(_categoryHandle);
  sdkNavigationGeneralwarningroadsigntypeReleaseFfiHandle(_generalWarningTypeHandle);
  booleanReleaseFfiHandle(_isPrioritySignHandle);
  heresdkNavigationBindingslistofSdkNavigationRoadsignvehicletypeReleaseFfiHandle(_vehicleTypesHandle);
  sdkNavigationWeathertypeReleaseFfiHandle(_weatherTypeHandle);
  sdkCoreLocalizedtextReleaseFfiHandleNullable(_signValueHandle);
  sdkCoreLocalizedtextReleaseFfiHandleNullable(_preWarningHandle);
  sdkCoreLocalizedtextReleaseFfiHandleNullable(_durationHandle);
  sdkCoreLocalizedtextReleaseFfiHandleNullable(_validityTimeHandle);
  sdkRoutingSegmentreferenceReleaseFfiHandle(_roadSignSegmentHandle);
  sdkNavigationDistancetypeReleaseFfiHandle(_distanceTypeHandle);
  return _result;
}

RoadSignWarning sdkNavigationRoadsignwarningFromFfi(Pointer<Void> handle) {
  final _distanceToRoadSignInMetersHandle = _sdkNavigationRoadsignwarningGetFielddistanceToRoadSignInMeters(handle);
  final _typeHandle = _sdkNavigationRoadsignwarningGetFieldtype(handle);
  final _categoryHandle = _sdkNavigationRoadsignwarningGetFieldcategory(handle);
  final _generalWarningTypeHandle = _sdkNavigationRoadsignwarningGetFieldgeneralWarningType(handle);
  final _isPrioritySignHandle = _sdkNavigationRoadsignwarningGetFieldisPrioritySign(handle);
  final _vehicleTypesHandle = _sdkNavigationRoadsignwarningGetFieldvehicleTypes(handle);
  final _weatherTypeHandle = _sdkNavigationRoadsignwarningGetFieldweatherType(handle);
  final _signValueHandle = _sdkNavigationRoadsignwarningGetFieldsignValue(handle);
  final _preWarningHandle = _sdkNavigationRoadsignwarningGetFieldpreWarning(handle);
  final _durationHandle = _sdkNavigationRoadsignwarningGetFieldduration(handle);
  final _validityTimeHandle = _sdkNavigationRoadsignwarningGetFieldvalidityTime(handle);
  final _roadSignSegmentHandle = _sdkNavigationRoadsignwarningGetFieldroadSignSegment(handle);
  final _distanceTypeHandle = _sdkNavigationRoadsignwarningGetFielddistanceType(handle);
  try {
    return RoadSignWarning._(
      (_distanceToRoadSignInMetersHandle), 
      sdkNavigationRoadsigntypeFromFfi(_typeHandle), 
      sdkNavigationRoadsigncategoryFromFfi(_categoryHandle), 
      sdkNavigationGeneralwarningroadsigntypeFromFfi(_generalWarningTypeHandle), 
      booleanFromFfi(_isPrioritySignHandle), 
      heresdkNavigationBindingslistofSdkNavigationRoadsignvehicletypeFromFfi(_vehicleTypesHandle), 
      sdkNavigationWeathertypeFromFfi(_weatherTypeHandle), 
      sdkCoreLocalizedtextFromFfiNullable(_signValueHandle), 
      sdkCoreLocalizedtextFromFfiNullable(_preWarningHandle), 
      sdkCoreLocalizedtextFromFfiNullable(_durationHandle), 
      sdkCoreLocalizedtextFromFfiNullable(_validityTimeHandle), 
      sdkRoutingSegmentreferenceFromFfi(_roadSignSegmentHandle), 
      sdkNavigationDistancetypeFromFfi(_distanceTypeHandle)
    );
  } finally {
    
    sdkNavigationRoadsigntypeReleaseFfiHandle(_typeHandle);
    sdkNavigationRoadsigncategoryReleaseFfiHandle(_categoryHandle);
    sdkNavigationGeneralwarningroadsigntypeReleaseFfiHandle(_generalWarningTypeHandle);
    booleanReleaseFfiHandle(_isPrioritySignHandle);
    heresdkNavigationBindingslistofSdkNavigationRoadsignvehicletypeReleaseFfiHandle(_vehicleTypesHandle);
    sdkNavigationWeathertypeReleaseFfiHandle(_weatherTypeHandle);
    sdkCoreLocalizedtextReleaseFfiHandleNullable(_signValueHandle);
    sdkCoreLocalizedtextReleaseFfiHandleNullable(_preWarningHandle);
    sdkCoreLocalizedtextReleaseFfiHandleNullable(_durationHandle);
    sdkCoreLocalizedtextReleaseFfiHandleNullable(_validityTimeHandle);
    sdkRoutingSegmentreferenceReleaseFfiHandle(_roadSignSegmentHandle);
    sdkNavigationDistancetypeReleaseFfiHandle(_distanceTypeHandle);
  }
}

void sdkNavigationRoadsignwarningReleaseFfiHandle(Pointer<Void> handle) => _sdkNavigationRoadsignwarningReleaseHandle(handle);

// Nullable RoadSignWarning

final _sdkNavigationRoadsignwarningCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadSignWarning_create_handle_nullable'));
final _sdkNavigationRoadsignwarningReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadSignWarning_release_handle_nullable'));
final _sdkNavigationRoadsignwarningGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadSignWarning_get_value_nullable'));

Pointer<Void> sdkNavigationRoadsignwarningToFfiNullable(RoadSignWarning? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationRoadsignwarningToFfi(value);
  final result = _sdkNavigationRoadsignwarningCreateHandleNullable(_handle);
  sdkNavigationRoadsignwarningReleaseFfiHandle(_handle);
  return result;
}

RoadSignWarning? sdkNavigationRoadsignwarningFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationRoadsignwarningGetValueNullable(handle);
  final result = sdkNavigationRoadsignwarningFromFfi(_handle);
  sdkNavigationRoadsignwarningReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationRoadsignwarningReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationRoadsignwarningReleaseHandleNullable(handle);

// End of RoadSignWarning "private" section.


