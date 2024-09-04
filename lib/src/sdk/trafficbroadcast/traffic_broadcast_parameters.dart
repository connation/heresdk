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
import 'package:here_sdk/src/sdk/core/location.dart';
import 'package:here_sdk/src/sdk/core/location_impl.dart' as location_impl;
import 'package:here_sdk/src/sdk/trafficbroadcast/t_m_c_service_interface.dart';

/// Represents the parameters needed to request the traffic broadcast.

class TrafficBroadcastParameters {
  /// Contains all outgoing dependencies to the client side.
  TMCServiceInterface tmcService;

  /// Current location to determine the country code and LTNs.
  location_impl.Location location;

  /// Creates a new instance.
  /// [tmcService] Contains all outgoing dependencies to the client side.
  /// [location] Current location to determine the country code and LTNs.
  TrafficBroadcastParameters(this.tmcService, this.location);
}


// TrafficBroadcastParameters "private" section, not exported.

final _sdkTrafficbroadcastTrafficbroadcastparametersCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_TrafficBroadcastParameters_create_handle'));
final _sdkTrafficbroadcastTrafficbroadcastparametersReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_TrafficBroadcastParameters_release_handle'));
final _sdkTrafficbroadcastTrafficbroadcastparametersGetFieldtmcService = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_TrafficBroadcastParameters_get_field_tmcService'));
final _sdkTrafficbroadcastTrafficbroadcastparametersGetFieldlocation = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_TrafficBroadcastParameters_get_field_location'));



Pointer<Void> sdkTrafficbroadcastTrafficbroadcastparametersToFfi(TrafficBroadcastParameters value) {
  final _tmcServiceHandle = sdkTrafficbroadcastTmcserviceinterfaceToFfi(value.tmcService);
  final _locationHandle = sdkCoreLocationToFfi(value.location);
  final _result = _sdkTrafficbroadcastTrafficbroadcastparametersCreateHandle(_tmcServiceHandle, _locationHandle);
  sdkTrafficbroadcastTmcserviceinterfaceReleaseFfiHandle(_tmcServiceHandle);
  sdkCoreLocationReleaseFfiHandle(_locationHandle);
  return _result;
}

TrafficBroadcastParameters sdkTrafficbroadcastTrafficbroadcastparametersFromFfi(Pointer<Void> handle) {
  final _tmcServiceHandle = _sdkTrafficbroadcastTrafficbroadcastparametersGetFieldtmcService(handle);
  final _locationHandle = _sdkTrafficbroadcastTrafficbroadcastparametersGetFieldlocation(handle);
  try {
    return TrafficBroadcastParameters(
      sdkTrafficbroadcastTmcserviceinterfaceFromFfi(_tmcServiceHandle), 
      sdkCoreLocationFromFfi(_locationHandle)
    );
  } finally {
    sdkTrafficbroadcastTmcserviceinterfaceReleaseFfiHandle(_tmcServiceHandle);
    sdkCoreLocationReleaseFfiHandle(_locationHandle);
  }
}

void sdkTrafficbroadcastTrafficbroadcastparametersReleaseFfiHandle(Pointer<Void> handle) => _sdkTrafficbroadcastTrafficbroadcastparametersReleaseHandle(handle);

// Nullable TrafficBroadcastParameters

final _sdkTrafficbroadcastTrafficbroadcastparametersCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_TrafficBroadcastParameters_create_handle_nullable'));
final _sdkTrafficbroadcastTrafficbroadcastparametersReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_TrafficBroadcastParameters_release_handle_nullable'));
final _sdkTrafficbroadcastTrafficbroadcastparametersGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_TrafficBroadcastParameters_get_value_nullable'));

Pointer<Void> sdkTrafficbroadcastTrafficbroadcastparametersToFfiNullable(TrafficBroadcastParameters? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkTrafficbroadcastTrafficbroadcastparametersToFfi(value);
  final result = _sdkTrafficbroadcastTrafficbroadcastparametersCreateHandleNullable(_handle);
  sdkTrafficbroadcastTrafficbroadcastparametersReleaseFfiHandle(_handle);
  return result;
}

TrafficBroadcastParameters? sdkTrafficbroadcastTrafficbroadcastparametersFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkTrafficbroadcastTrafficbroadcastparametersGetValueNullable(handle);
  final result = sdkTrafficbroadcastTrafficbroadcastparametersFromFfi(_handle);
  sdkTrafficbroadcastTrafficbroadcastparametersReleaseFfiHandle(_handle);
  return result;
}

void sdkTrafficbroadcastTrafficbroadcastparametersReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkTrafficbroadcastTrafficbroadcastparametersReleaseHandleNullable(handle);

// End of TrafficBroadcastParameters "private" section.


