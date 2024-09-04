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
import 'package:here_sdk/src/builtin_types__conversion.dart';

/// Note: This is a beta release of this feature, so there could be a few bugs and unexpected
/// behaviors.
///
/// Related APIs may change for new releases without a deprecation process.
abstract class OfflineSearchIndex {

}

/// Shows the operation that is performed over index.
enum OfflineSearchIndexOperation {
    /// The index is being created. This happens when indexing is enabled and persistent map
    /// contents have been modified.
    creating,
    /// The index is being removed. This happens when indexing has been disabled or
    /// if persistent map contents have been removed.
    removing
}

// OfflineSearchIndexOperation "private" section, not exported.

int sdkSearchOfflinesearchindexOperationToFfi(OfflineSearchIndexOperation value) {
  switch (value) {
  case OfflineSearchIndexOperation.creating:
    return 0;
  case OfflineSearchIndexOperation.removing:
    return 1;
  default:
    throw StateError("Invalid enum value $value for OfflineSearchIndexOperation enum.");
  }
}

OfflineSearchIndexOperation sdkSearchOfflinesearchindexOperationFromFfi(int handle) {
  switch (handle) {
  case 0:
    return OfflineSearchIndexOperation.creating;
  case 1:
    return OfflineSearchIndexOperation.removing;
  default:
    throw StateError("Invalid numeric value $handle for OfflineSearchIndexOperation enum.");
  }
}

void sdkSearchOfflinesearchindexOperationReleaseFfiHandle(int handle) {}

final _sdkSearchOfflinesearchindexOperationCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_search_OfflineSearchIndex_Operation_create_handle_nullable'));
final _sdkSearchOfflinesearchindexOperationReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_OfflineSearchIndex_Operation_release_handle_nullable'));
final _sdkSearchOfflinesearchindexOperationGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_OfflineSearchIndex_Operation_get_value_nullable'));

Pointer<Void> sdkSearchOfflinesearchindexOperationToFfiNullable(OfflineSearchIndexOperation? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchOfflinesearchindexOperationToFfi(value);
  final result = _sdkSearchOfflinesearchindexOperationCreateHandleNullable(_handle);
  sdkSearchOfflinesearchindexOperationReleaseFfiHandle(_handle);
  return result;
}

OfflineSearchIndexOperation? sdkSearchOfflinesearchindexOperationFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchOfflinesearchindexOperationGetValueNullable(handle);
  final result = sdkSearchOfflinesearchindexOperationFromFfi(_handle);
  sdkSearchOfflinesearchindexOperationReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchOfflinesearchindexOperationReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchOfflinesearchindexOperationReleaseHandleNullable(handle);

// End of OfflineSearchIndexOperation "private" section.
/// Error corresponding to the offline search operation.
enum OfflineSearchIndexError {
    /// Unreachable `SDKOptions.persistentMapStoragePath` or lacking required permission
    /// to generate index inside.
    invalidPersistentPath,
    /// Failed to get installed regions in protected cache.
    /// Any previous available index would be deleted when this error occurs.
    /// Use method `MapDownloader.getInitialPersistentMapStatus` to get the status of the
    /// map and check `maploader.PersistentMapStatus` for exact healing procedure for specific status.
    mapError,
    /// Unable to generate index due to failed database operation.
    /// Any previous available index would be deleted when this error occurs.
    /// Call `MapDownloader.repairPersistentMap` to retry index generation.
    databaseError,
    /// Indexing operation cancelled due to OS killing the application or when a new indexing operation is invoked by SDK
    /// after finishing a map operation while the previous indexing operation was in progress.
    /// Any previous available index would be deleted when this error occurs.
    /// In later case, SDK would finish the latest indexing operation successfully and it can be tracked through
    /// `OfflineSearchIndexListener`, otherwise call `MapDownloader.repairPersistentMap` to retry index generation.
    operationCancelled,
    /// Internal error occurred.
    internalError
}

// OfflineSearchIndexError "private" section, not exported.

int sdkSearchOfflinesearchindexErrorToFfi(OfflineSearchIndexError value) {
  switch (value) {
  case OfflineSearchIndexError.invalidPersistentPath:
    return 0;
  case OfflineSearchIndexError.mapError:
    return 1;
  case OfflineSearchIndexError.databaseError:
    return 2;
  case OfflineSearchIndexError.operationCancelled:
    return 3;
  case OfflineSearchIndexError.internalError:
    return 4;
  default:
    throw StateError("Invalid enum value $value for OfflineSearchIndexError enum.");
  }
}

OfflineSearchIndexError sdkSearchOfflinesearchindexErrorFromFfi(int handle) {
  switch (handle) {
  case 0:
    return OfflineSearchIndexError.invalidPersistentPath;
  case 1:
    return OfflineSearchIndexError.mapError;
  case 2:
    return OfflineSearchIndexError.databaseError;
  case 3:
    return OfflineSearchIndexError.operationCancelled;
  case 4:
    return OfflineSearchIndexError.internalError;
  default:
    throw StateError("Invalid numeric value $handle for OfflineSearchIndexError enum.");
  }
}

void sdkSearchOfflinesearchindexErrorReleaseFfiHandle(int handle) {}

final _sdkSearchOfflinesearchindexErrorCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_search_OfflineSearchIndex_Error_create_handle_nullable'));
final _sdkSearchOfflinesearchindexErrorReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_OfflineSearchIndex_Error_release_handle_nullable'));
final _sdkSearchOfflinesearchindexErrorGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_OfflineSearchIndex_Error_get_value_nullable'));

