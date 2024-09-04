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
import 'package:here_sdk/src/_native_base.dart' as __lib;
import 'package:here_sdk/src/_token_cache.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';
import 'package:here_sdk/src/sdk/venue/data/venue_level.dart';
import 'package:here_sdk/src/sdk/venue/routing/venue_transport_mode.dart';

/// Represents routing topologies inside the [VenueLevel].
///
/// The topologies can be paths
/// used for enabling routing services.
abstract class VenueTopology {

  /// Gets an id of the topology.
  String get identifier;

  /// Gets a parent level of the topology.
  VenueLevel get level;

  /// Gets a center of the topology.
  @Deprecated("Will be removed in v4.20.0. Calling this function would not return correct center of topology.")
  GeoCoordinates get center;

  /// Gets the list of [VenueTopologyAccessCharacteristics].
  List<VenueTopologyAccessCharacteristics> get accessibility;

}

/// Available directions.
enum VenueTopologyTopologyDirectionality {
    /// Topology direction unknown.
    undefined,
    /// Topology can be traversed from start to end.
    fromStart,
    /// Topology can be traversed from end to start.
    toStart,
    /// Topology can be traversed from both start and end.
    bidirectional
}

// VenueTopologyTopologyDirectionality "private" section, not exported.

int sdkVenueDataVenuetopologyTopologydirectionalityToFfi(VenueTopologyTopologyDirectionality value) {
  switch (value) {
  case VenueTopologyTopologyDirectionality.undefined:
    return 0;
  case VenueTopologyTopologyDirectionality.fromStart:
    return 1;
  case VenueTopologyTopologyDirectionality.toStart:
    return 2;
  case VenueTopologyTopologyDirectionality.bidirectional:
    return 3;
  default:
    throw StateError("Invalid enum value $value for VenueTopologyTopologyDirectionality enum.");
  }
}

VenueTopologyTopologyDirectionality sdkVenueDataVenuetopologyTopologydirectionalityFromFfi(int handle) {
  switch (handle) {
  case 0:
    return VenueTopologyTopologyDirectionality.undefined;
  case 1:
    return VenueTopologyTopologyDirectionality.fromStart;
  case 2:
    return VenueTopologyTopologyDirectionality.toStart;
  case 3:
    return VenueTopologyTopologyDirectionality.bidirectional;
  default:
    throw StateError("Invalid numeric value $handle for VenueTopologyTopologyDirectionality enum.");
  }
}

void sdkVenueDataVenuetopologyTopologydirectionalityReleaseFfiHandle(int handle) {}

final _sdkVenueDataVenuetopologyTopologydirectionalityCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_venue_data_VenueTopology_TopologyDirectionality_create_handle_nullable'));
final _sdkVenueDataVenuetopologyTopologydirectionalityReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_data_VenueTopology_TopologyDirectionality_release_handle_nullable'));
final _sdkVenueDataVenuetopologyTopologydirectionalityGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_venue_data_VenueTopology_TopologyDirectionality_get_value_nullable'));

Pointer<Void> sdkVenueDataVenuetopologyTopologydirectionalityToFfiNullable(VenueTopologyTopologyDirectionality? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkVenueDataVenuetopologyTopologydirectionalityToFfi(value);
  final result = _sdkVenueDataVenuetopologyTopologydirectionalityCreateHandleNullable(_handle);
  sdkVenueDataVenuetopologyTopologydirectionalityReleaseFfiHandle(_handle);
  return result;
}

VenueTopologyTopologyDirectionality? sdkVenueDataVenuetopologyTopologydirectionalityFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkVenueDataVenuetopologyTopologydirectionalityGetValueNullable(handle);
  final result = sdkVenueDataVenuetopologyTopologydirectionalityFromFfi(_handle);
  sdkVenueDataVenuetopologyTopologydirectionalityReleaseFfiHandle(_handle);
  return result;
}

void sdkVenueDataVenuetopologyTopologydirectionalityReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkVenueDataVenuetopologyTopologydirectionalityReleaseHandleNullable(handle);

// End of VenueTopologyTopologyDirectionality "private" section.
/// Represents the access characreisticas of a topology.
///
/// Access characteristics is a combination of [VenueTransportMode] which is suppoted on this topology
/// and the [VenueTopologyTopologyDirectionality] towards which it is allowed.
abstract class VenueTopologyAccessCharacteristics {

  /// Gets the mode of transport.
  VenueTransportMode get mode;

  /// Gets the topology direction.
  VenueTopologyTopologyDirectionality get direction;

}


// VenueTopologyAccessCharacteristics "private" section, not exported.

final _sdkVenueDataVenuetopologyAccesscharacteristicsRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_venue_data_VenueTopology_AccessCharacteristics_register_finalizer'));
final _sdkVenueDataVenuetopologyAccesscharacteristicsCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_data_VenueTopology_AccessCharacteristics_copy_handle'));
final _sdkVenueDataVenuetopologyAccesscharacteristicsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_data_VenueTopology_AccessCharacteristics_release_handle'));


