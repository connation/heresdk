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
import 'package:here_sdk/src/sdk/navigation/road_sign_warning.dart';

/// This Abstract class
/// should be implemented in order to receive road sign warnings.
///
/// **Note:** The road sign warner is a point warner, which means that for a road sign there will _always_ be
/// 2 warnings emitted, with the [RoadSignWarning.distanceType] set to [DistanceType.ahead] and [DistanceType.passed]
/// which is given when the location of the road sign is reached.
/// A [RoadSignWarning] will not be given until the previous warning of that type has been passed.
/// For example, a route with [RoadSignWarning] 120 meters and [RoadSignWarning] 160 meters ahead,
/// the first [RoadSignWarning.distanceToRoadSignInMeters] is 120 meters
/// and the next [RoadSignWarning.distanceToRoadSignInMeters] is then 40 meters,
/// since that is the distance between the first and second warnings.
abstract class RoadSignWarningListener {
  /// This Abstract class
  /// should be implemented in order to receive road sign warnings.
  ///
  /// **Note:** The road sign warner is a point warner, which means that for a road sign there will _always_ be
  /// 2 warnings emitted, with the [RoadSignWarning.distanceType] set to [DistanceType.ahead] and [DistanceType.passed]
  /// which is given when the location of the road sign is reached.
  /// A [RoadSignWarning] will not be given until the previous warning of that type has been passed.
  /// For example, a route with [RoadSignWarning] 120 meters and [RoadSignWarning] 160 meters ahead,
  /// the first [RoadSignWarning.distanceToRoadSignInMeters] is 120 meters
  /// and the next [RoadSignWarning.distanceToRoadSignInMeters] is then 40 meters,
  /// since that is the distance between the first and second warnings.

  factory RoadSignWarningListener(
    void Function(RoadSignWarning) onRoadSignWarningUpdatedLambda,

  ) => RoadSignWarningListener$Lambdas(
    onRoadSignWarningUpdatedLambda,

  );

  /// Called whenever a new road sign warning is available.
  ///
  /// [roadSignWarning] The object that contains details on the road sign warning.
  ///
  void onRoadSignWarningUpdated(RoadSignWarning roadSignWarning);
}


// RoadSignWarningListener "private" section, not exported.

final _sdkNavigationRoadsignwarninglistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_navigation_RoadSignWarningListener_register_finalizer'));
final _sdkNavigationRoadsignwarninglistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadSignWarningListener_copy_handle'));
final _sdkNavigationRoadsignwarninglistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadSignWarningListener_release_handle'));
final _sdkNavigationRoadsignwarninglistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_navigation_RoadSignWarningListener_create_proxy'));
final _sdkNavigationRoadsignwarninglistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadSignWarningListener_get_type_id'));


class RoadSignWarningListener$Lambdas implements RoadSignWarningListener {
  void Function(RoadSignWarning) onRoadSignWarningUpdatedLambda;

  RoadSignWarningListener$Lambdas(
    this.onRoadSignWarningUpdatedLambda,

  );

  @override
  void onRoadSignWarningUpdated(RoadSignWarning roadSignWarning) =>
    onRoadSignWarningUpdatedLambda(roadSignWarning);
}

class RoadSignWarningListener$Impl extends __lib.NativeBase implements RoadSignWarningListener {

  RoadSignWarningListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onRoadSignWarningUpdated(RoadSignWarning roadSignWarning) {
    final _onRoadSignWarningUpdatedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_RoadSignWarningListener_onRoadSignWarningUpdated__RoadSignWarning'));
    final _roadSignWarningHandle = sdkNavigationRoadsignwarningToFfi(roadSignWarning);
    final _handle = this.handle;
    _onRoadSignWarningUpdatedFfi(_handle, __lib.LibraryContext.isolateId, _roadSignWarningHandle);
    sdkNavigationRoadsignwarningReleaseFfiHandle(_roadSignWarningHandle);

  }


}

int _sdkNavigationRoadsignwarninglisteneronRoadSignWarningUpdatedStatic(Object _obj, Pointer<Void> roadSignWarning) {

  try {
    (_obj as RoadSignWarningListener).onRoadSignWarningUpdated(sdkNavigationRoadsignwarningFromFfi(roadSignWarning));
  } finally {
    sdkNavigationRoadsignwarningReleaseFfiHandle(roadSignWarning);
  }
  return 0;
}


Pointer<Void> sdkNavigationRoadsignwarninglistenerToFfi(RoadSignWarningListener value) {
  if (value is __lib.NativeBase) return _sdkNavigationRoadsignwarninglistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkNavigationRoadsignwarninglistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationRoadsignwarninglisteneronRoadSignWarningUpdatedStatic, __lib.unknownError)
  );

  return result;
}

RoadSignWarningListener sdkNavigationRoadsignwarninglistenerFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is RoadSignWarningListener) return instance;

  final _typeIdHandle = _sdkNavigationRoadsignwarninglistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkNavigationRoadsignwarninglistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : RoadSignWarningListener$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkNavigationRoadsignwarninglistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkNavigationRoadsignwarninglistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkNavigationRoadsignwarninglistenerReleaseHandle(handle);

Pointer<Void> sdkNavigationRoadsignwarninglistenerToFfiNullable(RoadSignWarningListener? value) =>
  value != null ? sdkNavigationRoadsignwarninglistenerToFfi(value) : Pointer<Void>.fromAddress(0);

RoadSignWarningListener? sdkNavigationRoadsignwarninglistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkNavigationRoadsignwarninglistenerFromFfi(handle) : null;

void sdkNavigationRoadsignwarninglistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationRoadsignwarninglistenerReleaseHandle(handle);

// End of RoadSignWarningListener "private" section.


