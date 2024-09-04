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
import 'package:here_sdk/src/sdk/core/engine/s_d_k_native_engine.dart';
import 'package:here_sdk/src/sdk/core/geo_polygon.dart';
import 'package:here_sdk/src/sdk/core/threading/task_handle.dart';
import 'package:here_sdk/src/sdk/prefetcher/map_data_size_listener.dart';
import 'package:here_sdk/src/sdk/prefetcher/prefetch_status_listener.dart';
import 'package:meta/meta.dart';

/// Supports downloading of map data - in advance - into the cache to optimize temporary offline
/// use cases that rely on cached map data.
///
/// Please note, this class puts data in the map cache, which has its own size constraints,
/// and extensive usage may start evicting old cached data.
/// Note: This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
/// Related APIs may change for new releases without a deprecation process.
abstract class PolygonPrefetcher {
  /// Creates a PolygonPrefetcher instance for a given [SDKNativeEngine].
  ///
  /// [sdkEngine] Instance of an existing SDKEngine.
  ///
  factory PolygonPrefetcher(SDKNativeEngine sdkEngine) => $prototype.make(sdkEngine);

  /// Prefetches map data for an area bounded by geo polygon.
  ///
  /// After the operation is finished [PrefetchStatusListener.onComplete] is
  /// invoked on the main thread. Progress is reported by invocation
  /// of [PrefetchStatusListener.onProgress] on the main thread.
  /// If there is not enough space left in the cache to store needed tiles, operation will
  /// fail with [MapLoaderError.notEnoughSpace]. To increase cache size, use
  /// [SDKOptions.cacheSizeInBytes] API.
  ///
  /// To control list of map content features for area prefetch, use [LayerConfiguration.enabledFeatures].
  ///
  /// [geoPolygon] Area to prefetch map data for.
  ///
  /// [callback] Callback that is triggered to report progress and the result of prefetch.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate execution of the task.
  ///
  TaskHandle prefetch(GeoPolygon geoPolygon, PrefetchStatusListener callback);
  /// Estimates map data size for the area bounded by geo polygon.
  ///
  /// Size for tiles that are already
  /// in the cache will not be included in the final result.
  ///
  /// [geoPolygon] Area to estimate map data size for.
  ///
  /// [callback] Callback that is triggered to report the result of map data size estimation.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate execution of the task.
  ///
  TaskHandle estimateMapDataSize(GeoPolygon geoPolygon, MapDataSizeListener callback);

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = PolygonPrefetcher$Impl(Pointer<Void>.fromAddress(0));
}


// PolygonPrefetcher "private" section, not exported.

final _sdkPrefetcherPolygonprefetcherRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_prefetcher_PolygonPrefetcher_register_finalizer'));
final _sdkPrefetcherPolygonprefetcherCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_prefetcher_PolygonPrefetcher_copy_handle'));
final _sdkPrefetcherPolygonprefetcherReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_prefetcher_PolygonPrefetcher_release_handle'));





/// @nodoc
@visibleForTesting
class PolygonPrefetcher$Impl extends __lib.NativeBase implements PolygonPrefetcher {

  PolygonPrefetcher$Impl(Pointer<Void> handle) : super(handle);


  PolygonPrefetcher make(SDKNativeEngine sdkEngine) {
    final _result_handle = _make(sdkEngine);
    final _result = PolygonPrefetcher$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkPrefetcherPolygonprefetcherRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _make(SDKNativeEngine sdkEngine) {
    final _makeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_prefetcher_PolygonPrefetcher_make__SDKNativeEngine'));
    final _sdkEngineHandle = sdkCoreEngineSdknativeengineToFfi(sdkEngine);
    final __resultHandle = _makeFfi(__lib.LibraryContext.isolateId, _sdkEngineHandle);
    sdkCoreEngineSdknativeengineReleaseFfiHandle(_sdkEngineHandle);
    return __resultHandle;
  }

  @override
  TaskHandle prefetch(GeoPolygon geoPolygon, PrefetchStatusListener callback) {
    final _prefetchFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_prefetcher_PolygonPrefetcher_prefetch__GeoPolygon_PrefetchStatusListener'));
    final _geoPolygonHandle = sdkCoreGeopolygonToFfi(geoPolygon);
    final _callbackHandle = sdkPrefetcherPrefetchstatuslistenerToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _prefetchFfi(_handle, __lib.LibraryContext.isolateId, _geoPolygonHandle, _callbackHandle);
    sdkCoreGeopolygonReleaseFfiHandle(_geoPolygonHandle);
    sdkPrefetcherPrefetchstatuslistenerReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle estimateMapDataSize(GeoPolygon geoPolygon, MapDataSizeListener callback) {
    final _estimateMapDataSizeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_prefetcher_PolygonPrefetcher_estimateMapDataSize__GeoPolygon_MapDataSizeListener'));
    final _geoPolygonHandle = sdkCoreGeopolygonToFfi(geoPolygon);
    final _callbackHandle = sdkPrefetcherMapdatasizelistenerToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _estimateMapDataSizeFfi(_handle, __lib.LibraryContext.isolateId, _geoPolygonHandle, _callbackHandle);
    sdkCoreGeopolygonReleaseFfiHandle(_geoPolygonHandle);
    sdkPrefetcherMapdatasizelistenerReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }


}

Pointer<Void> sdkPrefetcherPolygonprefetcherToFfi(PolygonPrefetcher value) =>
  _sdkPrefetcherPolygonprefetcherCopyHandle((value as __lib.NativeBase).handle);

PolygonPrefetcher sdkPrefetcherPolygonprefetcherFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is PolygonPrefetcher) return instance;

  final _copiedHandle = _sdkPrefetcherPolygonprefetcherCopyHandle(handle);
  final result = PolygonPrefetcher$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkPrefetcherPolygonprefetcherRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkPrefetcherPolygonprefetcherReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkPrefetcherPolygonprefetcherReleaseHandle(handle);

Pointer<Void> sdkPrefetcherPolygonprefetcherToFfiNullable(PolygonPrefetcher? value) =>
  value != null ? sdkPrefetcherPolygonprefetcherToFfi(value) : Pointer<Void>.fromAddress(0);

PolygonPrefetcher? sdkPrefetcherPolygonprefetcherFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkPrefetcherPolygonprefetcherFromFfi(handle) : null;

void sdkPrefetcherPolygonprefetcherReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkPrefetcherPolygonprefetcherReleaseHandle(handle);

// End of PolygonPrefetcher "private" section.


