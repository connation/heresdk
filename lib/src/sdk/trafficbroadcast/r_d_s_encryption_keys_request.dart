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

/// Represents data to search for RDS encryption keys.

class RDSEncryptionKeysRequest {
  /// Refers to a country in RDS-TMC format.
  int countryCode;

  /// SID that owns the key.
  int sid;

  /// LTN to which the key refers.
  int ltnBeforeEncryption;

  /// Creates a new instance.

  /// [countryCode] Refers to a country in RDS-TMC format.

  /// [sid] SID that owns the key.

  /// [ltnBeforeEncryption] LTN to which the key refers.

  RDSEncryptionKeysRequest(this.countryCode, this.sid, this.ltnBeforeEncryption);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! RDSEncryptionKeysRequest) return false;
    RDSEncryptionKeysRequest _other = other;
    return countryCode == _other.countryCode &&
        sid == _other.sid &&
        ltnBeforeEncryption == _other.ltnBeforeEncryption;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + countryCode.hashCode;
    result = 31 * result + sid.hashCode;
    result = 31 * result + ltnBeforeEncryption.hashCode;
    return result;
  }
}


// RDSEncryptionKeysRequest "private" section, not exported.

final _sdkTrafficbroadcastRdsencryptionkeysrequestCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint8, Uint8, Uint8),
    Pointer<Void> Function(int, int, int)
  >('here_sdk_sdk_trafficbroadcast_RDSEncryptionKeysRequest_create_handle'));
final _sdkTrafficbroadcastRdsencryptionkeysrequestReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_RDSEncryptionKeysRequest_release_handle'));
final _sdkTrafficbroadcastRdsencryptionkeysrequestGetFieldcountryCode = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_RDSEncryptionKeysRequest_get_field_countryCode'));
final _sdkTrafficbroadcastRdsencryptionkeysrequestGetFieldsid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_RDSEncryptionKeysRequest_get_field_sid'));
final _sdkTrafficbroadcastRdsencryptionkeysrequestGetFieldltnBeforeEncryption = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_RDSEncryptionKeysRequest_get_field_ltnBeforeEncryption'));



Pointer<Void> sdkTrafficbroadcastRdsencryptionkeysrequestToFfi(RDSEncryptionKeysRequest value) {
  final _countryCodeHandle = (value.countryCode);
  final _sidHandle = (value.sid);
  final _ltnBeforeEncryptionHandle = (value.ltnBeforeEncryption);
  final _result = _sdkTrafficbroadcastRdsencryptionkeysrequestCreateHandle(_countryCodeHandle, _sidHandle, _ltnBeforeEncryptionHandle);
  
  
  
  return _result;
}

RDSEncryptionKeysRequest sdkTrafficbroadcastRdsencryptionkeysrequestFromFfi(Pointer<Void> handle) {
  final _countryCodeHandle = _sdkTrafficbroadcastRdsencryptionkeysrequestGetFieldcountryCode(handle);
  final _sidHandle = _sdkTrafficbroadcastRdsencryptionkeysrequestGetFieldsid(handle);
  final _ltnBeforeEncryptionHandle = _sdkTrafficbroadcastRdsencryptionkeysrequestGetFieldltnBeforeEncryption(handle);
  try {
    return RDSEncryptionKeysRequest(
      (_countryCodeHandle), 
      (_sidHandle), 
      (_ltnBeforeEncryptionHandle)
    );
  } finally {
    
    
    
  }
}

void sdkTrafficbroadcastRdsencryptionkeysrequestReleaseFfiHandle(Pointer<Void> handle) => _sdkTrafficbroadcastRdsencryptionkeysrequestReleaseHandle(handle);

// Nullable RDSEncryptionKeysRequest

final _sdkTrafficbroadcastRdsencryptionkeysrequestCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_RDSEncryptionKeysRequest_create_handle_nullable'));
final _sdkTrafficbroadcastRdsencryptionkeysrequestReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_RDSEncryptionKeysRequest_release_handle_nullable'));
final _sdkTrafficbroadcastRdsencryptionkeysrequestGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_RDSEncryptionKeysRequest_get_value_nullable'));

Pointer<Void> sdkTrafficbroadcastRdsencryptionkeysrequestToFfiNullable(RDSEncryptionKeysRequest? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkTrafficbroadcastRdsencryptionkeysrequestToFfi(value);
  final result = _sdkTrafficbroadcastRdsencryptionkeysrequestCreateHandleNullable(_handle);
  sdkTrafficbroadcastRdsencryptionkeysrequestReleaseFfiHandle(_handle);
  return result;
}

RDSEncryptionKeysRequest? sdkTrafficbroadcastRdsencryptionkeysrequestFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkTrafficbroadcastRdsencryptionkeysrequestGetValueNullable(handle);
  final result = sdkTrafficbroadcastRdsencryptionkeysrequestFromFfi(_handle);
  sdkTrafficbroadcastRdsencryptionkeysrequestReleaseFfiHandle(_handle);
  return result;
}

void sdkTrafficbroadcastRdsencryptionkeysrequestReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkTrafficbroadcastRdsencryptionkeysrequestReleaseHandleNullable(handle);

// End of RDSEncryptionKeysRequest "private" section.


