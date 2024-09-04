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
import 'package:here_sdk/src/sdk/navigation/danger_zone_warning.dart';

/// This abstract class should be implemented in order to
/// receive notifications about the Danger zones from [Navigator].
abstract class DangerZoneWarningListener {
  /// This abstract class should be implemented in order to
  /// receive notifications about the Danger zones from [Navigator].

  factory DangerZoneWarningListener(
    void Function(DangerZoneWarning) onDangerZoneWarningsUpdatedLambda,

  ) => DangerZoneWarningListener$Lambdas(
    onDangerZoneWarningsUpdatedLambda,

  );

  /// Called whenever the current location has been updated.
  ///
  /// [dangerZonesWarning] The Danger zones warning.
  ///
  void onDangerZoneWarningsUpdated(DangerZoneWarning dangerZonesWarning);
}


// DangerZoneWarningListener "private" section, not exported.

final _sdkNavigationDangerzonewarninglistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_navigation_DangerZoneWarningListener_register_finalizer'));
final _sdkNavigationDangerzonewarninglistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_DangerZoneWarningListener_copy_handle'));
final _sdkNavigationDangerzonewarninglistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_DangerZoneWarningListener_release_handle'));
final _sdkNavigationDangerzonewarninglistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_navigation_DangerZoneWarningListener_create_proxy'));
final _sdkNavigationDangerzonewarninglistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_DangerZoneWarningListener_get_type_id'));


class DangerZoneWarningListener$Lambdas implements DangerZoneWarningListener {
  void Function(DangerZoneWarning) onDangerZoneWarningsUpdatedLambda;

  DangerZoneWarningListener$Lambdas(
    this.onDangerZoneWarningsUpdatedLambda,

  );

  @override
  void onDangerZoneWarningsUpdated(DangerZoneWarning dangerZonesWarning) =>
    onDangerZoneWarningsUpdatedLambda(dangerZonesWarning);
}

class DangerZoneWarningListener$Impl extends __lib.NativeBase implements DangerZoneWarningListener {

  DangerZoneWarningListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onDangerZoneWarningsUpdated(DangerZoneWarning dangerZonesWarning) {
    final _onDangerZoneWarningsUpdatedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_DangerZoneWarningListener_onDangerZoneWarningsUpdated__DangerZoneWarning'));
    final _dangerZonesWarningHandle = sdkNavigationDangerzonewarningToFfi(dangerZonesWarning);
    final _handle = this.handle;
    _onDangerZoneWarningsUpdatedFfi(_handle, __lib.LibraryContext.isolateId, _dangerZonesWarningHandle);
    sdkNavigationDangerzonewarningReleaseFfiHandle(_dangerZonesWarningHandle);

  }


}

int _sdkNavigationDangerzonewarninglisteneronDangerZoneWarningsUpdatedStatic(Object _obj, Pointer<Void> dangerZonesWarning) {

  try {
    (_obj as DangerZoneWarningListener).onDangerZoneWarningsUpdated(sdkNavigationDangerzonewarningFromFfi(dangerZonesWarning));
  } finally {
    sdkNavigationDangerzonewarningReleaseFfiHandle(dangerZonesWarning);
  }
  return 0;
}


Pointer<Void> sdkNavigationDangerzonewarninglistenerToFfi(DangerZoneWarningListener value) {
  if (value is __lib.NativeBase) return _sdkNavigationDangerzonewarninglistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkNavigationDangerzonewarninglistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationDangerzonewarninglisteneronDangerZoneWarningsUpdatedStatic, __lib.unknownError)
  );

  return result;
}

DangerZoneWarningListener sdkNavigationDangerzonewarninglistenerFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is DangerZoneWarningListener) return instance;

  final _typeIdHandle = _sdkNavigationDangerzonewarninglistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkNavigationDangerzonewarninglistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : DangerZoneWarningListener$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkNavigationDangerzonewarninglistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkNavigationDangerzonewarninglistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkNavigationDangerzonewarninglistenerReleaseHandle(handle);

Pointer<Void> sdkNavigationDangerzonewarninglistenerToFfiNullable(DangerZoneWarningListener? value) =>
  value != null ? sdkNavigationDangerzonewarninglistenerToFfi(value) : Pointer<Void>.fromAddress(0);

DangerZoneWarningListener? sdkNavigationDangerzonewarninglistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkNavigationDangerzonewarninglistenerFromFfi(handle) : null;

void sdkNavigationDangerzonewarninglistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationDangerzonewarninglistenerReleaseHandle(handle);

// End of DangerZoneWarningListener "private" section.


