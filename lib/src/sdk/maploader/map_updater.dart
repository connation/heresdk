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
import 'package:here_sdk/src/sdk/core/threading/task_handle.dart';
import 'package:here_sdk/src/sdk/maploader/catalog_update_info.dart';
import 'package:here_sdk/src/sdk/maploader/catalog_update_progress_listener.dart';
import 'package:here_sdk/src/sdk/maploader/catalog_update_task.dart';
import 'package:here_sdk/src/sdk/maploader/catalogs_update_info_callback.dart';
import 'package:here_sdk/src/sdk/maploader/map_loader_error.dart';
import 'package:here_sdk/src/sdk/maploader/map_loader_exception_exception.dart';
import 'package:here_sdk/src/sdk/maploader/map_update_progress_listener.dart';
import 'package:here_sdk/src/sdk/maploader/map_update_task.dart';
import 'package:here_sdk/src/sdk/maploader/map_updater_construction_callback.dart';
import 'package:here_sdk/src/sdk/maploader/map_version_handle.dart';
import 'package:here_sdk/src/sdk/maploader/update_statistics.dart';
import 'package:meta/meta.dart';

/// A class to update regions that have been previously downloaded by
/// [MapDownloader].
///
/// At the first, the updates for the regions are downloaded.
/// When the download has completed, the update process starts and the new content is installed.
/// It is recommended, to regularly call [MapUpdater.retrieveCatalogsUpdateInfo] to check if there is an update available
/// for any of the downloaded regions.
///
/// If so, those regions can be updated asynchronously by calling [MapUpdater.updateCatalog].
/// The [MapUpdateProgressListener] informs on the update progress
/// for the individual regions.
///
/// Incremental map updates are supported, by default: Instead of downloading an entire region,
/// only the parts that have changed will be installed. This results in a faster update process.
///
/// In case of an error, previous map data is still ready for use. Previous map data
/// will only be replaced once the new map data has been downloaded successfully. This happens per
/// region. The regions that may have failed, need to be updated in a new call. Paused updates
/// can be resumed at a later time.
///
/// During the update process, the [MapUpdater] will internally retry failed downloads
/// until it is timed out. If this happens, it will be reported via [MapUpdateProgressListener].
/// If the update process is cancelled by the user during the update phase then it is ignored -
/// the update phase starts when all content has been downloaded and the HERE SDK will install and
/// replace the existing regions. It's only possible to cancel the process during the download phase
/// and a successful cancellation is indicated via [MapUpdateProgressListener.onComplete].
/// [MapUpdateProgressListener.onPause], so that the user can resume at a later time.
///
/// Note that a [MapLoaderError.notReady] occurs when the [MapDownloader] is used in parallel.
/// In general, background updates are not supported explicitly, as the OS can abort background processes.
/// In addition, the OfflineSearchEngine and the OfflineRoutingEngine cannot be used while a map update is
/// in progress and it will be indicated by a [MapLoaderError].
///
/// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected
/// behaviors. Related APIs may change for new releases with a deprecation process. Deprecated APIs will be
/// kept for the next two major releases.
abstract class MapUpdater {

