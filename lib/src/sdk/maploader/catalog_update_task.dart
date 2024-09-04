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

/// A class to control the catalog update process.
abstract class CatalogUpdateTask {

  /// Cancels the ongoing catalog update operation.
  ///
  /// Operation cannot be resumed afterwards.
  /// It will do nothing if the task was already cancelled or has been completed.
  /// Status of the call will be reported via [CatalogUpdateProgressListener.onComplete].
  /// [MapLoaderError.operationCancelled] will be reported for a successful cancel operation.
  ///
  void cancel();
  /// Pauses the ongoing map update operation.
  ///
  /// Operation can be resumed afterwards.
  /// It will do nothing if the operation is not in a running state.
  /// Status of the call will be reported via [CatalogUpdateProgressListener.onPause].
  ///
  void pause();
  /// Resumes paused map update operation.
  ///
  /// It will do nothing if operation is not in
  /// paused state.
  ///
  void resume();
}


// CatalogUpdateTask "private" section, not exported.

final _sdkMaploaderCatalogupdatetaskRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_maploader_CatalogUpdateTask_register_finalizer'));
final _sdkMaploaderCatalogupdatetaskCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_CatalogUpdateTask_copy_handle'));
final _sdkMaploaderCatalogupdatetaskReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_CatalogUpdateTask_release_handle'));





class CatalogUpdateTask$Impl extends __lib.NativeBase implements CatalogUpdateTask {

  CatalogUpdateTask$Impl(Pointer<Void> handle) : super(handle);

  @override
  void cancel() {
    final _cancelFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_maploader_CatalogUpdateTask_cancel'));
    final _handle = this.handle;
    _cancelFfi(_handle, __lib.LibraryContext.isolateId);

  }

  @override
  void pause() {
    final _pauseFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_maploader_CatalogUpdateTask_pause'));
    final _handle = this.handle;
    _pauseFfi(_handle, __lib.LibraryContext.isolateId);

  }

  @override
  void resume() {
    final _resumeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_maploader_CatalogUpdateTask_resume'));
    final _handle = this.handle;
    _resumeFfi(_handle, __lib.LibraryContext.isolateId);

  }


}

Pointer<Void> sdkMaploaderCatalogupdatetaskToFfi(CatalogUpdateTask value) =>
  _sdkMaploaderCatalogupdatetaskCopyHandle((value as __lib.NativeBase).handle);

CatalogUpdateTask sdkMaploaderCatalogupdatetaskFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is CatalogUpdateTask) return instance;

  final _copiedHandle = _sdkMaploaderCatalogupdatetaskCopyHandle(handle);
  final result = CatalogUpdateTask$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMaploaderCatalogupdatetaskRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMaploaderCatalogupdatetaskReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMaploaderCatalogupdatetaskReleaseHandle(handle);

Pointer<Void> sdkMaploaderCatalogupdatetaskToFfiNullable(CatalogUpdateTask? value) =>
  value != null ? sdkMaploaderCatalogupdatetaskToFfi(value) : Pointer<Void>.fromAddress(0);

CatalogUpdateTask? sdkMaploaderCatalogupdatetaskFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMaploaderCatalogupdatetaskFromFfi(handle) : null;

void sdkMaploaderCatalogupdatetaskReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMaploaderCatalogupdatetaskReleaseHandle(handle);

// End of CatalogUpdateTask "private" section.


