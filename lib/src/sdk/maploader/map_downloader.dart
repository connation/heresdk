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
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/engine/s_d_k_native_engine.dart';
import 'package:here_sdk/src/sdk/core/geo_polygon.dart';
import 'package:here_sdk/src/sdk/core/language_code.dart';
import 'package:here_sdk/src/sdk/core/threading/task_handle.dart';
import 'package:here_sdk/src/sdk/maploader/deleted_regions_callback.dart';
import 'package:here_sdk/src/sdk/maploader/download_regions_status_listener.dart';
import 'package:here_sdk/src/sdk/maploader/downloadable_regions_callback.dart';
import 'package:here_sdk/src/sdk/maploader/installed_region.dart';
import 'package:here_sdk/src/sdk/maploader/map_downloader_construction_callback.dart';
import 'package:here_sdk/src/sdk/maploader/map_downloader_task.dart';
import 'package:here_sdk/src/sdk/maploader/map_loader_error.dart';
import 'package:here_sdk/src/sdk/maploader/map_loader_exception_exception.dart';
import 'package:here_sdk/src/sdk/maploader/persistent_map_status.dart';
import 'package:here_sdk/src/sdk/maploader/region_id.dart';
import 'package:here_sdk/src/sdk/maploader/repair_persistent_map_callback.dart';
import 'package:here_sdk/src/sdk/maploader/s_d_k_cache_callback.dart';
import 'package:meta/meta.dart';

