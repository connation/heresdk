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
import 'package:here_sdk/src/sdk/navigation/environmental_zone_warning.dart';

/// This abstract class should be implemented in order to
/// receive notifications about the environmental zones from [Navigator].
abstract class EnvironmentalZoneWarningListener {
  /// This abstract class should be implemented in order to
  /// receive notifications about the environmental zones from [Navigator].

  factory EnvironmentalZoneWarningListener(
    void Function(List<EnvironmentalZoneWarning>) onEnvironmentalZoneWarningsUpdatedLambda,

  ) => EnvironmentalZoneWarningListener$Lambdas(
    onEnvironmentalZoneWarningsUpdatedLambda,

  );

  /// Called whenever the current location has been updated.
  ///
  /// [environmentalZonesWarning] The list of environmental zones.
  ///
  void onEnvironmentalZoneWarningsUpdated(List<EnvironmentalZoneWarning> environmentalZonesWarning);
}


// EnvironmentalZoneWarningListener "private" section, not exported.

final _sdkNavigationEnvironmentalzonewarninglistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_navigation_EnvironmentalZoneWarningListener_register_finalizer'));
final _sdkNavigationEnvironmentalzonewarninglistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_EnvironmentalZoneWarningListener_copy_handle'));
final _sdkNavigationEnvironmentalzonewarninglistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_EnvironmentalZoneWarningListener_release_handle'));
final _sdkNavigationEnvironmentalzonewarninglistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_navigation_EnvironmentalZoneWarningListener_create_proxy'));
final _sdkNavigationEnvironmentalzonewarninglistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_EnvironmentalZoneWarningListener_get_type_id'));


class EnvironmentalZoneWarningListener$Lambdas implements EnvironmentalZoneWarningListener {
  void Function(List<EnvironmentalZoneWarning>) onEnvironmentalZoneWarningsUpdatedLambda;

  EnvironmentalZoneWarningListener$Lambdas(
    this.onEnvironmentalZoneWarningsUpdatedLambda,

  );

  @override
  void onEnvironmentalZoneWarningsUpdated(List<EnvironmentalZoneWarning> environmentalZonesWarning) =>
    onEnvironmentalZoneWarningsUpdatedLambda(environmentalZonesWarning);
}

class EnvironmentalZoneWarningListener$Impl extends __lib.NativeBase implements EnvironmentalZoneWarningListener {

  EnvironmentalZoneWarningListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onEnvironmentalZoneWarningsUpdated(List<EnvironmentalZoneWarning> environmentalZonesWarning) {
    final _onEnvironmentalZoneWarningsUpdatedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_EnvironmentalZoneWarningListener_onEnvironmentalZoneWarningsUpdated__ListOf_sdk_navigation_EnvironmentalZoneWarning'));
    final _environmentalZonesWarningHandle = heresdkNavigationBindingslistofSdkNavigationEnvironmentalzonewarningToFfi(environmentalZonesWarning);
    final _handle = this.handle;
    _onEnvironmentalZoneWarningsUpdatedFfi(_handle, __lib.LibraryContext.isolateId, _environmentalZonesWarningHandle);
    heresdkNavigationBindingslistofSdkNavigationEnvironmentalzonewarningReleaseFfiHandle(_environmentalZonesWarningHandle);

  }


}

int _sdkNavigationEnvironmentalzonewarninglisteneronEnvironmentalZoneWarningsUpdatedStatic(Object _obj, Pointer<Void> environmentalZonesWarning) {

  try {
    (_obj as EnvironmentalZoneWarningListener).onEnvironmentalZoneWarningsUpdated(heresdkNavigationBindingslistofSdkNavigationEnvironmentalzonewarningFromFfi(environmentalZonesWarning));
  } finally {
    heresdkNavigationBindingslistofSdkNavigationEnvironmentalzonewarningReleaseFfiHandle(environmentalZonesWarning);
  }
  return 0;
}


Pointer<Void> sdkNavigationEnvironmentalzonewarninglistenerToFfi(EnvironmentalZoneWarningListener value) {
  if (value is __lib.NativeBase) return _sdkNavigationEnvironmentalzonewarninglistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkNavigationEnvironmentalzonewarninglistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationEnvironmentalzonewarninglisteneronEnvironmentalZoneWarningsUpdatedStatic, __lib.unknownError)
  );

  return result;
}

EnvironmentalZoneWarningListener sdkNavigationEnvironmentalzonewarninglistenerFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is EnvironmentalZoneWarningListener) return instance;

  final _typeIdHandle = _sdkNavigationEnvironmentalzonewarninglistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkNavigationEnvironmentalzonewarninglistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : EnvironmentalZoneWarningListener$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkNavigationEnvironmentalzonewarninglistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkNavigationEnvironmentalzonewarninglistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkNavigationEnvironmentalzonewarninglistenerReleaseHandle(handle);

Pointer<Void> sdkNavigationEnvironmentalzonewarninglistenerToFfiNullable(EnvironmentalZoneWarningListener? value) =>
  value != null ? sdkNavigationEnvironmentalzonewarninglistenerToFfi(value) : Pointer<Void>.fromAddress(0);

EnvironmentalZoneWarningListener? sdkNavigationEnvironmentalzonewarninglistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkNavigationEnvironmentalzonewarninglistenerFromFfi(handle) : null;

void sdkNavigationEnvironmentalzonewarninglistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationEnvironmentalzonewarninglistenerReleaseHandle(handle);

// End of EnvironmentalZoneWarningListener "private" section.


