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
import 'package:here_sdk/src/sdk/core/errors/instantiation_error_code.dart';
import 'package:here_sdk/src/sdk/core/errors/instantiation_exception.dart';
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';
import 'package:here_sdk/src/sdk/core/language_code.dart';
import 'package:here_sdk/src/sdk/core/picked_place.dart';
import 'package:here_sdk/src/sdk/core/threading/on_task_completed.dart';
import 'package:here_sdk/src/sdk/core/threading/task_handle.dart';
import 'package:here_sdk/src/sdk/search/address_query.dart';
import 'package:here_sdk/src/sdk/search/category_query.dart';
import 'package:here_sdk/src/sdk/search/my_places.dart';
import 'package:here_sdk/src/sdk/search/offline_search_index.dart';
import 'package:here_sdk/src/sdk/search/offline_search_index_listener.dart';
import 'package:here_sdk/src/sdk/search/place_id_query.dart';
import 'package:here_sdk/src/sdk/search/place_id_search_callback.dart';
import 'package:here_sdk/src/sdk/search/search_callback.dart';
import 'package:here_sdk/src/sdk/search/search_options.dart';
import 'package:here_sdk/src/sdk/search/structured_query.dart';
import 'package:here_sdk/src/sdk/search/suggest_callback.dart';
import 'package:here_sdk/src/sdk/search/text_query.dart';
import 'package:meta/meta.dart';

/// The OfflineSearchEngine works without internet and unlocks the search and geocoding
/// capabilities of HERE services to provide developers with unmatched flexibility
/// to create differentiating location-enabled applications.
///
/// It provides the same interfaces as the SearchEngine, but the results may slightly
/// differ as the results are taken from already downloaded map data instead of initiating
/// a new request to a HERE backend service. This way the data may be, for example, older
/// compared to the data you may receive when using the SearchEngine. On the other hand,
/// this class provides results faster as no online connection is necessary.
///
/// In comparison to the SearchEngine, there are a few limitations:
///
/// - The IDs of POIs are different and may differ among different map versions.
/// - The implementation is different and the resources are limited, so the results can differ.
///
/// Note: You can only search on already cached map data or persistent map data (downloaded via MapDownloader).
/// Make sure that at least [LayerConfigurationFeature.offlineSearch] is enabled.
/// For EV rich attributes, also enable [LayerConfigurationFeature.ev].
/// For truck rich attributes, also enable [LayerConfigurationFeature.truckServiceAttributes].
/// For fuel station rich attributes, also enable [LayerConfigurationFeature.fuelStationAttributes].
abstract class OfflineSearchEngine {
  /// Creates a new instance of this class.
  ///
  /// Throws [InstantiationException]. Indicates what went wrong when the instantiation was attempted.
  ///
  factory OfflineSearchEngine() => $prototype.$init();
  /// Creates a new instance of this class.
  ///
  /// [sdkEngine] Instance of an existing SDKEngine.
  ///
  /// Throws [InstantiationException]. Indicates what went wrong when the instantiation was attempted.
  ///
  factory OfflineSearchEngine.withSdkEngine(SDKNativeEngine sdkEngine) => $prototype.withSdkEngine(sdkEngine);

