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
import 'package:here_sdk/src/sdk/search/offline_search_index.dart';

/// Abstract class to get updates about progress
/// of creating persistent map index.
///
/// Note: This is a beta release of this feature, so there could be a few bugs and unexpected
/// behaviors. Related APIs may change for new releases without a deprecation process.
abstract class OfflineSearchIndexListener {
  /// Abstract class to get updates about progress
  /// of creating persistent map index.
  ///
  /// Note: This is a beta release of this feature, so there could be a few bugs and unexpected
  /// behaviors. Related APIs may change for new releases without a deprecation process.

  factory OfflineSearchIndexListener(
    void Function(OfflineSearchIndexOperation) onStartedLambda,
    void Function(int) onProgressLambda,
    void Function(OfflineSearchIndexError?) onCompleteLambda,

  ) => OfflineSearchIndexListener$Lambdas(
    onStartedLambda,
    onProgressLambda,
    onCompleteLambda,

  );

  /// Called each time that the indexing has started.
  ///
  /// It is triggered by changes to persistent map
  /// or by calling `OfflineSearchEngine.setIndexOptions`.
  /// If a valid index was previously created for the installed regions, no additional indexing
  /// is performed, so no notifications are sent. In this context, a valid index is the one
  /// that contains data for the exact versions of the installed map regions. When any of them
  /// is updated or new regions are downloaded or deleted, the index becomes invalid and is
  /// automatically rebuilt, as long as indexing has been enabled previously.
  /// Invoked on the main thread.
  ///
  /// [operation] Shows whether the index is being created or removed.
  ///
  void onStarted(OfflineSearchIndexOperation operation);
  /// Called multiple times to indicate the progress of index creation or deletion.
  ///
  /// Invoked on the main thread.
  ///
  /// [percentage] Represents a percentage of work done.
  ///
  void onProgress(int percentage);
  /// Called after index creation or deletion has been completed.
  ///
  /// Invoked on the main thread.
  ///
  /// [error] Represents an error in case of a failure.
  /// It is `null` for an operation that succeeds.
  ///
  void onComplete(OfflineSearchIndexError? error);
}


// OfflineSearchIndexListener "private" section, not exported.

final _sdkSearchOfflinesearchindexlistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_search_OfflineSearchIndexListener_register_finalizer'));
final _sdkSearchOfflinesearchindexlistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_OfflineSearchIndexListener_copy_handle'));
final _sdkSearchOfflinesearchindexlistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_OfflineSearchIndexListener_release_handle'));
final _sdkSearchOfflinesearchindexlistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer, Pointer)
  >('here_sdk_sdk_search_OfflineSearchIndexListener_create_proxy'));
final _sdkSearchOfflinesearchindexlistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_OfflineSearchIndexListener_get_type_id'));




class OfflineSearchIndexListener$Lambdas implements OfflineSearchIndexListener {
  void Function(OfflineSearchIndexOperation) onStartedLambda;
  void Function(int) onProgressLambda;
  void Function(OfflineSearchIndexError?) onCompleteLambda;

  OfflineSearchIndexListener$Lambdas(
    this.onStartedLambda,
    this.onProgressLambda,
    this.onCompleteLambda,

  );

  @override
  void onStarted(OfflineSearchIndexOperation operation) =>
    onStartedLambda(operation);
  @override
  void onProgress(int percentage) =>
    onProgressLambda(percentage);
  @override
  void onComplete(OfflineSearchIndexError? error) =>
    onCompleteLambda(error);
}

class OfflineSearchIndexListener$Impl extends __lib.NativeBase implements OfflineSearchIndexListener {

  OfflineSearchIndexListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onStarted(OfflineSearchIndexOperation operation) {
    final _onStartedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_search_OfflineSearchIndexListener_onStarted__Operation'));
    final _operationHandle = sdkSearchOfflinesearchindexOperationToFfi(operation);
    final _handle = this.handle;
    _onStartedFfi(_handle, __lib.LibraryContext.isolateId, _operationHandle);
    sdkSearchOfflinesearchindexOperationReleaseFfiHandle(_operationHandle);

  }

  @override
  void onProgress(int percentage) {
    final _onProgressFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Int32), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_search_OfflineSearchIndexListener_onProgress__Int'));
    final _percentageHandle = (percentage);
    final _handle = this.handle;
    _onProgressFfi(_handle, __lib.LibraryContext.isolateId, _percentageHandle);


  }

  @override
  void onComplete(OfflineSearchIndexError? error) {
    final _onCompleteFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_search_OfflineSearchIndexListener_onComplete__Error_'));
    final _errorHandle = sdkSearchOfflinesearchindexErrorToFfiNullable(error);
    final _handle = this.handle;
    _onCompleteFfi(_handle, __lib.LibraryContext.isolateId, _errorHandle);
    sdkSearchOfflinesearchindexErrorReleaseFfiHandleNullable(_errorHandle);

  }


}

int _sdkSearchOfflinesearchindexlisteneronStartedStatic(Object _obj, int operation) {

  try {
    (_obj as OfflineSearchIndexListener).onStarted(sdkSearchOfflinesearchindexOperationFromFfi(operation));
  } finally {
    sdkSearchOfflinesearchindexOperationReleaseFfiHandle(operation);
  }
  return 0;
}
int _sdkSearchOfflinesearchindexlisteneronProgressStatic(Object _obj, int percentage) {

  try {
    (_obj as OfflineSearchIndexListener).onProgress((percentage));
  } finally {
    
  }
  return 0;
}
int _sdkSearchOfflinesearchindexlisteneronCompleteStatic(Object _obj, Pointer<Void> error) {

  try {
    (_obj as OfflineSearchIndexListener).onComplete(sdkSearchOfflinesearchindexErrorFromFfiNullable(error));
  } finally {
    sdkSearchOfflinesearchindexErrorReleaseFfiHandleNullable(error);
  }
  return 0;
}


Pointer<Void> sdkSearchOfflinesearchindexlistenerToFfi(OfflineSearchIndexListener value) {
  if (value is __lib.NativeBase) return _sdkSearchOfflinesearchindexlistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkSearchOfflinesearchindexlistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Uint32)>(_sdkSearchOfflinesearchindexlisteneronStartedStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Int32)>(_sdkSearchOfflinesearchindexlisteneronProgressStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkSearchOfflinesearchindexlisteneronCompleteStatic, __lib.unknownError)
  );

  return result;
}

OfflineSearchIndexListener sdkSearchOfflinesearchindexlistenerFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is OfflineSearchIndexListener) return instance;

  final _typeIdHandle = _sdkSearchOfflinesearchindexlistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkSearchOfflinesearchindexlistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : OfflineSearchIndexListener$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkSearchOfflinesearchindexlistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkSearchOfflinesearchindexlistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkSearchOfflinesearchindexlistenerReleaseHandle(handle);

Pointer<Void> sdkSearchOfflinesearchindexlistenerToFfiNullable(OfflineSearchIndexListener? value) =>
  value != null ? sdkSearchOfflinesearchindexlistenerToFfi(value) : Pointer<Void>.fromAddress(0);

OfflineSearchIndexListener? sdkSearchOfflinesearchindexlistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkSearchOfflinesearchindexlistenerFromFfi(handle) : null;

void sdkSearchOfflinesearchindexlistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchOfflinesearchindexlistenerReleaseHandle(handle);

// End of OfflineSearchIndexListener "private" section.