/// A class to download and manage map data for various regions of the world.
///
/// Downloaded map data will be permanently
/// stored to disk and enables the use of maps on all zoom levels, search, routing, and other features without an active
/// data connection. Satellite based map schemes are not part of the downloaded map data. User can query downloadable
/// regions, download them to disk or delete them.
/// Storage Path for downloaded map can be specified via [SDKOptions.persistentMapStoragePath].
/// An instance of this class can be created with [MapDownloader.fromSdkEngineAsync].
///
/// In addition, the content and or data features of the downloaded regions and the map cache can be
/// controlled before starting an application via
/// plist and/or AndroidManifest file when specifying a "FeatureConfiguration".
/// An example plist file is shown in the documentation for the [SDKOptions] class.
/// The "FeatureConfiguration" defines a list of data features that can be enabled / disabled.
/// Once set via
/// plist and/or AndroidManifest file then it will affect the map cache and offline maps.
///
/// When disabling certain features, less data will be prefetched when the map is rendered. Map
/// data that was already cached will not be removed until the least recently used strategy (LRU)
/// applies. That means you cannot remove any content from the map cache by updating the
/// "FeatureConfiguration". However, for new map data, it will be applied.
/// For offline maps, this "FeatureConfiguration" can reduce the download size of all regions.
/// Note that the "FeatureConfiguration" is applied globally to all regions that will be downloaded
/// in the future. It will not affect already downloaded regions. Updating a region will also
/// not update the "FeatureConfiguration". Only the "FeatureConfiguration" will be used that was set
/// globally when a region was downloaded for the first time. If you want to update the
/// "FeatureConfiguration" for an already downloaded region, call once `mapUpdater.performFeatureUpdate(...)`.
///
/// The following features can be enabled / disabled:
///
/// - "DETAIL_RENDERING": Additional rendering details like buildings. Only used for the `MapView`.
///   When not set, the data will be excluded when downloading offline regions or prefetching areas
///   that contain such data. However, during online usage such data may still be downloaded into the
///   cache and shown. Increase of 11-16% is to be expected for map size, in case of enabling this feature.
/// - "NAVIGATION": Map data that is used for map matching during navigation. When not set,
///   navigation may not work properly when being used online or offline.
///   Increase of 5-7% is to be expected for map size, but pay attention, that this feature is depended on
///   other layer groups (e.g. routing), so, in total is takes about 21-29 % of map size.
/// - "OFFLINE_SEARCH": Map data that is used to search. When not set, the `OfflineSearchEngine` may not
///   work properly when being used. Increase of 12-16.5% is to be expected for map size, but pay attention,
///   that this feature is depended on other layer groups (e.g. navigation), so, in total is takes about 33-45 % of map size.
/// - "OFFLINE_ROUTING": Map data that is used to calculate routes. When not set, the `OfflineRoutingEngine`
///   may not work properly when being used. Increase of 16-22% is to be expected for map size, but pay attention,
///   that this feature is depended on other layer groups (e.g. navigation), so, in total is takes about 21-29 % of map size.
/// - "TRUCK": Map data that is used to calculate truck routes. When not set,
///   the `OfflineRoutingEngine` may not work properly when being used to calculate truck routes.
///   It is also used for map matching during truck navigation.
///   When not set, truck navigation may not work properly when being used offline. Online truck navigation will still work when the device has an online connection.
///   Increase of 0.7-1.1% is to be expected for map size, in case of enabling this feature.
/// - "LANDMARKS_3D": Map data that is used to render textured 3D landmarks. When not set, the data
///   will be excluded when downloading offline regions or prefetching areas that contain such data.
///   When the `landmarks` layer is set to be visible for a `MapScene`, 3D landmarks will still be
///   visible during online usage. Increase of 2-3% is to be expected for map size, in case of enabling this feature. Disabled by default.
/// - "JUNCTION_VIEW_3X4", "JUNCTION_VIEW_16X9", "JUNCTION_SIGN_3X4", "JUNCTION_SIGN_3X5",
///   "JUNCTION_SIGN_4X3", "JUNCTION_SIGN_5X3", "JUNCTION_SIGN_16X9": Asset data to show SVG images during
///   guidance. If enabled, downloaded regions will include junction view and signposts images to be used
///   with the corresponding events.
/// - "RENDERING": A basic set of rendering features such as carto POIs. It cannot be disabled.
/// - "TRAFFIC": Map data that provides traffic broadcast functionality using RDS-TMC format. It should be
///   used when there is no internet connection, so that the routing module can utilize traffic data coming
///   over the radio channel to create routes with the `OfflineRoutingEngine`.
/// - "EV": Offline map data for `EVChargingStation`.
/// - "TRUCK_SERVICE_ATTRIBUTES": Enables truck related attributes to be returned by `OfflineSearchEngine`.
/// - "FUEL_STATION_ATTRIBUTES": Enables fuel attributes to be returned by `OfflineSearchEngine`.
/// - "OFFLINE_BUS_ROUTING": Map data that is used to calculate bus routes. When not set, the
///   `OfflineRoutingEngine` may not be able to calculate routes with `BusOptions`.
/// - "TERRAIN": Map data that is used to represent topographical data. Disabled, by default.
///
/// **Notes**
/// - The "FeatureConfiguration" is only applicable for HERE SDK editions that contain the offline maps
///   feature such as the _Navigate Edition_. It has no effect on other editions.
/// - Only "OFFLINE_SEARCH", "OFFLINE_ROUTING", "TRUCK, NAVIGATION", "RENDERING", "DETAIL_RENDERING",
///   "TRAFFIC" are enabled, by default. All other layers are disabled, by default.
///   Note that the "RENDERING" layer is a base layer that cannot be disabled: Therefore, it is not
///   necessary to explicitly add the layer to a feature configuration - it will be always enabled.
/// - The "FeatureConfiguration" cannot be set separately for a region, it will be applied globally
///   for all regions that will be downloaded in the future.
/// - It is not possible to specify a separate "FeatureConfiguration" for the map cache and offline maps.
///   The "FeatureConfiguration" will be always applied to both.
/// - The "FeatureConfiguration" does affect the map cache when a device has connectivity. Even
///   when a device has connectivity it will only download the specified layers.
/// - If a "FeatureConfiguration" is present in the config
///   file, then only the listed features will be enabled, all others will be disabled. If you want to
///   disable only one feature, then all other features need to be present, or they will be also disabled.
/// - Important note for _turn-by-turn navigation_: As long as a map download or a map update is performed,
///   navigation may not work as expected and an app may be blocked until the operation has been completed.
///   Make sure to wait for pending map operations before starting navigation. This only applies to
///   `MapDownloader` and `MapUpdater`. The `RoutePrefetcher` operations are not affected.
///
/// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected
/// behaviors. Related APIs may change for new releases with a deprecation process. Deprecated APIs will be
/// kept for the next two major releases.
abstract class MapDownloader {

