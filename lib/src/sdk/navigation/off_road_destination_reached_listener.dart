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

/// This abstract class should be
/// implemented in order to receive notifications from this class about the
/// arrival at the off-road destination.
abstract class OffRoadDestinationReachedListener {
  /// This abstract class should be
  /// implemented in order to receive notifications from this class about the
  /// arrival at the off-road destination.

  factory OffRoadDestinationReachedListener(
    void Function() onOffRoadDestinationReachedLambda,

  ) => OffRoadDestinationReachedListener$Lambdas(
    onOffRoadDestinationReachedLambda,

  );

  /// Called when the off-road destination has been reached.
  ///
  void onOffRoadDestinationReached();
}


// OffRoadDestinationReachedListener "private" section, not exported.

final _sdkNavigationOffroaddestinationreachedlistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_navigation_OffRoadDestinationReachedListener_register_finalizer'));
final _sdkNavigationOffroaddestinationreachedlistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_OffRoadDestinationReachedListener_copy_handle'));
final _sdkNavigationOffroaddestinationreachedlistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_OffRoadDestinationReachedListener_release_handle'));
final _sdkNavigationOffroaddestinationreachedlistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_navigation_OffRoadDestinationReachedListener_create_proxy'));
final _sdkNavigationOffroaddestinationreachedlistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_OffRoadDestinationReachedListener_get_type_id'));


class OffRoadDestinationReachedListener$Lambdas implements OffRoadDestinationReachedListener {
  void Function() onOffRoadDestinationReachedLambda;

  OffRoadDestinationReachedListener$Lambdas(
    this.onOffRoadDestinationReachedLambda,

  );

  @override
  void onOffRoadDestinationReached() =>
    onOffRoadDestinationReachedLambda();
}

class OffRoadDestinationReachedListener$Impl extends __lib.NativeBase implements OffRoadDestinationReachedListener {

  OffRoadDestinationReachedListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onOffRoadDestinationReached() {
    final _onOffRoadDestinationReachedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_OffRoadDestinationReachedListener_onOffRoadDestinationReached'));
    final _handle = this.handle;
    _onOffRoadDestinationReachedFfi(_handle, __lib.LibraryContext.isolateId);

  }


}

int _sdkNavigationOffroaddestinationreachedlisteneronOffRoadDestinationReachedStatic(Object _obj) {

  try {
    (_obj as OffRoadDestinationReachedListener).onOffRoadDestinationReached();
  } finally {
  }
  return 0;
}


Pointer<Void> sdkNavigationOffroaddestinationreachedlistenerToFfi(OffRoadDestinationReachedListener value) {
  if (value is __lib.NativeBase) return _sdkNavigationOffroaddestinationreachedlistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkNavigationOffroaddestinationreachedlistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle)>(_sdkNavigationOffroaddestinationreachedlisteneronOffRoadDestinationReachedStatic, __lib.unknownError)
  );

  return result;
}

OffRoadDestinationReachedListener sdkNavigationOffroaddestinationreachedlistenerFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is OffRoadDestinationReachedListener) return instance;

  final _typeIdHandle = _sdkNavigationOffroaddestinationreachedlistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkNavigationOffroaddestinationreachedlistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : OffRoadDestinationReachedListener$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkNavigationOffroaddestinationreachedlistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkNavigationOffroaddestinationreachedlistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkNavigationOffroaddestinationreachedlistenerReleaseHandle(handle);

Pointer<Void> sdkNavigationOffroaddestinationreachedlistenerToFfiNullable(OffRoadDestinationReachedListener? value) =>
  value != null ? sdkNavigationOffroaddestinationreachedlistenerToFfi(value) : Pointer<Void>.fromAddress(0);

OffRoadDestinationReachedListener? sdkNavigationOffroaddestinationreachedlistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkNavigationOffroaddestinationreachedlistenerFromFfi(handle) : null;

void sdkNavigationOffroaddestinationreachedlistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationOffroaddestinationreachedlistenerReleaseHandle(handle);

// End of OffRoadDestinationReachedListener "private" section.


