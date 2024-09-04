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
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/trafficbroadcast/r_d_s_encryption_key.dart';
import 'package:here_sdk/src/sdk/trafficbroadcast/r_d_s_encryption_keys_request.dart';
import 'package:here_sdk/src/sdk/trafficbroadcast/t_m_c_preferred_sids_request.dart';
import 'package:here_sdk/src/sdk/trafficbroadcast/t_m_c_service_request.dart';

/// Contains all outgoing dependencies to the client side.
abstract class TMCServiceInterface {
  /// Contains all outgoing dependencies to the client side.

  factory TMCServiceInterface(
    void Function(TMCServiceRequest) requestTMCServiceLambda,
    List<int> Function(TMCPreferredSidsRequest) getTMCPreferredSidsLambda,
    List<RDSEncryptionKey> Function(RDSEncryptionKeysRequest) getRDSEncryptionKeysLambda,

  ) => TMCServiceInterface$Lambdas(
    requestTMCServiceLambda,
    getTMCPreferredSidsLambda,
    getRDSEncryptionKeysLambda,

  );

  /// Called whenever the traffic broadcast needs to be activated.
  ///
  /// [tmcServiceRequest] Parameters used to request the traffic broadcast.
  ///
  void requestTMCService(TMCServiceRequest tmcServiceRequest);
  /// Called whenever there is a need to get a list of preferred SIDs for a specific area.
  ///
  /// [tmcPreferredSidsRequest] Specifies the area to request the preferred SIDs.
  ///
  /// Returns [List<int>]. List of preferred SIDs.
  ///
  List<int> getTMCPreferredSids(TMCPreferredSidsRequest tmcPreferredSidsRequest);
  /// Called whenever there is a need to get RDS encryption keys.
  ///
  /// [rdsEncryptionKeysRequest] Input data to search for keys.
  ///
  /// Returns [List<RDSEncryptionKey>]. RDS encryption keys.
  ///
  List<RDSEncryptionKey> getRDSEncryptionKeys(RDSEncryptionKeysRequest rdsEncryptionKeysRequest);
}


// TMCServiceInterface "private" section, not exported.

final _sdkTrafficbroadcastTmcserviceinterfaceRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_trafficbroadcast_TMCServiceInterface_register_finalizer'));
final _sdkTrafficbroadcastTmcserviceinterfaceCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_TMCServiceInterface_copy_handle'));
final _sdkTrafficbroadcastTmcserviceinterfaceReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_TMCServiceInterface_release_handle'));
final _sdkTrafficbroadcastTmcserviceinterfaceCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer, Pointer)
  >('here_sdk_sdk_trafficbroadcast_TMCServiceInterface_create_proxy'));
final _sdkTrafficbroadcastTmcserviceinterfaceGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_TMCServiceInterface_get_type_id'));




class TMCServiceInterface$Lambdas implements TMCServiceInterface {
  void Function(TMCServiceRequest) requestTMCServiceLambda;
  List<int> Function(TMCPreferredSidsRequest) getTMCPreferredSidsLambda;
  List<RDSEncryptionKey> Function(RDSEncryptionKeysRequest) getRDSEncryptionKeysLambda;

  TMCServiceInterface$Lambdas(
    this.requestTMCServiceLambda,
    this.getTMCPreferredSidsLambda,
    this.getRDSEncryptionKeysLambda,

  );

  @override
  void requestTMCService(TMCServiceRequest tmcServiceRequest) =>
    requestTMCServiceLambda(tmcServiceRequest);
  @override
  List<int> getTMCPreferredSids(TMCPreferredSidsRequest tmcPreferredSidsRequest) =>
    getTMCPreferredSidsLambda(tmcPreferredSidsRequest);
  @override
  List<RDSEncryptionKey> getRDSEncryptionKeys(RDSEncryptionKeysRequest rdsEncryptionKeysRequest) =>
    getRDSEncryptionKeysLambda(rdsEncryptionKeysRequest);
}

class TMCServiceInterface$Impl extends __lib.NativeBase implements TMCServiceInterface {

  TMCServiceInterface$Impl(Pointer<Void> handle) : super(handle);

  @override
  void requestTMCService(TMCServiceRequest tmcServiceRequest) {
    final _requestTMCServiceFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_trafficbroadcast_TMCServiceInterface_requestTMCService__TMCServiceRequest'));
    final _tmcServiceRequestHandle = sdkTrafficbroadcastTmcservicerequestToFfi(tmcServiceRequest);
    final _handle = this.handle;
    _requestTMCServiceFfi(_handle, __lib.LibraryContext.isolateId, _tmcServiceRequestHandle);
    sdkTrafficbroadcastTmcservicerequestReleaseFfiHandle(_tmcServiceRequestHandle);

  }

