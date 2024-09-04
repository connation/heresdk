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

/// Specifies types of transportation for which access/restriction rules apply.
///
/// **Note:** This is a beta release of this feature.
/// Related APIs may change for new releases without a deprecation process.
enum TransportType {
    /// Cars.
    automobiles,
    /// Buses.
    buses,
    /// Taxis.
    taxis,
    /// Car pools.
    carpools,
    /// Pedestrians.
    pedestrians,
    /// Trucks.
    trucks,
    /// Through traffic.
    throughTraffic,
    /// Deliveries.
    deliveries,
    /// Emergency vehicles.
    emergencyVehicles,
    /// Motorcycles.
    motorcycles
}

// TransportType "private" section, not exported.

int sdkTransportTransporttypeToFfi(TransportType value) {
  switch (value) {
  case TransportType.automobiles:
    return 0;
  case TransportType.buses:
    return 1;
  case TransportType.taxis:
    return 2;
  case TransportType.carpools:
    return 3;
  case TransportType.pedestrians:
    return 4;
  case TransportType.trucks:
    return 5;
  case TransportType.throughTraffic:
    return 6;
  case TransportType.deliveries:
    return 7;
  case TransportType.emergencyVehicles:
    return 8;
  case TransportType.motorcycles:
    return 9;
  default:
    throw StateError("Invalid enum value $value for TransportType enum.");
  }
}

TransportType sdkTransportTransporttypeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return TransportType.automobiles;
  case 1:
    return TransportType.buses;
  case 2:
    return TransportType.taxis;
  case 3:
    return TransportType.carpools;
  case 4:
    return TransportType.pedestrians;
  case 5:
    return TransportType.trucks;
  case 6:
    return TransportType.throughTraffic;
  case 7:
    return TransportType.deliveries;
  case 8:
    return TransportType.emergencyVehicles;
  case 9:
    return TransportType.motorcycles;
  default:
    throw StateError("Invalid numeric value $handle for TransportType enum.");
  }
}

void sdkTransportTransporttypeReleaseFfiHandle(int handle) {}

final _sdkTransportTransporttypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_transport_TransportType_create_handle_nullable'));
final _sdkTransportTransporttypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_transport_TransportType_release_handle_nullable'));
final _sdkTransportTransporttypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_transport_TransportType_get_value_nullable'));

Pointer<Void> sdkTransportTransporttypeToFfiNullable(TransportType? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkTransportTransporttypeToFfi(value);
  final result = _sdkTransportTransporttypeCreateHandleNullable(_handle);
  sdkTransportTransporttypeReleaseFfiHandle(_handle);
  return result;
}

TransportType? sdkTransportTransporttypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkTransportTransporttypeGetValueNullable(handle);
  final result = sdkTransportTransporttypeFromFfi(_handle);
  sdkTransportTransporttypeReleaseFfiHandle(_handle);
  return result;
}

void sdkTransportTransporttypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkTransportTransporttypeReleaseHandleNullable(handle);

// End of TransportType "private" section.


