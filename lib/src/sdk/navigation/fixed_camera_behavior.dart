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
import 'package:here_sdk/src/sdk/navigation/camera_behavior.dart';
import 'package:meta/meta.dart';

/// Use this class to follow the current location of the user: The camera will permanently look at
/// the target location that was fed into the navigator instance.
///
/// Since location updates happen in
/// discrete intervals, locations in-between will be interpolated to achieve a smooth camera
/// movement.
abstract class FixedCameraBehavior implements CameraBehavior {
  /// Creates a new instance of this class.
  ///
  factory FixedCameraBehavior() => $prototype.make();

  /// Gets the currently set camera distance to current location. The default value is 150 meters.
  double get cameraDistanceInMeters;
  /// Sets the camera distance to current location. The default value is 150 meters.
  set cameraDistanceInMeters(double value);

  /// Gets the currently set camera tilt with axis parallel to the ground. The default value is 50 degrees.
  double get cameraTiltInDegrees;
  /// Sets camera tilt with axis parallel to the ground.
  /// The default value is 50 degrees.
  set cameraTiltInDegrees(double value);

  /// Gets the currently set fixed bearing.
  /// Defaults to `null`, which means the camera derives the bearing from the [Location],
  /// so that it points to the direction of travel.
  /// If this property is `null` and the device does not provide bearing, the last known value is
  /// used or zero otherwise.
  double? get cameraBearingInDegrees;
  /// Sets an optional fixed bearing value, from true North (0 degrees) in clockwise direction.
  /// The valid range is \[0, 360]\.
  /// If set, it will prevent the map from rotating to the direction of travel. For example, a
  /// value of zero results in "north up" mode.
  /// Defaults to `null`, which means the camera derives the bearing from the [Location],
  /// so that it points to the direction of travel.
  set cameraBearingInDegrees(double? value);


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = FixedCameraBehavior$Impl(Pointer<Void>.fromAddress(0));
}


// FixedCameraBehavior "private" section, not exported.

final _sdkNavigationFixedcamerabehaviorRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_navigation_FixedCameraBehavior_register_finalizer'));
final _sdkNavigationFixedcamerabehaviorCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_FixedCameraBehavior_copy_handle'));
final _sdkNavigationFixedcamerabehaviorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_FixedCameraBehavior_release_handle'));
final _sdkNavigationFixedcamerabehaviorGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_FixedCameraBehavior_get_type_id'));



/// @nodoc
@visibleForTesting
class FixedCameraBehavior$Impl extends __lib.NativeBase implements FixedCameraBehavior {

  FixedCameraBehavior$Impl(Pointer<Void> handle) : super(handle);


  FixedCameraBehavior make() {
    final _result_handle = _make();
    final _result = FixedCameraBehavior$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkNavigationFixedcamerabehaviorRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _make() {
    final _makeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('here_sdk_sdk_navigation_FixedCameraBehavior_make'));
    final __resultHandle = _makeFfi(__lib.LibraryContext.isolateId);
    return __resultHandle;
  }

  @override
  double get cameraDistanceInMeters {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Int32), double Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_FixedCameraBehavior_cameraDistanceInMeters_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }

  @override
  set cameraDistanceInMeters(double value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Double), void Function(Pointer<Void>, int, double)>('here_sdk_sdk_navigation_FixedCameraBehavior_cameraDistanceInMeters_set__Double'));
    final _valueHandle = (value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);


  }


  @override
  double get cameraTiltInDegrees {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Int32), double Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_FixedCameraBehavior_cameraTiltInDegrees_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }

  @override
  set cameraTiltInDegrees(double value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Double), void Function(Pointer<Void>, int, double)>('here_sdk_sdk_navigation_FixedCameraBehavior_cameraTiltInDegrees_set__Double'));
    final _valueHandle = (value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);


  }


  @override
  double? get cameraBearingInDegrees {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_FixedCameraBehavior_cameraBearingInDegrees_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return doubleFromFfiNullable(__resultHandle);
    } finally {
      doubleReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set cameraBearingInDegrees(double? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_FixedCameraBehavior_cameraBearingInDegrees_set__Double_'));
    final _valueHandle = doubleToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    doubleReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  Anchor2D get normalizedPrincipalPoint {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_FixedCameraBehavior_normalizedPrincipalPoint_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreAnchor2dFromFfi(__resultHandle);
    } finally {
      sdkCoreAnchor2dReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set normalizedPrincipalPoint(Anchor2D value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_FixedCameraBehavior_normalizedPrincipalPoint_set'));
    final _valueHandle = sdkCoreAnchor2dToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkCoreAnchor2dReleaseFfiHandle(_valueHandle);

  }



}

Pointer<Void> sdkNavigationFixedcamerabehaviorToFfi(FixedCameraBehavior value) =>
  _sdkNavigationFixedcamerabehaviorCopyHandle((value as __lib.NativeBase).handle);

FixedCameraBehavior sdkNavigationFixedcamerabehaviorFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is FixedCameraBehavior) return instance;

  final _typeIdHandle = _sdkNavigationFixedcamerabehaviorGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkNavigationFixedcamerabehaviorCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : FixedCameraBehavior$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkNavigationFixedcamerabehaviorRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkNavigationFixedcamerabehaviorReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkNavigationFixedcamerabehaviorReleaseHandle(handle);

Pointer<Void> sdkNavigationFixedcamerabehaviorToFfiNullable(FixedCameraBehavior? value) =>
  value != null ? sdkNavigationFixedcamerabehaviorToFfi(value) : Pointer<Void>.fromAddress(0);

FixedCameraBehavior? sdkNavigationFixedcamerabehaviorFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkNavigationFixedcamerabehaviorFromFfi(handle) : null;

void sdkNavigationFixedcamerabehaviorReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationFixedcamerabehaviorReleaseHandle(handle);

// End of FixedCameraBehavior "private" section.


