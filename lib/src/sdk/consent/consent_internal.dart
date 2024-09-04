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
import 'package:here_sdk/src/sdk/consent/consent_feature.dart';
import 'package:here_sdk/src/sdk/consent/consent_listener.dart';
import 'package:here_sdk/src/sdk/consent/consent_state.dart';
import 'package:here_sdk/src/sdk/consent/consent_status.dart';
import 'package:here_sdk/src/sdk/core/engine/s_d_k_native_engine.dart';
import 'package:here_sdk/src/sdk/core/errors/instantiation_error_code.dart';
import 'package:here_sdk/src/sdk/core/errors/instantiation_exception.dart';
import 'package:meta/meta.dart';

/// ConsentInternal class.
/// @nodoc
abstract class ConsentInternal {

  /// Returns instance of this class associated with given instance of [SDKNativeEngine].
  ///
  /// If instance doesn't yet exists then it's created.
  ///
  /// [sdkEngine] Instance of [SDKNativeEngine]
  ///
  /// Returns [ConsentInternal]. An [ConsentInternal] instance.
  ///
  /// Throws [InstantiationException]. Indicates what went wrong when the instantiation was attempted.
  ///
  static ConsentInternal fromSdkNativeEngine(SDKNativeEngine sdkEngine) => $prototype.fromSdkNativeEngine(sdkEngine);
  /// Returns instance of this class associated with shared instance of [SDKNativeEngine].
  ///
  /// If instance doesn't yet exists then it's created.
  ///
  /// Returns [ConsentInternal]. An [ConsentInternal] instance.
  ///
  /// Throws [InstantiationException]. Indicates what went wrong when the instantiation was attempted.
  ///
  static ConsentInternal fromSharedSdkNativeEngine() => $prototype.fromSharedSdkNativeEngine();
  /// Starts concurrent requests to verify enabled features.
  ///
  /// Requires valid shared instance of SDK engine.
  /// Calling this method several times is safe.
  ///
  void start();
  /// Add business feature specific listener for tracking user consent state changes.
  ///
  /// Calling this method several times with same business feature leaves only last
  /// registration active, removing the previous.
  ///
  /// [feature] The required business feature.
  ///
  /// [listener] The listener.
  ///
  /// Returns [bool]. True if registration succeeed, false otherwise.
  ///
  bool addListener(ConsentFeature feature, ConsentListener listener);
  /// Remove business feature consent listener.
  ///
  /// [feature] The business feature.
  ///
  void removeListener(ConsentFeature feature);
  /// Grants user consent for this app.
  ///
  /// Returns [ConsentStatus]. Call status.
  ///
  ConsentStatus grantUserConsent();
  /// Deny user consent from this app.
  ///
  /// Returns [ConsentStatus]. Call status.
  ///
  ConsentStatus denyUserConsent();
  /// Check if user consent has been handled.
  ///
  /// Returns [bool]. True if user consent has been handled false otherwise.
  ///
  bool isUserConsentHandled();
  /// Gets the internal user consent state.
  ConsentState get consentState;
  /// Sets the internal user consent state.
  set consentState(ConsentState value);


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = ConsentInternal$Impl(Pointer<Void>.fromAddress(0));
}


// ConsentInternal "private" section, not exported.

final _sdkConsentConsentinternalRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_consent_ConsentInternal_register_finalizer'));
final _sdkConsentConsentinternalCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_consent_ConsentInternal_copy_handle'));
final _sdkConsentConsentinternalReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_consent_ConsentInternal_release_handle'));


final _fromSdkNativeEnginesdkConsentConsentinternalFromsdknativeengineSdknativeengineReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_consent_ConsentInternal_fromSdkNativeEngine__SDKNativeEngine_return_release_handle'));
final _fromSdkNativeEnginesdkConsentConsentinternalFromsdknativeengineSdknativeengineReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_consent_ConsentInternal_fromSdkNativeEngine__SDKNativeEngine_return_get_result'));
final _fromSdkNativeEnginesdkConsentConsentinternalFromsdknativeengineSdknativeengineReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_consent_ConsentInternal_fromSdkNativeEngine__SDKNativeEngine_return_get_error'));
final _fromSdkNativeEnginesdkConsentConsentinternalFromsdknativeengineSdknativeengineReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_consent_ConsentInternal_fromSdkNativeEngine__SDKNativeEngine_return_has_error'));


