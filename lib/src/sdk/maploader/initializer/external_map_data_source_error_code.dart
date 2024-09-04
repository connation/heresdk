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

/// Describes the reason for failing to configure [SDKNativeEngine] with external map data source.
///
/// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
/// Related APIs may change for new releases without a deprecation process.
enum ExternalMapDataSourceErrorCode {
    /// Internal error occurred.
    internalError,
    /// Error while adding catalog to `DataStoreClient`.
    /// Verify the same catalogs are added to the `DataStoreServer` instance on the server side.
    addCatalogError
}

// ExternalMapDataSourceErrorCode "private" section, not exported.

int sdkMaploaderInitializerExternalmapdatasourceerrorcodeToFfi(ExternalMapDataSourceErrorCode value) {
  switch (value) {
  case ExternalMapDataSourceErrorCode.internalError:
    return 1;
  case ExternalMapDataSourceErrorCode.addCatalogError:
    return 2;
  default:
    throw StateError("Invalid enum value $value for ExternalMapDataSourceErrorCode enum.");
  }
}

ExternalMapDataSourceErrorCode sdkMaploaderInitializerExternalmapdatasourceerrorcodeFromFfi(int handle) {
  switch (handle) {
  case 1:
    return ExternalMapDataSourceErrorCode.internalError;
  case 2:
    return ExternalMapDataSourceErrorCode.addCatalogError;
  default:
    throw StateError("Invalid numeric value $handle for ExternalMapDataSourceErrorCode enum.");
  }
}

void sdkMaploaderInitializerExternalmapdatasourceerrorcodeReleaseFfiHandle(int handle) {}

final _sdkMaploaderInitializerExternalmapdatasourceerrorcodeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_maploader_initializer_ExternalMapDataSourceErrorCode_create_handle_nullable'));
final _sdkMaploaderInitializerExternalmapdatasourceerrorcodeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_initializer_ExternalMapDataSourceErrorCode_release_handle_nullable'));
final _sdkMaploaderInitializerExternalmapdatasourceerrorcodeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_initializer_ExternalMapDataSourceErrorCode_get_value_nullable'));

Pointer<Void> sdkMaploaderInitializerExternalmapdatasourceerrorcodeToFfiNullable(ExternalMapDataSourceErrorCode? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMaploaderInitializerExternalmapdatasourceerrorcodeToFfi(value);
  final result = _sdkMaploaderInitializerExternalmapdatasourceerrorcodeCreateHandleNullable(_handle);
  sdkMaploaderInitializerExternalmapdatasourceerrorcodeReleaseFfiHandle(_handle);
  return result;
}

ExternalMapDataSourceErrorCode? sdkMaploaderInitializerExternalmapdatasourceerrorcodeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMaploaderInitializerExternalmapdatasourceerrorcodeGetValueNullable(handle);
  final result = sdkMaploaderInitializerExternalmapdatasourceerrorcodeFromFfi(_handle);
  sdkMaploaderInitializerExternalmapdatasourceerrorcodeReleaseFfiHandle(_handle);
  return result;
}

void sdkMaploaderInitializerExternalmapdatasourceerrorcodeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMaploaderInitializerExternalmapdatasourceerrorcodeReleaseHandleNullable(handle);

// End of ExternalMapDataSourceErrorCode "private" section.


