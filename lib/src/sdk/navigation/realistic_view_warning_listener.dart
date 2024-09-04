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
import 'package:here_sdk/src/sdk/navigation/realistic_view_warning.dart';

/// This Abstract class
/// should be implemented in order to receive realistic view warnings.
///
/// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected
/// behaviors. Related APIs may change for new releases without a deprecation process.
/// A [RealisticViewWarning] will not be given until the previous warning of that type has been passed.
/// For example, a route with [RealisticViewWarning] 120 meters and [RealisticViewWarning] 160 meters ahead,
/// the first [RealisticViewWarning.distanceToRealisticViewInMeters] is 120 meters
/// and the next [RealisticViewWarning.distanceToRealisticViewInMeters] is then 40 meters,
/// since that is the distance between the first and second warnings.
abstract class RealisticViewWarningListener {
  /// This Abstract class
  /// should be implemented in order to receive realistic view warnings.
  ///
  /// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected
  /// behaviors. Related APIs may change for new releases without a deprecation process.
  /// A [RealisticViewWarning] will not be given until the previous warning of that type has been passed.
  /// For example, a route with [RealisticViewWarning] 120 meters and [RealisticViewWarning] 160 meters ahead,
  /// the first [RealisticViewWarning.distanceToRealisticViewInMeters] is 120 meters
  /// and the next [RealisticViewWarning.distanceToRealisticViewInMeters] is then 40 meters,
  /// since that is the distance between the first and second warnings.

  factory RealisticViewWarningListener(
    void Function(RealisticViewWarning) onRealisticViewWarningUpdatedLambda,

  ) => RealisticViewWarningListener$Lambdas(
    onRealisticViewWarningUpdatedLambda,

  );

  /// Called whenever a new realistic view warning is available.
  ///
  /// [realisticViewWarning] The object that contains details on the realistic view warning.
  ///
  void onRealisticViewWarningUpdated(RealisticViewWarning realisticViewWarning);
}


// RealisticViewWarningListener "private" section, not exported.

final _sdkNavigationRealisticviewwarninglistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_navigation_RealisticViewWarningListener_register_finalizer'));
final _sdkNavigationRealisticviewwarninglistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RealisticViewWarningListener_copy_handle'));
final _sdkNavigationRealisticviewwarninglistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RealisticViewWarningListener_release_handle'));
final _sdkNavigationRealisticviewwarninglistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_navigation_RealisticViewWarningListener_create_proxy'));
final _sdkNavigationRealisticviewwarninglistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RealisticViewWarningListener_get_type_id'));


class RealisticViewWarningListener$Lambdas implements RealisticViewWarningListener {
  void Function(RealisticViewWarning) onRealisticViewWarningUpdatedLambda;

  RealisticViewWarningListener$Lambdas(
    this.onRealisticViewWarningUpdatedLambda,

  );

  @override
  void onRealisticViewWarningUpdated(RealisticViewWarning realisticViewWarning) =>
    onRealisticViewWarningUpdatedLambda(realisticViewWarning);
}

class RealisticViewWarningListener$Impl extends __lib.NativeBase implements RealisticViewWarningListener {

  RealisticViewWarningListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onRealisticViewWarningUpdated(RealisticViewWarning realisticViewWarning) {
    final _onRealisticViewWarningUpdatedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_RealisticViewWarningListener_onRealisticViewWarningUpdated__RealisticViewWarning'));
    final _realisticViewWarningHandle = sdkNavigationRealisticviewwarningToFfi(realisticViewWarning);
    final _handle = this.handle;
    _onRealisticViewWarningUpdatedFfi(_handle, __lib.LibraryContext.isolateId, _realisticViewWarningHandle);
    sdkNavigationRealisticviewwarningReleaseFfiHandle(_realisticViewWarningHandle);

  }


}

int _sdkNavigationRealisticviewwarninglisteneronRealisticViewWarningUpdatedStatic(Object _obj, Pointer<Void> realisticViewWarning) {

  try {
    (_obj as RealisticViewWarningListener).onRealisticViewWarningUpdated(sdkNavigationRealisticviewwarningFromFfi(realisticViewWarning));
  } finally {
    sdkNavigationRealisticviewwarningReleaseFfiHandle(realisticViewWarning);
  }
  return 0;
}


Pointer<Void> sdkNavigationRealisticviewwarninglistenerToFfi(RealisticViewWarningListener value) {
  if (value is __lib.NativeBase) return _sdkNavigationRealisticviewwarninglistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkNavigationRealisticviewwarninglistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationRealisticviewwarninglisteneronRealisticViewWarningUpdatedStatic, __lib.unknownError)
  );

  return result;
}

RealisticViewWarningListener sdkNavigationRealisticviewwarninglistenerFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is RealisticViewWarningListener) return instance;

  final _typeIdHandle = _sdkNavigationRealisticviewwarninglistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkNavigationRealisticviewwarninglistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : RealisticViewWarningListener$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkNavigationRealisticviewwarninglistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkNavigationRealisticviewwarninglistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkNavigationRealisticviewwarninglistenerReleaseHandle(handle);

Pointer<Void> sdkNavigationRealisticviewwarninglistenerToFfiNullable(RealisticViewWarningListener? value) =>
  value != null ? sdkNavigationRealisticviewwarninglistenerToFfi(value) : Pointer<Void>.fromAddress(0);

RealisticViewWarningListener? sdkNavigationRealisticviewwarninglistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkNavigationRealisticviewwarninglistenerFromFfi(handle) : null;

void sdkNavigationRealisticviewwarninglistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationRealisticviewwarninglistenerReleaseHandle(handle);

// End of RealisticViewWarningListener "private" section.