  /// Gets a single instance of this class per provided [SDKNativeEngine].
  ///
  /// [sdkEngine] An instance of the SDKNativeEngine
  ///
  /// [mapUpdaterConstructionCallback] A callback that will receive the result of construction
  ///
  static void fromSdkEngineAsync(SDKNativeEngine sdkEngine, MapUpdaterConstructionCallback mapUpdaterConstructionCallback) => $prototype.fromSdkEngineAsync(sdkEngine, mapUpdaterConstructionCallback);
  /// Performs an asynchronous request to update the FeatureConfiguration changed via .
  ///
  /// If there is no map downloaded, [MapUpdateProgressListener.onComplete]
  /// will be called immediately with success.
  /// Note that this is only once required after a feature configuration was changed by a developer (see MapDownloader) :
  /// After an update of an application is installed, this method should be called to activate the new configuration.
  /// As a result, affected offline maps will be refreshed. This may take a while, depending on how many offline maps are installed
  /// on a device. Note that calling this is not necessary when an application is installed for the very first time.
  ///
  /// If indexing is enabled through `OfflineSearchEngine.setIndexOptions`, then after
  /// the map has been updated, the index will be rebuilt.
  /// The index is used by `OfflineSearchEngine` to find better results.
  /// Note: Indexing is a beta feature, so there could be a few bugs and unexpected behaviors.
  ///
  /// [callback] Callback which receives the result on the main thread.
  ///
  /// Returns [MapUpdateTask]. A handle that will be used to manipulate the execution of the task, for example, to cancel an ongoing request.
  ///
  MapUpdateTask performFeatureUpdate(MapUpdateProgressListener callback);
  /// Returns a handle that contains the map version of the already downloaded and installed regions.
  ///
  /// This information is only needed for debugging purposes.
  ///
  /// Returns [MapVersionHandle]. A handle to get the map version.
  ///
  /// Throws [MapLoaderExceptionException]. Specifies reason, why current map version is not returned.
  ///
  MapVersionHandle getCurrentMapVersion();
  /// Performs an asynchronous request per catalog to update map data to the latest available version.
  ///
  /// This will be performed for all previously installed [Region] map data and incomplete downloads which are in pending states.
  /// Call this in parallel to update multiple catalogs and their associated regions.
  /// Usually, the HERE SDK consists only of one catalog referencing regions for the entire world.
  /// If no regions have been downloaded, this method will update only the map cache.
  /// Previously downloaded cache data will be evicted as soon as new map data
  /// is requested, ie. by panning a map view. The map cache and the persisted regions are always
  /// bound to the same map version.
  /// If no updates are available, [MapUpdateProgressListener.onComplete] will be called immediately
  /// with a [MapLoaderError].
  /// Please also note, User can query all catalogs that have newer versions available with
  /// [MapUpdater.retrieveCatalogsUpdateInfo] and then catalog can updated individually with this method.
  ///
  /// If indexing is enabled through `OfflineSearchEngine.setIndexOptions`, then after
  /// the map has been updated, the index will be rebuilt.
  /// The index is used by `OfflineSearchEngine` to find better results.
  /// Note: Indexing is a beta feature, so there could be a few bugs and unexpected behaviors.
  ///
  /// [catalogInfo] catalog to update. CatalogUpdateInfo should be get from [MapUpdater.retrieveCatalogsUpdateInfo]
  ///
  /// [callback] Callback which receives the result on the main thread.
  ///
  /// Returns [CatalogUpdateTask]. A handle that will be used to manipulate the execution of the task, for example, to cancel an ongoing request.
  ///
  CatalogUpdateTask updateCatalog(CatalogUpdateInfo catalogInfo, CatalogUpdateProgressListener callback);
  /// Retrieves information of all catalogs that have newer version available.
  ///
  /// This method can also be used to query
  /// catalog information like HRN, current installed version and newer available version on server.
  /// An empty list in [CatalogsUpdateInfoCallback] represent no map updates.
  ///
  /// [callback] Callback which receives the result on the main thread.
  ///
  /// Returns [TaskHandle]. A handle to cancel a pending operation.
  ///
  TaskHandle retrieveCatalogsUpdateInfo(CatalogsUpdateInfoCallback callback);
  /// Sets the map update version policy.
  ///
  /// Defaults to [MapUpdaterMapUpdateVersionCommitPolicy.onComplete].
  ///
  /// [versionCommitPolicy] to choose from [MapUpdaterMapUpdateVersionCommitPolicy]
  ///
  void setVersionCommitPolicy(MapUpdaterMapUpdateVersionCommitPolicy versionCommitPolicy);
  /// Gets the number of concurrent tasks for downloading a map.
  int get taskCount;
  /// Sets the number of concurrent tasks for downloading a map.
  /// A valid task count is between 1 to 64. When the value set is outside the valid range,
  /// then it is clamped to a valid range:
  /// - when passed in value is 0 or less, then task count is set to 1;
  /// - when passed in value is 65 or more, then task count is set to 64.
  set taskCount(int value);

  /// Map update statistics for the ongoing session of the current application.
  /// In the event of binary updates, patches are downloaded and applied. This
  /// property helps to  determine the success or failure rate of applied patches.
  UpdateStatistics get updateStatistics;


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = MapUpdater$Impl(Pointer<Void>.fromAddress(0));
}

