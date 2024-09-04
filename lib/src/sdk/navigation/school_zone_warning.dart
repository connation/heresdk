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
import 'package:here_sdk/src/sdk/core/time_rule.dart';
import 'package:here_sdk/src/sdk/navigation/distance_type.dart';

/// A school zone warning which notifies about a school zone presence on road with a speed limit
/// different than the default speed limit applicable for cars.
///
/// Use [NavigatorInterface.schoolZoneWarningListener] to get notifications about school zones.

class SchoolZoneWarning {
  /// The distance from the current location to the school zone in meters.
  double distanceToSchoolZoneInMeters;

  /// Speed limit meters/second, which applies to current school zone.
  double speedLimitInMetersPerSecond;

  /// The distance type for the warning, e.g. a warning for a new school zone ahead or a warning
  /// for passing a school zone.
  DistanceType distanceType;

  /// Time rule indicating the time periods for which the warning applies.
  /// If the field is 'null' then the warning is applicable at anytime.
  TimeRule? timeRule;

  /// Creates a new instance.

  /// [distanceToSchoolZoneInMeters] The distance from the current location to the school zone in meters.

  /// [speedLimitInMetersPerSecond] Speed limit meters/second, which applies to current school zone.

  /// [distanceType] The distance type for the warning, e.g. a warning for a new school zone ahead or a warning
  /// for passing a school zone.

  /// [timeRule] Time rule indicating the time periods for which the warning applies.
  /// If the field is 'null' then the warning is applicable at anytime.

  SchoolZoneWarning._(this.distanceToSchoolZoneInMeters, this.speedLimitInMetersPerSecond, this.distanceType, this.timeRule);
  SchoolZoneWarning(double distanceToSchoolZoneInMeters, double speedLimitInMetersPerSecond, DistanceType distanceType)
    : distanceToSchoolZoneInMeters = distanceToSchoolZoneInMeters, speedLimitInMetersPerSecond = speedLimitInMetersPerSecond, distanceType = distanceType, timeRule = null;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SchoolZoneWarning) return false;
    SchoolZoneWarning _other = other;
    return distanceToSchoolZoneInMeters == _other.distanceToSchoolZoneInMeters &&
        speedLimitInMetersPerSecond == _other.speedLimitInMetersPerSecond &&
        distanceType == _other.distanceType &&
        timeRule == _other.timeRule;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + distanceToSchoolZoneInMeters.hashCode;
    result = 31 * result + speedLimitInMetersPerSecond.hashCode;
    result = 31 * result + distanceType.hashCode;
    result = 31 * result + timeRule.hashCode;
    return result;
  }
}


// SchoolZoneWarning "private" section, not exported.

final _sdkNavigationSchoolzonewarningCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double, Double, Uint32, Pointer<Void>),
    Pointer<Void> Function(double, double, int, Pointer<Void>)
  >('here_sdk_sdk_navigation_SchoolZoneWarning_create_handle'));
final _sdkNavigationSchoolzonewarningReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SchoolZoneWarning_release_handle'));
final _sdkNavigationSchoolzonewarningGetFielddistanceToSchoolZoneInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SchoolZoneWarning_get_field_distanceToSchoolZoneInMeters'));
final _sdkNavigationSchoolzonewarningGetFieldspeedLimitInMetersPerSecond = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SchoolZoneWarning_get_field_speedLimitInMetersPerSecond'));
final _sdkNavigationSchoolzonewarningGetFielddistanceType = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SchoolZoneWarning_get_field_distanceType'));
final _sdkNavigationSchoolzonewarningGetFieldtimeRule = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SchoolZoneWarning_get_field_timeRule'));



Pointer<Void> sdkNavigationSchoolzonewarningToFfi(SchoolZoneWarning value) {
  final _distanceToSchoolZoneInMetersHandle = (value.distanceToSchoolZoneInMeters);
  final _speedLimitInMetersPerSecondHandle = (value.speedLimitInMetersPerSecond);
  final _distanceTypeHandle = sdkNavigationDistancetypeToFfi(value.distanceType);
  final _timeRuleHandle = sdkCoreTimeruleToFfiNullable(value.timeRule);
  final _result = _sdkNavigationSchoolzonewarningCreateHandle(_distanceToSchoolZoneInMetersHandle, _speedLimitInMetersPerSecondHandle, _distanceTypeHandle, _timeRuleHandle);
  
  
  sdkNavigationDistancetypeReleaseFfiHandle(_distanceTypeHandle);
  sdkCoreTimeruleReleaseFfiHandleNullable(_timeRuleHandle);
  return _result;
}

SchoolZoneWarning sdkNavigationSchoolzonewarningFromFfi(Pointer<Void> handle) {
  final _distanceToSchoolZoneInMetersHandle = _sdkNavigationSchoolzonewarningGetFielddistanceToSchoolZoneInMeters(handle);
  final _speedLimitInMetersPerSecondHandle = _sdkNavigationSchoolzonewarningGetFieldspeedLimitInMetersPerSecond(handle);
  final _distanceTypeHandle = _sdkNavigationSchoolzonewarningGetFielddistanceType(handle);
  final _timeRuleHandle = _sdkNavigationSchoolzonewarningGetFieldtimeRule(handle);
  try {
    return SchoolZoneWarning._(
      (_distanceToSchoolZoneInMetersHandle), 
      (_speedLimitInMetersPerSecondHandle), 
      sdkNavigationDistancetypeFromFfi(_distanceTypeHandle), 
      sdkCoreTimeruleFromFfiNullable(_timeRuleHandle)
    );
  } finally {
    
    
    sdkNavigationDistancetypeReleaseFfiHandle(_distanceTypeHandle);
    sdkCoreTimeruleReleaseFfiHandleNullable(_timeRuleHandle);
  }
}

void sdkNavigationSchoolzonewarningReleaseFfiHandle(Pointer<Void> handle) => _sdkNavigationSchoolzonewarningReleaseHandle(handle);

// Nullable SchoolZoneWarning

final _sdkNavigationSchoolzonewarningCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SchoolZoneWarning_create_handle_nullable'));
final _sdkNavigationSchoolzonewarningReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SchoolZoneWarning_release_handle_nullable'));
final _sdkNavigationSchoolzonewarningGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SchoolZoneWarning_get_value_nullable'));

Pointer<Void> sdkNavigationSchoolzonewarningToFfiNullable(SchoolZoneWarning? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationSchoolzonewarningToFfi(value);
  final result = _sdkNavigationSchoolzonewarningCreateHandleNullable(_handle);
  sdkNavigationSchoolzonewarningReleaseFfiHandle(_handle);
  return result;
}

SchoolZoneWarning? sdkNavigationSchoolzonewarningFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationSchoolzonewarningGetValueNullable(handle);
  final result = sdkNavigationSchoolzonewarningFromFfi(_handle);
  sdkNavigationSchoolzonewarningReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationSchoolzonewarningReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationSchoolzonewarningReleaseHandleNullable(handle);

// End of SchoolZoneWarning "private" section.


