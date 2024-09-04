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
import 'package:here_sdk/src/sdk/core/engine/s_d_k_native_engine.dart';
import 'package:here_sdk/src/sdk/core/errors/instantiation_error_code.dart';
import 'package:here_sdk/src/sdk/core/errors/instantiation_exception.dart';
import 'package:here_sdk/src/sdk/core/location.dart';
import 'package:here_sdk/src/sdk/core/location_impl.dart' as location_impl;
import 'package:here_sdk/src/sdk/core/location_listener.dart';
import 'package:here_sdk/src/sdk/traffic/traffic_data_provider.dart';
import 'package:here_sdk/src/sdk/trafficbroadcast/t_m_c_data.dart';
import 'package:here_sdk/src/sdk/trafficbroadcast/t_m_c_service_provider_info.dart';
import 'package:here_sdk/src/sdk/trafficbroadcast/traffic_broadcast_parameters.dart';
import 'package:meta/meta.dart';

/// A `TrafficBroadcast` is expecting the [RDS-TMC](https://en.wikipedia.org/wiki/Traffic_message_channel)
/// format and it can be used when there is no internet connection, so that the `OfflineRoutingEngine`
/// can utilize traffic data coming over a radio channel.
///
/// The [TrafficBroadcast.activate] method needs to be called to
/// receive traffic data events.
///
/// **Note:** In order to adopt the `TrafficDataProvider` interface special hardware is required. Talk
/// to your HERE representative for more details. Only by adopting the `TrafficDataProvider` interface
/// you can integrate radio station signals providing traffic broadcasts. Traffic broadcasts are meant
/// to be used _independently_ from the already included traffic on routes, on the map and from the
/// HERE backends (when using the `TrafficEngine`).
///
/// This class continuously reacts to new locations provided from a location source and acts as a
/// [LocationListener]. The location must be updated regardless of calling [TrafficBroadcast.activate].
///
/// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected
/// behaviors. Related APIs may change for new releases without a deprecation process.
abstract class TrafficBroadcast implements LocationListener {
  /// Creates a new instance of this class.
  ///
  /// [parameters] The necessary parameters to start traffic broadcast.
  ///
  /// Throws [InstantiationException]. when the object was not initialized properly.
  ///
  factory TrafficBroadcast(TrafficBroadcastParameters parameters) => $prototype.$init(parameters);
  /// Creates a new instance of this class.
  ///
  /// [sdkEngine] Instance of an existing SDKEngine.
  ///
  /// [parameters] The necessary parameters to start traffic broadcast.
  ///
  /// Throws [InstantiationException]. when the object was not initialized properly.
  ///
  factory TrafficBroadcast.withSdkEngine(SDKNativeEngine sdkEngine, TrafficBroadcastParameters parameters) => $prototype.withSdkEngine(sdkEngine, parameters);

  /// Activates the reception of traffic data over the radio channel.
  ///
  /// This method is supposed to be called when the system loses internet connection,
  /// so that traffic data can be switched from the online source to the radio channel.
  /// When activation is done, requestTMCService is called from TMCServiceInterface
  ///
  void activate();
  /// Deactivates the reception of traffic data over the radio channel.
  ///
  /// When deactivation is done, requestTMCService is called from TMCServiceInterface
  /// With special case of countryCode parameter = 0
  ///
  void deactivate();
  /// Must be called on every TMC service prodiver info update.
  ///
  /// [tmcServiceProdiverInfo] Contains service prodiver info in RDS-TMC format.
  ///
  void onTMCServiceProviderInfoUpdated(TMCServiceProviderInfo tmcServiceProdiverInfo);
  /// Must be called on every TMC data update.
  ///
  /// [tmcData] Contains the traffic events in RDS-TMC format.
  ///
  void onTMCDataUpdated(TMCData tmcData);
  TrafficDataProvider? get trafficDataProvider;


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = TrafficBroadcast$Impl(Pointer<Void>.fromAddress(0));
}


// TrafficBroadcast "private" section, not exported.

final _sdkTrafficbroadcastTrafficbroadcastRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_trafficbroadcast_TrafficBroadcast_register_finalizer'));
final _sdkTrafficbroadcastTrafficbroadcastCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_TrafficBroadcast_copy_handle'));
final _sdkTrafficbroadcastTrafficbroadcastReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_TrafficBroadcast_release_handle'));
final _sdkTrafficbroadcastTrafficbroadcastGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_TrafficBroadcast_get_type_id'));


