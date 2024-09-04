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

/// Represents the information needed to help the users to reach their off-road destination.

class OffRoadProgress {
  /// Distance to the off-road destination in meters.
  int remainingDistanceInMeters;

  /// The direction, in degrees, the user should take in order to reach the off-road destination.
  double bearingInDegrees;

  /// Creates a new instance.

  /// [remainingDistanceInMeters] Distance to the off-road destination in meters.

  /// [bearingInDegrees] The direction, in degrees, the user should take in order to reach the off-road destination.

  OffRoadProgress._(this.remainingDistanceInMeters, this.bearingInDegrees);
  OffRoadProgress()
    : remainingDistanceInMeters = 0, bearingInDegrees = 0;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! OffRoadProgress) return false;
    OffRoadProgress _other = other;
    return remainingDistanceInMeters == _other.remainingDistanceInMeters &&
        bearingInDegrees == _other.bearingInDegrees;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + remainingDistanceInMeters.hashCode;
    result = 31 * result + bearingInDegrees.hashCode;
    return result;
  }
}


// OffRoadProgress "private" section, not exported.

final _sdkNavigationOffroadprogressCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int32, Double),
    Pointer<Void> Function(int, double)
  >('here_sdk_sdk_navigation_OffRoadProgress_create_handle'));
final _sdkNavigationOffroadprogressReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_OffRoadProgress_release_handle'));
final _sdkNavigationOffroadprogressGetFieldremainingDistanceInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_OffRoadProgress_get_field_remainingDistanceInMeters'));
final _sdkNavigationOffroadprogressGetFieldbearingInDegrees = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_OffRoadProgress_get_field_bearingInDegrees'));



Pointer<Void> sdkNavigationOffroadprogressToFfi(OffRoadProgress value) {
  final _remainingDistanceInMetersHandle = (value.remainingDistanceInMeters);
  final _bearingInDegreesHandle = (value.bearingInDegrees);
  final _result = _sdkNavigationOffroadprogressCreateHandle(_remainingDistanceInMetersHandle, _bearingInDegreesHandle);
  
  
  return _result;
}

OffRoadProgress sdkNavigationOffroadprogressFromFfi(Pointer<Void> handle) {
  final _remainingDistanceInMetersHandle = _sdkNavigationOffroadprogressGetFieldremainingDistanceInMeters(handle);
  final _bearingInDegreesHandle = _sdkNavigationOffroadprogressGetFieldbearingInDegrees(handle);
  try {
    return OffRoadProgress._(
      (_remainingDistanceInMetersHandle), 
      (_bearingInDegreesHandle)
    );
  } finally {
    
    
  }
}

void sdkNavigationOffroadprogressReleaseFfiHandle(Pointer<Void> handle) => _sdkNavigationOffroadprogressReleaseHandle(handle);

// Nullable OffRoadProgress

final _sdkNavigationOffroadprogressCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_OffRoadProgress_create_handle_nullable'));
final _sdkNavigationOffroadprogressReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_OffRoadProgress_release_handle_nullable'));
final _sdkNavigationOffroadprogressGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_OffRoadProgress_get_value_nullable'));

Pointer<Void> sdkNavigationOffroadprogressToFfiNullable(OffRoadProgress? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationOffroadprogressToFfi(value);
  final result = _sdkNavigationOffroadprogressCreateHandleNullable(_handle);
  sdkNavigationOffroadprogressReleaseFfiHandle(_handle);
  return result;
}

OffRoadProgress? sdkNavigationOffroadprogressFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationOffroadprogressGetValueNullable(handle);
  final result = sdkNavigationOffroadprogressFromFfi(_handle);
  sdkNavigationOffroadprogressReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationOffroadprogressReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationOffroadprogressReleaseHandleNullable(handle);

// End of OffRoadProgress "private" section.