  /// Gets a single instance of this class per provided [SDKNativeEngine].
  ///
  /// [sdkEngine] An instance of the SDKNativeEngine
  ///
  /// [mapDownloaderConstructionCallback] A callback that will receive the result of construction
  ///
  static void fromSdkEngineAsync(SDKNativeEngine sdkEngine, MapDownloaderConstructionCallback mapDownloaderConstructionCallback) => $prototype.fromSdkEngineAsync(sdkEngine, mapDownloaderConstructionCallback);
  /// Performs an asynchronous request to fetch a list of [Region] objects that can be used to download
  /// the actual map data in a separate request.
  ///
  /// The default language for [Region.name] will be [LanguageCode.enUs].
  ///
  /// [callback] Callback which receives the result on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task, for example, to cancel on ongoing request.
  ///
  TaskHandle getDownloadableRegions(DownloadableRegionsCallback callback);
  /// Performs an asynchronous request to fetch a list of [Region] objects with [Region.name]
  /// in given [MapDownloader.getDownloadableRegionsWithLanguageCode.languageCode], that can be used to download the actual map data in a separate request.
  ///
  /// [languageCode] The language code determines the language of [Region.name].
  ///
  /// [callback] Callback which receives the result on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task, for example, to cancel on ongoing request.
  ///
  TaskHandle getDownloadableRegionsWithLanguageCode(LanguageCode languageCode, DownloadableRegionsCallback callback);
  /// Performs an asynchronous request to download map data for regions specified by a list of [RegionId] instances.
  ///
  /// [MapDownloader.downloadRegions.statusListener] is receiving notifications until [DownloadRegionsStatusListener.onDownloadRegionsComplete] is called.
  /// Returned [MapDownloaderTask] should be used to pause or resume started download, by invoking
  /// [MapDownloaderTask.pauseWithCompaction] or [MapDownloaderTask.resume].
  /// Request can be cancelled by calling [MapDownloaderTask.cancel] on returned [MapDownloaderTask] object, afterwards
  /// [DownloadRegionsStatusListener.onDownloadRegionsComplete] is called with error [MapLoaderError.operationCancelled].
  ///
  /// [MapDownloaderTask] remains operational until [DownloadRegionsStatusListener.onDownloadRegionsComplete] is called.
  ///
  /// To get list of downloadable regions use [MapDownloader.getDownloadableRegionsWithLanguageCode] API.
  ///
  /// Simultaneous download of the same region twice is not supported. When such condition occurs then
  /// [DownloadRegionsStatusListener.onDownloadRegionsComplete] is called with error [MapLoaderError.serviceAccessFailed]
  /// for a new request, while previous one continues uninterrupted.
  ///
  /// If indexing is enabled through `OfflineSearchEngine.setIndexOptions`, then after
  /// the requested regions have been downloaded, the corresponding index will be created.
  /// The index is used by `OfflineSearchEngine` to find better results.
  /// Note: Indexing is a beta feature, so there could be a few bugs and unexpected behaviors.
  ///
  /// To control list of map content features for region download, use [LayerConfiguration.enabledFeatures].
  ///
  /// <br>
  /// Note: If an application is forcefully closed or crashes during a map download operation, then this
  /// method can be called again to resume the download. For example, if a download was interrupted at 60%,
  /// then the next call to download the same region will load the remaining 40%.
  /// <br>
  /// Note: If a download fails during runtime, then the HERE SDK will automatically retry to download the affected
  /// region three times before giving up. A connection will be timed out after one minute.
  ///
  /// [regions] List of regions to download. Can be fetched using [MapDownloader.getDownloadableRegionsWithLanguageCode] API.
  ///
  /// [statusListener] Notifies on the download progress.
  ///
  /// Returns [MapDownloaderTask]. Handle that will be used to manipulate the execution of the task, for example, to cancel on ongoing request.
  ///
  MapDownloaderTask downloadRegions(List<RegionId> regions, DownloadRegionsStatusListener statusListener);
  /// Performs an asynchronous request to download map data for area specified by a GeoPolygon.
  ///
  /// [MapDownloader.downloadArea.statusListener] is receiving notifications until [DownloadRegionsStatusListener.onDownloadRegionsComplete] is called.
  /// Returned [MapDownloaderTask] should be used to pause or resume started download, by invoking
  /// [MapDownloaderTask.pauseWithCompaction] or [MapDownloaderTask.resume].
  /// Request can be cancelled by calling [MapDownloaderTask.cancel] on returned [MapDownloaderTask] object, afterwards
  /// [DownloadRegionsStatusListener.onDownloadRegionsComplete] is called with error [MapLoaderError.operationCancelled].
  ///
  /// [MapDownloaderTask] remains operational until [DownloadRegionsStatusListener.onDownloadRegionsComplete] is called.
  ///
  /// Downloaded area will be associated to a unique id that will be reported via [DownloadRegionsStatusListener].
  ///
  /// Simultaneous download of the same region twice is not supported. When such condition occurs then
  /// [DownloadRegionsStatusListener.onDownloadRegionsComplete] is called with error [MapLoaderError.serviceAccessFailed]
  /// for a new request, while previous one continues uninterrupted.
  ///
  /// If indexing is enabled through `OfflineSearchEngine.setIndexOptions`, then after
  /// the requested regions have been downloaded, the corresponding index will be created.
  /// The index is used by `OfflineSearchEngine` to find better results.
  /// Note: Indexing is a beta feature, so there could be a few bugs and unexpected behaviors.
  ///
  /// To control list of map content features for area download, use [LayerConfiguration.enabledFeatures].
  ///
  /// <br>
  /// Note: If an application is forcefully closed or crashes during a map download operation, then this
  /// method can be called again to resume the download. For example, if a download was interrupted at 60%,
  /// then the next call to download the same region will load the remaining 40%.
  /// <br>
  /// Note: If a download fails during runtime, then the HERE SDK will automatically retry to download the affected
  /// region three times before giving up. A connection will be timed out after one minute.
  /// <br>
  /// Note: If user try to re-download same GeoPolygon the status will be reported as per the
  /// state of previous download operation.
  ///
  /// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected
  /// behaviors. Related APIs may change for new releases without a deprecation process.
  ///
  /// [area] Area to download.
  ///
  /// [statusListener] Notifies on the download progress.
  ///
  /// Returns [MapDownloaderTask]. Handle that will be used to manipulate the execution of the task, for example, to cancel on ongoing request.
  ///
  MapDownloaderTask downloadArea(GeoPolygon area, DownloadRegionsStatusListener statusListener);
  /// Performs an asynchronous operation to delete map data for regions specified by a list of [RegionId].
  ///
  /// Note: Deleting a region when there is a pending download returns error
  /// [MapLoaderError.internalError]. Also, deleting a region when there is an ongoing download returns
  /// error [MapLoaderError.notReady]
  ///
  /// If indexing is enabled through `OfflineSearchEngine.setIndexOptions`, then after
  /// the requested regions have been deleted, the index over remaining regions will be rebuilt,
  /// so that entries related to deleted regions are removed.
  /// The index is used by `OfflineSearchEngine` to find better results.
  /// Note: Indexing is a beta feature, so there could be a few bugs and unexpected behaviors.
  ///
  /// [regions] List of regions to be deleted.
  ///
  /// [callback] Callback which receives the result of deletion on the main thread.
  ///
  void deleteRegions(List<RegionId> regions, DeletedRegionsCallback callback);
  /// Performs an asynchronous operation to clear the persistent map storage from all data.
  ///
  /// All downloaded regions will be removed.
  /// Note: Must be called only when no other region operation is ongoing. Returns an error if there is any active operation.
  ///
  /// Any previously built index will also be deleted.
  /// See [MapDownloader.downloadRegions] to learn more about index.
  ///
  /// [callback] Callback which receives the result of clearing on the main thread.
  ///
  void clearPersistentMapStorage(SDKCacheCallback callback);
  /// Method to get a list of map regions that are currently installed on the device.
  ///
  /// Throws if it's not possible to return list of installed regions.
  /// Returned list contains:
  /// - successfully downloaded regions, indicated by [InstalledRegionStatus.installed] in [InstalledRegion.status];
  /// - regions, that are in the download process, indicated by [InstalledRegionStatus.pending] in [InstalledRegion.status];
  /// - regions, which were failed to be downloaded, indicated by [InstalledRegionStatus.pending] in [InstalledRegion.status].
  ///
  /// Returns [List<InstalledRegion>]. List of IDs of regions that are installed on the device
  ///
  /// Throws [MapLoaderExceptionException]. Specifies reason, why list of installed regions is not returned.
  ///
  List<InstalledRegion> getInstalledRegions();
  /// Gets the initial status of the already downloaded regions at start-up time of the app.
  ///
  /// It is not recommended to download or to upload map data while an app is running in
  /// background. However, it can happen, that an app gets shut down during an ongoing
  /// operation, for example, due to a crash. In such a case, some or all of the downloaded map data
  /// may be in a corrupted state.
  /// Refer to the [PersistentMapStatus] for exact healing procedure for specific
  /// status.
  /// Note: This value will not change during the lifetime of an app.
  ///
  /// Returns [PersistentMapStatus]. Initial status of the persistent map.
  ///
  PersistentMapStatus getInitialPersistentMapStatus();
  /// Tries to repair already downloaded regions that are in a corrupted state (see [MapDownloader.getInitialPersistentMapStatus]).
  ///
  /// If indexing is enabled through `OfflineSearchEngine.setIndexOptions`, then index will be
  /// rebuilt if existing index does not match with the installed map regions after this operation.
  /// The index is used by `OfflineSearchEngine` to find better results.
  /// Note: Indexing is a beta feature, so there could be a few bugs and unexpected behaviors.
  ///
  /// [callback] A callback which receives the result of the repair operation on the main thread.
  ///
  void repairPersistentMap(RepairPersistentMapCallback callback);
  /// Get the total size of all downloaded regions currently persisted on disk at the location that
  /// is specified via [SDKOptions.persistentMapStoragePath].
  ///
  /// This includes also data that is currently being downloaded.
  ///
  /// Returns [int]. Value of offline map size.
  ///
  /// Throws [MapLoaderExceptionException]. Specifies reason, why current map size is not returned.
  ///
  int getOfflineMapsStorageSizeInBytes();
  /// Gets the number of concurrent tasks for downloading a map.
  int get taskCount;
  /// Sets the number of concurrent tasks for downloading a map.
  /// A valid task count is between 1 to 64. When the value set is outside the valid range,
  /// then it is clamped to a valid range:
  /// - when passed in value is 0 or less, then task count is set to 1;
  /// - when passed in value is 65 or more, then task count is set to 64.
  set taskCount(int value);


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = MapDownloader$Impl(Pointer<Void>.fromAddress(0));
}