  /// Attach data source into SearchEngine instance.
  ///
  /// Places from MyPlaces ranked the same
  /// way as places from default source.
  /// New data source replaces old one.
  /// Note: Only OfflineSearchEngine supports search over MyPlaces.
  ///
  /// [dataSource] The data source.
  ///
  /// [callback] The callback to be called when task is completed.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle attach(MyPlaces dataSource, OnTaskCompleted callback);
  /// Performs an asynchronous request to search for places.
  ///
  /// The user submits a free-form text request
  /// that returns candidate places in the order of intent matching relevance.
  ///
  /// If indexing is enabled through [OfflineSearchEngine.setIndexOptions], when map data has been
  /// downloaded or updated (using `MapDownloader` or `MapUpdater`), then index will be available
  /// to help find better results. It enables finding places that are far from the search center.
  /// The index contains only entries for regions that have been installed via `MapDownloader`.
  /// Cached map data is not indexed.
  /// While a new index is being created, `OfflineSearchEngine` functionality can still be used.
  /// However, without a valid index in place yet, it operates as though indexing is disabled.
  /// Note: Indexing is a beta feature, so there could be a few bugs and unexpected behaviors.
  ///
  /// [query] Desired text query to search.
  ///
  /// [options] Search options.
  ///
  /// [callback] Callback which receives the result on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle searchByText(TextQuery query, SearchOptions options, SearchCallback callback);
  /// Performs asynchronous request to search for places based on a list of categories.
  ///
  /// [query] Query with list of desired categories.
  ///
  /// [options] Search options.
  ///
  /// [callback] Callback which receives the result on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle searchByCategory(CategoryQuery query, SearchOptions options, SearchCallback callback);
  /// Performs an asynchronous request to search for places at given coordinates and returns
  /// candidate places in the order of intent matching relevance.
  ///
  /// [coordinates] The coordinates where to search.
  ///
  /// [options] Search options.
  ///
  /// [callback] Callback which receives the result on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle searchByCoordinates(GeoCoordinates coordinates, SearchOptions options, SearchCallback callback);
  /// Performs an asynchronous request to search for places.
  ///
  /// The user submits a free-form address text
  /// request that returns candidate places in the order of intent matching relevance.
  ///
  /// If indexing is enabled through [OfflineSearchEngine.setIndexOptions], when map data has been
  /// downloaded or updated (using `MapDownloader` or `MapUpdater`), then index will be available
  /// to help find better results. It enables finding places that are far from the search center.
  /// The index contains only entries for regions that have been installed via `MapDownloader`.
  /// Cached map data is not indexed.
  /// While a new index is being created, `OfflineSearchEngine` functionality can still be used.
  /// However, without a valid index in place yet, it operates as though indexing is disabled.
  /// Note: Indexing is a beta feature, so there could be a few bugs and unexpected behaviors.
  ///
  /// [query] Desired address query to search.
  ///
  /// [options] Search options.
  ///
  /// [callback] Callback which receives the result on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle searchByAddress(AddressQuery query, SearchOptions options, SearchCallback callback);
  /// Performs an asynchronous request to search for a [Place] based on the content
  /// found in `PickedPlace`.
  ///
  /// If `PickedPlace` data is obtained from the offline map, in some rare cases it may happen
  /// that `offlineSearchId` is empty. That means that the POI details may not be
  /// available. In that case, the returned place contains only the basic information that
  /// was provided in `pickedPlace`.
  ///
  /// [pickedPlace] The content picked from map.
  ///
  /// [languageCode] The preferred language for the search result. When unset or unsupported language is chosen,
  /// result will be returned in the local language.
  ///
  /// [callback] Callback which receives the result on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle searchPickedPlace(PickedPlace pickedPlace, LanguageCode? languageCode, PlaceIdSearchCallback callback);
  /// Performs an asynchronous request to search for a [Place] based on its ID and [LanguageCode].
  ///
  /// [query] The id of place to search.
  ///
  /// [languageCode] The preferred language for the search results. When unset or unsupported language is chosen,
  /// results will be returned in their local language.
  ///
  /// [callback] Callback which receives the result on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle searchByPlaceIdWithLanguageCode(PlaceIdQuery query, LanguageCode? languageCode, PlaceIdSearchCallback callback);
  /// Performs an asynchronous request to search for places.
  ///
  /// The user submits a [StructuredQuery]
  /// that returns places adhering to the constraints provided in [StructuredQuery].
  /// For example, when user wants results of type street for a text query `Invalidenstraße` in `Berlin`, it can be searched
  /// by preparing [StructuredQuery] providing [StructuredQuery.query] as `Invalidenstraße`,
  /// [StructuredQuery.areaCenter], [StructuredQueryAddressElements.country] as `Germany`,
  /// [StructuredQueryAddressElements.city] as `Berlin` and [StructuredQueryResultType] as `STREET`.
  /// The results will be presented only from the given geographical area.
  ///
  /// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
  /// Related APIs may change for new releases without a deprecation process.
  ///
  /// [query] Desired structured query to search.
  ///
  /// [options] Search options.
  ///
  /// [callback] Callback which receives the result on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle searchByAddressElements(StructuredQuery query, SearchOptions options, SearchCallback callback);
  /// Performs an asynchronous request to suggest places for text queries and
  /// returns candidate suggestions sorted by relevance.
  ///
  /// If indexing is enabled through [OfflineSearchEngine.setIndexOptions], when map data has been
  /// downloaded or updated (using `MapDownloader` or `MapUpdater`), then index will be available
  /// to help find better results. It enables finding places that are far from the search center.
  /// The index contains only entries for regions that have been installed via `MapDownloader`.
  /// Cached map data is not indexed.
  /// While a new index is being created, `OfflineSearchEngine` functionality can still be used.
  /// However, without a valid index in place yet, it operates as though indexing is disabled.
  /// Note: Indexing is a beta feature, so there could be a few bugs and unexpected behaviors.
  ///
  /// [query] Desired text query to search.
  ///
  /// [options] Search options.
  ///
  /// [callback] Callback which receives the result on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle suggest(TextQuery query, SearchOptions options, SuggestCallback callback);
  /// Performs an asynchronous request to suggest places for a [StructuredQuery] built with address elements and
  /// returns candidate suggestions sorted by relevance.
  ///
  /// For example, when user wants suggestions of type street for a text query `Invalidenstraße` in `Berlin`, it can be searched
  /// by preparing [StructuredQuery] providing [StructuredQuery.query] as `Invalidenstraße`,
  /// [StructuredQuery.areaCenter], [StructuredQueryAddressElements.country] as `Germany`,
  /// [StructuredQueryAddressElements.city] as `Berlin` and [StructuredQueryResultType] as `STREET`.
  /// The suggestions will be presented only from the given geographical area.
  ///
  /// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
  /// Related APIs may change for new releases without a deprecation process.
  ///
  /// [query] Desired structured query to search.
  ///
  /// [options] Search options.
  ///
  /// [callback] Callback which receives the result on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle suggestByAddressElements(StructuredQuery query, SearchOptions options, SuggestCallback callback);
  /// Enables or disables indexing.
  ///
  /// When indexing is enabled, HERE SDK will create a detailed index over persistent
  /// map data and update it as needed.
  /// A detailed index enables finding data faster and over entire persistent map.
  /// Creating an index takes time, but usually no more than a few seconds up to a couple of
  /// minutes, depending on persistent map size.
  /// As the feature is improved, the indexing time will improve.
  /// Also please note that this is a heavy processing task.
  /// The stored index increases the space taken by offline maps by around 2-5%.
  /// This may also improve in future versions.
  ///
  /// Indexing is disabled by default.
  /// If you want it enabled, make sure to call setIndexOptions with `OfflineSearchIndex.Options.enabled` as true before
  /// any operations in `MapDownloader` or `MapUpdater` that modify the persistent map.
  /// Calling setIndexOptions may also create or remove map index to match the previously
  /// installed map regions. If the matching index for installed map regions is found, then
  /// indexing is skipped.
  /// While a new index is being created, `OfflineSearchEngine` functionality can still be used.
  /// However, without a valid index in place yet, it operates as though indexing is disabled.
  /// If `SDKNativeEngine` is disposed during indexing (for example, by closing the app),
  /// the indexing is cancelled. Recreating `SDKNativeEngine` and enabling indexing will
  /// ensure that index is created.
  ///
  /// Note: This is a beta release of this feature, so there could be a few bugs and unexpected
  /// behaviors. Related APIs may change for new releases without a deprecation process.
  ///
  /// [sdkEngine] Indexing is enabled and disabled per SDKNativeEngine instance.
  /// The index is created inside the related [SDKOptions.persistentMapStoragePath].
  ///
  /// [options] Sets indexing options.
  ///
  /// [listener] The listener that will receive updates about indexing process.
  /// When `OfflineSearchIndex.Options.enabled` is true, SDK would store listener and the listener will receive updates
  /// about indexing progress every time it is performed.
  /// When `OfflineSearchIndex.Options.enabled` is false, SDK would report indexing removal progress to the listener
  /// one last time and remove storage of listener.
  ///
  /// Returns [OfflineSearchIndexError?]. An error in case there was one.
  ///
  /// It's `null` if the indexing listener could be
  /// configured successfully.
  ///
  static OfflineSearchIndexError? setIndexOptions(SDKNativeEngine sdkEngine, OfflineSearchIndexOptions options, OfflineSearchIndexListener listener) => $prototype.setIndexOptions(sdkEngine, options, listener);

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = OfflineSearchEngine$Impl(Pointer<Void>.fromAddress(0));
}