Pointer<Void> sdkSearchOfflinesearchindexErrorToFfiNullable(OfflineSearchIndexError? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchOfflinesearchindexErrorToFfi(value);
  final result = _sdkSearchOfflinesearchindexErrorCreateHandleNullable(_handle);
  sdkSearchOfflinesearchindexErrorReleaseFfiHandle(_handle);
  return result;
}

OfflineSearchIndexError? sdkSearchOfflinesearchindexErrorFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchOfflinesearchindexErrorGetValueNullable(handle);
  final result = sdkSearchOfflinesearchindexErrorFromFfi(_handle);
  sdkSearchOfflinesearchindexErrorReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchOfflinesearchindexErrorReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchOfflinesearchindexErrorReleaseHandleNullable(handle);

// End of OfflineSearchIndexError "private" section.
/// Options to set indexing for offline search.

class OfflineSearchIndexOptions {
  /// Sets whether indexing is enabled or disabled. Defaults to false.
  bool enabled;

  /// Creates a new instance.

  /// [enabled] Sets whether indexing is enabled or disabled. Defaults to false.

  OfflineSearchIndexOptions._(this.enabled);
  OfflineSearchIndexOptions()
    : enabled = true;
}


// OfflineSearchIndexOptions "private" section, not exported.

final _sdkSearchOfflinesearchindexOptionsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint8),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_search_OfflineSearchIndex_Options_create_handle'));
final _sdkSearchOfflinesearchindexOptionsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_OfflineSearchIndex_Options_release_handle'));
final _sdkSearchOfflinesearchindexOptionsGetFieldenabled = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_OfflineSearchIndex_Options_get_field_enabled'));



Pointer<Void> sdkSearchOfflinesearchindexOptionsToFfi(OfflineSearchIndexOptions value) {
  final _enabledHandle = booleanToFfi(value.enabled);
  final _result = _sdkSearchOfflinesearchindexOptionsCreateHandle(_enabledHandle);
  booleanReleaseFfiHandle(_enabledHandle);
  return _result;
}

OfflineSearchIndexOptions sdkSearchOfflinesearchindexOptionsFromFfi(Pointer<Void> handle) {
  final _enabledHandle = _sdkSearchOfflinesearchindexOptionsGetFieldenabled(handle);
  try {
    return OfflineSearchIndexOptions._(
      booleanFromFfi(_enabledHandle)
    );
  } finally {
    booleanReleaseFfiHandle(_enabledHandle);
  }
}

void sdkSearchOfflinesearchindexOptionsReleaseFfiHandle(Pointer<Void> handle) => _sdkSearchOfflinesearchindexOptionsReleaseHandle(handle);

// Nullable OfflineSearchIndexOptions

final _sdkSearchOfflinesearchindexOptionsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_OfflineSearchIndex_Options_create_handle_nullable'));
final _sdkSearchOfflinesearchindexOptionsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_OfflineSearchIndex_Options_release_handle_nullable'));
final _sdkSearchOfflinesearchindexOptionsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_OfflineSearchIndex_Options_get_value_nullable'));

Pointer<Void> sdkSearchOfflinesearchindexOptionsToFfiNullable(OfflineSearchIndexOptions? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchOfflinesearchindexOptionsToFfi(value);
  final result = _sdkSearchOfflinesearchindexOptionsCreateHandleNullable(_handle);
  sdkSearchOfflinesearchindexOptionsReleaseFfiHandle(_handle);
  return result;
}

OfflineSearchIndexOptions? sdkSearchOfflinesearchindexOptionsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchOfflinesearchindexOptionsGetValueNullable(handle);
  final result = sdkSearchOfflinesearchindexOptionsFromFfi(_handle);
  sdkSearchOfflinesearchindexOptionsReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchOfflinesearchindexOptionsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchOfflinesearchindexOptionsReleaseHandleNullable(handle);

// End of OfflineSearchIndexOptions "private" section.

// OfflineSearchIndex "private" section, not exported.

final _sdkSearchOfflinesearchindexRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_search_OfflineSearchIndex_register_finalizer'));
final _sdkSearchOfflinesearchindexCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_OfflineSearchIndex_copy_handle'));
final _sdkSearchOfflinesearchindexReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_OfflineSearchIndex_release_handle'));


class OfflineSearchIndex$Impl extends __lib.NativeBase implements OfflineSearchIndex {

  OfflineSearchIndex$Impl(Pointer<Void> handle) : super(handle);


}

Pointer<Void> sdkSearchOfflinesearchindexToFfi(OfflineSearchIndex value) =>
  _sdkSearchOfflinesearchindexCopyHandle((value as __lib.NativeBase).handle);

OfflineSearchIndex sdkSearchOfflinesearchindexFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is OfflineSearchIndex) return instance;

  final _copiedHandle = _sdkSearchOfflinesearchindexCopyHandle(handle);
  final result = OfflineSearchIndex$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkSearchOfflinesearchindexRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkSearchOfflinesearchindexReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkSearchOfflinesearchindexReleaseHandle(handle);

Pointer<Void> sdkSearchOfflinesearchindexToFfiNullable(OfflineSearchIndex? value) =>
  value != null ? sdkSearchOfflinesearchindexToFfi(value) : Pointer<Void>.fromAddress(0);

OfflineSearchIndex? sdkSearchOfflinesearchindexFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkSearchOfflinesearchindexFromFfi(handle) : null;

void sdkSearchOfflinesearchindexReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchOfflinesearchindexReleaseHandle(handle);

// End of OfflineSearchIndex "private" section.


