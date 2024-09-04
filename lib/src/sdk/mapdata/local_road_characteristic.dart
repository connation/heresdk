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

/// Specifies the local road characteristics: frontage, parking lot road, poi access.
///
/// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
/// Related APIs may change for new releases without a deprecation process.
enum LocalRoadCharacteristic {
    /// Indicates whether the segment range is a frontage road or not.
    /// Frontage roads are local roads that run parallel to and usually
    /// contain the name(s) and addresses of a road with a higher traffic flow.
    frontage,
    /// Indicates whether the segment range is within a parking lot or not.
    parkingLotRoad,
    /// Indicates whether the segment range is a POI Access Road.
    /// POI Access Roads connect Points of Interest (POIs) to the road network.
    /// These roads provide the only means of entrance or exit from a POI to a public road.
    poiAccess
}

// LocalRoadCharacteristic "private" section, not exported.

int sdkMapdataLocalroadcharacteristicToFfi(LocalRoadCharacteristic value) {
  switch (value) {
  case LocalRoadCharacteristic.frontage:
    return 0;
  case LocalRoadCharacteristic.parkingLotRoad:
    return 1;
  case LocalRoadCharacteristic.poiAccess:
    return 2;
  default:
    throw StateError("Invalid enum value $value for LocalRoadCharacteristic enum.");
  }
}

LocalRoadCharacteristic sdkMapdataLocalroadcharacteristicFromFfi(int handle) {
  switch (handle) {
  case 0:
    return LocalRoadCharacteristic.frontage;
  case 1:
    return LocalRoadCharacteristic.parkingLotRoad;
  case 2:
    return LocalRoadCharacteristic.poiAccess;
  default:
    throw StateError("Invalid numeric value $handle for LocalRoadCharacteristic enum.");
  }
}

void sdkMapdataLocalroadcharacteristicReleaseFfiHandle(int handle) {}

final _sdkMapdataLocalroadcharacteristicCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_mapdata_LocalRoadCharacteristic_create_handle_nullable'));
final _sdkMapdataLocalroadcharacteristicReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_LocalRoadCharacteristic_release_handle_nullable'));
final _sdkMapdataLocalroadcharacteristicGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_LocalRoadCharacteristic_get_value_nullable'));

Pointer<Void> sdkMapdataLocalroadcharacteristicToFfiNullable(LocalRoadCharacteristic? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapdataLocalroadcharacteristicToFfi(value);
  final result = _sdkMapdataLocalroadcharacteristicCreateHandleNullable(_handle);
  sdkMapdataLocalroadcharacteristicReleaseFfiHandle(_handle);
  return result;
}

LocalRoadCharacteristic? sdkMapdataLocalroadcharacteristicFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapdataLocalroadcharacteristicGetValueNullable(handle);
  final result = sdkMapdataLocalroadcharacteristicFromFfi(_handle);
  sdkMapdataLocalroadcharacteristicReleaseFfiHandle(_handle);
  return result;
}

void sdkMapdataLocalroadcharacteristicReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapdataLocalroadcharacteristicReleaseHandleNullable(handle);

// End of LocalRoadCharacteristic "private" section.


