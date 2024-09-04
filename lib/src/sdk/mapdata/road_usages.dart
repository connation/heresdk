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

/// Road Usages of the segment.
///
/// ***Note*** a road can have more than one attribute at the same time.
///
/// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
/// Related APIs may change for new releases without a deprecation process.

class RoadUsages {
  /// Range is a ramp: connects roads that do not intersect at grade.
  /// Ramp allows explication of maneuvers involving ramps (e.g., “Take the ramp”)
  /// and for route guidance when determining if sign text should be used.
  bool isRamp;

  /// Controlled access roads are roads with limited entrances and exits
  /// that allow uninterrupted high-speed traffic flow.
  /// For example, the Interstate/Freeway network in the United States or
  /// the Motorway network in Europe.
  /// Controlled Access can be used for map display, avoidance of freeway/motorway,
  /// publishing speed limits, and route guidance timing.
  bool isControlledAccess;

  /// Identifies a road for which a fee must be paid to use the road.
  /// Tollway may be used for map display (e.g., different rendering of toll roads) and routing.
  /// Tollway is flagged on roads that require a fee for traversal.
  bool isTollway;

  /// Creates a new instance with default values.

  /// [isRamp] Range is a ramp: connects roads that do not intersect at grade.
  /// Ramp allows explication of maneuvers involving ramps (e.g., “Take the ramp”)
  /// and for route guidance when determining if sign text should be used.

  /// [isControlledAccess] Controlled access roads are roads with limited entrances and exits
  /// that allow uninterrupted high-speed traffic flow.
  /// For example, the Interstate/Freeway network in the United States or
  /// the Motorway network in Europe.
  /// Controlled Access can be used for map display, avoidance of freeway/motorway,
  /// publishing speed limits, and route guidance timing.

  /// [isTollway] Identifies a road for which a fee must be paid to use the road.
  /// Tollway may be used for map display (e.g., different rendering of toll roads) and routing.
  /// Tollway is flagged on roads that require a fee for traversal.

  RoadUsages._(this.isRamp, this.isControlledAccess, this.isTollway);
  RoadUsages()
    : isRamp = false, isControlledAccess = false, isTollway = false;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! RoadUsages) return false;
    RoadUsages _other = other;
    return isRamp == _other.isRamp &&
        isControlledAccess == _other.isControlledAccess &&
        isTollway == _other.isTollway;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + isRamp.hashCode;
    result = 31 * result + isControlledAccess.hashCode;
    result = 31 * result + isTollway.hashCode;
    return result;
  }
}


// RoadUsages "private" section, not exported.

final _sdkMapdataRoadusagesCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint8, Uint8, Uint8),
    Pointer<Void> Function(int, int, int)
  >('here_sdk_sdk_mapdata_RoadUsages_create_handle'));
final _sdkMapdataRoadusagesReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_RoadUsages_release_handle'));
final _sdkMapdataRoadusagesGetFieldisRamp = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_RoadUsages_get_field_isRamp'));
final _sdkMapdataRoadusagesGetFieldisControlledAccess = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_RoadUsages_get_field_isControlledAccess'));
final _sdkMapdataRoadusagesGetFieldisTollway = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_RoadUsages_get_field_isTollway'));



Pointer<Void> sdkMapdataRoadusagesToFfi(RoadUsages value) {
  final _isRampHandle = booleanToFfi(value.isRamp);
  final _isControlledAccessHandle = booleanToFfi(value.isControlledAccess);
  final _isTollwayHandle = booleanToFfi(value.isTollway);
  final _result = _sdkMapdataRoadusagesCreateHandle(_isRampHandle, _isControlledAccessHandle, _isTollwayHandle);
  booleanReleaseFfiHandle(_isRampHandle);
  booleanReleaseFfiHandle(_isControlledAccessHandle);
  booleanReleaseFfiHandle(_isTollwayHandle);
  return _result;
}

RoadUsages sdkMapdataRoadusagesFromFfi(Pointer<Void> handle) {
  final _isRampHandle = _sdkMapdataRoadusagesGetFieldisRamp(handle);
  final _isControlledAccessHandle = _sdkMapdataRoadusagesGetFieldisControlledAccess(handle);
  final _isTollwayHandle = _sdkMapdataRoadusagesGetFieldisTollway(handle);
  try {
    return RoadUsages._(
      booleanFromFfi(_isRampHandle), 
      booleanFromFfi(_isControlledAccessHandle), 
      booleanFromFfi(_isTollwayHandle)
    );
  } finally {
    booleanReleaseFfiHandle(_isRampHandle);
    booleanReleaseFfiHandle(_isControlledAccessHandle);
    booleanReleaseFfiHandle(_isTollwayHandle);
  }
}

void sdkMapdataRoadusagesReleaseFfiHandle(Pointer<Void> handle) => _sdkMapdataRoadusagesReleaseHandle(handle);

// Nullable RoadUsages

final _sdkMapdataRoadusagesCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_RoadUsages_create_handle_nullable'));
final _sdkMapdataRoadusagesReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_RoadUsages_release_handle_nullable'));
final _sdkMapdataRoadusagesGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_RoadUsages_get_value_nullable'));

Pointer<Void> sdkMapdataRoadusagesToFfiNullable(RoadUsages? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapdataRoadusagesToFfi(value);
  final result = _sdkMapdataRoadusagesCreateHandleNullable(_handle);
  sdkMapdataRoadusagesReleaseFfiHandle(_handle);
  return result;
}

RoadUsages? sdkMapdataRoadusagesFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapdataRoadusagesGetValueNullable(handle);
  final result = sdkMapdataRoadusagesFromFfi(_handle);
  sdkMapdataRoadusagesReleaseFfiHandle(_handle);
  return result;
}

void sdkMapdataRoadusagesReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapdataRoadusagesReleaseHandleNullable(handle);

// End of RoadUsages "private" section.