/// Defines if installed regions and subregions are updated one-by-one or if all regions are
/// updated only once the updates for all installed regions have been downloaded entirely.
///
/// This influences the required size of the storage during an update.
/// Regardless of the set policy, during an update, the previous region data is kept
/// until the new region data is committed successfully to the persisted storage.
/// This allows to revert to the previous version in case the update fails.
/// With [MapUpdaterMapUpdateVersionCommitPolicy.onComplete], more data has to be kept until
/// the update process finishes, while [MapUpdaterMapUpdateVersionCommitPolicy.onFirstRegion]
/// allows to make faster use of the downloaded region and requires less disk space as only the
/// currently updated region is kept until the process completes.
/// However, with an [MapUpdaterMapUpdateVersionCommitPolicy.onFirstRegion] policy the overall
/// process can be less reliable and bears a higher risk of errors.
enum MapUpdaterMapUpdateVersionCommitPolicy {
    /// Updates the cache and the persisted storage once the first region was fully downloaded.
    /// If only one region was requested, this setting is equivalent to [MapUpdaterMapUpdateVersionCommitPolicy.onComplete].
    /// If more regions or subregions are requested, then the policy will apply.
    /// For example, if Germany is requested to be updated, then the cache and the persisted
    /// storage will be updated as soon as any contained subregion such as Berlin or Brandenburg
    /// has been fully downloaded. The previous data for a region will be removed once
    /// that specific region has been updated successfully.
    /// However, the [MapVersionHandle] will be updated once the first region has
    /// been installed. This inconsistency will be gone, once the update process completes.
    /// In case of errors, or an aborted update process, [CatalogsUpdateInfoCallback]
    /// indicates that still an update is available until the process was successfully repeated.
    onFirstRegion,
    /// Commits the new map version to the cache and the persisted storage once all previously
    /// installed regions have been updated. For example, if Germany needs an update, then
    /// all previous data is kept until Germany including all subregions has been downloaded.
    /// This update process is more reliable than [MapUpdaterMapUpdateVersionCommitPolicy.onFirstRegion],
    /// but requires more free storage space until the process completes. Besides, users need to wait longer until
    /// they can use all updated regions.
    onComplete
}

// MapUpdaterMapUpdateVersionCommitPolicy "private" section, not exported.

int sdkMaploaderMapupdaterMapupdateversioncommitpolicyToFfi(MapUpdaterMapUpdateVersionCommitPolicy value) {
  switch (value) {
  case MapUpdaterMapUpdateVersionCommitPolicy.onFirstRegion:
    return 0;
  case MapUpdaterMapUpdateVersionCommitPolicy.onComplete:
    return 1;
  default:
    throw StateError("Invalid enum value $value for MapUpdaterMapUpdateVersionCommitPolicy enum.");
  }
}

MapUpdaterMapUpdateVersionCommitPolicy sdkMaploaderMapupdaterMapupdateversioncommitpolicyFromFfi(int handle) {
  switch (handle) {
  case 0:
    return MapUpdaterMapUpdateVersionCommitPolicy.onFirstRegion;
  case 1:
    return MapUpdaterMapUpdateVersionCommitPolicy.onComplete;
  default:
    throw StateError("Invalid numeric value $handle for MapUpdaterMapUpdateVersionCommitPolicy enum.");
  }
}

void sdkMaploaderMapupdaterMapupdateversioncommitpolicyReleaseFfiHandle(int handle) {}

final _sdkMaploaderMapupdaterMapupdateversioncommitpolicyCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_maploader_MapUpdater_MapUpdateVersionCommitPolicy_create_handle_nullable'));
final _sdkMaploaderMapupdaterMapupdateversioncommitpolicyReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_MapUpdater_MapUpdateVersionCommitPolicy_release_handle_nullable'));
final _sdkMaploaderMapupdaterMapupdateversioncommitpolicyGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_MapUpdater_MapUpdateVersionCommitPolicy_get_value_nullable'));

Pointer<Void> sdkMaploaderMapupdaterMapupdateversioncommitpolicyToFfiNullable(MapUpdaterMapUpdateVersionCommitPolicy? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMaploaderMapupdaterMapupdateversioncommitpolicyToFfi(value);
  final result = _sdkMaploaderMapupdaterMapupdateversioncommitpolicyCreateHandleNullable(_handle);
  sdkMaploaderMapupdaterMapupdateversioncommitpolicyReleaseFfiHandle(_handle);
  return result;
}

