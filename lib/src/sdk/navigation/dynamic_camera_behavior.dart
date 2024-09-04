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

/// Use this class to follow the current location of the user: The camera will look at
/// the target location that was fed into the navigator instance, gradually zooming in as the user
/// approaches each maneuver and zooming out after the user passes them.
///
/// Since location updates
/// happen in discrete intervals, locations in-between will be interpolated to achieve a smooth
/// camera movement.  If no route is set, constant values of camera distance and tilt are used.
abstract class DynamicCameraBehavior implements CameraBehavior {
  /// Creates a new instance of this class.
  ///
  factory DynamicCameraBehavior() => $prototype.make();


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = DynamicCameraBehavior$Impl(Pointer<Void>.fromAddress(0));
}


// DynamicCameraBehavior "private" section, not exported.

final _sdkNavigationDynamiccamerabehaviorRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_navigation_DynamicCameraBehavior_register_finalizer'));
final _sdkNavigationDynamiccamerabehaviorCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_DynamicCameraBehavior_copy_handle'));
final _sdkNavigationDynamiccamerabehaviorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_DynamicCameraBehavior_release_handle'));
final _sdkNavigationDynamiccamerabehaviorGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_DynamicCameraBehavior_get_type_id'));



/// @nodoc
@visibleForTesting
class DynamicCameraBehavior$Impl extends __lib.NativeBase implements DynamicCameraBehavior {

  DynamicCameraBehavior$Impl(Pointer<Void> handle) : super(handle);


  DynamicCameraBehavior make() {
    final _result_handle = _make();
    final _result = DynamicCameraBehavior$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkNavigationDynamiccamerabehaviorRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _make() {
    final _makeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('here_sdk_sdk_navigation_DynamicCameraBehavior_make'));
    final __resultHandle = _makeFfi(__lib.LibraryContext.isolateId);
    return __resultHandle;
  }

  @override
  Anchor2D get normalizedPrincipalPoint {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_DynamicCameraBehavior_normalizedPrincipalPoint_get'));
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
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_DynamicCameraBehavior_normalizedPrincipalPoint_set'));
    final _valueHandle = sdkCoreAnchor2dToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkCoreAnchor2dReleaseFfiHandle(_valueHandle);

  }



}

Pointer<Void> sdkNavigationDynamiccamerabehaviorToFfi(DynamicCameraBehavior value) =>
  _sdkNavigationDynamiccamerabehaviorCopyHandle((value as __lib.NativeBase).handle);

DynamicCameraBehavior sdkNavigationDynamiccamerabehaviorFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is DynamicCameraBehavior) return instance;

  final _typeIdHandle = _sdkNavigationDynamiccamerabehaviorGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkNavigationDynamiccamerabehaviorCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : DynamicCameraBehavior$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkNavigationDynamiccamerabehaviorRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkNavigationDynamiccamerabehaviorReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkNavigationDynamiccamerabehaviorReleaseHandle(handle);

Pointer<Void> sdkNavigationDynamiccamerabehaviorToFfiNullable(DynamicCameraBehavior? value) =>
  value != null ? sdkNavigationDynamiccamerabehaviorToFfi(value) : Pointer<Void>.fromAddress(0);

DynamicCameraBehavior? sdkNavigationDynamiccamerabehaviorFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkNavigationDynamiccamerabehaviorFromFfi(handle) : null;

void sdkNavigationDynamiccamerabehaviorReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationDynamiccamerabehaviorReleaseHandle(handle);

// End of DynamicCameraBehavior "private" section.