final _fromSharedSdkNativeEnginesdkConsentConsentinternalFromsharedsdknativeengineReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_consent_ConsentInternal_fromSharedSdkNativeEngine_return_release_handle'));
final _fromSharedSdkNativeEnginesdkConsentConsentinternalFromsharedsdknativeengineReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_consent_ConsentInternal_fromSharedSdkNativeEngine_return_get_result'));
final _fromSharedSdkNativeEnginesdkConsentConsentinternalFromsharedsdknativeengineReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_consent_ConsentInternal_fromSharedSdkNativeEngine_return_get_error'));
final _fromSharedSdkNativeEnginesdkConsentConsentinternalFromsharedsdknativeengineReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_consent_ConsentInternal_fromSharedSdkNativeEngine_return_has_error'));








/// @nodoc
@visibleForTesting
class ConsentInternal$Impl extends __lib.NativeBase implements ConsentInternal {

  ConsentInternal$Impl(Pointer<Void> handle) : super(handle);

  ConsentInternal fromSdkNativeEngine(SDKNativeEngine sdkEngine) {
    final _fromSdkNativeEngineFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_consent_ConsentInternal_fromSdkNativeEngine__SDKNativeEngine'));
    final _sdkEngineHandle = sdkCoreEngineSdknativeengineToFfi(sdkEngine);
    final __callResultHandle = _fromSdkNativeEngineFfi(__lib.LibraryContext.isolateId, _sdkEngineHandle);
    sdkCoreEngineSdknativeengineReleaseFfiHandle(_sdkEngineHandle);
    if (_fromSdkNativeEnginesdkConsentConsentinternalFromsdknativeengineSdknativeengineReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _fromSdkNativeEnginesdkConsentConsentinternalFromsdknativeengineSdknativeengineReturnGetError(__callResultHandle);
        _fromSdkNativeEnginesdkConsentConsentinternalFromsdknativeengineSdknativeengineReturnReleaseHandle(__callResultHandle);
        try {
          throw InstantiationException(sdkCoreErrorsInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkCoreErrorsInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _fromSdkNativeEnginesdkConsentConsentinternalFromsdknativeengineSdknativeengineReturnGetResult(__callResultHandle);
    _fromSdkNativeEnginesdkConsentConsentinternalFromsdknativeengineSdknativeengineReturnReleaseHandle(__callResultHandle);
    try {
      return sdkConsentConsentinternalFromFfi(__resultHandle);
    } finally {
      sdkConsentConsentinternalReleaseFfiHandle(__resultHandle);

    }

  }

  ConsentInternal fromSharedSdkNativeEngine() {
    final _fromSharedSdkNativeEngineFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('here_sdk_sdk_consent_ConsentInternal_fromSharedSdkNativeEngine'));
    final __callResultHandle = _fromSharedSdkNativeEngineFfi(__lib.LibraryContext.isolateId);
    if (_fromSharedSdkNativeEnginesdkConsentConsentinternalFromsharedsdknativeengineReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _fromSharedSdkNativeEnginesdkConsentConsentinternalFromsharedsdknativeengineReturnGetError(__callResultHandle);
        _fromSharedSdkNativeEnginesdkConsentConsentinternalFromsharedsdknativeengineReturnReleaseHandle(__callResultHandle);
        try {
          throw InstantiationException(sdkCoreErrorsInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkCoreErrorsInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _fromSharedSdkNativeEnginesdkConsentConsentinternalFromsharedsdknativeengineReturnGetResult(__callResultHandle);
    _fromSharedSdkNativeEnginesdkConsentConsentinternalFromsharedsdknativeengineReturnReleaseHandle(__callResultHandle);
    try {
      return sdkConsentConsentinternalFromFfi(__resultHandle);
    } finally {
      sdkConsentConsentinternalReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  void start() {
    final _startFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_consent_ConsentInternal_start'));
    final _handle = this.handle;
    _startFfi(_handle, __lib.LibraryContext.isolateId);

  }

  @override
  bool addListener(ConsentFeature feature, ConsentListener listener) {
    final _addListenerFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Uint32, Pointer<Void>), int Function(Pointer<Void>, int, int, Pointer<Void>)>('here_sdk_sdk_consent_ConsentInternal_addListener__ConsentFeature_ConsentListener'));
    final _featureHandle = sdkConsentConsentfeatureToFfi(feature);
    final _listenerHandle = sdkConsentConsentlistenerToFfi(listener);
    final _handle = this.handle;
    final __resultHandle = _addListenerFfi(_handle, __lib.LibraryContext.isolateId, _featureHandle, _listenerHandle);
    sdkConsentConsentfeatureReleaseFfiHandle(_featureHandle);
    sdkConsentConsentlistenerReleaseFfiHandle(_listenerHandle);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  void removeListener(ConsentFeature feature) {
    final _removeListenerFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_consent_ConsentInternal_removeListener__ConsentFeature'));
    final _featureHandle = sdkConsentConsentfeatureToFfi(feature);
    final _handle = this.handle;
    _removeListenerFfi(_handle, __lib.LibraryContext.isolateId, _featureHandle);
    sdkConsentConsentfeatureReleaseFfiHandle(_featureHandle);

  }

  @override
  ConsentStatus grantUserConsent() {
    final _grantUserConsentFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_consent_ConsentInternal_grantUserConsent'));
    final _handle = this.handle;
    final __resultHandle = _grantUserConsentFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkConsentConsentstatusFromFfi(__resultHandle);
    } finally {
      sdkConsentConsentstatusReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  ConsentStatus denyUserConsent() {
    final _denyUserConsentFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_consent_ConsentInternal_denyUserConsent'));
    final _handle = this.handle;
    final __resultHandle = _denyUserConsentFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkConsentConsentstatusFromFfi(__resultHandle);
    } finally {
      sdkConsentConsentstatusReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  bool isUserConsentHandled() {
    final _isUserConsentHandledFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_consent_ConsentInternal_isUserConsentHandled'));
    final _handle = this.handle;
    final __resultHandle = _isUserConsentHandledFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  ConsentState get consentState {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_consent_ConsentInternal_consentState_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkConsentConsentstateFromFfi(__resultHandle);
    } finally {
      sdkConsentConsentstateReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set consentState(ConsentState value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_consent_ConsentInternal_consentState_set__ConsentState'));
    final _valueHandle = sdkConsentConsentstateToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkConsentConsentstateReleaseFfiHandle(_valueHandle);

  }



}

Pointer<Void> sdkConsentConsentinternalToFfi(ConsentInternal value) =>
  _sdkConsentConsentinternalCopyHandle((value as __lib.NativeBase).handle);

ConsentInternal sdkConsentConsentinternalFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is ConsentInternal) return instance;

  final _copiedHandle = _sdkConsentConsentinternalCopyHandle(handle);
  final result = ConsentInternal$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkConsentConsentinternalRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkConsentConsentinternalReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkConsentConsentinternalReleaseHandle(handle);

Pointer<Void> sdkConsentConsentinternalToFfiNullable(ConsentInternal? value) =>
  value != null ? sdkConsentConsentinternalToFfi(value) : Pointer<Void>.fromAddress(0);

ConsentInternal? sdkConsentConsentinternalFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkConsentConsentinternalFromFfi(handle) : null;

void sdkConsentConsentinternalReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkConsentConsentinternalReleaseHandle(handle);

// End of ConsentInternal "private" section.


