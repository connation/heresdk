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

/// Defines statistics related to the success or failure of patched bundles.
///
/// It can be used to
/// monitor and analyze the reliability of binary patch updates.

class UpdateStatistics {
  /// Number of bundles patched successfully
  int totalPatchedBundlesSuccess;

  /// Number of bundles failed to patch
  int totalPatchedBundlesFail;

  /// Creates a new instance.

  /// [totalPatchedBundlesSuccess] Number of bundles patched successfully

  /// [totalPatchedBundlesFail] Number of bundles failed to patch

  UpdateStatistics._(this.totalPatchedBundlesSuccess, this.totalPatchedBundlesFail);
  UpdateStatistics()
    : totalPatchedBundlesSuccess = 0, totalPatchedBundlesFail = 0;
}


// UpdateStatistics "private" section, not exported.

final _sdkMaploaderUpdatestatisticsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Uint64),
    Pointer<Void> Function(int, int)
  >('here_sdk_sdk_maploader_UpdateStatistics_create_handle'));
final _sdkMaploaderUpdatestatisticsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_UpdateStatistics_release_handle'));
final _sdkMaploaderUpdatestatisticsGetFieldtotalPatchedBundlesSuccess = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_UpdateStatistics_get_field_totalPatchedBundlesSuccess'));
final _sdkMaploaderUpdatestatisticsGetFieldtotalPatchedBundlesFail = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_UpdateStatistics_get_field_totalPatchedBundlesFail'));



Pointer<Void> sdkMaploaderUpdatestatisticsToFfi(UpdateStatistics value) {
  final _totalPatchedBundlesSuccessHandle = (value.totalPatchedBundlesSuccess);
  final _totalPatchedBundlesFailHandle = (value.totalPatchedBundlesFail);
  final _result = _sdkMaploaderUpdatestatisticsCreateHandle(_totalPatchedBundlesSuccessHandle, _totalPatchedBundlesFailHandle);
  
  
  return _result;
}

UpdateStatistics sdkMaploaderUpdatestatisticsFromFfi(Pointer<Void> handle) {
  final _totalPatchedBundlesSuccessHandle = _sdkMaploaderUpdatestatisticsGetFieldtotalPatchedBundlesSuccess(handle);
  final _totalPatchedBundlesFailHandle = _sdkMaploaderUpdatestatisticsGetFieldtotalPatchedBundlesFail(handle);
  try {
    return UpdateStatistics._(
      (_totalPatchedBundlesSuccessHandle), 
      (_totalPatchedBundlesFailHandle)
    );
  } finally {
    
    
  }
}

void sdkMaploaderUpdatestatisticsReleaseFfiHandle(Pointer<Void> handle) => _sdkMaploaderUpdatestatisticsReleaseHandle(handle);

// Nullable UpdateStatistics

final _sdkMaploaderUpdatestatisticsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_UpdateStatistics_create_handle_nullable'));
final _sdkMaploaderUpdatestatisticsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_UpdateStatistics_release_handle_nullable'));
final _sdkMaploaderUpdatestatisticsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_UpdateStatistics_get_value_nullable'));

Pointer<Void> sdkMaploaderUpdatestatisticsToFfiNullable(UpdateStatistics? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMaploaderUpdatestatisticsToFfi(value);
  final result = _sdkMaploaderUpdatestatisticsCreateHandleNullable(_handle);
  sdkMaploaderUpdatestatisticsReleaseFfiHandle(_handle);
  return result;
}

UpdateStatistics? sdkMaploaderUpdatestatisticsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMaploaderUpdatestatisticsGetValueNullable(handle);
  final result = sdkMaploaderUpdatestatisticsFromFfi(_handle);
  sdkMaploaderUpdatestatisticsReleaseFfiHandle(_handle);
  return result;
}

void sdkMaploaderUpdatestatisticsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMaploaderUpdatestatisticsReleaseHandleNullable(handle);

// End of UpdateStatistics "private" section.