  @override
  List<int> getTMCPreferredSids(TMCPreferredSidsRequest tmcPreferredSidsRequest) {
    final _getTMCPreferredSidsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_trafficbroadcast_TMCServiceInterface_getTMCPreferredSids__TMCPreferredSidsRequest'));
    final _tmcPreferredSidsRequestHandle = sdkTrafficbroadcastTmcpreferredsidsrequestToFfi(tmcPreferredSidsRequest);
    final _handle = this.handle;
    final __resultHandle = _getTMCPreferredSidsFfi(_handle, __lib.LibraryContext.isolateId, _tmcPreferredSidsRequestHandle);
    sdkTrafficbroadcastTmcpreferredsidsrequestReleaseFfiHandle(_tmcPreferredSidsRequestHandle);
    try {
      return heresdkTrafficBroadcastBindingslistofUbyteFromFfi(__resultHandle);
    } finally {
      heresdkTrafficBroadcastBindingslistofUbyteReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  List<RDSEncryptionKey> getRDSEncryptionKeys(RDSEncryptionKeysRequest rdsEncryptionKeysRequest) {
    final _getRDSEncryptionKeysFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_trafficbroadcast_TMCServiceInterface_getRDSEncryptionKeys__RDSEncryptionKeysRequest'));
    final _rdsEncryptionKeysRequestHandle = sdkTrafficbroadcastRdsencryptionkeysrequestToFfi(rdsEncryptionKeysRequest);
    final _handle = this.handle;
    final __resultHandle = _getRDSEncryptionKeysFfi(_handle, __lib.LibraryContext.isolateId, _rdsEncryptionKeysRequestHandle);
    sdkTrafficbroadcastRdsencryptionkeysrequestReleaseFfiHandle(_rdsEncryptionKeysRequestHandle);
    try {
      return heresdkTrafficBroadcastBindingslistofSdkTrafficbroadcastRdsencryptionkeyFromFfi(__resultHandle);
    } finally {
      heresdkTrafficBroadcastBindingslistofSdkTrafficbroadcastRdsencryptionkeyReleaseFfiHandle(__resultHandle);

    }

  }


}

int _sdkTrafficbroadcastTmcserviceinterfacerequestTMCServiceStatic(Object _obj, Pointer<Void> tmcServiceRequest) {

  try {
    (_obj as TMCServiceInterface).requestTMCService(sdkTrafficbroadcastTmcservicerequestFromFfi(tmcServiceRequest));
  } finally {
    sdkTrafficbroadcastTmcservicerequestReleaseFfiHandle(tmcServiceRequest);
  }
  return 0;
}
int _sdkTrafficbroadcastTmcserviceinterfacegetTMCPreferredSidsStatic(Object _obj, Pointer<Void> tmcPreferredSidsRequest, Pointer<Pointer<Void>> _result) {
  List<int>? _resultObject;
  try {
    _resultObject = (_obj as TMCServiceInterface).getTMCPreferredSids(sdkTrafficbroadcastTmcpreferredsidsrequestFromFfi(tmcPreferredSidsRequest));
    _result.value = heresdkTrafficBroadcastBindingslistofUbyteToFfi(_resultObject);
  } finally {
    sdkTrafficbroadcastTmcpreferredsidsrequestReleaseFfiHandle(tmcPreferredSidsRequest);
  }
  return 0;
}
int _sdkTrafficbroadcastTmcserviceinterfacegetRDSEncryptionKeysStatic(Object _obj, Pointer<Void> rdsEncryptionKeysRequest, Pointer<Pointer<Void>> _result) {
  List<RDSEncryptionKey>? _resultObject;
  try {
    _resultObject = (_obj as TMCServiceInterface).getRDSEncryptionKeys(sdkTrafficbroadcastRdsencryptionkeysrequestFromFfi(rdsEncryptionKeysRequest));
    _result.value = heresdkTrafficBroadcastBindingslistofSdkTrafficbroadcastRdsencryptionkeyToFfi(_resultObject);
  } finally {
    sdkTrafficbroadcastRdsencryptionkeysrequestReleaseFfiHandle(rdsEncryptionKeysRequest);
  }
  return 0;
}


Pointer<Void> sdkTrafficbroadcastTmcserviceinterfaceToFfi(TMCServiceInterface value) {
  if (value is __lib.NativeBase) return _sdkTrafficbroadcastTmcserviceinterfaceCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkTrafficbroadcastTmcserviceinterfaceCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkTrafficbroadcastTmcserviceinterfacerequestTMCServiceStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>, Pointer<Pointer<Void>>)>(_sdkTrafficbroadcastTmcserviceinterfacegetTMCPreferredSidsStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>, Pointer<Pointer<Void>>)>(_sdkTrafficbroadcastTmcserviceinterfacegetRDSEncryptionKeysStatic, __lib.unknownError)
  );

  return result;
}

TMCServiceInterface sdkTrafficbroadcastTmcserviceinterfaceFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is TMCServiceInterface) return instance;

  final _typeIdHandle = _sdkTrafficbroadcastTmcserviceinterfaceGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkTrafficbroadcastTmcserviceinterfaceCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : TMCServiceInterface$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkTrafficbroadcastTmcserviceinterfaceRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkTrafficbroadcastTmcserviceinterfaceReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkTrafficbroadcastTmcserviceinterfaceReleaseHandle(handle);

Pointer<Void> sdkTrafficbroadcastTmcserviceinterfaceToFfiNullable(TMCServiceInterface? value) =>
  value != null ? sdkTrafficbroadcastTmcserviceinterfaceToFfi(value) : Pointer<Void>.fromAddress(0);

TMCServiceInterface? sdkTrafficbroadcastTmcserviceinterfaceFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkTrafficbroadcastTmcserviceinterfaceFromFfi(handle) : null;

void sdkTrafficbroadcastTmcserviceinterfaceReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkTrafficbroadcastTmcserviceinterfaceReleaseHandle(handle);

// End of TMCServiceInterface "private" section.


