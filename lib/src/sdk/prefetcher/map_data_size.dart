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

/// Represents map data size.

class MapDataSize {
  /// Size of the data that will be transferred over the internet.
  int networkSizeInBytes;

  /// Size on the disk that is needed to store the data.
  int diskSizeInBytes;

  /// Creates a new instance.

  /// [networkSizeInBytes] Size of the data that will be transferred over the internet.

  /// [diskSizeInBytes] Size on the disk that is needed to store the data.

  MapDataSize._(this.networkSizeInBytes, this.diskSizeInBytes);
  MapDataSize()
    : networkSizeInBytes = 0, diskSizeInBytes = 0;
}


// MapDataSize "private" section, not exported.

final _sdkPrefetcherMapdatasizeCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Uint64),
    Pointer<Void> Function(int, int)
  >('here_sdk_sdk_prefetcher_MapDataSize_create_handle'));
final _sdkPrefetcherMapdatasizeReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_prefetcher_MapDataSize_release_handle'));
final _sdkPrefetcherMapdatasizeGetFieldnetworkSizeInBytes = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_prefetcher_MapDataSize_get_field_networkSizeInBytes'));
final _sdkPrefetcherMapdatasizeGetFielddiskSizeInBytes = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_prefetcher_MapDataSize_get_field_diskSizeInBytes'));



Pointer<Void> sdkPrefetcherMapdatasizeToFfi(MapDataSize value) {
  final _networkSizeInBytesHandle = (value.networkSizeInBytes);
  final _diskSizeInBytesHandle = (value.diskSizeInBytes);
  final _result = _sdkPrefetcherMapdatasizeCreateHandle(_networkSizeInBytesHandle, _diskSizeInBytesHandle);
  
  
  return _result;
}

MapDataSize sdkPrefetcherMapdatasizeFromFfi(Pointer<Void> handle) {
  final _networkSizeInBytesHandle = _sdkPrefetcherMapdatasizeGetFieldnetworkSizeInBytes(handle);
  final _diskSizeInBytesHandle = _sdkPrefetcherMapdatasizeGetFielddiskSizeInBytes(handle);
  try {
    return MapDataSize._(
      (_networkSizeInBytesHandle), 
      (_diskSizeInBytesHandle)
    );
  } finally {
    
    
  }
}

void sdkPrefetcherMapdatasizeReleaseFfiHandle(Pointer<Void> handle) => _sdkPrefetcherMapdatasizeReleaseHandle(handle);

// Nullable MapDataSize

final _sdkPrefetcherMapdatasizeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_prefetcher_MapDataSize_create_handle_nullable'));
final _sdkPrefetcherMapdatasizeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_prefetcher_MapDataSize_release_handle_nullable'));
final _sdkPrefetcherMapdatasizeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_prefetcher_MapDataSize_get_value_nullable'));

Pointer<Void> sdkPrefetcherMapdatasizeToFfiNullable(MapDataSize? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkPrefetcherMapdatasizeToFfi(value);
  final result = _sdkPrefetcherMapdatasizeCreateHandleNullable(_handle);
  sdkPrefetcherMapdatasizeReleaseFfiHandle(_handle);
  return result;
}

MapDataSize? sdkPrefetcherMapdatasizeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkPrefetcherMapdatasizeGetValueNullable(handle);
  final result = sdkPrefetcherMapdatasizeFromFfi(_handle);
  sdkPrefetcherMapdatasizeReleaseFfiHandle(_handle);
  return result;
}

void sdkPrefetcherMapdatasizeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkPrefetcherMapdatasizeReleaseHandleNullable(handle);

// End of MapDataSize "private" section.


