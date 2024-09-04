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
import 'package:here_sdk/src/sdk/mapdata/o_c_m_segment_id.dart';
import 'package:here_sdk/src/sdk/routing/travel_direction.dart';

/// OCM Segment ID with travel direction of segment.
///
/// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
/// Related APIs may change for new releases without a deprecation process.

class DirectedOCMSegmentId {
  /// Segment ID in OCM map
  OCMSegmentId id;

  /// Travel direction of the segment.
  TravelDirection travelDirection;

  /// Creates a new instance.

  /// [id] Segment ID in OCM map

  /// [travelDirection] Travel direction of the segment.

  DirectedOCMSegmentId._(this.id, this.travelDirection);
  DirectedOCMSegmentId(OCMSegmentId id)
    : id = id, travelDirection = TravelDirection.bidirectional;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! DirectedOCMSegmentId) return false;
    DirectedOCMSegmentId _other = other;
    return id == _other.id &&
        travelDirection == _other.travelDirection;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + id.hashCode;
    result = 31 * result + travelDirection.hashCode;
    return result;
  }
}


// DirectedOCMSegmentId "private" section, not exported.

final _sdkMapdataDirectedocmsegmentidCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Uint32),
    Pointer<Void> Function(Pointer<Void>, int)
  >('here_sdk_sdk_mapdata_DirectedOCMSegmentId_create_handle'));
final _sdkMapdataDirectedocmsegmentidReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_DirectedOCMSegmentId_release_handle'));
final _sdkMapdataDirectedocmsegmentidGetFieldid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_DirectedOCMSegmentId_get_field_id'));
final _sdkMapdataDirectedocmsegmentidGetFieldtravelDirection = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_DirectedOCMSegmentId_get_field_travelDirection'));



Pointer<Void> sdkMapdataDirectedocmsegmentidToFfi(DirectedOCMSegmentId value) {
  final _idHandle = sdkMapdataOcmsegmentidToFfi(value.id);
  final _travelDirectionHandle = sdkRoutingTraveldirectionToFfi(value.travelDirection);
  final _result = _sdkMapdataDirectedocmsegmentidCreateHandle(_idHandle, _travelDirectionHandle);
  sdkMapdataOcmsegmentidReleaseFfiHandle(_idHandle);
  sdkRoutingTraveldirectionReleaseFfiHandle(_travelDirectionHandle);
  return _result;
}

DirectedOCMSegmentId sdkMapdataDirectedocmsegmentidFromFfi(Pointer<Void> handle) {
  final _idHandle = _sdkMapdataDirectedocmsegmentidGetFieldid(handle);
  final _travelDirectionHandle = _sdkMapdataDirectedocmsegmentidGetFieldtravelDirection(handle);
  try {
    return DirectedOCMSegmentId._(
      sdkMapdataOcmsegmentidFromFfi(_idHandle), 
      sdkRoutingTraveldirectionFromFfi(_travelDirectionHandle)
    );
  } finally {
    sdkMapdataOcmsegmentidReleaseFfiHandle(_idHandle);
    sdkRoutingTraveldirectionReleaseFfiHandle(_travelDirectionHandle);
  }
}

void sdkMapdataDirectedocmsegmentidReleaseFfiHandle(Pointer<Void> handle) => _sdkMapdataDirectedocmsegmentidReleaseHandle(handle);

// Nullable DirectedOCMSegmentId

final _sdkMapdataDirectedocmsegmentidCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_DirectedOCMSegmentId_create_handle_nullable'));
final _sdkMapdataDirectedocmsegmentidReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_DirectedOCMSegmentId_release_handle_nullable'));
final _sdkMapdataDirectedocmsegmentidGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_DirectedOCMSegmentId_get_value_nullable'));

Pointer<Void> sdkMapdataDirectedocmsegmentidToFfiNullable(DirectedOCMSegmentId? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapdataDirectedocmsegmentidToFfi(value);
  final result = _sdkMapdataDirectedocmsegmentidCreateHandleNullable(_handle);
  sdkMapdataDirectedocmsegmentidReleaseFfiHandle(_handle);
  return result;
}

DirectedOCMSegmentId? sdkMapdataDirectedocmsegmentidFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapdataDirectedocmsegmentidGetValueNullable(handle);
  final result = sdkMapdataDirectedocmsegmentidFromFfi(_handle);
  sdkMapdataDirectedocmsegmentidReleaseFfiHandle(_handle);
  return result;
}

void sdkMapdataDirectedocmsegmentidReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapdataDirectedocmsegmentidReleaseHandleNullable(handle);

// End of DirectedOCMSegmentId "private" section.


