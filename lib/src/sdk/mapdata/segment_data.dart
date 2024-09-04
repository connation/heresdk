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
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/geo_polyline.dart';
import 'package:here_sdk/src/sdk/mapdata/o_c_m_segment_id.dart';
import 'package:here_sdk/src/sdk/mapdata/segment_span_data.dart';
import 'package:here_sdk/src/sdk/routing/segment_reference.dart';

/// Contains the requested information for a segment
///
/// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
///
/// Related APIs may change for new releases without a deprecation process.
abstract class SegmentData {

  /// Gets the [OCMSegmentId] object representing the the segment.
  OCMSegmentId get ocmSegmentId;

  /// Gets the [SegmentReference] object representing the the segment.
  SegmentReference get segmentReference;

  /// Gets the [GeoPolyline] object representing the polyline of this segment.
  GeoPolyline get polyline;

  /// Gets the length of this segment in meters.
  int get lengthInMeters;

  List<SegmentSpanData> get spans;

}


// SegmentData "private" section, not exported.

final _sdkMapdataSegmentdataRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapdata_SegmentData_register_finalizer'));
final _sdkMapdataSegmentdataCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_SegmentData_copy_handle'));
final _sdkMapdataSegmentdataReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_SegmentData_release_handle'));


class SegmentData$Impl extends __lib.NativeBase implements SegmentData {

  SegmentData$Impl(Pointer<Void> handle) : super(handle);

  @override
  OCMSegmentId get ocmSegmentId {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapdata_SegmentData_ocmSegmentId_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkMapdataOcmsegmentidFromFfi(__resultHandle);
    } finally {
      sdkMapdataOcmsegmentidReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  SegmentReference get segmentReference {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapdata_SegmentData_segmentReference_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkRoutingSegmentreferenceFromFfi(__resultHandle);
    } finally {
      sdkRoutingSegmentreferenceReleaseFfiHandle(__resultHandle);

    }

  }



  late GeoPolyline _polylineCache;
  bool _polylineIsCached = false;
  @override

  GeoPolyline get polyline {
    if (!_polylineIsCached) {
      final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapdata_SegmentData_polyline_get'));
      final __resultHandle = _getFfi(this.handle, __lib.LibraryContext.isolateId);
      try {
        _polylineCache = sdkCoreGeopolylineFromFfi(__resultHandle);
      } finally {
        sdkCoreGeopolylineReleaseFfiHandle(__resultHandle);

      }
      _polylineIsCached = true;
    }
    return _polylineCache;
  }

  @override
  int get lengthInMeters {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_mapdata_SegmentData_lengthInMeters_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }


  @override
  List<SegmentSpanData> get spans {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapdata_SegmentData_spans_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return heresdkMapdataBindingslistofSdkMapdataSegmentspandataFromFfi(__resultHandle);
    } finally {
      heresdkMapdataBindingslistofSdkMapdataSegmentspandataReleaseFfiHandle(__resultHandle);

    }

  }



}

Pointer<Void> sdkMapdataSegmentdataToFfi(SegmentData value) =>
  _sdkMapdataSegmentdataCopyHandle((value as __lib.NativeBase).handle);

SegmentData sdkMapdataSegmentdataFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is SegmentData) return instance;

  final _copiedHandle = _sdkMapdataSegmentdataCopyHandle(handle);
  final result = SegmentData$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMapdataSegmentdataRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapdataSegmentdataReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapdataSegmentdataReleaseHandle(handle);

Pointer<Void> sdkMapdataSegmentdataToFfiNullable(SegmentData? value) =>
  value != null ? sdkMapdataSegmentdataToFfi(value) : Pointer<Void>.fromAddress(0);

SegmentData? sdkMapdataSegmentdataFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapdataSegmentdataFromFfi(handle) : null;

void sdkMapdataSegmentdataReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapdataSegmentdataReleaseHandle(handle);

// End of SegmentData "private" section.


