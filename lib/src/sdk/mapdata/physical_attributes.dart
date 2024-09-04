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

/// Physical attributes of the segment.
///
/// ***Note*** a road can have more than one attribute at the same time.
///
/// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
/// Related APIs may change for new releases without a deprecation process.

class PhysicalAttributes {
  /// Indicates whether the navigable segment is paved.
  /// Paved is primarily used for map display and routing by assigning
  /// higher penalties to unpaved roads.
  /// Paved roads are made of concrete, asphalt, cobblestone or brick.
  /// Unpaved roads do not have a solid surface, e.g. are made of gravel, dirt or grass.
  bool isDirtRoad;

  /// Identifies an enclosed (on all sides) passageway through or under an obstruction.
  /// This attribute can be used for display or route guidance.
  bool isTunnel;

  /// Identifies a structure that allows a road, railway, or walkway
  /// to pass over another road, railway, waterway, or valley serving
  /// map display and route guidance functionalities.
  /// Bridge is published on segments that represent significant
  /// bridges and/or overpasses; elevated roads are not published as bridge.
  bool isBridge;

  /// Private identifies roads that are not maintained by an organization
  /// responsible for maintenance of public roads.
  /// Allows for unique cartographic representation of roads that restrict public use.
  /// May be used to avoid routing through a private road.
  bool isPrivate;

  /// Indicates if there is a physical structure or painted road marking intended to legally
  /// prohibit left turns in right-side driving countries, right turns in left-side driving
  /// countries, and U-turns at divided intersections or in the middle of divided segments.
  bool isDividedRoad;

  /// Indicates the presence of a roundabout.
  bool isRoundabout;

  /// Creates a new instance with default values.

  /// [isDirtRoad] Indicates whether the navigable segment is paved.
  /// Paved is primarily used for map display and routing by assigning
  /// higher penalties to unpaved roads.
  /// Paved roads are made of concrete, asphalt, cobblestone or brick.
  /// Unpaved roads do not have a solid surface, e.g. are made of gravel, dirt or grass.

  /// [isTunnel] Identifies an enclosed (on all sides) passageway through or under an obstruction.
  /// This attribute can be used for display or route guidance.

  /// [isBridge] Identifies a structure that allows a road, railway, or walkway
  /// to pass over another road, railway, waterway, or valley serving
  /// map display and route guidance functionalities.
  /// Bridge is published on segments that represent significant
  /// bridges and/or overpasses; elevated roads are not published as bridge.

  /// [isPrivate] Private identifies roads that are not maintained by an organization
  /// responsible for maintenance of public roads.
  /// Allows for unique cartographic representation of roads that restrict public use.
  /// May be used to avoid routing through a private road.

  /// [isDividedRoad] Indicates if there is a physical structure or painted road marking intended to legally
  /// prohibit left turns in right-side driving countries, right turns in left-side driving
  /// countries, and U-turns at divided intersections or in the middle of divided segments.

  /// [isRoundabout] Indicates the presence of a roundabout.

  PhysicalAttributes._(this.isDirtRoad, this.isTunnel, this.isBridge, this.isPrivate, this.isDividedRoad, this.isRoundabout);
  PhysicalAttributes()
    : isDirtRoad = false, isTunnel = false, isBridge = false, isPrivate = false, isDividedRoad = false, isRoundabout = false;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PhysicalAttributes) return false;
    PhysicalAttributes _other = other;
    return isDirtRoad == _other.isDirtRoad &&
        isTunnel == _other.isTunnel &&
        isBridge == _other.isBridge &&
        isPrivate == _other.isPrivate &&
        isDividedRoad == _other.isDividedRoad &&
        isRoundabout == _other.isRoundabout;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + isDirtRoad.hashCode;
    result = 31 * result + isTunnel.hashCode;
    result = 31 * result + isBridge.hashCode;
    result = 31 * result + isPrivate.hashCode;
    result = 31 * result + isDividedRoad.hashCode;
    result = 31 * result + isRoundabout.hashCode;
    return result;
  }
}


// PhysicalAttributes "private" section, not exported.

final _sdkMapdataPhysicalattributesCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint8, Uint8, Uint8, Uint8, Uint8, Uint8),
    Pointer<Void> Function(int, int, int, int, int, int)
  >('here_sdk_sdk_mapdata_PhysicalAttributes_create_handle'));
final _sdkMapdataPhysicalattributesReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_PhysicalAttributes_release_handle'));
final _sdkMapdataPhysicalattributesGetFieldisDirtRoad = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_PhysicalAttributes_get_field_isDirtRoad'));
final _sdkMapdataPhysicalattributesGetFieldisTunnel = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_PhysicalAttributes_get_field_isTunnel'));
final _sdkMapdataPhysicalattributesGetFieldisBridge = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_PhysicalAttributes_get_field_isBridge'));
final _sdkMapdataPhysicalattributesGetFieldisPrivate = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_PhysicalAttributes_get_field_isPrivate'));
final _sdkMapdataPhysicalattributesGetFieldisDividedRoad = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_PhysicalAttributes_get_field_isDividedRoad'));
final _sdkMapdataPhysicalattributesGetFieldisRoundabout = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_PhysicalAttributes_get_field_isRoundabout'));



Pointer<Void> sdkMapdataPhysicalattributesToFfi(PhysicalAttributes value) {
  final _isDirtRoadHandle = booleanToFfi(value.isDirtRoad);
  final _isTunnelHandle = booleanToFfi(value.isTunnel);
  final _isBridgeHandle = booleanToFfi(value.isBridge);
  final _isPrivateHandle = booleanToFfi(value.isPrivate);
  final _isDividedRoadHandle = booleanToFfi(value.isDividedRoad);
  final _isRoundaboutHandle = booleanToFfi(value.isRoundabout);
  final _result = _sdkMapdataPhysicalattributesCreateHandle(_isDirtRoadHandle, _isTunnelHandle, _isBridgeHandle, _isPrivateHandle, _isDividedRoadHandle, _isRoundaboutHandle);
  booleanReleaseFfiHandle(_isDirtRoadHandle);
  booleanReleaseFfiHandle(_isTunnelHandle);
  booleanReleaseFfiHandle(_isBridgeHandle);
  booleanReleaseFfiHandle(_isPrivateHandle);
  booleanReleaseFfiHandle(_isDividedRoadHandle);
  booleanReleaseFfiHandle(_isRoundaboutHandle);
  return _result;
}

PhysicalAttributes sdkMapdataPhysicalattributesFromFfi(Pointer<Void> handle) {
  final _isDirtRoadHandle = _sdkMapdataPhysicalattributesGetFieldisDirtRoad(handle);
  final _isTunnelHandle = _sdkMapdataPhysicalattributesGetFieldisTunnel(handle);
  final _isBridgeHandle = _sdkMapdataPhysicalattributesGetFieldisBridge(handle);
  final _isPrivateHandle = _sdkMapdataPhysicalattributesGetFieldisPrivate(handle);
  final _isDividedRoadHandle = _sdkMapdataPhysicalattributesGetFieldisDividedRoad(handle);
  final _isRoundaboutHandle = _sdkMapdataPhysicalattributesGetFieldisRoundabout(handle);
  try {
    return PhysicalAttributes._(
      booleanFromFfi(_isDirtRoadHandle), 
      booleanFromFfi(_isTunnelHandle), 
      booleanFromFfi(_isBridgeHandle), 
      booleanFromFfi(_isPrivateHandle), 
      booleanFromFfi(_isDividedRoadHandle), 
      booleanFromFfi(_isRoundaboutHandle)
    );
  } finally {
    booleanReleaseFfiHandle(_isDirtRoadHandle);
    booleanReleaseFfiHandle(_isTunnelHandle);
    booleanReleaseFfiHandle(_isBridgeHandle);
    booleanReleaseFfiHandle(_isPrivateHandle);
    booleanReleaseFfiHandle(_isDividedRoadHandle);
    booleanReleaseFfiHandle(_isRoundaboutHandle);
  }
}

void sdkMapdataPhysicalattributesReleaseFfiHandle(Pointer<Void> handle) => _sdkMapdataPhysicalattributesReleaseHandle(handle);

// Nullable PhysicalAttributes

final _sdkMapdataPhysicalattributesCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_PhysicalAttributes_create_handle_nullable'));
final _sdkMapdataPhysicalattributesReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_PhysicalAttributes_release_handle_nullable'));
final _sdkMapdataPhysicalattributesGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_PhysicalAttributes_get_value_nullable'));

Pointer<Void> sdkMapdataPhysicalattributesToFfiNullable(PhysicalAttributes? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapdataPhysicalattributesToFfi(value);
  final result = _sdkMapdataPhysicalattributesCreateHandleNullable(_handle);
  sdkMapdataPhysicalattributesReleaseFfiHandle(_handle);
  return result;
}

PhysicalAttributes? sdkMapdataPhysicalattributesFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapdataPhysicalattributesGetValueNullable(handle);
  final result = sdkMapdataPhysicalattributesFromFfi(_handle);
  sdkMapdataPhysicalattributesReleaseFfiHandle(_handle);
  return result;
}

void sdkMapdataPhysicalattributesReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapdataPhysicalattributesReleaseHandleNullable(handle);

// End of PhysicalAttributes "private" section.