// OfflineSearchEngine "private" section, not exported.

final _sdkSearchOfflinesearchengineRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_search_OfflineSearchEngine_register_finalizer'));
final _sdkSearchOfflinesearchengineCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_OfflineSearchEngine_copy_handle'));
final _sdkSearchOfflinesearchengineReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_OfflineSearchEngine_release_handle'));


final _$initsdkSearchOfflinesearchengineMakeReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_OfflineSearchEngine_make_return_release_handle'));
final _$initsdkSearchOfflinesearchengineMakeReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_OfflineSearchEngine_make_return_get_result'));
final _$initsdkSearchOfflinesearchengineMakeReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_OfflineSearchEngine_make_return_get_error'));
final _$initsdkSearchOfflinesearchengineMakeReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_OfflineSearchEngine_make_return_has_error'));


final _withSdkEnginesdkSearchOfflinesearchengineMakeSdknativeengineReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_OfflineSearchEngine_make__SDKNativeEngine_return_release_handle'));
final _withSdkEnginesdkSearchOfflinesearchengineMakeSdknativeengineReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_OfflineSearchEngine_make__SDKNativeEngine_return_get_result'));
final _withSdkEnginesdkSearchOfflinesearchengineMakeSdknativeengineReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_OfflineSearchEngine_make__SDKNativeEngine_return_get_error'));
final _withSdkEnginesdkSearchOfflinesearchengineMakeSdknativeengineReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_OfflineSearchEngine_make__SDKNativeEngine_return_has_error'));