MapUpdaterMapUpdateVersionCommitPolicy? sdkMaploaderMapupdaterMapupdateversioncommitpolicyFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMaploaderMapupdaterMapupdateversioncommitpolicyGetValueNullable(handle);
  final result = sdkMaploaderMapupdaterMapupdateversioncommitpolicyFromFfi(_handle);
  sdkMaploaderMapupdaterMapupdateversioncommitpolicyReleaseFfiHandle(_handle);
  return result;
}

void sdkMaploaderMapupdaterMapupdateversioncommitpolicyReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMaploaderMapupdaterMapupdateversioncommitpolicyReleaseHandleNullable(handle);

// End of MapUpdaterMapUpdateVersionCommitPolicy "private" section.

// MapUpdater "private" section, not exported.

final _sdkMaploaderMapupdaterRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_maploader_MapUpdater_register_finalizer'));
final _sdkMaploaderMapupdaterCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_MapUpdater_copy_handle'));
final _sdkMaploaderMapupdaterReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_MapUpdater_release_handle'));




final _getCurrentMapVersionsdkMaploaderMapupdaterGetcurrentmapversionReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_MapUpdater_getCurrentMapVersion_return_release_handle'));
final _getCurrentMapVersionsdkMaploaderMapupdaterGetcurrentmapversionReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_MapUpdater_getCurrentMapVersion_return_get_result'));
final _getCurrentMapVersionsdkMaploaderMapupdaterGetcurrentmapversionReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_MapUpdater_getCurrentMapVersion_return_get_error'));
final _getCurrentMapVersionsdkMaploaderMapupdaterGetcurrentmapversionReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_MapUpdater_getCurrentMapVersion_return_has_error'));





/// @nodoc
@visibleForTesting
class MapUpdater$Impl extends __lib.NativeBase implements MapUpdater {

  MapUpdater$Impl(Pointer<Void> handle) : super(handle);