// MapDownloader "private" section, not exported.

final _sdkMaploaderMapdownloaderRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_maploader_MapDownloader_register_finalizer'));
final _sdkMaploaderMapdownloaderCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_MapDownloader_copy_handle'));
final _sdkMaploaderMapdownloaderReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_MapDownloader_release_handle'));









final _getInstalledRegionssdkMaploaderMapdownloaderGetinstalledregionsReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_MapDownloader_getInstalledRegions_return_release_handle'));
final _getInstalledRegionssdkMaploaderMapdownloaderGetinstalledregionsReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_MapDownloader_getInstalledRegions_return_get_result'));
final _getInstalledRegionssdkMaploaderMapdownloaderGetinstalledregionsReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_MapDownloader_getInstalledRegions_return_get_error'));
final _getInstalledRegionssdkMaploaderMapdownloaderGetinstalledregionsReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_MapDownloader_getInstalledRegions_return_has_error'));




final _getOfflineMapsStorageSizeInBytessdkMaploaderMapdownloaderGetofflinemapsstoragesizeinbytesReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_MapDownloader_getOfflineMapsStorageSizeInBytes_return_release_handle'));
final _getOfflineMapsStorageSizeInBytessdkMaploaderMapdownloaderGetofflinemapsstoragesizeinbytesReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_MapDownloader_getOfflineMapsStorageSizeInBytes_return_get_result'));
final _getOfflineMapsStorageSizeInBytessdkMaploaderMapdownloaderGetofflinemapsstoragesizeinbytesReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_MapDownloader_getOfflineMapsStorageSizeInBytes_return_get_error'));
final _getOfflineMapsStorageSizeInBytessdkMaploaderMapdownloaderGetofflinemapsstoragesizeinbytesReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_MapDownloader_getOfflineMapsStorageSizeInBytes_return_has_error'));


