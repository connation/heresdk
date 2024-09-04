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

/// **Note:** The distance types are being given for warnings at distances which can be configured
/// via options specific for each warner.
///
/// These distances are defined based on the speed limit present
/// on the road at that specific location and not the actual road classification.
/// - For speed limits greater than 0 meters/second but slower or equal to 16.39 meters/second (aproximately
///   60 kilometers/hour) the road type is considered to be `URBAN`. There is also an additional check if
///   the area is built up and if so, the road type is also considered as `URBAN` regardless of the speed limit.
/// - For speed limits greater than 16.39 meters/second (aproximately 60 kilometer/hour) but slower or equal to
///   27.78 meters/second (aproximately 100 kilometer/hour) the road type is considered to be `RURAL`.
/// - For speed limits greater than 27.78 meters/second (aproximately 100 kilometer/hour) or no speed limit the
///   road type is considered to be `HIGHWAY`.
///   Indicates the distance type of a warning.
enum DistanceType {
    /// The warning is given for the first time for a new warner data ahead.
    ahead,
    /// The warning is given when a warner data was passed.
    passed,
    /// The warning is given when a warner data was reached.
    reached
}

// DistanceType "private" section, not exported.

int sdkNavigationDistancetypeToFfi(DistanceType value) {
  switch (value) {
  case DistanceType.ahead:
    return 0;
  case DistanceType.passed:
    return 1;
  case DistanceType.reached:
    return 2;
  default:
    throw StateError("Invalid enum value $value for DistanceType enum.");
  }
}

DistanceType sdkNavigationDistancetypeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return DistanceType.ahead;
  case 1:
    return DistanceType.passed;
  case 2:
    return DistanceType.reached;
  default:
    throw StateError("Invalid numeric value $handle for DistanceType enum.");
  }
}

void sdkNavigationDistancetypeReleaseFfiHandle(int handle) {}

final _sdkNavigationDistancetypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_navigation_DistanceType_create_handle_nullable'));
final _sdkNavigationDistancetypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_DistanceType_release_handle_nullable'));
final _sdkNavigationDistancetypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_DistanceType_get_value_nullable'));

Pointer<Void> sdkNavigationDistancetypeToFfiNullable(DistanceType? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationDistancetypeToFfi(value);
  final result = _sdkNavigationDistancetypeCreateHandleNullable(_handle);
  sdkNavigationDistancetypeReleaseFfiHandle(_handle);
  return result;
}

DistanceType? sdkNavigationDistancetypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationDistancetypeGetValueNullable(handle);
  final result = sdkNavigationDistancetypeFromFfi(_handle);
  sdkNavigationDistancetypeReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationDistancetypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationDistancetypeReleaseHandleNullable(handle);

// End of DistanceType "private" section.


