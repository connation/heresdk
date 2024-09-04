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

/// Represents the RDS encryption key.
///
/// Fields allocation information is described in CEN ISO/CD 14819-6.

class RDSEncryptionKey {
  /// Id of encryption key within the list.
  int encryptionId;

  /// Rotate Right used for bit manipulations as a part of encryption process.
  int rotateRight;

  /// Start Bit used for bit manipulations as a part of encryption process.
  int startBit;

  /// XOR Value used for bit manipulations as a part of encryption process.
  int xorValue;

  /// Creates a new instance.

  /// [encryptionId] Id of encryption key within the list.

  /// [rotateRight] Rotate Right used for bit manipulations as a part of encryption process.

  /// [startBit] Start Bit used for bit manipulations as a part of encryption process.

  /// [xorValue] XOR Value used for bit manipulations as a part of encryption process.

  RDSEncryptionKey(this.encryptionId, this.rotateRight, this.startBit, this.xorValue);
}


// RDSEncryptionKey "private" section, not exported.

final _sdkTrafficbroadcastRdsencryptionkeyCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint8, Uint8, Uint8, Uint8),
    Pointer<Void> Function(int, int, int, int)
  >('here_sdk_sdk_trafficbroadcast_RDSEncryptionKey_create_handle'));
final _sdkTrafficbroadcastRdsencryptionkeyReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_RDSEncryptionKey_release_handle'));
final _sdkTrafficbroadcastRdsencryptionkeyGetFieldencryptionId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_RDSEncryptionKey_get_field_encryptionId'));
final _sdkTrafficbroadcastRdsencryptionkeyGetFieldrotateRight = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_RDSEncryptionKey_get_field_rotateRight'));
final _sdkTrafficbroadcastRdsencryptionkeyGetFieldstartBit = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_RDSEncryptionKey_get_field_startBit'));
final _sdkTrafficbroadcastRdsencryptionkeyGetFieldxorValue = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_RDSEncryptionKey_get_field_xorValue'));



Pointer<Void> sdkTrafficbroadcastRdsencryptionkeyToFfi(RDSEncryptionKey value) {
  final _encryptionIdHandle = (value.encryptionId);
  final _rotateRightHandle = (value.rotateRight);
  final _startBitHandle = (value.startBit);
  final _xorValueHandle = (value.xorValue);
  final _result = _sdkTrafficbroadcastRdsencryptionkeyCreateHandle(_encryptionIdHandle, _rotateRightHandle, _startBitHandle, _xorValueHandle);
  
  
  
  
  return _result;
}

RDSEncryptionKey sdkTrafficbroadcastRdsencryptionkeyFromFfi(Pointer<Void> handle) {
  final _encryptionIdHandle = _sdkTrafficbroadcastRdsencryptionkeyGetFieldencryptionId(handle);
  final _rotateRightHandle = _sdkTrafficbroadcastRdsencryptionkeyGetFieldrotateRight(handle);
  final _startBitHandle = _sdkTrafficbroadcastRdsencryptionkeyGetFieldstartBit(handle);
  final _xorValueHandle = _sdkTrafficbroadcastRdsencryptionkeyGetFieldxorValue(handle);
  try {
    return RDSEncryptionKey(
      (_encryptionIdHandle), 
      (_rotateRightHandle), 
      (_startBitHandle), 
      (_xorValueHandle)
    );
  } finally {
    
    
    
    
  }
}

void sdkTrafficbroadcastRdsencryptionkeyReleaseFfiHandle(Pointer<Void> handle) => _sdkTrafficbroadcastRdsencryptionkeyReleaseHandle(handle);

// Nullable RDSEncryptionKey

final _sdkTrafficbroadcastRdsencryptionkeyCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_RDSEncryptionKey_create_handle_nullable'));
final _sdkTrafficbroadcastRdsencryptionkeyReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_RDSEncryptionKey_release_handle_nullable'));
final _sdkTrafficbroadcastRdsencryptionkeyGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_RDSEncryptionKey_get_value_nullable'));

Pointer<Void> sdkTrafficbroadcastRdsencryptionkeyToFfiNullable(RDSEncryptionKey? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkTrafficbroadcastRdsencryptionkeyToFfi(value);
  final result = _sdkTrafficbroadcastRdsencryptionkeyCreateHandleNullable(_handle);
  sdkTrafficbroadcastRdsencryptionkeyReleaseFfiHandle(_handle);
  return result;
}

RDSEncryptionKey? sdkTrafficbroadcastRdsencryptionkeyFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkTrafficbroadcastRdsencryptionkeyGetValueNullable(handle);
  final result = sdkTrafficbroadcastRdsencryptionkeyFromFfi(_handle);
  sdkTrafficbroadcastRdsencryptionkeyReleaseFfiHandle(_handle);
  return result;
}

void sdkTrafficbroadcastRdsencryptionkeyReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkTrafficbroadcastRdsencryptionkeyReleaseHandleNullable(handle);

// End of RDSEncryptionKey "private" section.


