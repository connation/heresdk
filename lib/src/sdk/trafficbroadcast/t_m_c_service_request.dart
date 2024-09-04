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
import 'package:here_sdk/src/generic_types__conversion.dart';

/// Represents the parameters used to request the traffic broadcast.

class TMCServiceRequest {
  /// Refers to a country in RDS-TMC format.
  int countryCode;

  /// List of preferred SIDs (up to 8).
  List<int> preferredSids;

  /// List of supported LTNs (up to 8).
  List<int> supportedLtns;

  /// Creates a new instance.

  /// [countryCode] Refers to a country in RDS-TMC format.

  /// [preferredSids] List of preferred SIDs (up to 8).

  /// [supportedLtns] List of supported LTNs (up to 8).

  TMCServiceRequest(this.countryCode, this.preferredSids, this.supportedLtns);
}


// TMCServiceRequest "private" section, not exported.

final _sdkTrafficbroadcastTmcservicerequestCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint8, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_TMCServiceRequest_create_handle'));
final _sdkTrafficbroadcastTmcservicerequestReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_TMCServiceRequest_release_handle'));
final _sdkTrafficbroadcastTmcservicerequestGetFieldcountryCode = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_TMCServiceRequest_get_field_countryCode'));
final _sdkTrafficbroadcastTmcservicerequestGetFieldpreferredSids = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_TMCServiceRequest_get_field_preferredSids'));
final _sdkTrafficbroadcastTmcservicerequestGetFieldsupportedLtns = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_TMCServiceRequest_get_field_supportedLtns'));



Pointer<Void> sdkTrafficbroadcastTmcservicerequestToFfi(TMCServiceRequest value) {
  final _countryCodeHandle = (value.countryCode);
  final _preferredSidsHandle = heresdkTrafficBroadcastBindingslistofUbyteToFfi(value.preferredSids);
  final _supportedLtnsHandle = heresdkTrafficBroadcastBindingslistofUbyteToFfi(value.supportedLtns);
  final _result = _sdkTrafficbroadcastTmcservicerequestCreateHandle(_countryCodeHandle, _preferredSidsHandle, _supportedLtnsHandle);
  
  heresdkTrafficBroadcastBindingslistofUbyteReleaseFfiHandle(_preferredSidsHandle);
  heresdkTrafficBroadcastBindingslistofUbyteReleaseFfiHandle(_supportedLtnsHandle);
  return _result;
}

TMCServiceRequest sdkTrafficbroadcastTmcservicerequestFromFfi(Pointer<Void> handle) {
  final _countryCodeHandle = _sdkTrafficbroadcastTmcservicerequestGetFieldcountryCode(handle);
  final _preferredSidsHandle = _sdkTrafficbroadcastTmcservicerequestGetFieldpreferredSids(handle);
  final _supportedLtnsHandle = _sdkTrafficbroadcastTmcservicerequestGetFieldsupportedLtns(handle);
  try {
    return TMCServiceRequest(
      (_countryCodeHandle), 
      heresdkTrafficBroadcastBindingslistofUbyteFromFfi(_preferredSidsHandle), 
      heresdkTrafficBroadcastBindingslistofUbyteFromFfi(_supportedLtnsHandle)
    );
  } finally {
    
    heresdkTrafficBroadcastBindingslistofUbyteReleaseFfiHandle(_preferredSidsHandle);
    heresdkTrafficBroadcastBindingslistofUbyteReleaseFfiHandle(_supportedLtnsHandle);
  }
}

void sdkTrafficbroadcastTmcservicerequestReleaseFfiHandle(Pointer<Void> handle) => _sdkTrafficbroadcastTmcservicerequestReleaseHandle(handle);

// Nullable TMCServiceRequest

final _sdkTrafficbroadcastTmcservicerequestCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_TMCServiceRequest_create_handle_nullable'));
final _sdkTrafficbroadcastTmcservicerequestReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_TMCServiceRequest_release_handle_nullable'));
final _sdkTrafficbroadcastTmcservicerequestGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_TMCServiceRequest_get_value_nullable'));

Pointer<Void> sdkTrafficbroadcastTmcservicerequestToFfiNullable(TMCServiceRequest? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkTrafficbroadcastTmcservicerequestToFfi(value);
  final result = _sdkTrafficbroadcastTmcservicerequestCreateHandleNullable(_handle);
  sdkTrafficbroadcastTmcservicerequestReleaseFfiHandle(_handle);
  return result;
}

TMCServiceRequest? sdkTrafficbroadcastTmcservicerequestFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkTrafficbroadcastTmcservicerequestGetValueNullable(handle);
  final result = sdkTrafficbroadcastTmcservicerequestFromFfi(_handle);
  sdkTrafficbroadcastTmcservicerequestReleaseFfiHandle(_handle);
  return result;
}

void sdkTrafficbroadcastTmcservicerequestReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkTrafficbroadcastTmcservicerequestReleaseHandleNullable(handle);

// End of TMCServiceRequest "private" section.


