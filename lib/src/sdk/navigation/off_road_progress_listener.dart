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
import 'package:here_sdk/src/sdk/navigation/off_road_progress.dart';

/// This abstract class should be implemented in order to
/// receive notifications about the current off-road location from [Navigator].
abstract class OffRoadProgressListener {
  /// This abstract class should be implemented in order to
  /// receive notifications about the current off-road location from [Navigator].

  factory OffRoadProgressListener(
    void Function(OffRoadProgress) onOffRoadProgressUpdatedLambda,

  ) => OffRoadProgressListener$Lambdas(
    onOffRoadProgressUpdatedLambda,

  );

  /// Called whenever the current location has been updated and the user is off-road.
  ///
  /// Off-road
  /// progress events starts after the user has reached the map-matched destination and the current
  /// location is not map-matched.
  ///
  /// [offRoadProgress] The current off-road progress update.
  ///
  void onOffRoadProgressUpdated(OffRoadProgress offRoadProgress);
}


// OffRoadProgressListener "private" section, not exported.

final _sdkNavigationOffroadprogresslistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_navigation_OffRoadProgressListener_register_finalizer'));
final _sdkNavigationOffroadprogresslistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_OffRoadProgressListener_copy_handle'));
final _sdkNavigationOffroadprogresslistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_OffRoadProgressListener_release_handle'));
final _sdkNavigationOffroadprogresslistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_navigation_OffRoadProgressListener_create_proxy'));
final _sdkNavigationOffroadprogresslistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_OffRoadProgressListener_get_type_id'));


class OffRoadProgressListener$Lambdas implements OffRoadProgressListener {
  void Function(OffRoadProgress) onOffRoadProgressUpdatedLambda;

  OffRoadProgressListener$Lambdas(
    this.onOffRoadProgressUpdatedLambda,

  );

  @override
  void onOffRoadProgressUpdated(OffRoadProgress offRoadProgress) =>
    onOffRoadProgressUpdatedLambda(offRoadProgress);
}

class OffRoadProgressListener$Impl extends __lib.NativeBase implements OffRoadProgressListener {

  OffRoadProgressListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onOffRoadProgressUpdated(OffRoadProgress offRoadProgress) {
    final _onOffRoadProgressUpdatedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_OffRoadProgressListener_onOffRoadProgressUpdated__OffRoadProgress'));
    final _offRoadProgressHandle = sdkNavigationOffroadprogressToFfi(offRoadProgress);
    final _handle = this.handle;
    _onOffRoadProgressUpdatedFfi(_handle, __lib.LibraryContext.isolateId, _offRoadProgressHandle);
    sdkNavigationOffroadprogressReleaseFfiHandle(_offRoadProgressHandle);

  }


}

int _sdkNavigationOffroadprogresslisteneronOffRoadProgressUpdatedStatic(Object _obj, Pointer<Void> offRoadProgress) {

  try {
    (_obj as OffRoadProgressListener).onOffRoadProgressUpdated(sdkNavigationOffroadprogressFromFfi(offRoadProgress));
  } finally {
    sdkNavigationOffroadprogressReleaseFfiHandle(offRoadProgress);
  }
  return 0;
}


Pointer<Void> sdkNavigationOffroadprogresslistenerToFfi(OffRoadProgressListener value) {
  if (value is __lib.NativeBase) return _sdkNavigationOffroadprogresslistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkNavigationOffroadprogresslistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationOffroadprogresslisteneronOffRoadProgressUpdatedStatic, __lib.unknownError)
  );

  return result;
}

OffRoadProgressListener sdkNavigationOffroadprogresslistenerFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is OffRoadProgressListener) return instance;

  final _typeIdHandle = _sdkNavigationOffroadprogresslistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkNavigationOffroadprogresslistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : OffRoadProgressListener$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkNavigationOffroadprogresslistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkNavigationOffroadprogresslistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkNavigationOffroadprogresslistenerReleaseHandle(handle);

Pointer<Void> sdkNavigationOffroadprogresslistenerToFfiNullable(OffRoadProgressListener? value) =>
  value != null ? sdkNavigationOffroadprogresslistenerToFfi(value) : Pointer<Void>.fromAddress(0);

OffRoadProgressListener? sdkNavigationOffroadprogresslistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkNavigationOffroadprogresslistenerFromFfi(handle) : null;

void sdkNavigationOffroadprogresslistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationOffroadprogresslistenerReleaseHandle(handle);

// End of OffRoadProgressListener "private" section.


