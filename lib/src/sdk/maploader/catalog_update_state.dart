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

/// Represents the state of catalog map updates.
enum CatalogUpdateState {
    /// Previously downloaded catalog version can be updated to their latest version.
    updateAvailable,
    /// Previous catalog downloading is ongoing or interrupted.
    pendingUpdate,
    /// When more than one catalog is used or configured,
    /// and the update process for it fails, then that specific catalog goes in PENDING_UPDATE state.
    /// A user should not update any other catalog until the catalog in PENDING_UPDATE state is updated.
    /// Other catalogs will be set to UPDATE_BLOCKED_AS_ANOTHER_PENDING until the update process has been completed.
    updateBlockedAsAnotherPending,
    /// State is not fetched, so unknown
    unknownState
}

// CatalogUpdateState "private" section, not exported.

int sdkMaploaderCatalogupdatestateToFfi(CatalogUpdateState value) {
  switch (value) {
  case CatalogUpdateState.updateAvailable:
    return 0;
  case CatalogUpdateState.pendingUpdate:
    return 1;
  case CatalogUpdateState.updateBlockedAsAnotherPending:
    return 2;
  case CatalogUpdateState.unknownState:
    return 3;
  default:
    throw StateError("Invalid enum value $value for CatalogUpdateState enum.");
  }
}

CatalogUpdateState sdkMaploaderCatalogupdatestateFromFfi(int handle) {
  switch (handle) {
  case 0:
    return CatalogUpdateState.updateAvailable;
  case 1:
    return CatalogUpdateState.pendingUpdate;
  case 2:
    return CatalogUpdateState.updateBlockedAsAnotherPending;
  case 3:
    return CatalogUpdateState.unknownState;
  default:
    throw StateError("Invalid numeric value $handle for CatalogUpdateState enum.");
  }
}

void sdkMaploaderCatalogupdatestateReleaseFfiHandle(int handle) {}

final _sdkMaploaderCatalogupdatestateCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_maploader_CatalogUpdateState_create_handle_nullable'));
final _sdkMaploaderCatalogupdatestateReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_CatalogUpdateState_release_handle_nullable'));
final _sdkMaploaderCatalogupdatestateGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_CatalogUpdateState_get_value_nullable'));

Pointer<Void> sdkMaploaderCatalogupdatestateToFfiNullable(CatalogUpdateState? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMaploaderCatalogupdatestateToFfi(value);
  final result = _sdkMaploaderCatalogupdatestateCreateHandleNullable(_handle);
  sdkMaploaderCatalogupdatestateReleaseFfiHandle(_handle);
  return result;
}

CatalogUpdateState? sdkMaploaderCatalogupdatestateFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMaploaderCatalogupdatestateGetValueNullable(handle);
  final result = sdkMaploaderCatalogupdatestateFromFfi(_handle);
  sdkMaploaderCatalogupdatestateReleaseFfiHandle(_handle);
  return result;
}

void sdkMaploaderCatalogupdatestateReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMaploaderCatalogupdatestateReleaseHandleNullable(handle);

// End of CatalogUpdateState "private" section.


