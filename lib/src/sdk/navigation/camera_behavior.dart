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
import 'package:here_sdk/src/sdk/core/anchor2_d.dart';

/// Abstract class used to change implement different
/// camera behaviors.
abstract class CameraBehavior {
  /// Abstract class used to change implement different
  /// camera behaviors.

  factory CameraBehavior(
    Anchor2D Function() normalizedPrincipalPointGetLambda,
    void Function(Anchor2D) normalizedPrincipalPointSetLambda
  ) => CameraBehavior$Lambdas(
    normalizedPrincipalPointGetLambda,
    normalizedPrincipalPointSetLambda
  );

  /// Gets the currently set normalized principal point to be used during navigation.
  Anchor2D get normalizedPrincipalPoint;
  /// Sets a normalized principal point to be used during navigation.
  /// Defaults to (0.5, 0.775), which means the camera will use the position slightly at the bottom
  /// of the mapview.
  set normalizedPrincipalPoint(Anchor2D value);

}


// CameraBehavior "private" section, not exported.

final _sdkNavigationCamerabehaviorRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_navigation_CameraBehavior_register_finalizer'));
final _sdkNavigationCamerabehaviorCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_CameraBehavior_copy_handle'));
final _sdkNavigationCamerabehaviorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_CameraBehavior_release_handle'));
final _sdkNavigationCamerabehaviorCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer)
  >('here_sdk_sdk_navigation_CameraBehavior_create_proxy'));
final _sdkNavigationCamerabehaviorGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_CameraBehavior_get_type_id'));

class CameraBehavior$Lambdas implements CameraBehavior {
  Anchor2D Function() normalizedPrincipalPointGetLambda;
  void Function(Anchor2D) normalizedPrincipalPointSetLambda;

  CameraBehavior$Lambdas(
    this.normalizedPrincipalPointGetLambda,
    this.normalizedPrincipalPointSetLambda
  );

  @override
  Anchor2D get normalizedPrincipalPoint => normalizedPrincipalPointGetLambda();
  @override
  set normalizedPrincipalPoint(Anchor2D value) => normalizedPrincipalPointSetLambda(value);
}

class CameraBehavior$Impl extends __lib.NativeBase implements CameraBehavior {

  CameraBehavior$Impl(Pointer<Void> handle) : super(handle);

  /// Gets the currently set normalized principal point to be used during navigation.
  Anchor2D get normalizedPrincipalPoint {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_CameraBehavior_normalizedPrincipalPoint_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreAnchor2dFromFfi(__resultHandle);
    } finally {
      sdkCoreAnchor2dReleaseFfiHandle(__resultHandle);

    }

  }

  /// Sets a normalized principal point to be used during navigation.
  /// Defaults to (0.5, 0.775), which means the camera will use the position slightly at the bottom
  /// of the mapview.
  ///
  /// [value] Normalized principal point to be used during navigation.
  /// Defaults to (0.5, 0.775), which means the camera will use the position slightly at the bottom
  /// of the mapview.
  ///
  set normalizedPrincipalPoint(Anchor2D value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_CameraBehavior_normalizedPrincipalPoint_set__Anchor2D'));
    final _valueHandle = sdkCoreAnchor2dToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkCoreAnchor2dReleaseFfiHandle(_valueHandle);

  }



}


int _sdkNavigationCamerabehaviornormalizedPrincipalPointGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkCoreAnchor2dToFfi((_obj as CameraBehavior).normalizedPrincipalPoint);
  return 0;
}

int _sdkNavigationCamerabehaviornormalizedPrincipalPointSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as CameraBehavior).normalizedPrincipalPoint =
      sdkCoreAnchor2dFromFfi(_value);
  } finally {
    sdkCoreAnchor2dReleaseFfiHandle(_value);
  }
  return 0;
}

Pointer<Void> sdkNavigationCamerabehaviorToFfi(CameraBehavior value) {
  if (value is __lib.NativeBase) return _sdkNavigationCamerabehaviorCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkNavigationCamerabehaviorCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationCamerabehaviornormalizedPrincipalPointGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationCamerabehaviornormalizedPrincipalPointSetStatic, __lib.unknownError)
  );

  return result;
}

CameraBehavior sdkNavigationCamerabehaviorFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is CameraBehavior) return instance;

  final _typeIdHandle = _sdkNavigationCamerabehaviorGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkNavigationCamerabehaviorCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : CameraBehavior$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkNavigationCamerabehaviorRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkNavigationCamerabehaviorReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkNavigationCamerabehaviorReleaseHandle(handle);

Pointer<Void> sdkNavigationCamerabehaviorToFfiNullable(CameraBehavior? value) =>
  value != null ? sdkNavigationCamerabehaviorToFfi(value) : Pointer<Void>.fromAddress(0);

CameraBehavior? sdkNavigationCamerabehaviorFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkNavigationCamerabehaviorFromFfi(handle) : null;

void sdkNavigationCamerabehaviorReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationCamerabehaviorReleaseHandle(handle);

// End of CameraBehavior "private" section.


