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
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/navigation/distance_type.dart';

/// Represents danger zones.
///
/// A danger zone refers to areas where there is an increased risk of
/// traffic incidents. These zones are designated to alert drivers to potential hazards and encourage
/// safer driving behaviors. Legally, certain devices can alert you to being in a danger zone,
/// typically indicating the presence of a speed camera. In line with applicable law and industry
/// standard, these alerts are usually provided along a road within a range of 4 km on a motorway,
/// 2 km outside built-up areas, and 300 m in built-up areas​​. The HERE SDK warns when approaching
/// the danger zone, as well as when leaving such a zone. A danger zone may or may not have one or
/// more speed cameras in it. The exact location of such speed cameras is not provided. Note that
/// danger zones are only available in selected countries, such as France.

class DangerZoneWarning {
  /// A flag indicating whether the Danger Zone officially start in the location the user is
  /// entering it.
  bool isZoneStart;

  /// The distance from the current location to the Danger zone.
  double distanceInMeters;

  /// Indicates if the specified zone is ahead of the vehicle or has just passed by. If it is
  /// ahead, then [DangerZoneWarning.distanceInMeters] is greater than 0.
  DistanceType distanceType;

  /// Creates a new instance.

  /// [isZoneStart] A flag indicating whether the Danger Zone officially start in the location the user is
  /// entering it.

  /// [distanceInMeters] The distance from the current location to the Danger zone.

  /// [distanceType] Indicates if the specified zone is ahead of the vehicle or has just passed by. If it is
  /// ahead, then [DangerZoneWarning.distanceInMeters] is greater than 0.

  DangerZoneWarning(this.isZoneStart, this.distanceInMeters, this.distanceType);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! DangerZoneWarning) return false;
    DangerZoneWarning _other = other;
    return isZoneStart == _other.isZoneStart &&
        distanceInMeters == _other.distanceInMeters &&
        distanceType == _other.distanceType;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + isZoneStart.hashCode;
    result = 31 * result + distanceInMeters.hashCode;
    result = 31 * result + distanceType.hashCode;
    return result;
  }
}


// DangerZoneWarning "private" section, not exported.

final _sdkNavigationDangerzonewarningCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint8, Double, Uint32),
    Pointer<Void> Function(int, double, int)
  >('here_sdk_sdk_navigation_DangerZoneWarning_create_handle'));
final _sdkNavigationDangerzonewarningReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_DangerZoneWarning_release_handle'));
final _sdkNavigationDangerzonewarningGetFieldisZoneStart = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_DangerZoneWarning_get_field_isZoneStart'));
final _sdkNavigationDangerzonewarningGetFielddistanceInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_DangerZoneWarning_get_field_distanceInMeters'));
final _sdkNavigationDangerzonewarningGetFielddistanceType = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_DangerZoneWarning_get_field_distanceType'));



Pointer<Void> sdkNavigationDangerzonewarningToFfi(DangerZoneWarning value) {
  final _isZoneStartHandle = booleanToFfi(value.isZoneStart);
  final _distanceInMetersHandle = (value.distanceInMeters);
  final _distanceTypeHandle = sdkNavigationDistancetypeToFfi(value.distanceType);
  final _result = _sdkNavigationDangerzonewarningCreateHandle(_isZoneStartHandle, _distanceInMetersHandle, _distanceTypeHandle);
  booleanReleaseFfiHandle(_isZoneStartHandle);
  
  sdkNavigationDistancetypeReleaseFfiHandle(_distanceTypeHandle);
  return _result;
}

DangerZoneWarning sdkNavigationDangerzonewarningFromFfi(Pointer<Void> handle) {
  final _isZoneStartHandle = _sdkNavigationDangerzonewarningGetFieldisZoneStart(handle);
  final _distanceInMetersHandle = _sdkNavigationDangerzonewarningGetFielddistanceInMeters(handle);
  final _distanceTypeHandle = _sdkNavigationDangerzonewarningGetFielddistanceType(handle);
  try {
    return DangerZoneWarning(
      booleanFromFfi(_isZoneStartHandle), 
      (_distanceInMetersHandle), 
      sdkNavigationDistancetypeFromFfi(_distanceTypeHandle)
    );
  } finally {
    booleanReleaseFfiHandle(_isZoneStartHandle);
    
    sdkNavigationDistancetypeReleaseFfiHandle(_distanceTypeHandle);
  }
}

void sdkNavigationDangerzonewarningReleaseFfiHandle(Pointer<Void> handle) => _sdkNavigationDangerzonewarningReleaseHandle(handle);

// Nullable DangerZoneWarning

final _sdkNavigationDangerzonewarningCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_DangerZoneWarning_create_handle_nullable'));
final _sdkNavigationDangerzonewarningReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_DangerZoneWarning_release_handle_nullable'));
final _sdkNavigationDangerzonewarningGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_DangerZoneWarning_get_value_nullable'));

Pointer<Void> sdkNavigationDangerzonewarningToFfiNullable(DangerZoneWarning? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationDangerzonewarningToFfi(value);
  final result = _sdkNavigationDangerzonewarningCreateHandleNullable(_handle);
  sdkNavigationDangerzonewarningReleaseFfiHandle(_handle);
  return result;
}

DangerZoneWarning? sdkNavigationDangerzonewarningFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationDangerzonewarningGetValueNullable(handle);
  final result = sdkNavigationDangerzonewarningFromFfi(_handle);
  sdkNavigationDangerzonewarningReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationDangerzonewarningReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationDangerzonewarningReleaseHandleNullable(handle);

// End of DangerZoneWarning "private" section.


