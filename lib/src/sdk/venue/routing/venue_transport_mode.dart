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

/// Available mode of transport on indoor topology.
enum VenueTransportMode {
    /// Auto.
    auto,
    /// Taxi.
    taxi,
    /// Motorcycle.
    motorcycle,
    /// Emergency Vehicle.
    emergencyVehicle,
    /// Pedestrian.
    pedestrian
}

// VenueTransportMode "private" section, not exported.

int sdkVenueRoutingVenuetransportmodeToFfi(VenueTransportMode value) {
  switch (value) {
  case VenueTransportMode.auto:
    return 0;
  case VenueTransportMode.taxi:
    return 1;
  case VenueTransportMode.motorcycle:
    return 2;
  case VenueTransportMode.emergencyVehicle:
    return 3;
  case VenueTransportMode.pedestrian:
    return 4;
  default:
    throw StateError("Invalid enum value $value for VenueTransportMode enum.");
  }
}

VenueTransportMode sdkVenueRoutingVenuetransportmodeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return VenueTransportMode.auto;
  case 1:
    return VenueTransportMode.taxi;
  case 2:
    return VenueTransportMode.motorcycle;
  case 3:
    return VenueTransportMode.emergencyVehicle;
  case 4:
    return VenueTransportMode.pedestrian;
  default:
    throw StateError("Invalid numeric value $handle for VenueTransportMode enum.");
  }
}

void sdkVenueRoutingVenuetransportmodeReleaseFfiHandle(int handle) {}

final _sdkVenueRoutingVenuetransportmodeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_venue_routing_VenueTransportMode_create_handle_nullable'));
final _sdkVenueRoutingVenuetransportmodeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_routing_VenueTransportMode_release_handle_nullable'));
final _sdkVenueRoutingVenuetransportmodeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_venue_routing_VenueTransportMode_get_value_nullable'));

Pointer<Void> sdkVenueRoutingVenuetransportmodeToFfiNullable(VenueTransportMode? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkVenueRoutingVenuetransportmodeToFfi(value);
  final result = _sdkVenueRoutingVenuetransportmodeCreateHandleNullable(_handle);
  sdkVenueRoutingVenuetransportmodeReleaseFfiHandle(_handle);
  return result;
}

VenueTransportMode? sdkVenueRoutingVenuetransportmodeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkVenueRoutingVenuetransportmodeGetValueNullable(handle);
  final result = sdkVenueRoutingVenuetransportmodeFromFfi(_handle);
  sdkVenueRoutingVenuetransportmodeReleaseFfiHandle(_handle);
  return result;
}

void sdkVenueRoutingVenuetransportmodeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkVenueRoutingVenuetransportmodeReleaseHandleNullable(handle);

// End of VenueTransportMode "private" section.