class VenueTopologyAccessCharacteristics$Impl extends __lib.NativeBase implements VenueTopologyAccessCharacteristics {

  VenueTopologyAccessCharacteristics$Impl(Pointer<Void> handle) : super(handle);

  @override
  VenueTransportMode get mode {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueTopology_AccessCharacteristics_mode_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkVenueRoutingVenuetransportmodeFromFfi(__resultHandle);
    } finally {
      sdkVenueRoutingVenuetransportmodeReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  VenueTopologyTopologyDirectionality get direction {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueTopology_AccessCharacteristics_direction_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkVenueDataVenuetopologyTopologydirectionalityFromFfi(__resultHandle);
    } finally {
      sdkVenueDataVenuetopologyTopologydirectionalityReleaseFfiHandle(__resultHandle);

    }

  }



}

Pointer<Void> sdkVenueDataVenuetopologyAccesscharacteristicsToFfi(VenueTopologyAccessCharacteristics value) =>
  _sdkVenueDataVenuetopologyAccesscharacteristicsCopyHandle((value as __lib.NativeBase).handle);

VenueTopologyAccessCharacteristics sdkVenueDataVenuetopologyAccesscharacteristicsFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is VenueTopologyAccessCharacteristics) return instance;

  final _copiedHandle = _sdkVenueDataVenuetopologyAccesscharacteristicsCopyHandle(handle);
  final result = VenueTopologyAccessCharacteristics$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkVenueDataVenuetopologyAccesscharacteristicsRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkVenueDataVenuetopologyAccesscharacteristicsReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkVenueDataVenuetopologyAccesscharacteristicsReleaseHandle(handle);

Pointer<Void> sdkVenueDataVenuetopologyAccesscharacteristicsToFfiNullable(VenueTopologyAccessCharacteristics? value) =>
  value != null ? sdkVenueDataVenuetopologyAccesscharacteristicsToFfi(value) : Pointer<Void>.fromAddress(0);

VenueTopologyAccessCharacteristics? sdkVenueDataVenuetopologyAccesscharacteristicsFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkVenueDataVenuetopologyAccesscharacteristicsFromFfi(handle) : null;

void sdkVenueDataVenuetopologyAccesscharacteristicsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkVenueDataVenuetopologyAccesscharacteristicsReleaseHandle(handle);

// End of VenueTopologyAccessCharacteristics "private" section.

// VenueTopology "private" section, not exported.

final _sdkVenueDataVenuetopologyRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_venue_data_VenueTopology_register_finalizer'));
final _sdkVenueDataVenuetopologyCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_data_VenueTopology_copy_handle'));
final _sdkVenueDataVenuetopologyReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_data_VenueTopology_release_handle'));


class VenueTopology$Impl extends __lib.NativeBase implements VenueTopology {

  VenueTopology$Impl(Pointer<Void> handle) : super(handle);

  @override
  String get identifier {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueTopology_identifier_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  VenueLevel get level {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueTopology_level_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkVenueDataVenuelevelFromFfi(__resultHandle);
    } finally {
      sdkVenueDataVenuelevelReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  GeoCoordinates get center {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueTopology_center_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreGeocoordinatesFromFfi(__resultHandle);
    } finally {
      sdkCoreGeocoordinatesReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  List<VenueTopologyAccessCharacteristics> get accessibility {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueTopology_accessibility_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return venuecoreBindingslistofSdkVenueDataVenuetopologyAccesscharacteristicsFromFfi(__resultHandle);
    } finally {
      venuecoreBindingslistofSdkVenueDataVenuetopologyAccesscharacteristicsReleaseFfiHandle(__resultHandle);

    }

  }



}

Pointer<Void> sdkVenueDataVenuetopologyToFfi(VenueTopology value) =>
  _sdkVenueDataVenuetopologyCopyHandle((value as __lib.NativeBase).handle);

VenueTopology sdkVenueDataVenuetopologyFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is VenueTopology) return instance;

  final _copiedHandle = _sdkVenueDataVenuetopologyCopyHandle(handle);
  final result = VenueTopology$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkVenueDataVenuetopologyRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkVenueDataVenuetopologyReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkVenueDataVenuetopologyReleaseHandle(handle);

Pointer<Void> sdkVenueDataVenuetopologyToFfiNullable(VenueTopology? value) =>
  value != null ? sdkVenueDataVenuetopologyToFfi(value) : Pointer<Void>.fromAddress(0);

VenueTopology? sdkVenueDataVenuetopologyFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkVenueDataVenuetopologyFromFfi(handle) : null;

void sdkVenueDataVenuetopologyReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkVenueDataVenuetopologyReleaseHandle(handle);

// End of VenueTopology "private" section.


