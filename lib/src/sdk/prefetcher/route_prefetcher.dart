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
import 'package:here_sdk/src/sdk/core/engine/s_d_k_native_engine.dart';
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';
import 'package:here_sdk/src/sdk/core/geo_corridor.dart';
import 'package:here_sdk/src/sdk/core/threading/task_handle.dart';
import 'package:here_sdk/src/sdk/navigation/navigator_interface.dart';
import 'package:here_sdk/src/sdk/prefetcher/prefetch_status_listener.dart';
import 'package:meta/meta.dart';

/// Supports downloading of map data - in advance - into the cache to optimize temporary offline
/// use cases that rely on cached map data.
///
/// This allows scenarios such as navigation to work in a
/// specific area reliably even though the network might be offline at that time.
/// Please note, this class puts data in the map cache, which has its own size constraints,
/// and extensive usage may start evicting old cached data.
/// Note: This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
/// Related APIs may change for new releases without a deprecation process.
abstract class RoutePrefetcher {
  /// Creates a RoutePrefetcher instance for a given [SDKNativeEngine].
  ///
  /// [sdkEngine] Instance of an existing SDKEngine.
  ///
  factory RoutePrefetcher(SDKNativeEngine sdkEngine) => $prototype.make(sdkEngine);

  /// Prefetches map data within a circle of user-set radius (specified in meters) around a given location.
  ///
  /// The radius is limited to between 1km and 50km. When 'null' is passed, it defaults to 2km.
  /// It is recommended to call this method once before starting navigation
  /// for a smooth experience.
  ///
  /// To control list of map content features for area prefetch, use [LayerConfiguration.enabledFeatures].
  ///
  /// [currentLocation] The center of the circle to prefetch data within.
  ///
  /// [radiusInMeters] The radius of the circle to prefetch data within.
  ///
  void prefetchAroundLocationWithRadius(GeoCoordinates currentLocation, double? radiusInMeters);
  /// Prefetches map data within a corridor along the route, that is currently set for the
  /// provided [NavigatorInterface] instance.
  ///
  /// If no route is set, no data will be prefetched.
  /// The route corridor defaults to a length of 10 km and a width of 5 km.
  /// To prefetch the whole route before navigation has been started see [RoutePrefetcher.prefetchGeoCorridor].
  /// Map data is prefetched only in discrete intervals. Prefetching starts 1 km before reaching the
  /// end of the current corridor. Prefetching happens based on the current map-matched location - as
  /// indicated by the [RouteProgress] event.
  /// This method should be called right after navigation has started.
  /// In case of default prefetch length first prefetching will start after traveling a distance
  /// of 9 km along the route.
  ///
  /// To control list of map content features for prefetch, use [LayerConfiguration.enabledFeatures].
  ///
  /// [navigator] The [NavigatorInterface] to listen for Route Progress to prefetch data ahead.
  ///
  void prefetchAroundRouteOnIntervals(NavigatorInterface navigator);
  /// Stops listening [NavigatorInterface] passed to [RoutePrefetcher.prefetchAroundRouteOnIntervals]
  /// for route progress events and stops prefetching data along the current route.
  ///
  void stopPrefetchAroundRoute();
  /// Prefetch tiles for a given geo-corridor.
  ///
  /// A geo-corridor can easily be created from a route with [Route.geometry]
  /// so navigation on this route is possible in offline cases.
  /// Please note, tiles will be saved in mutable cache so when there is not enough space to accommodate new
  /// prefetched tiles [MapLoaderError.notEnoughSpace] is returned.
  /// When updating mutable cache, all tiles will be unusable. Please re-download the geoCorridor again.
  /// Please also note, any route calculation may not possible on prefetched tiles.
  ///
  /// To control list of map content features for corridor prefetch, use [LayerConfiguration.enabledFeatures].
  ///
  /// [corridor] indicates `GeoCorridor` that can be constructed from the route.
  ///
  /// [callback] is invoked to report progress and the result of prefetch. After operation is
  /// finished, [PrefetchStatusListener.onComplete] is invoked on the main thread. Progress is reported by invocation
  /// of [PrefetchStatusListener.onProgress] on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle prefetchGeoCorridor(GeoCorridor corridor, PrefetchStatusListener callback);
  /// Gets the length of the corridor along the route in front of the car which will be used to prefetch data.
  int get prefetchCorridorLengthMeters;
  /// Sets the length of the corridor along the route in front of the car which will be used to prefetch data.
  /// Upper limit for length is 50000 meters, when the requested length is greater than upper limit, then 50000 meters set.
  /// Lower limit for length is 1000 meters, when the requested length is less than lower limit, then 1000 meters set.
  set prefetchCorridorLengthMeters(int value);


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = RoutePrefetcher$Impl(Pointer<Void>.fromAddress(0));
}


// RoutePrefetcher "private" section, not exported.

final _sdkPrefetcherRouteprefetcherRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_prefetcher_RoutePrefetcher_register_finalizer'));
final _sdkPrefetcherRouteprefetcherCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_prefetcher_RoutePrefetcher_copy_handle'));
final _sdkPrefetcherRouteprefetcherReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_prefetcher_RoutePrefetcher_release_handle'));