  void fromSdkEngineAsync(SDKNativeEngine sdkEngine, MapUpdaterConstructionCallback mapUpdaterConstructionCallback) {
    final _fromSdkEngineAsyncFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32, Pointer<Void>, Pointer<Void>), void Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_maploader_MapUpdater_fromEngineAsync__SDKNativeEngine_MapUpdaterConstructionCallback'));
    final _sdkEngineHandle = sdkCoreEngineSdknativeengineToFfi(sdkEngine);
    final _mapUpdaterConstructionCallbackHandle = sdkMaploaderMapupdaterconstructioncallbackToFfi(mapUpdaterConstructionCallback);
    _fromSdkEngineAsyncFfi(__lib.LibraryContext.isolateId, _sdkEngineHandle, _mapUpdaterConstructionCallbackHandle);
    sdkCoreEngineSdknativeengineReleaseFfiHandle(_sdkEngineHandle);
    sdkMaploaderMapupdaterconstructioncallbackReleaseFfiHandle(_mapUpdaterConstructionCallbackHandle);

  }

  @override
  MapUpdateTask performFeatureUpdate(MapUpdateProgressListener callback) {
    final _performFeatureUpdateFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_maploader_MapUpdater_performFeatureUpdate__MapUpdateProgressListener'));
    final _callbackHandle = sdkMaploaderMapupdateprogresslistenerToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _performFeatureUpdateFfi(_handle, __lib.LibraryContext.isolateId, _callbackHandle);
    sdkMaploaderMapupdateprogresslistenerReleaseFfiHandle(_callbackHandle);
    try {
      return sdkMaploaderMapupdatetaskFromFfi(__resultHandle);
    } finally {
      sdkMaploaderMapupdatetaskReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  MapVersionHandle getCurrentMapVersion() {
    final _getCurrentMapVersionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_maploader_MapUpdater_getCurrentMapVersion'));
    final _handle = this.handle;
    final __callResultHandle = _getCurrentMapVersionFfi(_handle, __lib.LibraryContext.isolateId);
    if (_getCurrentMapVersionsdkMaploaderMapupdaterGetcurrentmapversionReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _getCurrentMapVersionsdkMaploaderMapupdaterGetcurrentmapversionReturnGetError(__callResultHandle);
        _getCurrentMapVersionsdkMaploaderMapupdaterGetcurrentmapversionReturnReleaseHandle(__callResultHandle);
        try {
          throw MapLoaderExceptionException(sdkMaploaderMaploadererrorFromFfi(__errorHandle));
        } finally {
          sdkMaploaderMaploadererrorReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _getCurrentMapVersionsdkMaploaderMapupdaterGetcurrentmapversionReturnGetResult(__callResultHandle);
    _getCurrentMapVersionsdkMaploaderMapupdaterGetcurrentmapversionReturnReleaseHandle(__callResultHandle);
    try {
      return sdkMaploaderMapversionhandleFromFfi(__resultHandle);
    } finally {
      sdkMaploaderMapversionhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  CatalogUpdateTask updateCatalog(CatalogUpdateInfo catalogInfo, CatalogUpdateProgressListener callback) {
    final _updateCatalogFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_maploader_MapUpdater_updateCatalog__CatalogUpdateInfo_CatalogUpdateProgressListener'));
    final _catalogInfoHandle = sdkMaploaderCatalogupdateinfoToFfi(catalogInfo);
    final _callbackHandle = sdkMaploaderCatalogupdateprogresslistenerToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _updateCatalogFfi(_handle, __lib.LibraryContext.isolateId, _catalogInfoHandle, _callbackHandle);
    sdkMaploaderCatalogupdateinfoReleaseFfiHandle(_catalogInfoHandle);
    sdkMaploaderCatalogupdateprogresslistenerReleaseFfiHandle(_callbackHandle);
    try {
      return sdkMaploaderCatalogupdatetaskFromFfi(__resultHandle);
    } finally {
      sdkMaploaderCatalogupdatetaskReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle retrieveCatalogsUpdateInfo(CatalogsUpdateInfoCallback callback) {
    final _retrieveCatalogsUpdateInfoFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_maploader_MapUpdater_retrieveCatalogsUpdateInfo__CatalogsUpdateInfoCallback'));
    final _callbackHandle = sdkMaploaderCatalogsupdateinfocallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _retrieveCatalogsUpdateInfoFfi(_handle, __lib.LibraryContext.isolateId, _callbackHandle);
    sdkMaploaderCatalogsupdateinfocallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  void setVersionCommitPolicy(MapUpdaterMapUpdateVersionCommitPolicy versionCommitPolicy) {
    final _setVersionCommitPolicyFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_maploader_MapUpdater_setVersionCommitPolicy__MapUpdateVersionCommitPolicy'));
    final _versionCommitPolicyHandle = sdkMaploaderMapupdaterMapupdateversioncommitpolicyToFfi(versionCommitPolicy);
    final _handle = this.handle;
    _setVersionCommitPolicyFfi(_handle, __lib.LibraryContext.isolateId, _versionCommitPolicyHandle);
    sdkMaploaderMapupdaterMapupdateversioncommitpolicyReleaseFfiHandle(_versionCommitPolicyHandle);

  }

  @override
  int get taskCount {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_maploader_MapUpdater_taskCount_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }

  @override
  set taskCount(int value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_maploader_MapUpdater_taskCount_set__UInt'));
    final _valueHandle = (value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);


  }


  @override
  UpdateStatistics get updateStatistics {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_maploader_MapUpdater_updateStatistics_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkMaploaderUpdatestatisticsFromFfi(__resultHandle);
    } finally {
      sdkMaploaderUpdatestatisticsReleaseFfiHandle(__resultHandle);

    }

  }



}

Pointer<Void> sdkMaploaderMapupdaterToFfi(MapUpdater value) =>
  _sdkMaploaderMapupdaterCopyHandle((value as __lib.NativeBase).handle);

MapUpdater sdkMaploaderMapupdaterFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is MapUpdater) return instance;

  final _copiedHandle = _sdkMaploaderMapupdaterCopyHandle(handle);
  final result = MapUpdater$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMaploaderMapupdaterRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMaploaderMapupdaterReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMaploaderMapupdaterReleaseHandle(handle);

Pointer<Void> sdkMaploaderMapupdaterToFfiNullable(MapUpdater? value) =>
  value != null ? sdkMaploaderMapupdaterToFfi(value) : Pointer<Void>.fromAddress(0);

MapUpdater? sdkMaploaderMapupdaterFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMaploaderMapupdaterFromFfi(handle) : null;

void sdkMaploaderMapupdaterReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMaploaderMapupdaterReleaseHandle(handle);

// End of MapUpdater "private" section.


