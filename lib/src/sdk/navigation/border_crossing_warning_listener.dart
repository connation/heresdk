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
import 'package:here_sdk/src/sdk/navigation/border_crossing_warning.dart';

/// This Abstract class
/// should be implemented in order to receive border crossing warnings for country and state borders.
///
/// **Note:** The border crossing warner is a point warner, which means that for a border crossing there will _always_ be
/// 2 warnings emitted, with the [BorderCrossingWarning.distanceType] set to [DistanceType.ahead] and [DistanceType.passed]
/// which is given when the location of the border crossing is reached.
/// A [BorderCrossingWarning] will not be given until the previous warning of that type has been passed.
/// For example, a route with [BorderCrossingWarning] 120 meters and [BorderCrossingWarning] 160 meters ahead,
/// the first [BorderCrossingWarning.distanceToBorderCrossingInMeters] is 120 meters
/// and the next [BorderCrossingWarning.distanceToBorderCrossingInMeters] is then 40 meters,
/// since that is the distance between the first and second warnings.
abstract class BorderCrossingWarningListener {
  /// This Abstract class
  /// should be implemented in order to receive border crossing warnings for country and state borders.
  ///
  /// **Note:** The border crossing warner is a point warner, which means that for a border crossing there will _always_ be
  /// 2 warnings emitted, with the [BorderCrossingWarning.distanceType] set to [DistanceType.ahead] and [DistanceType.passed]
  /// which is given when the location of the border crossing is reached.
  /// A [BorderCrossingWarning] will not be given until the previous warning of that type has been passed.
  /// For example, a route with [BorderCrossingWarning] 120 meters and [BorderCrossingWarning] 160 meters ahead,
  /// the first [BorderCrossingWarning.distanceToBorderCrossingInMeters] is 120 meters
  /// and the next [BorderCrossingWarning.distanceToBorderCrossingInMeters] is then 40 meters,
  /// since that is the distance between the first and second warnings.

  factory BorderCrossingWarningListener(
    void Function(BorderCrossingWarning) onBorderCrossingWarningUpdatedLambda,

  ) => BorderCrossingWarningListener$Lambdas(
    onBorderCrossingWarningUpdatedLambda,

  );

  /// Called whenever a new border crossing warning is available.
  ///
  /// [borderCrossingWarning] The object that contains details on the border crossing warning.
  ///
  void onBorderCrossingWarningUpdated(BorderCrossingWarning borderCrossingWarning);
}


// BorderCrossingWarningListener "private" section, not exported.

final _sdkNavigationBordercrossingwarninglistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_navigation_BorderCrossingWarningListener_register_finalizer'));
final _sdkNavigationBordercrossingwarninglistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_BorderCrossingWarningListener_copy_handle'));
final _sdkNavigationBordercrossingwarninglistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_BorderCrossingWarningListener_release_handle'));
final _sdkNavigationBordercrossingwarninglistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_navigation_BorderCrossingWarningListener_create_proxy'));
final _sdkNavigationBordercrossingwarninglistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_BorderCrossingWarningListener_get_type_id'));


class BorderCrossingWarningListener$Lambdas implements BorderCrossingWarningListener {
  void Function(BorderCrossingWarning) onBorderCrossingWarningUpdatedLambda;

  BorderCrossingWarningListener$Lambdas(
    this.onBorderCrossingWarningUpdatedLambda,

  );

  @override
  void onBorderCrossingWarningUpdated(BorderCrossingWarning borderCrossingWarning) =>
    onBorderCrossingWarningUpdatedLambda(borderCrossingWarning);
}

class BorderCrossingWarningListener$Impl extends __lib.NativeBase implements BorderCrossingWarningListener {

  BorderCrossingWarningListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onBorderCrossingWarningUpdated(BorderCrossingWarning borderCrossingWarning) {
    final _onBorderCrossingWarningUpdatedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_BorderCrossingWarningListener_onBorderCrossingWarningUpdated__BorderCrossingWarning'));
    final _borderCrossingWarningHandle = sdkNavigationBordercrossingwarningToFfi(borderCrossingWarning);
    final _handle = this.handle;
    _onBorderCrossingWarningUpdatedFfi(_handle, __lib.LibraryContext.isolateId, _borderCrossingWarningHandle);
    sdkNavigationBordercrossingwarningReleaseFfiHandle(_borderCrossingWarningHandle);

  }


}

int _sdkNavigationBordercrossingwarninglisteneronBorderCrossingWarningUpdatedStatic(Object _obj, Pointer<Void> borderCrossingWarning) {

  try {
    (_obj as BorderCrossingWarningListener).onBorderCrossingWarningUpdated(sdkNavigationBordercrossingwarningFromFfi(borderCrossingWarning));
  } finally {
    sdkNavigationBordercrossingwarningReleaseFfiHandle(borderCrossingWarning);
  }
  return 0;
}


Pointer<Void> sdkNavigationBordercrossingwarninglistenerToFfi(BorderCrossingWarningListener value) {
  if (value is __lib.NativeBase) return _sdkNavigationBordercrossingwarninglistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkNavigationBordercrossingwarninglistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationBordercrossingwarninglisteneronBorderCrossingWarningUpdatedStatic, __lib.unknownError)
  );

  return result;
}

BorderCrossingWarningListener sdkNavigationBordercrossingwarninglistenerFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is BorderCrossingWarningListener) return instance;

  final _typeIdHandle = _sdkNavigationBordercrossingwarninglistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkNavigationBordercrossingwarninglistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : BorderCrossingWarningListener$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkNavigationBordercrossingwarninglistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkNavigationBordercrossingwarninglistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkNavigationBordercrossingwarninglistenerReleaseHandle(handle);

Pointer<Void> sdkNavigationBordercrossingwarninglistenerToFfiNullable(BorderCrossingWarningListener? value) =>
  value != null ? sdkNavigationBordercrossingwarninglistenerToFfi(value) : Pointer<Void>.fromAddress(0);

BorderCrossingWarningListener? sdkNavigationBordercrossingwarninglistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkNavigationBordercrossingwarninglistenerFromFfi(handle) : null;

void sdkNavigationBordercrossingwarninglistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationBordercrossingwarninglistenerReleaseHandle(handle);

// End of BorderCrossingWarningListener "private" section.


