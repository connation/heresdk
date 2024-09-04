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
import 'package:here_sdk/src/sdk/navigation/railway_crossing_warning.dart';

/// This Abstract class
/// should be implemented in order to receive railway crossing warnings.
///
/// **Note:** The railway crossing warner can be either a zone warner or a point warner, depending
/// on whether the railroad crossing warning is given for a railroad crossing zone or just a point. This
/// means that for a railway crossing there will can be either 2 or 3 warnings emitted. In case the railroad
/// crossing is a zone warner then 3 warnings will be emitted with the [RailwayCrossingWarning.distanceType] set to [DistanceType.ahead],
/// [DistanceType.reached] and lastly [DistanceType.passed] when the end of the railway crossing is passed. In
/// case the railroad crossing is a point warner then 2 warnings will be emitted with the [RailwayCrossingWarning.distanceType]
/// set to [DistanceType.ahead] and [DistanceType.passed] when the end of the railway crossing is passed.
abstract class RailwayCrossingWarningListener {
  /// This Abstract class
  /// should be implemented in order to receive railway crossing warnings.
  ///
  /// **Note:** The railway crossing warner can be either a zone warner or a point warner, depending
  /// on whether the railroad crossing warning is given for a railroad crossing zone or just a point. This
  /// means that for a railway crossing there will can be either 2 or 3 warnings emitted. In case the railroad
  /// crossing is a zone warner then 3 warnings will be emitted with the [RailwayCrossingWarning.distanceType] set to [DistanceType.ahead],
  /// [DistanceType.reached] and lastly [DistanceType.passed] when the end of the railway crossing is passed. In
  /// case the railroad crossing is a point warner then 2 warnings will be emitted with the [RailwayCrossingWarning.distanceType]
  /// set to [DistanceType.ahead] and [DistanceType.passed] when the end of the railway crossing is passed.

  factory RailwayCrossingWarningListener(
    void Function(RailwayCrossingWarning) onRailwayCrossingWarningUpdatedLambda,

  ) => RailwayCrossingWarningListener$Lambdas(
    onRailwayCrossingWarningUpdatedLambda,

  );

  /// Called whenever a new railway crossing warning is available.
  ///
  /// [railwayCrossingWarning] The object that contains details on the railway crossing warning.
  ///
  void onRailwayCrossingWarningUpdated(RailwayCrossingWarning railwayCrossingWarning);
}


// RailwayCrossingWarningListener "private" section, not exported.

final _sdkNavigationRailwaycrossingwarninglistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_navigation_RailwayCrossingWarningListener_register_finalizer'));
final _sdkNavigationRailwaycrossingwarninglistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RailwayCrossingWarningListener_copy_handle'));
final _sdkNavigationRailwaycrossingwarninglistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RailwayCrossingWarningListener_release_handle'));
final _sdkNavigationRailwaycrossingwarninglistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_navigation_RailwayCrossingWarningListener_create_proxy'));
final _sdkNavigationRailwaycrossingwarninglistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RailwayCrossingWarningListener_get_type_id'));


class RailwayCrossingWarningListener$Lambdas implements RailwayCrossingWarningListener {
  void Function(RailwayCrossingWarning) onRailwayCrossingWarningUpdatedLambda;

  RailwayCrossingWarningListener$Lambdas(
    this.onRailwayCrossingWarningUpdatedLambda,

  );

  @override
  void onRailwayCrossingWarningUpdated(RailwayCrossingWarning railwayCrossingWarning) =>
    onRailwayCrossingWarningUpdatedLambda(railwayCrossingWarning);
}

class RailwayCrossingWarningListener$Impl extends __lib.NativeBase implements RailwayCrossingWarningListener {

  RailwayCrossingWarningListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onRailwayCrossingWarningUpdated(RailwayCrossingWarning railwayCrossingWarning) {
    final _onRailwayCrossingWarningUpdatedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_RailwayCrossingWarningListener_onRailwayCrossingWarningUpdated__RailwayCrossingWarning'));
    final _railwayCrossingWarningHandle = sdkNavigationRailwaycrossingwarningToFfi(railwayCrossingWarning);
    final _handle = this.handle;
    _onRailwayCrossingWarningUpdatedFfi(_handle, __lib.LibraryContext.isolateId, _railwayCrossingWarningHandle);
    sdkNavigationRailwaycrossingwarningReleaseFfiHandle(_railwayCrossingWarningHandle);

  }


}

int _sdkNavigationRailwaycrossingwarninglisteneronRailwayCrossingWarningUpdatedStatic(Object _obj, Pointer<Void> railwayCrossingWarning) {

  try {
    (_obj as RailwayCrossingWarningListener).onRailwayCrossingWarningUpdated(sdkNavigationRailwaycrossingwarningFromFfi(railwayCrossingWarning));
  } finally {
    sdkNavigationRailwaycrossingwarningReleaseFfiHandle(railwayCrossingWarning);
  }
  return 0;
}


Pointer<Void> sdkNavigationRailwaycrossingwarninglistenerToFfi(RailwayCrossingWarningListener value) {
  if (value is __lib.NativeBase) return _sdkNavigationRailwaycrossingwarninglistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkNavigationRailwaycrossingwarninglistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationRailwaycrossingwarninglisteneronRailwayCrossingWarningUpdatedStatic, __lib.unknownError)
  );

  return result;
}

RailwayCrossingWarningListener sdkNavigationRailwaycrossingwarninglistenerFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is RailwayCrossingWarningListener) return instance;

  final _typeIdHandle = _sdkNavigationRailwaycrossingwarninglistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkNavigationRailwaycrossingwarninglistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : RailwayCrossingWarningListener$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkNavigationRailwaycrossingwarninglistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkNavigationRailwaycrossingwarninglistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkNavigationRailwaycrossingwarninglistenerReleaseHandle(handle);

Pointer<Void> sdkNavigationRailwaycrossingwarninglistenerToFfiNullable(RailwayCrossingWarningListener? value) =>
  value != null ? sdkNavigationRailwaycrossingwarninglistenerToFfi(value) : Pointer<Void>.fromAddress(0);

RailwayCrossingWarningListener? sdkNavigationRailwaycrossingwarninglistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkNavigationRailwaycrossingwarninglistenerFromFfi(handle) : null;

void sdkNavigationRailwaycrossingwarninglistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationRailwaycrossingwarninglistenerReleaseHandle(handle);

// End of RailwayCrossingWarningListener "private" section.