/// @nodoc
@visibleForTesting
class OfflineSearchEngine$Impl extends __lib.NativeBase implements OfflineSearchEngine {

  OfflineSearchEngine$Impl(Pointer<Void> handle) : super(handle);


  OfflineSearchEngine $init() {
    final _result_handle = _$init();
    final _result = OfflineSearchEngine$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkSearchOfflinesearchengineRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }


  OfflineSearchEngine withSdkEngine(SDKNativeEngine sdkEngine) {
    final _result_handle = _withSdkEngine(sdkEngine);
    final _result = OfflineSearchEngine$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkSearchOfflinesearchengineRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _$init() {
    final _$initFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('here_sdk_sdk_search_OfflineSearchEngine_make'));
    final __callResultHandle = _$initFfi(__lib.LibraryContext.isolateId);
    if (_$initsdkSearchOfflinesearchengineMakeReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _$initsdkSearchOfflinesearchengineMakeReturnGetError(__callResultHandle);
        _$initsdkSearchOfflinesearchengineMakeReturnReleaseHandle(__callResultHandle);
        try {
          throw InstantiationException(sdkCoreErrorsInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkCoreErrorsInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _$initsdkSearchOfflinesearchengineMakeReturnGetResult(__callResultHandle);
    _$initsdkSearchOfflinesearchengineMakeReturnReleaseHandle(__callResultHandle);
    return __resultHandle;
  }

  static Pointer<Void> _withSdkEngine(SDKNativeEngine sdkEngine) {
    final _withSdkEngineFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_search_OfflineSearchEngine_make__SDKNativeEngine'));
    final _sdkEngineHandle = sdkCoreEngineSdknativeengineToFfi(sdkEngine);
    final __callResultHandle = _withSdkEngineFfi(__lib.LibraryContext.isolateId, _sdkEngineHandle);
    sdkCoreEngineSdknativeengineReleaseFfiHandle(_sdkEngineHandle);
    if (_withSdkEnginesdkSearchOfflinesearchengineMakeSdknativeengineReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _withSdkEnginesdkSearchOfflinesearchengineMakeSdknativeengineReturnGetError(__callResultHandle);
        _withSdkEnginesdkSearchOfflinesearchengineMakeSdknativeengineReturnReleaseHandle(__callResultHandle);
        try {
          throw InstantiationException(sdkCoreErrorsInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkCoreErrorsInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _withSdkEnginesdkSearchOfflinesearchengineMakeSdknativeengineReturnGetResult(__callResultHandle);
    _withSdkEnginesdkSearchOfflinesearchengineMakeSdknativeengineReturnReleaseHandle(__callResultHandle);
    return __resultHandle;
  }

  @override
  TaskHandle attach(MyPlaces dataSource, OnTaskCompleted callback) {
    final _attachFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_OfflineSearchEngine_attach__MyPlaces_OnTaskCompleted'));
    final _dataSourceHandle = sdkSearchMyplacesToFfi(dataSource);
    final _callbackHandle = sdkCoreThreadingOntaskcompletedToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _attachFfi(_handle, __lib.LibraryContext.isolateId, _dataSourceHandle, _callbackHandle);
    sdkSearchMyplacesReleaseFfiHandle(_dataSourceHandle);
    sdkCoreThreadingOntaskcompletedReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle searchByText(TextQuery query, SearchOptions options, SearchCallback callback) {
    final _searchByTextFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_OfflineSearchEngine_search__TextQuery_SearchOptions_SearchCallback'));
    final _queryHandle = sdkSearchTextqueryToFfi(query);
    final _optionsHandle = sdkSearchSearchoptionsToFfi(options);
    final _callbackHandle = sdkSearchSearchcallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _searchByTextFfi(_handle, __lib.LibraryContext.isolateId, _queryHandle, _optionsHandle, _callbackHandle);
    sdkSearchTextqueryReleaseFfiHandle(_queryHandle);
    sdkSearchSearchoptionsReleaseFfiHandle(_optionsHandle);
    sdkSearchSearchcallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle searchByCategory(CategoryQuery query, SearchOptions options, SearchCallback callback) {
    final _searchByCategoryFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_OfflineSearchEngine_search__CategoryQuery_SearchOptions_SearchCallback'));
    final _queryHandle = sdkSearchCategoryqueryToFfi(query);
    final _optionsHandle = sdkSearchSearchoptionsToFfi(options);
    final _callbackHandle = sdkSearchSearchcallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _searchByCategoryFfi(_handle, __lib.LibraryContext.isolateId, _queryHandle, _optionsHandle, _callbackHandle);
    sdkSearchCategoryqueryReleaseFfiHandle(_queryHandle);
    sdkSearchSearchoptionsReleaseFfiHandle(_optionsHandle);
    sdkSearchSearchcallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle searchByCoordinates(GeoCoordinates coordinates, SearchOptions options, SearchCallback callback) {
    final _searchByCoordinatesFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_OfflineSearchEngine_search__GeoCoordinates_SearchOptions_SearchCallback'));
    final _coordinatesHandle = sdkCoreGeocoordinatesToFfi(coordinates);
    final _optionsHandle = sdkSearchSearchoptionsToFfi(options);
    final _callbackHandle = sdkSearchSearchcallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _searchByCoordinatesFfi(_handle, __lib.LibraryContext.isolateId, _coordinatesHandle, _optionsHandle, _callbackHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_coordinatesHandle);
    sdkSearchSearchoptionsReleaseFfiHandle(_optionsHandle);
    sdkSearchSearchcallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle searchByAddress(AddressQuery query, SearchOptions options, SearchCallback callback) {
    final _searchByAddressFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_OfflineSearchEngine_search__AddressQuery_SearchOptions_SearchCallback'));
    final _queryHandle = sdkSearchAddressqueryToFfi(query);
    final _optionsHandle = sdkSearchSearchoptionsToFfi(options);
    final _callbackHandle = sdkSearchSearchcallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _searchByAddressFfi(_handle, __lib.LibraryContext.isolateId, _queryHandle, _optionsHandle, _callbackHandle);
    sdkSearchAddressqueryReleaseFfiHandle(_queryHandle);
    sdkSearchSearchoptionsReleaseFfiHandle(_optionsHandle);
    sdkSearchSearchcallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle searchPickedPlace(PickedPlace pickedPlace, LanguageCode? languageCode, PlaceIdSearchCallback callback) {
    final _searchPickedPlaceFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_OfflineSearchEngine_searchPickedPlace__PickedPlace_LanguageCode__PlaceIdSearchCallback'));
    final _pickedPlaceHandle = sdkCorePickedplaceToFfi(pickedPlace);
    final _languageCodeHandle = sdkCoreLanguagecodeToFfiNullable(languageCode);
    final _callbackHandle = sdkSearchPlaceidsearchcallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _searchPickedPlaceFfi(_handle, __lib.LibraryContext.isolateId, _pickedPlaceHandle, _languageCodeHandle, _callbackHandle);
    sdkCorePickedplaceReleaseFfiHandle(_pickedPlaceHandle);
    sdkCoreLanguagecodeReleaseFfiHandleNullable(_languageCodeHandle);
    sdkSearchPlaceidsearchcallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle searchByPlaceIdWithLanguageCode(PlaceIdQuery query, LanguageCode? languageCode, PlaceIdSearchCallback callback) {
    final _searchByPlaceIdWithLanguageCodeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_OfflineSearchEngine_search__PlaceIdQuery_LanguageCode__PlaceIdSearchCallback'));
    final _queryHandle = sdkSearchPlaceidqueryToFfi(query);
    final _languageCodeHandle = sdkCoreLanguagecodeToFfiNullable(languageCode);
    final _callbackHandle = sdkSearchPlaceidsearchcallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _searchByPlaceIdWithLanguageCodeFfi(_handle, __lib.LibraryContext.isolateId, _queryHandle, _languageCodeHandle, _callbackHandle);
    sdkSearchPlaceidqueryReleaseFfiHandle(_queryHandle);
    sdkCoreLanguagecodeReleaseFfiHandleNullable(_languageCodeHandle);
    sdkSearchPlaceidsearchcallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle searchByAddressElements(StructuredQuery query, SearchOptions options, SearchCallback callback) {
    final _searchByAddressElementsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_OfflineSearchEngine_search__StructuredQuery_SearchOptions_SearchCallback'));
    final _queryHandle = sdkSearchStructuredqueryToFfi(query);
    final _optionsHandle = sdkSearchSearchoptionsToFfi(options);
    final _callbackHandle = sdkSearchSearchcallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _searchByAddressElementsFfi(_handle, __lib.LibraryContext.isolateId, _queryHandle, _optionsHandle, _callbackHandle);
    sdkSearchStructuredqueryReleaseFfiHandle(_queryHandle);
    sdkSearchSearchoptionsReleaseFfiHandle(_optionsHandle);
    sdkSearchSearchcallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle suggest(TextQuery query, SearchOptions options, SuggestCallback callback) {
    final _suggestFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_OfflineSearchEngine_suggest__TextQuery_SearchOptions_SuggestCallback'));
    final _queryHandle = sdkSearchTextqueryToFfi(query);
    final _optionsHandle = sdkSearchSearchoptionsToFfi(options);
    final _callbackHandle = sdkSearchSuggestcallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _suggestFfi(_handle, __lib.LibraryContext.isolateId, _queryHandle, _optionsHandle, _callbackHandle);
    sdkSearchTextqueryReleaseFfiHandle(_queryHandle);
    sdkSearchSearchoptionsReleaseFfiHandle(_optionsHandle);
    sdkSearchSuggestcallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle suggestByAddressElements(StructuredQuery query, SearchOptions options, SuggestCallback callback) {
    final _suggestByAddressElementsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_OfflineSearchEngine_suggest__StructuredQuery_SearchOptions_SuggestCallback'));
    final _queryHandle = sdkSearchStructuredqueryToFfi(query);
    final _optionsHandle = sdkSearchSearchoptionsToFfi(options);
    final _callbackHandle = sdkSearchSuggestcallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _suggestByAddressElementsFfi(_handle, __lib.LibraryContext.isolateId, _queryHandle, _optionsHandle, _callbackHandle);
    sdkSearchStructuredqueryReleaseFfiHandle(_queryHandle);
    sdkSearchSearchoptionsReleaseFfiHandle(_optionsHandle);
    sdkSearchSuggestcallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  OfflineSearchIndexError? setIndexOptions(SDKNativeEngine sdkEngine, OfflineSearchIndexOptions options, OfflineSearchIndexListener listener) {
    final _setIndexOptionsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_OfflineSearchEngine_setIndexOptions__SDKNativeEngine_Options_OfflineSearchIndexListener'));
    final _sdkEngineHandle = sdkCoreEngineSdknativeengineToFfi(sdkEngine);
    final _optionsHandle = sdkSearchOfflinesearchindexOptionsToFfi(options);
    final _listenerHandle = sdkSearchOfflinesearchindexlistenerToFfi(listener);
    final __resultHandle = _setIndexOptionsFfi(__lib.LibraryContext.isolateId, _sdkEngineHandle, _optionsHandle, _listenerHandle);
    sdkCoreEngineSdknativeengineReleaseFfiHandle(_sdkEngineHandle);
    sdkSearchOfflinesearchindexOptionsReleaseFfiHandle(_optionsHandle);
    sdkSearchOfflinesearchindexlistenerReleaseFfiHandle(_listenerHandle);
    try {
      return sdkSearchOfflinesearchindexErrorFromFfiNullable(__resultHandle);
    } finally {
      sdkSearchOfflinesearchindexErrorReleaseFfiHandleNullable(__resultHandle);

    }

  }


}

Pointer<Void> sdkSearchOfflinesearchengineToFfi(OfflineSearchEngine value) =>
  _sdkSearchOfflinesearchengineCopyHandle((value as __lib.NativeBase).handle);

OfflineSearchEngine sdkSearchOfflinesearchengineFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is OfflineSearchEngine) return instance;

  final _copiedHandle = _sdkSearchOfflinesearchengineCopyHandle(handle);
  final result = OfflineSearchEngine$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkSearchOfflinesearchengineRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkSearchOfflinesearchengineReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkSearchOfflinesearchengineReleaseHandle(handle);

Pointer<Void> sdkSearchOfflinesearchengineToFfiNullable(OfflineSearchEngine? value) =>
  value != null ? sdkSearchOfflinesearchengineToFfi(value) : Pointer<Void>.fromAddress(0);

OfflineSearchEngine? sdkSearchOfflinesearchengineFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkSearchOfflinesearchengineFromFfi(handle) : null;

void sdkSearchOfflinesearchengineReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchOfflinesearchengineReleaseHandle(handle);

// End of OfflineSearchEngine "private" section.


