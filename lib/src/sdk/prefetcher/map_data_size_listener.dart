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
import 'package:here_sdk/src/sdk/prefetcher/map_data_size.dart';

/// Abstract class to get the result of map data size
/// estimation.
abstract class MapDataSizeListener {
  /// Abstract class to get the result of map data size
  /// estimation.

  factory MapDataSizeListener(
    void Function(MapLoaderError?, MapDataSize?) onSizeEstimatedLambda,

  ) => MapDataSizeListener$Lambdas(
    onSizeEstimatedLambda,

  );

  /// Called after map data size estimation has been completed either with success or with error.
  ///
  /// Invoked on the main thread.
  ///
  /// [error] Represents an error in case of a failure. If the operation was successful,
  /// is returned.
  ///
  /// [dataSize] Represents the map data size. In case of failure,
  /// is returned.
  ///
  void onSizeEstimated(MapLoaderError? error, MapDataSize? dataSize);
}


// MapDataSizeListener "private" section, not exported.

final _sdkPrefetcherMapdatasizelistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_prefetcher_MapDataSizeListener_register_finalizer'));
final _sdkPrefetcherMapdatasizelistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_prefetcher_MapDataSizeListener_copy_handle'));
final _sdkPrefetcherMapdatasizelistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_prefetcher_MapDataSizeListener_release_handle'));
final _sdkPrefetcherMapdatasizelistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_prefetcher_MapDataSizeListener_create_proxy'));
final _sdkPrefetcherMapdatasizelistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_prefetcher_MapDataSizeListener_get_type_id'));


class MapDataSizeListener$Lambdas implements MapDataSizeListener {
  void Function(MapLoaderError?, MapDataSize?) onSizeEstimatedLambda;

  MapDataSizeListener$Lambdas(
    this.onSizeEstimatedLambda,

  );

  @override
  void onSizeEstimated(MapLoaderError? error, MapDataSize? dataSize) =>
    onSizeEstimatedLambda(error, dataSize);
}

class MapDataSizeListener$Impl extends __lib.NativeBase implements MapDataSizeListener {

  MapDataSizeListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onSizeEstimated(MapLoaderError? error, MapDataSize? dataSize) {
    final _onSizeEstimatedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_prefetcher_MapDataSizeListener_onSizeEstimated__MapLoaderError__MapDataSize_'));
    final _errorHandle = sdkMaploaderMaploadererrorToFfiNullable(error);
    final _dataSizeHandle = sdkPrefetcherMapdatasizeToFfiNullable(dataSize);
    final _handle = this.handle;
    _onSizeEstimatedFfi(_handle, __lib.LibraryContext.isolateId, _errorHandle, _dataSizeHandle);
    sdkMaploaderMaploadererrorReleaseFfiHandleNullable(_errorHandle);
    sdkPrefetcherMapdatasizeReleaseFfiHandleNullable(_dataSizeHandle);

  }


}

int _sdkPrefetcherMapdatasizelisteneronSizeEstimatedStatic(Object _obj, Pointer<Void> error, Pointer<Void> dataSize) {

  try {
    (_obj as MapDataSizeListener).onSizeEstimated(sdkMaploaderMaploadererrorFromFfiNullable(error), sdkPrefetcherMapdatasizeFromFfiNullable(dataSize));
  } finally {
    sdkMaploaderMaploadererrorReleaseFfiHandleNullable(error);
    sdkPrefetcherMapdatasizeReleaseFfiHandleNullable(dataSize);
  }
  return 0;
}


Pointer<Void> sdkPrefetcherMapdatasizelistenerToFfi(MapDataSizeListener value) {
  if (value is __lib.NativeBase) return _sdkPrefetcherMapdatasizelistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkPrefetcherMapdatasizelistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>, Pointer<Void>)>(_sdkPrefetcherMapdatasizelisteneronSizeEstimatedStatic, __lib.unknownError)
  );

  return result;
}

MapDataSizeListener sdkPrefetcherMapdatasizelistenerFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is MapDataSizeListener) return instance;

  final _typeIdHandle = _sdkPrefetcherMapdatasizelistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkPrefetcherMapdatasizelistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : MapDataSizeListener$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkPrefetcherMapdatasizelistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkPrefetcherMapdatasizelistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkPrefetcherMapdatasizelistenerReleaseHandle(handle);

Pointer<Void> sdkPrefetcherMapdatasizelistenerToFfiNullable(MapDataSizeListener? value) =>
  value != null ? sdkPrefetcherMapdatasizelistenerToFfi(value) : Pointer<Void>.fromAddress(0);

MapDataSizeListener? sdkPrefetcherMapdatasizelistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkPrefetcherMapdatasizelistenerFromFfi(handle) : null;

void sdkPrefetcherMapdatasizelistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkPrefetcherMapdatasizelistenerReleaseHandle(handle);

// End of MapDataSizeListener "private" section.


