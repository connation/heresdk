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
import 'package:here_sdk/src/sdk/navigation/low_speed_zone_warning.dart';

/// This Abstract class
/// should be implemented in order to receive low speed zone warnings.
///
/// **Note:** This listener is currently available _only_ for Japan.
/// The low speed zone warner is a zone warner, which means that for a low speed zone there will _always_
/// be 3 warnings emitted, with the [LowSpeedZoneWarning.distanceType] set to [DistanceType.ahead], [DistanceType.reached]
/// and lastly [DistanceType.passed] when the end of the low speed zone is passed.
abstract class LowSpeedZoneWarningListener {
  /// This Abstract class
  /// should be implemented in order to receive low speed zone warnings.
  ///
  /// **Note:** This listener is currently available _only_ for Japan.
  /// The low speed zone warner is a zone warner, which means that for a low speed zone there will _always_
  /// be 3 warnings emitted, with the [LowSpeedZoneWarning.distanceType] set to [DistanceType.ahead], [DistanceType.reached]
  /// and lastly [DistanceType.passed] when the end of the low speed zone is passed.

  factory LowSpeedZoneWarningListener(
    void Function(LowSpeedZoneWarning) onLowSpeedZoneWarningUpdatedLambda,

  ) => LowSpeedZoneWarningListener$Lambdas(
    onLowSpeedZoneWarningUpdatedLambda,

  );

  /// Called whenever a new low speed zone warning is available.
  ///
  /// [lowSpeedZoneWarning] The object that contains details on the low speed zone warning.
  ///
  void onLowSpeedZoneWarningUpdated(LowSpeedZoneWarning lowSpeedZoneWarning);
}


// LowSpeedZoneWarningListener "private" section, not exported.

final _sdkNavigationLowspeedzonewarninglistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_navigation_LowSpeedZoneWarningListener_register_finalizer'));
final _sdkNavigationLowspeedzonewarninglistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LowSpeedZoneWarningListener_copy_handle'));
final _sdkNavigationLowspeedzonewarninglistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LowSpeedZoneWarningListener_release_handle'));
final _sdkNavigationLowspeedzonewarninglistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_navigation_LowSpeedZoneWarningListener_create_proxy'));
final _sdkNavigationLowspeedzonewarninglistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LowSpeedZoneWarningListener_get_type_id'));


class LowSpeedZoneWarningListener$Lambdas implements LowSpeedZoneWarningListener {
  void Function(LowSpeedZoneWarning) onLowSpeedZoneWarningUpdatedLambda;

  LowSpeedZoneWarningListener$Lambdas(
    this.onLowSpeedZoneWarningUpdatedLambda,

  );

  @override
  void onLowSpeedZoneWarningUpdated(LowSpeedZoneWarning lowSpeedZoneWarning) =>
    onLowSpeedZoneWarningUpdatedLambda(lowSpeedZoneWarning);
}

class LowSpeedZoneWarningListener$Impl extends __lib.NativeBase implements LowSpeedZoneWarningListener {

  LowSpeedZoneWarningListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onLowSpeedZoneWarningUpdated(LowSpeedZoneWarning lowSpeedZoneWarning) {
    final _onLowSpeedZoneWarningUpdatedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_LowSpeedZoneWarningListener_onLowSpeedZoneWarningUpdated__LowSpeedZoneWarning'));
    final _lowSpeedZoneWarningHandle = sdkNavigationLowspeedzonewarningToFfi(lowSpeedZoneWarning);
    final _handle = this.handle;
    _onLowSpeedZoneWarningUpdatedFfi(_handle, __lib.LibraryContext.isolateId, _lowSpeedZoneWarningHandle);
    sdkNavigationLowspeedzonewarningReleaseFfiHandle(_lowSpeedZoneWarningHandle);

  }


}

int _sdkNavigationLowspeedzonewarninglisteneronLowSpeedZoneWarningUpdatedStatic(Object _obj, Pointer<Void> lowSpeedZoneWarning) {

  try {
    (_obj as LowSpeedZoneWarningListener).onLowSpeedZoneWarningUpdated(sdkNavigationLowspeedzonewarningFromFfi(lowSpeedZoneWarning));
  } finally {
    sdkNavigationLowspeedzonewarningReleaseFfiHandle(lowSpeedZoneWarning);
  }
  return 0;
}


Pointer<Void> sdkNavigationLowspeedzonewarninglistenerToFfi(LowSpeedZoneWarningListener value) {
  if (value is __lib.NativeBase) return _sdkNavigationLowspeedzonewarninglistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkNavigationLowspeedzonewarninglistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationLowspeedzonewarninglisteneronLowSpeedZoneWarningUpdatedStatic, __lib.unknownError)
  );

  return result;
}

LowSpeedZoneWarningListener sdkNavigationLowspeedzonewarninglistenerFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is LowSpeedZoneWarningListener) return instance;

  final _typeIdHandle = _sdkNavigationLowspeedzonewarninglistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkNavigationLowspeedzonewarninglistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : LowSpeedZoneWarningListener$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkNavigationLowspeedzonewarninglistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkNavigationLowspeedzonewarninglistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkNavigationLowspeedzonewarninglistenerReleaseHandle(handle);

Pointer<Void> sdkNavigationLowspeedzonewarninglistenerToFfiNullable(LowSpeedZoneWarningListener? value) =>
  value != null ? sdkNavigationLowspeedzonewarninglistenerToFfi(value) : Pointer<Void>.fromAddress(0);

LowSpeedZoneWarningListener? sdkNavigationLowspeedzonewarninglistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkNavigationLowspeedzonewarninglistenerFromFfi(handle) : null;

void sdkNavigationLowspeedzonewarninglistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationLowspeedzonewarninglistenerReleaseHandle(handle);

// End of LowSpeedZoneWarningListener "private" section.


