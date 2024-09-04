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

/// Vehicle type for which a road sign is applicable.
enum RoadSignVehicleType {
    /// Road sign is applicable for trucks.
    trucks,
    /// Road sign is applicable for heavy trucks.
    heavyTrucks,
    /// Road sign is applicable for buses.
    bus,
    /// Road sign is applicable for auto trailers. For example, passenger vehicles with trailer.
    autoTrailer,
    /// Road sign is applicable for motorhomes.
    motorhome,
    /// Road sign is applicable for motorcycles.
    motorcycle
}

// RoadSignVehicleType "private" section, not exported.

int sdkNavigationRoadsignvehicletypeToFfi(RoadSignVehicleType value) {
  switch (value) {
  case RoadSignVehicleType.trucks:
    return 0;
  case RoadSignVehicleType.heavyTrucks:
    return 1;
  case RoadSignVehicleType.bus:
    return 2;
  case RoadSignVehicleType.autoTrailer:
    return 3;
  case RoadSignVehicleType.motorhome:
    return 4;
  case RoadSignVehicleType.motorcycle:
    return 5;
  default:
    throw StateError("Invalid enum value $value for RoadSignVehicleType enum.");
  }
}

RoadSignVehicleType sdkNavigationRoadsignvehicletypeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return RoadSignVehicleType.trucks;
  case 1:
    return RoadSignVehicleType.heavyTrucks;
  case 2:
    return RoadSignVehicleType.bus;
  case 3:
    return RoadSignVehicleType.autoTrailer;
  case 4:
    return RoadSignVehicleType.motorhome;
  case 5:
    return RoadSignVehicleType.motorcycle;
  default:
    throw StateError("Invalid numeric value $handle for RoadSignVehicleType enum.");
  }
}

void sdkNavigationRoadsignvehicletypeReleaseFfiHandle(int handle) {}

final _sdkNavigationRoadsignvehicletypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_navigation_RoadSignVehicleType_create_handle_nullable'));
final _sdkNavigationRoadsignvehicletypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadSignVehicleType_release_handle_nullable'));
final _sdkNavigationRoadsignvehicletypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadSignVehicleType_get_value_nullable'));

Pointer<Void> sdkNavigationRoadsignvehicletypeToFfiNullable(RoadSignVehicleType? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationRoadsignvehicletypeToFfi(value);
  final result = _sdkNavigationRoadsignvehicletypeCreateHandleNullable(_handle);
  sdkNavigationRoadsignvehicletypeReleaseFfiHandle(_handle);
  return result;
}

RoadSignVehicleType? sdkNavigationRoadsignvehicletypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationRoadsignvehicletypeGetValueNullable(handle);
  final result = sdkNavigationRoadsignvehicletypeFromFfi(_handle);
  sdkNavigationRoadsignvehicletypeReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationRoadsignvehicletypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationRoadsignvehicletypeReleaseHandleNullable(handle);

// End of RoadSignVehicleType "private" section.


