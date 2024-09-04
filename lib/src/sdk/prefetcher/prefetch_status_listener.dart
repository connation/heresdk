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

/// Abstract class to get notified on status updates
/// when prefetching map data.
abstract class PrefetchStatusListener {
  /// Abstract class to get notified on status updates
  /// when prefetching map data.

  factory PrefetchStatusListener(
    void Function(int) onProgressLambda,
    void Function(MapLoaderError?) onCompleteLambda,

  ) => PrefetchStatusListener$Lambdas(
    onProgressLambda,
    onCompleteLambda,

  );

  /// Called multiple times to indicate the update progress.
  ///
  /// Invoked on the main thread.
  ///
  /// [percentage] Represents a percentage of corridor data which has been downloaded.
  ///
  void onProgress(int percentage);
  /// Called after the geo-corridor data downloads has been completed either with success or with error.
  ///
  /// Invoked on the main thread.
  ///
  /// [error] Represents an error in case of a failure.
  /// If an error occurs, to resume operation, please download geo-corridor again.
  /// It is `null` for an operation that succeeds.
  ///
  void onComplete(MapLoaderError? error);
}


// PrefetchStatusListener "private" section, not exported.

final _sdkPrefetcherPrefetchstatuslistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_prefetcher_PrefetchStatusListener_register_finalizer'));
final _sdkPrefetcherPrefetchstatuslistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_prefetcher_PrefetchStatusListener_copy_handle'));
final _sdkPrefetcherPrefetchstatuslistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_prefetcher_PrefetchStatusListener_release_handle'));
final _sdkPrefetcherPrefetchstatuslistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer)
  >('here_sdk_sdk_prefetcher_PrefetchStatusListener_create_proxy'));
final _sdkPrefetcherPrefetchstatuslistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_prefetcher_PrefetchStatusListener_get_type_id'));



class PrefetchStatusListener$Lambdas implements PrefetchStatusListener {
  void Function(int) onProgressLambda;
  void Function(MapLoaderError?) onCompleteLambda;

  PrefetchStatusListener$Lambdas(
    this.onProgressLambda,
    this.onCompleteLambda,

  );

  @override
  void onProgress(int percentage) =>
    onProgressLambda(percentage);
  @override
  void onComplete(MapLoaderError? error) =>
    onCompleteLambda(error);
}

class PrefetchStatusListener$Impl extends __lib.NativeBase implements PrefetchStatusListener {

  PrefetchStatusListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onProgress(int percentage) {
    final _onProgressFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Int32), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_prefetcher_PrefetchStatusListener_onProgress__Int'));
    final _percentageHandle = (percentage);
    final _handle = this.handle;
    _onProgressFfi(_handle, __lib.LibraryContext.isolateId, _percentageHandle);


  }

  @override
  void onComplete(MapLoaderError? error) {
    final _onCompleteFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_prefetcher_PrefetchStatusListener_onComplete__MapLoaderError_'));
    final _errorHandle = sdkMaploaderMaploadererrorToFfiNullable(error);
    final _handle = this.handle;
    _onCompleteFfi(_handle, __lib.LibraryContext.isolateId, _errorHandle);
    sdkMaploaderMaploadererrorReleaseFfiHandleNullable(_errorHandle);

  }


}

int _sdkPrefetcherPrefetchstatuslisteneronProgressStatic(Object _obj, int percentage) {

  try {
    (_obj as PrefetchStatusListener).onProgress((percentage));
  } finally {
    
  }
  return 0;
}
int _sdkPrefetcherPrefetchstatuslisteneronCompleteStatic(Object _obj, Pointer<Void> error) {

  try {
    (_obj as PrefetchStatusListener).onComplete(sdkMaploaderMaploadererrorFromFfiNullable(error));
  } finally {
    sdkMaploaderMaploadererrorReleaseFfiHandleNullable(error);
  }
  return 0;
}


Pointer<Void> sdkPrefetcherPrefetchstatuslistenerToFfi(PrefetchStatusListener value) {
  if (value is __lib.NativeBase) return _sdkPrefetcherPrefetchstatuslistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkPrefetcherPrefetchstatuslistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Int32)>(_sdkPrefetcherPrefetchstatuslisteneronProgressStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkPrefetcherPrefetchstatuslisteneronCompleteStatic, __lib.unknownError)
  );

  return result;
}

PrefetchStatusListener sdkPrefetcherPrefetchstatuslistenerFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is PrefetchStatusListener) return instance;

  final _typeIdHandle = _sdkPrefetcherPrefetchstatuslistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkPrefetcherPrefetchstatuslistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : PrefetchStatusListener$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkPrefetcherPrefetchstatuslistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkPrefetcherPrefetchstatuslistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkPrefetcherPrefetchstatuslistenerReleaseHandle(handle);

Pointer<Void> sdkPrefetcherPrefetchstatuslistenerToFfiNullable(PrefetchStatusListener? value) =>
  value != null ? sdkPrefetcherPrefetchstatuslistenerToFfi(value) : Pointer<Void>.fromAddress(0);

PrefetchStatusListener? sdkPrefetcherPrefetchstatuslistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkPrefetcherPrefetchstatuslistenerFromFfi(handle) : null;

void sdkPrefetcherPrefetchstatuslistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkPrefetcherPrefetchstatuslistenerReleaseHandle(handle);

// End of PrefetchStatusListener "private" section.


