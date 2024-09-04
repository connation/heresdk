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

/// Options to configure offline routing engine.

class OfflineRoutingEngineOptions {
  /// In-memory cache limit in bytes. If not set, default value of 80 Megabytes is used.
  /// It is clamped from 1 Megabyte to 256 Megabytes.
  int memoryCacheSizeLimitInBytes;

  /// Creates a new instance.

  /// [memoryCacheSizeLimitInBytes] In-memory cache limit in bytes. If not set, default value of 80 Megabytes is used.
  /// It is clamped from 1 Megabyte to 256 Megabytes.

  OfflineRoutingEngineOptions._(this.memoryCacheSizeLimitInBytes);
  OfflineRoutingEngineOptions()
    : memoryCacheSizeLimitInBytes = 0;
}


// OfflineRoutingEngineOptions "private" section, not exported.

final _sdkRoutingOfflineroutingengineoptionsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int64),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_routing_OfflineRoutingEngineOptions_create_handle'));
final _sdkRoutingOfflineroutingengineoptionsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_OfflineRoutingEngineOptions_release_handle'));
final _sdkRoutingOfflineroutingengineoptionsGetFieldmemoryCacheSizeLimitInBytes = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_OfflineRoutingEngineOptions_get_field_memoryCacheSizeLimitInBytes'));



Pointer<Void> sdkRoutingOfflineroutingengineoptionsToFfi(OfflineRoutingEngineOptions value) {
  final _memoryCacheSizeLimitInBytesHandle = (value.memoryCacheSizeLimitInBytes);
  final _result = _sdkRoutingOfflineroutingengineoptionsCreateHandle(_memoryCacheSizeLimitInBytesHandle);
  
  return _result;
}

OfflineRoutingEngineOptions sdkRoutingOfflineroutingengineoptionsFromFfi(Pointer<Void> handle) {
  final _memoryCacheSizeLimitInBytesHandle = _sdkRoutingOfflineroutingengineoptionsGetFieldmemoryCacheSizeLimitInBytes(handle);
  try {
    return OfflineRoutingEngineOptions._(
      (_memoryCacheSizeLimitInBytesHandle)
    );
  } finally {
    
  }
}

void sdkRoutingOfflineroutingengineoptionsReleaseFfiHandle(Pointer<Void> handle) => _sdkRoutingOfflineroutingengineoptionsReleaseHandle(handle);

// Nullable OfflineRoutingEngineOptions

final _sdkRoutingOfflineroutingengineoptionsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_OfflineRoutingEngineOptions_create_handle_nullable'));
final _sdkRoutingOfflineroutingengineoptionsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_OfflineRoutingEngineOptions_release_handle_nullable'));
final _sdkRoutingOfflineroutingengineoptionsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_OfflineRoutingEngineOptions_get_value_nullable'));

Pointer<Void> sdkRoutingOfflineroutingengineoptionsToFfiNullable(OfflineRoutingEngineOptions? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingOfflineroutingengineoptionsToFfi(value);
  final result = _sdkRoutingOfflineroutingengineoptionsCreateHandleNullable(_handle);
  sdkRoutingOfflineroutingengineoptionsReleaseFfiHandle(_handle);
  return result;
}

OfflineRoutingEngineOptions? sdkRoutingOfflineroutingengineoptionsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingOfflineroutingengineoptionsGetValueNullable(handle);
  final result = sdkRoutingOfflineroutingengineoptionsFromFfi(_handle);
  sdkRoutingOfflineroutingengineoptionsReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingOfflineroutingengineoptionsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingOfflineroutingengineoptionsReleaseHandleNullable(handle);

// End of OfflineRoutingEngineOptions "private" section.


