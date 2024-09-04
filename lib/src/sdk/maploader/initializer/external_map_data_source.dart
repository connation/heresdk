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
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/engine/catalog_identifier.dart';
import 'package:here_sdk/src/sdk/core/engine/s_d_k_native_engine.dart';
import 'package:here_sdk/src/sdk/maploader/initializer/external_map_data_source_error_code.dart';
import 'package:here_sdk/src/sdk/maploader/initializer/external_map_data_source_exception_exception.dart';
import 'package:meta/meta.dart';

/// Factory class to configure SDK with external map data source.
///
/// By "external map data source" we mean the map data service that is connected under the hood by our internal OCM Access Manager (OCM AM).
/// This feature can help to share data with multiple user profiles on the same device.
/// Note that this feature requires an advanced set-up.
/// In case of doubt, please contact your HERE representative.
///
/// Usage example:
///
/// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
/// Related APIs may change for new releases without a deprecation process.
abstract class ExternalMapDataSource {

  /// Initialize [SDKNativeEngine] with URL of the remote map data source gRPC server.
  ///
  /// Newly injected map data source replaces exiting one if [SDKNativeEngine] was already connected.
  /// Suggested configuration is taken from [SDKOptions.catalogConfigurations], actual catalog
  /// versions are queried from the remote connection in order to be in sync.
  ///
  /// [url] URL to connect with the remote map data source gRPC server.
  /// The remote map data source gRPC server could be self managed service created with help OCM Access Manager (OCM AM) or
  /// service exposed using [ExternalMapDataSource.start]
  ///
  /// [engine] Instance of an existing [SDKNativeEngine].
  ///
  /// Throws [ExternalMapDataSourceExceptionException]. Indicates what went wrong when initialization of SDK with external map data source was attempted.
  ///
  static void configureSdkEngineWithAutoRemoteConnection(String url, SDKNativeEngine engine) => $prototype.configureSdkEngineWithAutoRemoteConnection(url, engine);
  /// Initialize [SDKNativeEngine] with URL of the remote map data source gRPC server.
  ///
  /// Newly injected map data source replaces exiting one if [SDKNativeEngine] was already connected.
  /// Overrides automatic version resolution, in favour of explicitly passed one.
  ///
  /// [url] URL to connect with the remote map data source gRPC server.
  /// The remote map data source gRPC server could be self managed service created with help OCM Access Manager (OCM AM) or
  /// service exposed using [ExternalMapDataSource.start]
  ///
  /// [catalogConfigs] List of [CatalogIdentifier] with HRNs and corresponding catalog versions.
  /// The same catalogs must be added to the `DataStoreServer` instance on the server side.
  /// Otherwise, the `DataStoreClient` instance will not be able to load data from the catalog.
  /// In this case function will throw `ExternalMapDataSourceException.ADD_CATALOG_ERROR`.
  ///
  /// [engine] Instance of an existing [SDKNativeEngine].
  ///
  /// Throws [ExternalMapDataSourceExceptionException]. Indicates what went wrong when initialization of SDK with external map data source was attempted.
  ///
  static void configureSdkEngineWithFixedRemoteConnection(String url, List<CatalogIdentifier> catalogConfigs, SDKNativeEngine engine) => $prototype.configureSdkEngineWithFixedRemoteConnection(url, catalogConfigs, engine);
  /// Exposes map data source as GRPC service on given url for [SDKNativeEngine].
  ///
  /// The exposed service can be consumed with the help of [ExternalMapDataSource.configureSdkEngineWithAutoRemoteConnection]
  /// or [ExternalMapDataSource.configureSdkEngineWithFixedRemoteConnection]
  ///
  /// Note: This is a beta release of this feature,
  /// so there could be a few bugs and unexpected behaviors.
  /// Related APIs may change for new releases without a deprecation process.
  ///
  /// [url] URL in the 'ip_address:port' format. Address will be used to bind to the GRPC server.
  ///
  /// [engine] Instance of an existing [SDKNativeEngine].
  ///
  /// Returns [ExternalMapDataSource]. An object to control the lifetime of the server.
  ///
  /// Throws [ExternalMapDataSourceExceptionException]. Indicates what went wrong when trying to expose external map data source.
  ///
  static ExternalMapDataSource start(String url, SDKNativeEngine engine) => $prototype.start(url, engine);
  /// Stops the exposed map data source GRPC service started using [ExternalMapDataSource.start].
  ///
  /// Note: This is a beta release of this feature,
  /// so there could be a few bugs and unexpected behaviors.
  /// Related APIs may change for new releases without a deprecation process.
  ///
  /// [engine] Instance of an existing [SDKNativeEngine].
  ///
  /// Throws [ExternalMapDataSourceExceptionException]. Indicates what went wrong when trying to stop exposed external map data source service.
  ///
  void stop(SDKNativeEngine engine);

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = ExternalMapDataSource$Impl(Pointer<Void>.fromAddress(0));
}


