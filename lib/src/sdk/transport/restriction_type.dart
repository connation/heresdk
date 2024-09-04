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

/// Type of vehicle restriction.
///
/// **Note:** This is a beta release of this feature.
/// Related APIs may change for new releases without a deprecation process.
enum RestrictionType {
    /// Actual weight, in kilograms.
    weight,
    /// Gross vehicle mass, in kilograms.
    grossWeight,
    /// Weight per axle, in kilograms.
    weightPerAxle,
    /// Payload capacity weight, in kilograms.
    payloadCapacity,
    /// A height, in centimeters.
    height,
    /// A width, in centimeters.
    width,
    /// A length, in centimeters.
    length,
    /// Length from kingpin to rear axle, in centimeters.
    kingpinToRearAxleLength,
    /// Wheels per axle.
    wheelsPerAxle,
    /// Distance between axles, in centimeters.
    distanceBetweenAxles,
    /// Weight per number of axles, in kilograms. See [VehicleRestriction.axleCount]
    /// for information on number of axles.
    weightPerAxleCount,
    /// Weight per axle group, in kilograms. See [VehicleRestriction.axleCountInGroup]
    /// for information about axle group.
    weightPerAxleGroup
}

// RestrictionType "private" section, not exported.

int sdkTransportRestrictiontypeToFfi(RestrictionType value) {
  switch (value) {
  case RestrictionType.weight:
    return 0;
  case RestrictionType.grossWeight:
    return 1;
  case RestrictionType.weightPerAxle:
    return 2;
  case RestrictionType.payloadCapacity:
    return 3;
  case RestrictionType.height:
    return 4;
  case RestrictionType.width:
    return 5;
  case RestrictionType.length:
    return 6;
  case RestrictionType.kingpinToRearAxleLength:
    return 7;
  case RestrictionType.wheelsPerAxle:
    return 8;
  case RestrictionType.distanceBetweenAxles:
    return 9;
  case RestrictionType.weightPerAxleCount:
    return 10;
  case RestrictionType.weightPerAxleGroup:
    return 11;
  default:
    throw StateError("Invalid enum value $value for RestrictionType enum.");
  }
}

RestrictionType sdkTransportRestrictiontypeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return RestrictionType.weight;
  case 1:
    return RestrictionType.grossWeight;
  case 2:
    return RestrictionType.weightPerAxle;
  case 3:
    return RestrictionType.payloadCapacity;
  case 4:
    return RestrictionType.height;
  case 5:
    return RestrictionType.width;
  case 6:
    return RestrictionType.length;
  case 7:
    return RestrictionType.kingpinToRearAxleLength;
  case 8:
    return RestrictionType.wheelsPerAxle;
  case 9:
    return RestrictionType.distanceBetweenAxles;
  case 10:
    return RestrictionType.weightPerAxleCount;
  case 11:
    return RestrictionType.weightPerAxleGroup;
  default:
    throw StateError("Invalid numeric value $handle for RestrictionType enum.");
  }
}

void sdkTransportRestrictiontypeReleaseFfiHandle(int handle) {}

final _sdkTransportRestrictiontypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_transport_RestrictionType_create_handle_nullable'));
final _sdkTransportRestrictiontypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_transport_RestrictionType_release_handle_nullable'));
final _sdkTransportRestrictiontypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_transport_RestrictionType_get_value_nullable'));

Pointer<Void> sdkTransportRestrictiontypeToFfiNullable(RestrictionType? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkTransportRestrictiontypeToFfi(value);
  final result = _sdkTransportRestrictiontypeCreateHandleNullable(_handle);
  sdkTransportRestrictiontypeReleaseFfiHandle(_handle);
  return result;
}

RestrictionType? sdkTransportRestrictiontypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkTransportRestrictiontypeGetValueNullable(handle);
  final result = sdkTransportRestrictiontypeFromFfi(_handle);
  sdkTransportRestrictiontypeReleaseFfiHandle(_handle);
  return result;
}

void sdkTransportRestrictiontypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkTransportRestrictiontypeReleaseHandleNullable(handle);

// End of RestrictionType "private" section.


