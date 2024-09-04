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

/// Represents the service prodiver info in RDS-TMC format.

class TMCServiceProviderInfo {
  /// Service provider status.
  int status;

  /// Service provider country code.
  int countryCode;

  /// Service id.
  int sid;

  /// Location table number.
  int ltnNumber;

  /// Encryption mode test flag.
  int encryptionTestMode;

  /// Encryption key index.
  int encryptionId;

  /// Location table number before encryption.
  int ltnBeforeEncryption;

  /// Creates a new instance.

  /// [status] Service provider status.

  /// [countryCode] Service provider country code.

  /// [sid] Service id.

  /// [ltnNumber] Location table number.

  /// [encryptionTestMode] Encryption mode test flag.

  /// [encryptionId] Encryption key index.

  /// [ltnBeforeEncryption] Location table number before encryption.

  TMCServiceProviderInfo(this.status, this.countryCode, this.sid, this.ltnNumber, this.encryptionTestMode, this.encryptionId, this.ltnBeforeEncryption);
}


// TMCServiceProviderInfo "private" section, not exported.

final _sdkTrafficbroadcastTmcserviceproviderinfoCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint8, Uint8, Uint8, Uint8, Uint8, Uint8, Uint8),
    Pointer<Void> Function(int, int, int, int, int, int, int)
  >('here_sdk_sdk_trafficbroadcast_TMCServiceProviderInfo_create_handle'));
final _sdkTrafficbroadcastTmcserviceproviderinfoReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_TMCServiceProviderInfo_release_handle'));
final _sdkTrafficbroadcastTmcserviceproviderinfoGetFieldstatus = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_TMCServiceProviderInfo_get_field_status'));
final _sdkTrafficbroadcastTmcserviceproviderinfoGetFieldcountryCode = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_TMCServiceProviderInfo_get_field_countryCode'));
final _sdkTrafficbroadcastTmcserviceproviderinfoGetFieldsid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_TMCServiceProviderInfo_get_field_sid'));
final _sdkTrafficbroadcastTmcserviceproviderinfoGetFieldltnNumber = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_TMCServiceProviderInfo_get_field_ltnNumber'));
final _sdkTrafficbroadcastTmcserviceproviderinfoGetFieldencryptionTestMode = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_TMCServiceProviderInfo_get_field_encryptionTestMode'));
final _sdkTrafficbroadcastTmcserviceproviderinfoGetFieldencryptionId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_TMCServiceProviderInfo_get_field_encryptionId'));
final _sdkTrafficbroadcastTmcserviceproviderinfoGetFieldltnBeforeEncryption = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_TMCServiceProviderInfo_get_field_ltnBeforeEncryption'));



Pointer<Void> sdkTrafficbroadcastTmcserviceproviderinfoToFfi(TMCServiceProviderInfo value) {
  final _statusHandle = (value.status);
  final _countryCodeHandle = (value.countryCode);
  final _sidHandle = (value.sid);
  final _ltnNumberHandle = (value.ltnNumber);
  final _encryptionTestModeHandle = (value.encryptionTestMode);
  final _encryptionIdHandle = (value.encryptionId);
  final _ltnBeforeEncryptionHandle = (value.ltnBeforeEncryption);
  final _result = _sdkTrafficbroadcastTmcserviceproviderinfoCreateHandle(_statusHandle, _countryCodeHandle, _sidHandle, _ltnNumberHandle, _encryptionTestModeHandle, _encryptionIdHandle, _ltnBeforeEncryptionHandle);
  
  
  
  
  
  
  
  return _result;
}

TMCServiceProviderInfo sdkTrafficbroadcastTmcserviceproviderinfoFromFfi(Pointer<Void> handle) {
  final _statusHandle = _sdkTrafficbroadcastTmcserviceproviderinfoGetFieldstatus(handle);
  final _countryCodeHandle = _sdkTrafficbroadcastTmcserviceproviderinfoGetFieldcountryCode(handle);
  final _sidHandle = _sdkTrafficbroadcastTmcserviceproviderinfoGetFieldsid(handle);
  final _ltnNumberHandle = _sdkTrafficbroadcastTmcserviceproviderinfoGetFieldltnNumber(handle);
  final _encryptionTestModeHandle = _sdkTrafficbroadcastTmcserviceproviderinfoGetFieldencryptionTestMode(handle);
  final _encryptionIdHandle = _sdkTrafficbroadcastTmcserviceproviderinfoGetFieldencryptionId(handle);
  final _ltnBeforeEncryptionHandle = _sdkTrafficbroadcastTmcserviceproviderinfoGetFieldltnBeforeEncryption(handle);
  try {
    return TMCServiceProviderInfo(
      (_statusHandle), 
      (_countryCodeHandle), 
      (_sidHandle), 
      (_ltnNumberHandle), 
      (_encryptionTestModeHandle), 
      (_encryptionIdHandle), 
      (_ltnBeforeEncryptionHandle)
    );
  } finally {
    
    
    
    
    
    
    
  }
}

void sdkTrafficbroadcastTmcserviceproviderinfoReleaseFfiHandle(Pointer<Void> handle) => _sdkTrafficbroadcastTmcserviceproviderinfoReleaseHandle(handle);

// Nullable TMCServiceProviderInfo

final _sdkTrafficbroadcastTmcserviceproviderinfoCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_TMCServiceProviderInfo_create_handle_nullable'));
final _sdkTrafficbroadcastTmcserviceproviderinfoReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_TMCServiceProviderInfo_release_handle_nullable'));
final _sdkTrafficbroadcastTmcserviceproviderinfoGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_TMCServiceProviderInfo_get_value_nullable'));

Pointer<Void> sdkTrafficbroadcastTmcserviceproviderinfoToFfiNullable(TMCServiceProviderInfo? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkTrafficbroadcastTmcserviceproviderinfoToFfi(value);
  final result = _sdkTrafficbroadcastTmcserviceproviderinfoCreateHandleNullable(_handle);
  sdkTrafficbroadcastTmcserviceproviderinfoReleaseFfiHandle(_handle);
  return result;
}

TMCServiceProviderInfo? sdkTrafficbroadcastTmcserviceproviderinfoFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkTrafficbroadcastTmcserviceproviderinfoGetValueNullable(handle);
  final result = sdkTrafficbroadcastTmcserviceproviderinfoFromFfi(_handle);
  sdkTrafficbroadcastTmcserviceproviderinfoReleaseFfiHandle(_handle);
  return result;
}

void sdkTrafficbroadcastTmcserviceproviderinfoReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkTrafficbroadcastTmcserviceproviderinfoReleaseHandleNullable(handle);

// End of TMCServiceProviderInfo "private" section.