// ExternalMapDataSource "private" section, not exported.

final _sdkMaploaderInitializerExternalmapdatasourceRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_maploader_initializer_ExternalMapDataSource_register_finalizer'));
final _sdkMaploaderInitializerExternalmapdatasourceCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_initializer_ExternalMapDataSource_copy_handle'));
final _sdkMaploaderInitializerExternalmapdatasourceReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_initializer_ExternalMapDataSource_release_handle'));


final _configureSdkEngineWithAutoRemoteConnectionsdkMaploaderInitializerExternalmapdatasourceConfiguresdkenginewithautoremoteconnectionStringSdknativeengineReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_initializer_ExternalMapDataSource_configureSdkEngineWithAutoRemoteConnection__String_SDKNativeEngine_return_release_handle'));
final _configureSdkEngineWithAutoRemoteConnectionsdkMaploaderInitializerExternalmapdatasourceConfiguresdkenginewithautoremoteconnectionStringSdknativeengineReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_initializer_ExternalMapDataSource_configureSdkEngineWithAutoRemoteConnection__String_SDKNativeEngine_return_get_error'));
final _configureSdkEngineWithAutoRemoteConnectionsdkMaploaderInitializerExternalmapdatasourceConfiguresdkenginewithautoremoteconnectionStringSdknativeengineReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_initializer_ExternalMapDataSource_configureSdkEngineWithAutoRemoteConnection__String_SDKNativeEngine_return_has_error'));


final _configureSdkEngineWithFixedRemoteConnectionsdkMaploaderInitializerExternalmapdatasourceConfiguresdkenginewithfixedremoteconnectionStringListofSdkCoreEngineCatalogidentifierSdknativeengineReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_initializer_ExternalMapDataSource_configureSdkEngineWithFixedRemoteConnection__String_ListOf_sdk_core_engine_CatalogIdentifier_SDKNativeEngine_return_release_handle'));
final _configureSdkEngineWithFixedRemoteConnectionsdkMaploaderInitializerExternalmapdatasourceConfiguresdkenginewithfixedremoteconnectionStringListofSdkCoreEngineCatalogidentifierSdknativeengineReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_initializer_ExternalMapDataSource_configureSdkEngineWithFixedRemoteConnection__String_ListOf_sdk_core_engine_CatalogIdentifier_SDKNativeEngine_return_get_error'));
final _configureSdkEngineWithFixedRemoteConnectionsdkMaploaderInitializerExternalmapdatasourceConfiguresdkenginewithfixedremoteconnectionStringListofSdkCoreEngineCatalogidentifierSdknativeengineReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_initializer_ExternalMapDataSource_configureSdkEngineWithFixedRemoteConnection__String_ListOf_sdk_core_engine_CatalogIdentifier_SDKNativeEngine_return_has_error'));


final _startsdkMaploaderInitializerExternalmapdatasourceStartStringSdknativeengineReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_initializer_ExternalMapDataSource_start__String_SDKNativeEngine_return_release_handle'));
final _startsdkMaploaderInitializerExternalmapdatasourceStartStringSdknativeengineReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_initializer_ExternalMapDataSource_start__String_SDKNativeEngine_return_get_result'));
final _startsdkMaploaderInitializerExternalmapdatasourceStartStringSdknativeengineReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_initializer_ExternalMapDataSource_start__String_SDKNativeEngine_return_get_error'));
final _startsdkMaploaderInitializerExternalmapdatasourceStartStringSdknativeengineReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_initializer_ExternalMapDataSource_start__String_SDKNativeEngine_return_has_error'));


final _stopsdkMaploaderInitializerExternalmapdatasourceStopSdknativeengineReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_initializer_ExternalMapDataSource_stop__SDKNativeEngine_return_release_handle'));
final _stopsdkMaploaderInitializerExternalmapdatasourceStopSdknativeengineReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_initializer_ExternalMapDataSource_stop__SDKNativeEngine_return_get_error'));
final _stopsdkMaploaderInitializerExternalmapdatasourceStopSdknativeengineReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_initializer_ExternalMapDataSource_stop__SDKNativeEngine_return_has_error'));


