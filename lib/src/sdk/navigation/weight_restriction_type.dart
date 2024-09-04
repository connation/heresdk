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

/// Defines the type of a weight restriction.
enum WeightRestrictionType {
    /// A weight restriction.
    truckWeight,
    /// A weight per axle restriction.
    weightPerAxle,
    /// Payload capacity weight restriction.
    payloadCapacity
}

// WeightRestrictionType "private" section, not exported.

int sdkNavigationWeightrestrictiontypeToFfi(WeightRestrictionType value) {
  switch (value) {
  case WeightRestrictionType.truckWeight:
    return 0;
  case WeightRestrictionType.weightPerAxle:
    return 1;
  case WeightRestrictionType.payloadCapacity:
    return 2;
  default:
    throw StateError("Invalid enum value $value for WeightRestrictionType enum.");
  }
}

WeightRestrictionType sdkNavigationWeightrestrictiontypeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return WeightRestrictionType.truckWeight;
  case 1:
    return WeightRestrictionType.weightPerAxle;
  case 2:
    return WeightRestrictionType.payloadCapacity;
  default:
    throw StateError("Invalid numeric value $handle for WeightRestrictionType enum.");
  }
}

void sdkNavigationWeightrestrictiontypeReleaseFfiHandle(int handle) {}

final _sdkNavigationWeightrestrictiontypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_navigation_WeightRestrictionType_create_handle_nullable'));
final _sdkNavigationWeightrestrictiontypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_WeightRestrictionType_release_handle_nullable'));
final _sdkNavigationWeightrestrictiontypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_WeightRestrictionType_get_value_nullable'));

Pointer<Void> sdkNavigationWeightrestrictiontypeToFfiNullable(WeightRestrictionType? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationWeightrestrictiontypeToFfi(value);
  final result = _sdkNavigationWeightrestrictiontypeCreateHandleNullable(_handle);
  sdkNavigationWeightrestrictiontypeReleaseFfiHandle(_handle);
  return result;
}

WeightRestrictionType? sdkNavigationWeightrestrictiontypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationWeightrestrictiontypeGetValueNullable(handle);
  final result = sdkNavigationWeightrestrictiontypeFromFfi(_handle);
  sdkNavigationWeightrestrictiontypeReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationWeightrestrictiontypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationWeightrestrictiontypeReleaseHandleNullable(handle);

// End of WeightRestrictionType "private" section.