/// @nodoc
@visibleForTesting
class MapDownloader$Impl extends __lib.NativeBase implements MapDownloader {

  MapDownloader$Impl(Pointer<Void> handle) : super(handle);

  void fromSdkEngineAsync(SDKNativeEngine sdkEngine, MapDownloaderConstructionCallback mapDownloaderConstructionCallback) {
    final _fromSdkEngineAsyncFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32, Pointer<Void>, Pointer<Void>), void Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_maploader_MapDownloader_fromEngineAsync__SDKNativeEngine_MapDownloaderConstructionCallback'));
    final _sdkEngineHandle = sdkCoreEngineSdknativeengineToFfi(sdkEngine);
    final _mapDownloaderConstructionCallbackHandle = sdkMaploaderMapdownloaderconstructioncallbackToFfi(mapDownloaderConstructionCallback);
    _fromSdkEngineAsyncFfi(__lib.LibraryContext.isolateId, _sdkEngineHandle, _mapDownloaderConstructionCallbackHandle);
    sdkCoreEngineSdknativeengineReleaseFfiHandle(_sdkEngineHandle);
    sdkMaploaderMapdownloaderconstructioncallbackReleaseFfiHandle(_mapDownloaderConstructionCallbackHandle);

  }

  @override
  TaskHandle getDownloadableRegions(DownloadableRegionsCallback callback) {
    final _getDownloadableRegionsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_maploader_MapDownloader_getDownloadableRegions__DownloadableRegionsCallback'));
    final _callbackHandle = sdkMaploaderDownloadableregionscallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _getDownloadableRegionsFfi(_handle, __lib.LibraryContext.isolateId, _callbackHandle);
    sdkMaploaderDownloadableregionscallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle getDownloadableRegionsWithLanguageCode(LanguageCode languageCode, DownloadableRegionsCallback callback) {
    final _getDownloadableRegionsWithLanguageCodeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Uint32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, int, Pointer<Void>)>('here_sdk_sdk_maploader_MapDownloader_getDownloadableRegions__LanguageCode_DownloadableRegionsCallback'));
    final _languageCodeHandle = sdkCoreLanguagecodeToFfi(languageCode);
    final _callbackHandle = sdkMaploaderDownloadableregionscallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _getDownloadableRegionsWithLanguageCodeFfi(_handle, __lib.LibraryContext.isolateId, _languageCodeHandle, _callbackHandle);
    sdkCoreLanguagecodeReleaseFfiHandle(_languageCodeHandle);
    sdkMaploaderDownloadableregionscallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  MapDownloaderTask downloadRegions(List<RegionId> regions, DownloadRegionsStatusListener statusListener) {
    final _downloadRegionsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_maploader_MapDownloader_downloadRegions__ListOf_sdk_maploader_RegionId_DownloadRegionsStatusListener'));
    final _regionsHandle = heresdkMaploaderBindingslistofSdkMaploaderRegionidToFfi(regions);
    final _statusListenerHandle = sdkMaploaderDownloadregionsstatuslistenerToFfi(statusListener);
    final _handle = this.handle;
    final __resultHandle = _downloadRegionsFfi(_handle, __lib.LibraryContext.isolateId, _regionsHandle, _statusListenerHandle);
    heresdkMaploaderBindingslistofSdkMaploaderRegionidReleaseFfiHandle(_regionsHandle);
    sdkMaploaderDownloadregionsstatuslistenerReleaseFfiHandle(_statusListenerHandle);
    try {
      return sdkMaploaderMapdownloadertaskFromFfi(__resultHandle);
    } finally {
      sdkMaploaderMapdownloadertaskReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  MapDownloaderTask downloadArea(GeoPolygon area, DownloadRegionsStatusListener statusListener) {
    final _downloadAreaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_maploader_MapDownloader_downloadArea__GeoPolygon_DownloadRegionsStatusListener'));
    final _areaHandle = sdkCoreGeopolygonToFfi(area);
    final _statusListenerHandle = sdkMaploaderDownloadregionsstatuslistenerToFfi(statusListener);
    final _handle = this.handle;
    final __resultHandle = _downloadAreaFfi(_handle, __lib.LibraryContext.isolateId, _areaHandle, _statusListenerHandle);
    sdkCoreGeopolygonReleaseFfiHandle(_areaHandle);
    sdkMaploaderDownloadregionsstatuslistenerReleaseFfiHandle(_statusListenerHandle);
    try {
      return sdkMaploaderMapdownloadertaskFromFfi(__resultHandle);
    } finally {
      sdkMaploaderMapdownloadertaskReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  void deleteRegions(List<RegionId> regions, DeletedRegionsCallback callback) {
    final _deleteRegionsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_maploader_MapDownloader_deleteRegions__ListOf_sdk_maploader_RegionId_DeletedRegionsCallback'));
    final _regionsHandle = heresdkMaploaderBindingslistofSdkMaploaderRegionidToFfi(regions);
    final _callbackHandle = sdkMaploaderDeletedregionscallbackToFfi(callback);
    final _handle = this.handle;
    _deleteRegionsFfi(_handle, __lib.LibraryContext.isolateId, _regionsHandle, _callbackHandle);
    heresdkMaploaderBindingslistofSdkMaploaderRegionidReleaseFfiHandle(_regionsHandle);
    sdkMaploaderDeletedregionscallbackReleaseFfiHandle(_callbackHandle);

  }

  @override
  void clearPersistentMapStorage(SDKCacheCallback callback) {
    final _clearPersistentMapStorageFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_maploader_MapDownloader_clearPersistentMapStorage__SDKCacheCallback'));
    final _callbackHandle = sdkMaploaderSdkcachecallbackToFfi(callback);
    final _handle = this.handle;
    _clearPersistentMapStorageFfi(_handle, __lib.LibraryContext.isolateId, _callbackHandle);
    sdkMaploaderSdkcachecallbackReleaseFfiHandle(_callbackHandle);

  }

  @override
  List<InstalledRegion> getInstalledRegions() {
    final _getInstalledRegionsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_maploader_MapDownloader_getInstalledRegions'));
    final _handle = this.handle;
    final __callResultHandle = _getInstalledRegionsFfi(_handle, __lib.LibraryContext.isolateId);
    if (_getInstalledRegionssdkMaploaderMapdownloaderGetinstalledregionsReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _getInstalledRegionssdkMaploaderMapdownloaderGetinstalledregionsReturnGetError(__callResultHandle);
        _getInstalledRegionssdkMaploaderMapdownloaderGetinstalledregionsReturnReleaseHandle(__callResultHandle);
        try {
          throw MapLoaderExceptionException(sdkMaploaderMaploadererrorFromFfi(__errorHandle));
        } finally {
          sdkMaploaderMaploadererrorReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _getInstalledRegionssdkMaploaderMapdownloaderGetinstalledregionsReturnGetResult(__callResultHandle);
    _getInstalledRegionssdkMaploaderMapdownloaderGetinstalledregionsReturnReleaseHandle(__callResultHandle);
    try {
      return heresdkMaploaderBindingslistofSdkMaploaderInstalledregionFromFfi(__resultHandle);
    } finally {
      heresdkMaploaderBindingslistofSdkMaploaderInstalledregionReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  PersistentMapStatus getInitialPersistentMapStatus() {
    final _getInitialPersistentMapStatusFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_maploader_MapDownloader_getInitialPersistentMapStatus'));
    final _handle = this.handle;
    final __resultHandle = _getInitialPersistentMapStatusFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkMaploaderPersistentmapstatusFromFfi(__resultHandle);
    } finally {
      sdkMaploaderPersistentmapstatusReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  void repairPersistentMap(RepairPersistentMapCallback callback) {
    final _repairPersistentMapFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_maploader_MapDownloader_repairPersistentMap__RepairPersistentMapCallback'));
    final _callbackHandle = sdkMaploaderRepairpersistentmapcallbackToFfi(callback);
    final _handle = this.handle;
    _repairPersistentMapFfi(_handle, __lib.LibraryContext.isolateId, _callbackHandle);
    sdkMaploaderRepairpersistentmapcallbackReleaseFfiHandle(_callbackHandle);

  }

  @override
  int getOfflineMapsStorageSizeInBytes() {
    final _getOfflineMapsStorageSizeInBytesFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_maploader_MapDownloader_getOfflineMapsStorageSizeInBytes'));
    final _handle = this.handle;
    final __callResultHandle = _getOfflineMapsStorageSizeInBytesFfi(_handle, __lib.LibraryContext.isolateId);
    if (_getOfflineMapsStorageSizeInBytessdkMaploaderMapdownloaderGetofflinemapsstoragesizeinbytesReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _getOfflineMapsStorageSizeInBytessdkMaploaderMapdownloaderGetofflinemapsstoragesizeinbytesReturnGetError(__callResultHandle);
        _getOfflineMapsStorageSizeInBytessdkMaploaderMapdownloaderGetofflinemapsstoragesizeinbytesReturnReleaseHandle(__callResultHandle);
        try {
          throw MapLoaderExceptionException(sdkMaploaderMaploadererrorFromFfi(__errorHandle));
        } finally {
          sdkMaploaderMaploadererrorReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _getOfflineMapsStorageSizeInBytessdkMaploaderMapdownloaderGetofflinemapsstoragesizeinbytesReturnGetResult(__callResultHandle);
    _getOfflineMapsStorageSizeInBytessdkMaploaderMapdownloaderGetofflinemapsstoragesizeinbytesReturnReleaseHandle(__callResultHandle);
    try {
      return (__resultHandle);
    } finally {


    }

  }

  @override
  int get taskCount {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_maploader_MapDownloader_taskCount_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }

  @override
  set taskCount(int value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_maploader_MapDownloader_taskCount_set__UInt'));
    final _valueHandle = (value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);


  }



}

Pointer<Void> sdkMaploaderMapdownloaderToFfi(MapDownloader value) =>
  _sdkMaploaderMapdownloaderCopyHandle((value as __lib.NativeBase).handle);

MapDownloader sdkMaploaderMapdownloaderFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is MapDownloader) return instance;

  final _copiedHandle = _sdkMaploaderMapdownloaderCopyHandle(handle);
  final result = MapDownloader$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMaploaderMapdownloaderRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMaploaderMapdownloaderReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMaploaderMapdownloaderReleaseHandle(handle);

Pointer<Void> sdkMaploaderMapdownloaderToFfiNullable(MapDownloader? value) =>
  value != null ? sdkMaploaderMapdownloaderToFfi(value) : Pointer<Void>.fromAddress(0);

MapDownloader? sdkMaploaderMapdownloaderFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMaploaderMapdownloaderFromFfi(handle) : null;

void sdkMaploaderMapdownloaderReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMaploaderMapdownloaderReleaseHandle(handle);

// End of MapDownloader "private" section.