final _$initsdkTrafficbroadcastTrafficbroadcastMakeTrafficbroadcastparametersReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_TrafficBroadcast_make__TrafficBroadcastParameters_return_release_handle'));
final _$initsdkTrafficbroadcastTrafficbroadcastMakeTrafficbroadcastparametersReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_TrafficBroadcast_make__TrafficBroadcastParameters_return_get_result'));
final _$initsdkTrafficbroadcastTrafficbroadcastMakeTrafficbroadcastparametersReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_TrafficBroadcast_make__TrafficBroadcastParameters_return_get_error'));
final _$initsdkTrafficbroadcastTrafficbroadcastMakeTrafficbroadcastparametersReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_TrafficBroadcast_make__TrafficBroadcastParameters_return_has_error'));


final _withSdkEnginesdkTrafficbroadcastTrafficbroadcastMakeSdknativeengineTrafficbroadcastparametersReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_TrafficBroadcast_make__SDKNativeEngine_TrafficBroadcastParameters_return_release_handle'));
final _withSdkEnginesdkTrafficbroadcastTrafficbroadcastMakeSdknativeengineTrafficbroadcastparametersReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_TrafficBroadcast_make__SDKNativeEngine_TrafficBroadcastParameters_return_get_result'));
final _withSdkEnginesdkTrafficbroadcastTrafficbroadcastMakeSdknativeengineTrafficbroadcastparametersReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_TrafficBroadcast_make__SDKNativeEngine_TrafficBroadcastParameters_return_get_error'));
final _withSdkEnginesdkTrafficbroadcastTrafficbroadcastMakeSdknativeengineTrafficbroadcastparametersReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_TrafficBroadcast_make__SDKNativeEngine_TrafficBroadcastParameters_return_has_error'));






/// @nodoc
@visibleForTesting
class TrafficBroadcast$Impl extends __lib.NativeBase implements TrafficBroadcast {

  TrafficBroadcast$Impl(Pointer<Void> handle) : super(handle);


  TrafficBroadcast $init(TrafficBroadcastParameters parameters) {
    final _result_handle = _$init(parameters);
    final _result = TrafficBroadcast$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkTrafficbroadcastTrafficbroadcastRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }


