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
import 'package:here_sdk/src/_type_repository.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/maploader/map_loader_error.dart';
import 'package:here_sdk/src/sdk/maploader/region_id.dart';

/// Abstract class to get notified on status updates
/// when updating catalog, previously downloaded by [MapDownloader].
abstract class CatalogUpdateProgressListener {
  /// Abstract class to get notified on status updates
  /// when updating catalog, previously downloaded by [MapDownloader].

  factory CatalogUpdateProgressListener(
    void Function(RegionId, int) onProgressLambda,
    void Function(MapLoaderError?) onPauseLambda,
    void Function(MapLoaderError?) onCompleteLambda,
    void Function() onResumeLambda,

  ) => CatalogUpdateProgressListener$Lambdas(
    onProgressLambda,
    onPauseLambda,
    onCompleteLambda,
    onResumeLambda,

  );

  /// Called multiple times to indicate the update progress.
  ///
  /// Invoked on the main thread.
  ///
  /// [region] Represents an id of region status update is related to.
  ///
  /// [percentage] Represents a percentage of catalog data which has been updated.
  ///
  void onProgress(RegionId region, int percentage);
  /// Called when update is paused.
  ///
  /// Invoked on the main thread.
  ///
  /// [error] Populated when a retryable error is the reason for a pause. A retryable error can happen,
  /// when, for example, the HERE SDK tries too often to resume a download that was paused due to a lost connection.
  /// In general, the HERE SDK will try a few times, before the update is paused.
  /// This error value gives a hint on the reason for the necessary retry operation.
  /// A paused download can be resumed by the user at a later time.
  /// It is 'null' when [CatalogUpdateTask.pauseWithCompaction] was called by the user.
  ///
  void onPause(MapLoaderError? error);
  /// Called after the update process for all regions has been completed.
  ///
  /// Invoked on the main thread.
  ///
  /// [error] Represents an error in case of a failure.
  /// If an error occurs, the operation cannot be resumed later.
  /// It is `null` for an operation that succeeds.
  ///
  void onComplete(MapLoaderError? error);
  /// Called when a paused map update is resumed.
  ///
  void onResume();
}


// CatalogUpdateProgressListener "private" section, not exported.

final _sdkMaploaderCatalogupdateprogresslistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_maploader_CatalogUpdateProgressListener_register_finalizer'));
final _sdkMaploaderCatalogupdateprogresslistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_CatalogUpdateProgressListener_copy_handle'));
final _sdkMaploaderCatalogupdateprogresslistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_CatalogUpdateProgressListener_release_handle'));
final _sdkMaploaderCatalogupdateprogresslistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer, Pointer, Pointer)
  >('here_sdk_sdk_maploader_CatalogUpdateProgressListener_create_proxy'));
final _sdkMaploaderCatalogupdateprogresslistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_CatalogUpdateProgressListener_get_type_id'));





class CatalogUpdateProgressListener$Lambdas implements CatalogUpdateProgressListener {
  void Function(RegionId, int) onProgressLambda;
  void Function(MapLoaderError?) onPauseLambda;
  void Function(MapLoaderError?) onCompleteLambda;
  void Function() onResumeLambda;

  CatalogUpdateProgressListener$Lambdas(
    this.onProgressLambda,
    this.onPauseLambda,
    this.onCompleteLambda,
    this.onResumeLambda,

  );

  @override
  void onProgress(RegionId region, int percentage) =>
    onProgressLambda(region, percentage);
  @override
  void onPause(MapLoaderError? error) =>
    onPauseLambda(error);
  @override
  void onComplete(MapLoaderError? error) =>
    onCompleteLambda(error);
  @override
  void onResume() =>
    onResumeLambda();
}

class CatalogUpdateProgressListener$Impl extends __lib.NativeBase implements CatalogUpdateProgressListener {

  CatalogUpdateProgressListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onProgress(RegionId region, int percentage) {
    final _onProgressFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Int32), void Function(Pointer<Void>, int, Pointer<Void>, int)>('here_sdk_sdk_maploader_CatalogUpdateProgressListener_onProgress__RegionId_Int'));
    final _regionHandle = sdkMaploaderRegionidToFfi(region);
    final _percentageHandle = (percentage);
    final _handle = this.handle;
    _onProgressFfi(_handle, __lib.LibraryContext.isolateId, _regionHandle, _percentageHandle);
    sdkMaploaderRegionidReleaseFfiHandle(_regionHandle);


  }

  @override
  void onPause(MapLoaderError? error) {
    final _onPauseFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_maploader_CatalogUpdateProgressListener_onPause__MapLoaderError_'));
    final _errorHandle = sdkMaploaderMaploadererrorToFfiNullable(error);
    final _handle = this.handle;
    _onPauseFfi(_handle, __lib.LibraryContext.isolateId, _errorHandle);
    sdkMaploaderMaploadererrorReleaseFfiHandleNullable(_errorHandle);

  }

  @override
  void onComplete(MapLoaderError? error) {
    final _onCompleteFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_maploader_CatalogUpdateProgressListener_onComplete__MapLoaderError_'));
    final _errorHandle = sdkMaploaderMaploadererrorToFfiNullable(error);
    final _handle = this.handle;
    _onCompleteFfi(_handle, __lib.LibraryContext.isolateId, _errorHandle);
    sdkMaploaderMaploadererrorReleaseFfiHandleNullable(_errorHandle);

  }

  @override
  void onResume() {
    final _onResumeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_maploader_CatalogUpdateProgressListener_onResume'));
    final _handle = this.handle;
    _onResumeFfi(_handle, __lib.LibraryContext.isolateId);

  }


}

int _sdkMaploaderCatalogupdateprogresslisteneronProgressStatic(Object _obj, Pointer<Void> region, int percentage) {

  try {
    (_obj as CatalogUpdateProgressListener).onProgress(sdkMaploaderRegionidFromFfi(region), (percentage));
  } finally {
    sdkMaploaderRegionidReleaseFfiHandle(region);
    
  }
  return 0;
}
int _sdkMaploaderCatalogupdateprogresslisteneronPauseStatic(Object _obj, Pointer<Void> error) {

  try {
    (_obj as CatalogUpdateProgressListener).onPause(sdkMaploaderMaploadererrorFromFfiNullable(error));
  } finally {
    sdkMaploaderMaploadererrorReleaseFfiHandleNullable(error);
  }
  return 0;
}
int _sdkMaploaderCatalogupdateprogresslisteneronCompleteStatic(Object _obj, Pointer<Void> error) {

  try {
    (_obj as CatalogUpdateProgressListener).onComplete(sdkMaploaderMaploadererrorFromFfiNullable(error));
  } finally {
    sdkMaploaderMaploadererrorReleaseFfiHandleNullable(error);
  }
  return 0;
}
int _sdkMaploaderCatalogupdateprogresslisteneronResumeStatic(Object _obj) {

  try {
    (_obj as CatalogUpdateProgressListener).onResume();
  } finally {
  }
  return 0;
}


Pointer<Void> sdkMaploaderCatalogupdateprogresslistenerToFfi(CatalogUpdateProgressListener value) {
  if (value is __lib.NativeBase) return _sdkMaploaderCatalogupdateprogresslistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkMaploaderCatalogupdateprogresslistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>, Int32)>(_sdkMaploaderCatalogupdateprogresslisteneronProgressStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkMaploaderCatalogupdateprogresslisteneronPauseStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkMaploaderCatalogupdateprogresslisteneronCompleteStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle)>(_sdkMaploaderCatalogupdateprogresslisteneronResumeStatic, __lib.unknownError)
  );

  return result;
}

CatalogUpdateProgressListener sdkMaploaderCatalogupdateprogresslistenerFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is CatalogUpdateProgressListener) return instance;

  final _typeIdHandle = _sdkMaploaderCatalogupdateprogresslistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkMaploaderCatalogupdateprogresslistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : CatalogUpdateProgressListener$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMaploaderCatalogupdateprogresslistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMaploaderCatalogupdateprogresslistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMaploaderCatalogupdateprogresslistenerReleaseHandle(handle);

Pointer<Void> sdkMaploaderCatalogupdateprogresslistenerToFfiNullable(CatalogUpdateProgressListener? value) =>
  value != null ? sdkMaploaderCatalogupdateprogresslistenerToFfi(value) : Pointer<Void>.fromAddress(0);

CatalogUpdateProgressListener? sdkMaploaderCatalogupdateprogresslistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMaploaderCatalogupdateprogresslistenerFromFfi(handle) : null;

void sdkMaploaderCatalogupdateprogresslistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMaploaderCatalogupdateprogresslistenerReleaseHandle(handle);

// End of CatalogUpdateProgressListener "private" section.


