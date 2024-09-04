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

/// Represents data used to request the list of preferred SIDs.

class TMCPreferredSidsRequest {
  /// Refers to a country in RDS-TMC format.
  int countryCode;

  /// LTN to which the requested SIDs belong.
  int ltn;

  /// Creates a new instance.

  /// [countryCode] Refers to a country in RDS-TMC format.

  /// [ltn] LTN to which the requested SIDs belong.

  TMCPreferredSidsRequest(this.countryCode, this.ltn);
}


// TMCPreferredSidsRequest "private" section, not exported.

final _sdkTrafficbroadcastTmcpreferredsidsrequestCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint8, Uint8),
    Pointer<Void> Function(int, int)
  >('here_sdk_sdk_trafficbroadcast_TMCPreferredSidsRequest_create_handle'));
final _sdkTrafficbroadcastTmcpreferredsidsrequestReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_TMCPreferredSidsRequest_release_handle'));
final _sdkTrafficbroadcastTmcpreferredsidsrequestGetFieldcountryCode = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_TMCPreferredSidsRequest_get_field_countryCode'));
final _sdkTrafficbroadcastTmcpreferredsidsrequestGetFieldltn = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_TMCPreferredSidsRequest_get_field_ltn'));



Pointer<Void> sdkTrafficbroadcastTmcpreferredsidsrequestToFfi(TMCPreferredSidsRequest value) {
  final _countryCodeHandle = (value.countryCode);
  final _ltnHandle = (value.ltn);
  final _result = _sdkTrafficbroadcastTmcpreferredsidsrequestCreateHandle(_countryCodeHandle, _ltnHandle);
  
  
  return _result;
}

TMCPreferredSidsRequest sdkTrafficbroadcastTmcpreferredsidsrequestFromFfi(Pointer<Void> handle) {
  final _countryCodeHandle = _sdkTrafficbroadcastTmcpreferredsidsrequestGetFieldcountryCode(handle);
  final _ltnHandle = _sdkTrafficbroadcastTmcpreferredsidsrequestGetFieldltn(handle);
  try {
    return TMCPreferredSidsRequest(
      (_countryCodeHandle), 
      (_ltnHandle)
    );
  } finally {
    
    
  }
}

void sdkTrafficbroadcastTmcpreferredsidsrequestReleaseFfiHandle(Pointer<Void> handle) => _sdkTrafficbroadcastTmcpreferredsidsrequestReleaseHandle(handle);

// Nullable TMCPreferredSidsRequest

final _sdkTrafficbroadcastTmcpreferredsidsrequestCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_TMCPreferredSidsRequest_create_handle_nullable'));
final _sdkTrafficbroadcastTmcpreferredsidsrequestReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_TMCPreferredSidsRequest_release_handle_nullable'));
final _sdkTrafficbroadcastTmcpreferredsidsrequestGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_TMCPreferredSidsRequest_get_value_nullable'));

Pointer<Void> sdkTrafficbroadcastTmcpreferredsidsrequestToFfiNullable(TMCPreferredSidsRequest? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkTrafficbroadcastTmcpreferredsidsrequestToFfi(value);
  final result = _sdkTrafficbroadcastTmcpreferredsidsrequestCreateHandleNullable(_handle);
  sdkTrafficbroadcastTmcpreferredsidsrequestReleaseFfiHandle(_handle);
  return result;
}

TMCPreferredSidsRequest? sdkTrafficbroadcastTmcpreferredsidsrequestFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkTrafficbroadcastTmcpreferredsidsrequestGetValueNullable(handle);
  final result = sdkTrafficbroadcastTmcpreferredsidsrequestFromFfi(_handle);
  sdkTrafficbroadcastTmcpreferredsidsrequestReleaseFfiHandle(_handle);
  return result;
}

void sdkTrafficbroadcastTmcpreferredsidsrequestReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkTrafficbroadcastTmcpreferredsidsrequestReleaseHandleNullable(handle);

// End of TMCPreferredSidsRequest "private" section.


