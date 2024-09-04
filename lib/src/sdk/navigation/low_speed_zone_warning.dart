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
import 'package:here_sdk/src/sdk/navigation/distance_type.dart';

/// A low speed zone.
///
/// The main field describing the low speed zone is [LowSpeedZoneWarning.speedLimitInMetersPerSecond]
/// specifying the speed limit of the low speed zone.
/// Use [NavigatorInterface.lowSpeedZoneWarningListener] to get notifications about upcoming low speed zones.

class LowSpeedZoneWarning {
  /// Distance to the low speed warning in meters.
  double distanceToLowSpeedZoneInMeters;

  /// Speed limit of the low speed zone.
  double speedLimitInMetersPerSecond;

  /// The distance type for the warning, e.g. a warning for a new low speed zone ahead or a warning
  /// for passing a low speed zone.
  DistanceType distanceType;

  /// Creates a new instance.

  /// [distanceToLowSpeedZoneInMeters] Distance to the low speed warning in meters.

  /// [speedLimitInMetersPerSecond] Speed limit of the low speed zone.

  /// [distanceType] The distance type for the warning, e.g. a warning for a new low speed zone ahead or a warning
  /// for passing a low speed zone.

  LowSpeedZoneWarning(this.distanceToLowSpeedZoneInMeters, this.speedLimitInMetersPerSecond, this.distanceType);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! LowSpeedZoneWarning) return false;
    LowSpeedZoneWarning _other = other;
    return distanceToLowSpeedZoneInMeters == _other.distanceToLowSpeedZoneInMeters &&
        speedLimitInMetersPerSecond == _other.speedLimitInMetersPerSecond &&
        distanceType == _other.distanceType;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + distanceToLowSpeedZoneInMeters.hashCode;
    result = 31 * result + speedLimitInMetersPerSecond.hashCode;
    result = 31 * result + distanceType.hashCode;
    return result;
  }
}


// LowSpeedZoneWarning "private" section, not exported.

final _sdkNavigationLowspeedzonewarningCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double, Double, Uint32),
    Pointer<Void> Function(double, double, int)
  >('here_sdk_sdk_navigation_LowSpeedZoneWarning_create_handle'));
final _sdkNavigationLowspeedzonewarningReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LowSpeedZoneWarning_release_handle'));
final _sdkNavigationLowspeedzonewarningGetFielddistanceToLowSpeedZoneInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LowSpeedZoneWarning_get_field_distanceToLowSpeedZoneInMeters'));
final _sdkNavigationLowspeedzonewarningGetFieldspeedLimitInMetersPerSecond = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LowSpeedZoneWarning_get_field_speedLimitInMetersPerSecond'));
final _sdkNavigationLowspeedzonewarningGetFielddistanceType = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LowSpeedZoneWarning_get_field_distanceType'));



Pointer<Void> sdkNavigationLowspeedzonewarningToFfi(LowSpeedZoneWarning value) {
  final _distanceToLowSpeedZoneInMetersHandle = (value.distanceToLowSpeedZoneInMeters);
  final _speedLimitInMetersPerSecondHandle = (value.speedLimitInMetersPerSecond);
  final _distanceTypeHandle = sdkNavigationDistancetypeToFfi(value.distanceType);
  final _result = _sdkNavigationLowspeedzonewarningCreateHandle(_distanceToLowSpeedZoneInMetersHandle, _speedLimitInMetersPerSecondHandle, _distanceTypeHandle);
  
  
  sdkNavigationDistancetypeReleaseFfiHandle(_distanceTypeHandle);
  return _result;
}

LowSpeedZoneWarning sdkNavigationLowspeedzonewarningFromFfi(Pointer<Void> handle) {
  final _distanceToLowSpeedZoneInMetersHandle = _sdkNavigationLowspeedzonewarningGetFielddistanceToLowSpeedZoneInMeters(handle);
  final _speedLimitInMetersPerSecondHandle = _sdkNavigationLowspeedzonewarningGetFieldspeedLimitInMetersPerSecond(handle);
  final _distanceTypeHandle = _sdkNavigationLowspeedzonewarningGetFielddistanceType(handle);
  try {
    return LowSpeedZoneWarning(
      (_distanceToLowSpeedZoneInMetersHandle), 
      (_speedLimitInMetersPerSecondHandle), 
      sdkNavigationDistancetypeFromFfi(_distanceTypeHandle)
    );
  } finally {
    
    
    sdkNavigationDistancetypeReleaseFfiHandle(_distanceTypeHandle);
  }
}

void sdkNavigationLowspeedzonewarningReleaseFfiHandle(Pointer<Void> handle) => _sdkNavigationLowspeedzonewarningReleaseHandle(handle);

// Nullable LowSpeedZoneWarning

final _sdkNavigationLowspeedzonewarningCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LowSpeedZoneWarning_create_handle_nullable'));
final _sdkNavigationLowspeedzonewarningReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LowSpeedZoneWarning_release_handle_nullable'));
final _sdkNavigationLowspeedzonewarningGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LowSpeedZoneWarning_get_value_nullable'));

Pointer<Void> sdkNavigationLowspeedzonewarningToFfiNullable(LowSpeedZoneWarning? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationLowspeedzonewarningToFfi(value);
  final result = _sdkNavigationLowspeedzonewarningCreateHandleNullable(_handle);
  sdkNavigationLowspeedzonewarningReleaseFfiHandle(_handle);
  return result;
}

LowSpeedZoneWarning? sdkNavigationLowspeedzonewarningFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationLowspeedzonewarningGetValueNullable(handle);
  final result = sdkNavigationLowspeedzonewarningFromFfi(_handle);
  sdkNavigationLowspeedzonewarningReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationLowspeedzonewarningReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationLowspeedzonewarningReleaseHandleNullable(handle);

// End of LowSpeedZoneWarning "private" section.


