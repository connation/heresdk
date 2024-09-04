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

/// OCM Segment ID of particular matched [SegmentReference] from OCM map,
/// represented in form: Tile + Local ID's .
///
/// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
/// Related APIs may change for new releases without a deprecation process.

class OCMSegmentId {
  /// Here tile partition id (Morton-encoding + level indicator) of the segment.
  int tilePartitionId;

  /// Local ID of the segment inside the OCM tile.
  int localId;

  /// Creates a new instance.

  /// [tilePartitionId] Here tile partition id (Morton-encoding + level indicator) of the segment.

  /// [localId] Local ID of the segment inside the OCM tile.

  OCMSegmentId._(this.tilePartitionId, this.localId);
  OCMSegmentId()
    : tilePartitionId = 0, localId = 0;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! OCMSegmentId) return false;
    OCMSegmentId _other = other;
    return tilePartitionId == _other.tilePartitionId &&
        localId == _other.localId;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + tilePartitionId.hashCode;
    result = 31 * result + localId.hashCode;
    return result;
  }
}


// OCMSegmentId "private" section, not exported.

final _sdkMapdataOcmsegmentidCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int32, Int32),
    Pointer<Void> Function(int, int)
  >('here_sdk_sdk_mapdata_OCMSegmentId_create_handle'));
final _sdkMapdataOcmsegmentidReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_OCMSegmentId_release_handle'));
final _sdkMapdataOcmsegmentidGetFieldtilePartitionId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_OCMSegmentId_get_field_tilePartitionId'));
final _sdkMapdataOcmsegmentidGetFieldlocalId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_OCMSegmentId_get_field_localId'));



Pointer<Void> sdkMapdataOcmsegmentidToFfi(OCMSegmentId value) {
  final _tilePartitionIdHandle = (value.tilePartitionId);
  final _localIdHandle = (value.localId);
  final _result = _sdkMapdataOcmsegmentidCreateHandle(_tilePartitionIdHandle, _localIdHandle);
  
  
  return _result;
}

OCMSegmentId sdkMapdataOcmsegmentidFromFfi(Pointer<Void> handle) {
  final _tilePartitionIdHandle = _sdkMapdataOcmsegmentidGetFieldtilePartitionId(handle);
  final _localIdHandle = _sdkMapdataOcmsegmentidGetFieldlocalId(handle);
  try {
    return OCMSegmentId._(
      (_tilePartitionIdHandle), 
      (_localIdHandle)
    );
  } finally {
    
    
  }
}

void sdkMapdataOcmsegmentidReleaseFfiHandle(Pointer<Void> handle) => _sdkMapdataOcmsegmentidReleaseHandle(handle);

// Nullable OCMSegmentId

final _sdkMapdataOcmsegmentidCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_OCMSegmentId_create_handle_nullable'));
final _sdkMapdataOcmsegmentidReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_OCMSegmentId_release_handle_nullable'));
final _sdkMapdataOcmsegmentidGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_OCMSegmentId_get_value_nullable'));

Pointer<Void> sdkMapdataOcmsegmentidToFfiNullable(OCMSegmentId? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapdataOcmsegmentidToFfi(value);
  final result = _sdkMapdataOcmsegmentidCreateHandleNullable(_handle);
  sdkMapdataOcmsegmentidReleaseFfiHandle(_handle);
  return result;
}

OCMSegmentId? sdkMapdataOcmsegmentidFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapdataOcmsegmentidGetValueNullable(handle);
  final result = sdkMapdataOcmsegmentidFromFfi(_handle);
  sdkMapdataOcmsegmentidReleaseFfiHandle(_handle);
  return result;
}

void sdkMapdataOcmsegmentidReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapdataOcmsegmentidReleaseHandleNullable(handle);

// End of OCMSegmentId "private" section.