/// @nodoc
@visibleForTesting
class ExternalMapDataSource$Impl extends __lib.NativeBase implements ExternalMapDataSource {

  ExternalMapDataSource$Impl(Pointer<Void> handle) : super(handle);

  void configureSdkEngineWithAutoRemoteConnection(String url, SDKNativeEngine engine) {
    final _configureSdkEngineWithAutoRemoteConnectionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_maploader_initializer_ExternalMapDataSource_configureSdkEngineWithAutoRemoteConnection__String_SDKNativeEngine'));
    final _urlHandle = stringToFfi(url);
    final _engineHandle = sdkCoreEngineSdknativeengineToFfi(engine);
    final __callResultHandle = _configureSdkEngineWithAutoRemoteConnectionFfi(__lib.LibraryContext.isolateId, _urlHandle, _engineHandle);
    stringReleaseFfiHandle(_urlHandle);
    sdkCoreEngineSdknativeengineReleaseFfiHandle(_engineHandle);
    if (_configureSdkEngineWithAutoRemoteConnectionsdkMaploaderInitializerExternalmapdatasourceConfiguresdkenginewithautoremoteconnectionStringSdknativeengineReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _configureSdkEngineWithAutoRemoteConnectionsdkMaploaderInitializerExternalmapdatasourceConfiguresdkenginewithautoremoteconnectionStringSdknativeengineReturnGetError(__callResultHandle);
        _configureSdkEngineWithAutoRemoteConnectionsdkMaploaderInitializerExternalmapdatasourceConfiguresdkenginewithautoremoteconnectionStringSdknativeengineReturnReleaseHandle(__callResultHandle);
        try {
          throw ExternalMapDataSourceExceptionException(sdkMaploaderInitializerExternalmapdatasourceerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkMaploaderInitializerExternalmapdatasourceerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    _configureSdkEngineWithAutoRemoteConnectionsdkMaploaderInitializerExternalmapdatasourceConfiguresdkenginewithautoremoteconnectionStringSdknativeengineReturnReleaseHandle(__callResultHandle);

  }

  void configureSdkEngineWithFixedRemoteConnection(String url, List<CatalogIdentifier> catalogConfigs, SDKNativeEngine engine) {
    final _configureSdkEngineWithFixedRemoteConnectionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_maploader_initializer_ExternalMapDataSource_configureSdkEngineWithFixedRemoteConnection__String_ListOf_sdk_core_engine_CatalogIdentifier_SDKNativeEngine'));
    final _urlHandle = stringToFfi(url);
    final _catalogConfigsHandle = heresdkMaploaderCustomInitializationBindingslistofSdkCoreEngineCatalogidentifierToFfi(catalogConfigs);
    final _engineHandle = sdkCoreEngineSdknativeengineToFfi(engine);
    final __callResultHandle = _configureSdkEngineWithFixedRemoteConnectionFfi(__lib.LibraryContext.isolateId, _urlHandle, _catalogConfigsHandle, _engineHandle);
    stringReleaseFfiHandle(_urlHandle);
    heresdkMaploaderCustomInitializationBindingslistofSdkCoreEngineCatalogidentifierReleaseFfiHandle(_catalogConfigsHandle);
    sdkCoreEngineSdknativeengineReleaseFfiHandle(_engineHandle);
    if (_configureSdkEngineWithFixedRemoteConnectionsdkMaploaderInitializerExternalmapdatasourceConfiguresdkenginewithfixedremoteconnectionStringListofSdkCoreEngineCatalogidentifierSdknativeengineReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _configureSdkEngineWithFixedRemoteConnectionsdkMaploaderInitializerExternalmapdatasourceConfiguresdkenginewithfixedremoteconnectionStringListofSdkCoreEngineCatalogidentifierSdknativeengineReturnGetError(__callResultHandle);
        _configureSdkEngineWithFixedRemoteConnectionsdkMaploaderInitializerExternalmapdatasourceConfiguresdkenginewithfixedremoteconnectionStringListofSdkCoreEngineCatalogidentifierSdknativeengineReturnReleaseHandle(__callResultHandle);
        try {
          throw ExternalMapDataSourceExceptionException(sdkMaploaderInitializerExternalmapdatasourceerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkMaploaderInitializerExternalmapdatasourceerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    _configureSdkEngineWithFixedRemoteConnectionsdkMaploaderInitializerExternalmapdatasourceConfiguresdkenginewithfixedremoteconnectionStringListofSdkCoreEngineCatalogidentifierSdknativeengineReturnReleaseHandle(__callResultHandle);

  }

  ExternalMapDataSource start(String url, SDKNativeEngine engine) {
    final _startFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_maploader_initializer_ExternalMapDataSource_start__String_SDKNativeEngine'));
    final _urlHandle = stringToFfi(url);
    final _engineHandle = sdkCoreEngineSdknativeengineToFfi(engine);
    final __callResultHandle = _startFfi(__lib.LibraryContext.isolateId, _urlHandle, _engineHandle);
    stringReleaseFfiHandle(_urlHandle);
    sdkCoreEngineSdknativeengineReleaseFfiHandle(_engineHandle);
    if (_startsdkMaploaderInitializerExternalmapdatasourceStartStringSdknativeengineReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _startsdkMaploaderInitializerExternalmapdatasourceStartStringSdknativeengineReturnGetError(__callResultHandle);
        _startsdkMaploaderInitializerExternalmapdatasourceStartStringSdknativeengineReturnReleaseHandle(__callResultHandle);
        try {
          throw ExternalMapDataSourceExceptionException(sdkMaploaderInitializerExternalmapdatasourceerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkMaploaderInitializerExternalmapdatasourceerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _startsdkMaploaderInitializerExternalmapdatasourceStartStringSdknativeengineReturnGetResult(__callResultHandle);
    _startsdkMaploaderInitializerExternalmapdatasourceStartStringSdknativeengineReturnReleaseHandle(__callResultHandle);
    try {
      return sdkMaploaderInitializerExternalmapdatasourceFromFfi(__resultHandle);
    } finally {
      sdkMaploaderInitializerExternalmapdatasourceReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  void stop(SDKNativeEngine engine) {
    final _stopFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_maploader_initializer_ExternalMapDataSource_stop__SDKNativeEngine'));
    final _engineHandle = sdkCoreEngineSdknativeengineToFfi(engine);
    final _handle = this.handle;
    final __callResultHandle = _stopFfi(_handle, __lib.LibraryContext.isolateId, _engineHandle);
    sdkCoreEngineSdknativeengineReleaseFfiHandle(_engineHandle);
    if (_stopsdkMaploaderInitializerExternalmapdatasourceStopSdknativeengineReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _stopsdkMaploaderInitializerExternalmapdatasourceStopSdknativeengineReturnGetError(__callResultHandle);
        _stopsdkMaploaderInitializerExternalmapdatasourceStopSdknativeengineReturnReleaseHandle(__callResultHandle);
        try {
          throw ExternalMapDataSourceExceptionException(sdkMaploaderInitializerExternalmapdatasourceerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkMaploaderInitializerExternalmapdatasourceerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    _stopsdkMaploaderInitializerExternalmapdatasourceStopSdknativeengineReturnReleaseHandle(__callResultHandle);

  }


}

Pointer<Void> sdkMaploaderInitializerExternalmapdatasourceToFfi(ExternalMapDataSource value) =>
  _sdkMaploaderInitializerExternalmapdatasourceCopyHandle((value as __lib.NativeBase).handle);

ExternalMapDataSource sdkMaploaderInitializerExternalmapdatasourceFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is ExternalMapDataSource) return instance;

  final _copiedHandle = _sdkMaploaderInitializerExternalmapdatasourceCopyHandle(handle);
  final result = ExternalMapDataSource$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMaploaderInitializerExternalmapdatasourceRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMaploaderInitializerExternalmapdatasourceReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMaploaderInitializerExternalmapdatasourceReleaseHandle(handle);

Pointer<Void> sdkMaploaderInitializerExternalmapdatasourceToFfiNullable(ExternalMapDataSource? value) =>
  value != null ? sdkMaploaderInitializerExternalmapdatasourceToFfi(value) : Pointer<Void>.fromAddress(0);

ExternalMapDataSource? sdkMaploaderInitializerExternalmapdatasourceFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMaploaderInitializerExternalmapdatasourceFromFfi(handle) : null;

void sdkMaploaderInitializerExternalmapdatasourceReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMaploaderInitializerExternalmapdatasourceReleaseHandle(handle);

// End of ExternalMapDataSource "private" section.