  TrafficBroadcast withSdkEngine(SDKNativeEngine sdkEngine, TrafficBroadcastParameters parameters) {
    final _result_handle = _withSdkEngine(sdkEngine, parameters);
    final _result = TrafficBroadcast$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkTrafficbroadcastTrafficbroadcastRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _$init(TrafficBroadcastParameters parameters) {
    final _$initFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_trafficbroadcast_TrafficBroadcast_make__TrafficBroadcastParameters'));
    final _parametersHandle = sdkTrafficbroadcastTrafficbroadcastparametersToFfi(parameters);
    final __callResultHandle = _$initFfi(__lib.LibraryContext.isolateId, _parametersHandle);
    sdkTrafficbroadcastTrafficbroadcastparametersReleaseFfiHandle(_parametersHandle);
    if (_$initsdkTrafficbroadcastTrafficbroadcastMakeTrafficbroadcastparametersReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _$initsdkTrafficbroadcastTrafficbroadcastMakeTrafficbroadcastparametersReturnGetError(__callResultHandle);
        _$initsdkTrafficbroadcastTrafficbroadcastMakeTrafficbroadcastparametersReturnReleaseHandle(__callResultHandle);
        try {
          throw InstantiationException(sdkCoreErrorsInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkCoreErrorsInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _$initsdkTrafficbroadcastTrafficbroadcastMakeTrafficbroadcastparametersReturnGetResult(__callResultHandle);
    _$initsdkTrafficbroadcastTrafficbroadcastMakeTrafficbroadcastparametersReturnReleaseHandle(__callResultHandle);
    return __resultHandle;
  }

  static Pointer<Void> _withSdkEngine(SDKNativeEngine sdkEngine, TrafficBroadcastParameters parameters) {
    final _withSdkEngineFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_trafficbroadcast_TrafficBroadcast_make__SDKNativeEngine_TrafficBroadcastParameters'));
    final _sdkEngineHandle = sdkCoreEngineSdknativeengineToFfi(sdkEngine);
    final _parametersHandle = sdkTrafficbroadcastTrafficbroadcastparametersToFfi(parameters);
    final __callResultHandle = _withSdkEngineFfi(__lib.LibraryContext.isolateId, _sdkEngineHandle, _parametersHandle);
    sdkCoreEngineSdknativeengineReleaseFfiHandle(_sdkEngineHandle);
    sdkTrafficbroadcastTrafficbroadcastparametersReleaseFfiHandle(_parametersHandle);
    if (_withSdkEnginesdkTrafficbroadcastTrafficbroadcastMakeSdknativeengineTrafficbroadcastparametersReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _withSdkEnginesdkTrafficbroadcastTrafficbroadcastMakeSdknativeengineTrafficbroadcastparametersReturnGetError(__callResultHandle);
        _withSdkEnginesdkTrafficbroadcastTrafficbroadcastMakeSdknativeengineTrafficbroadcastparametersReturnReleaseHandle(__callResultHandle);
        try {
          throw InstantiationException(sdkCoreErrorsInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkCoreErrorsInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _withSdkEnginesdkTrafficbroadcastTrafficbroadcastMakeSdknativeengineTrafficbroadcastparametersReturnGetResult(__callResultHandle);
    _withSdkEnginesdkTrafficbroadcastTrafficbroadcastMakeSdknativeengineTrafficbroadcastparametersReturnReleaseHandle(__callResultHandle);
    return __resultHandle;
  }

  @override
  void activate() {
    final _activateFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_trafficbroadcast_TrafficBroadcast_activate'));
    final _handle = this.handle;
    _activateFfi(_handle, __lib.LibraryContext.isolateId);

  }

  @override
  void deactivate() {
    final _deactivateFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_trafficbroadcast_TrafficBroadcast_deactivate'));
    final _handle = this.handle;
    _deactivateFfi(_handle, __lib.LibraryContext.isolateId);

  }

  @override
  void onTMCServiceProviderInfoUpdated(TMCServiceProviderInfo tmcServiceProdiverInfo) {
    final _onTMCServiceProviderInfoUpdatedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_trafficbroadcast_TrafficBroadcast_onTMCServiceProviderInfoUpdated__TMCServiceProviderInfo'));
    final _tmcServiceProdiverInfoHandle = sdkTrafficbroadcastTmcserviceproviderinfoToFfi(tmcServiceProdiverInfo);
    final _handle = this.handle;
    _onTMCServiceProviderInfoUpdatedFfi(_handle, __lib.LibraryContext.isolateId, _tmcServiceProdiverInfoHandle);
    sdkTrafficbroadcastTmcserviceproviderinfoReleaseFfiHandle(_tmcServiceProdiverInfoHandle);

  }

  @override
  void onTMCDataUpdated(TMCData tmcData) {
    final _onTMCDataUpdatedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_trafficbroadcast_TrafficBroadcast_onTMCDataUpdated__TMCData'));
    final _tmcDataHandle = sdkTrafficbroadcastTmcdataToFfi(tmcData);
    final _handle = this.handle;
    _onTMCDataUpdatedFfi(_handle, __lib.LibraryContext.isolateId, _tmcDataHandle);
    sdkTrafficbroadcastTmcdataReleaseFfiHandle(_tmcDataHandle);

  }

  @override
  void onLocationUpdated(location_impl.Location location) {
    final _onLocationUpdatedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_trafficbroadcast_TrafficBroadcast_onLocationUpdated__Location'));
    final _locationHandle = sdkCoreLocationToFfi(location);
    final _handle = this.handle;
    _onLocationUpdatedFfi(_handle, __lib.LibraryContext.isolateId, _locationHandle);
    sdkCoreLocationReleaseFfiHandle(_locationHandle);

  }

  @override
  TrafficDataProvider? get trafficDataProvider {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_trafficbroadcast_TrafficBroadcast_trafficDataProvider_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkTrafficTrafficdataproviderFromFfiNullable(__resultHandle);
    } finally {
      sdkTrafficTrafficdataproviderReleaseFfiHandleNullable(__resultHandle);

    }

  }



}

Pointer<Void> sdkTrafficbroadcastTrafficbroadcastToFfi(TrafficBroadcast value) =>
  _sdkTrafficbroadcastTrafficbroadcastCopyHandle((value as __lib.NativeBase).handle);

TrafficBroadcast sdkTrafficbroadcastTrafficbroadcastFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is TrafficBroadcast) return instance;

  final _typeIdHandle = _sdkTrafficbroadcastTrafficbroadcastGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkTrafficbroadcastTrafficbroadcastCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : TrafficBroadcast$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkTrafficbroadcastTrafficbroadcastRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkTrafficbroadcastTrafficbroadcastReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkTrafficbroadcastTrafficbroadcastReleaseHandle(handle);

Pointer<Void> sdkTrafficbroadcastTrafficbroadcastToFfiNullable(TrafficBroadcast? value) =>
  value != null ? sdkTrafficbroadcastTrafficbroadcastToFfi(value) : Pointer<Void>.fromAddress(0);

TrafficBroadcast? sdkTrafficbroadcastTrafficbroadcastFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkTrafficbroadcastTrafficbroadcastFromFfi(handle) : null;

void sdkTrafficbroadcastTrafficbroadcastReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkTrafficbroadcastTrafficbroadcastReleaseHandle(handle);

// End of TrafficBroadcast "private" section.