/// @nodoc
@visibleForTesting
class RoutePrefetcher$Impl extends __lib.NativeBase implements RoutePrefetcher {

  RoutePrefetcher$Impl(Pointer<Void> handle) : super(handle);


  RoutePrefetcher make(SDKNativeEngine sdkEngine) {
    final _result_handle = _make(sdkEngine);
    final _result = RoutePrefetcher$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkPrefetcherRouteprefetcherRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _make(SDKNativeEngine sdkEngine) {
    final _makeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_prefetcher_RoutePrefetcher_make__SDKNativeEngine'));
    final _sdkEngineHandle = sdkCoreEngineSdknativeengineToFfi(sdkEngine);
    final __resultHandle = _makeFfi(__lib.LibraryContext.isolateId, _sdkEngineHandle);
    sdkCoreEngineSdknativeengineReleaseFfiHandle(_sdkEngineHandle);
    return __resultHandle;
  }

  @override
  void prefetchAroundLocationWithRadius(GeoCoordinates currentLocation, double? radiusInMeters) {
    final _prefetchAroundLocationWithRadiusFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_prefetcher_RoutePrefetcher_prefetchAroundLocationWithRadius__GeoCoordinates_Double_'));
    final _currentLocationHandle = sdkCoreGeocoordinatesToFfi(currentLocation);
    final _radiusInMetersHandle = doubleToFfiNullable(radiusInMeters);
    final _handle = this.handle;
    _prefetchAroundLocationWithRadiusFfi(_handle, __lib.LibraryContext.isolateId, _currentLocationHandle, _radiusInMetersHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_currentLocationHandle);
    doubleReleaseFfiHandleNullable(_radiusInMetersHandle);

  }

  @override
  void prefetchAroundRouteOnIntervals(NavigatorInterface navigator) {
    final _prefetchAroundRouteOnIntervalsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_prefetcher_RoutePrefetcher_prefetchAroundRouteOnIntervals__NavigatorInterface'));
    final _navigatorHandle = sdkNavigationNavigatorinterfaceToFfi(navigator);
    final _handle = this.handle;
    _prefetchAroundRouteOnIntervalsFfi(_handle, __lib.LibraryContext.isolateId, _navigatorHandle);
    sdkNavigationNavigatorinterfaceReleaseFfiHandle(_navigatorHandle);

  }

  @override
  void stopPrefetchAroundRoute() {
    final _stopPrefetchAroundRouteFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_prefetcher_RoutePrefetcher_stopPrefetchAroundRoute'));
    final _handle = this.handle;
    _stopPrefetchAroundRouteFfi(_handle, __lib.LibraryContext.isolateId);

  }

  @override
  TaskHandle prefetchGeoCorridor(GeoCorridor corridor, PrefetchStatusListener callback) {
    final _prefetchGeoCorridorFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_prefetcher_RoutePrefetcher_prefetchGeoCorridor__GeoCorridor_PrefetchStatusListener'));
    final _corridorHandle = sdkCoreGeocorridorToFfi(corridor);
    final _callbackHandle = sdkPrefetcherPrefetchstatuslistenerToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _prefetchGeoCorridorFfi(_handle, __lib.LibraryContext.isolateId, _corridorHandle, _callbackHandle);
    sdkCoreGeocorridorReleaseFfiHandle(_corridorHandle);
    sdkPrefetcherPrefetchstatuslistenerReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  int get prefetchCorridorLengthMeters {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_prefetcher_RoutePrefetcher_prefetchCorridorLengthMeters_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }

  @override
  set prefetchCorridorLengthMeters(int value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Int32), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_prefetcher_RoutePrefetcher_prefetchCorridorLengthMeters_set__Int'));
    final _valueHandle = (value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);


  }



}

Pointer<Void> sdkPrefetcherRouteprefetcherToFfi(RoutePrefetcher value) =>
  _sdkPrefetcherRouteprefetcherCopyHandle((value as __lib.NativeBase).handle);

RoutePrefetcher sdkPrefetcherRouteprefetcherFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is RoutePrefetcher) return instance;

  final _copiedHandle = _sdkPrefetcherRouteprefetcherCopyHandle(handle);
  final result = RoutePrefetcher$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkPrefetcherRouteprefetcherRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkPrefetcherRouteprefetcherReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkPrefetcherRouteprefetcherReleaseHandle(handle);

Pointer<Void> sdkPrefetcherRouteprefetcherToFfiNullable(RoutePrefetcher? value) =>
  value != null ? sdkPrefetcherRouteprefetcherToFfi(value) : Pointer<Void>.fromAddress(0);

RoutePrefetcher? sdkPrefetcherRouteprefetcherFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkPrefetcherRouteprefetcherFromFfi(handle) : null;

void sdkPrefetcherRouteprefetcherReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkPrefetcherRouteprefetcherReleaseHandle(handle);

// End of RoutePrefetcher "private" section.


