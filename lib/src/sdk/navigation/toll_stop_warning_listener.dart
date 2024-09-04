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
import 'package:here_sdk/src/sdk/navigation/toll_stop.dart';

/// This Abstract class
/// should be implemented in order to receive information on the upcoming toll booth structure.
///
/// The warner might also warn about gates/checkpoints for vignette, border checkpoints
/// and similar structures on the street.
///
/// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected
/// behaviors. Related APIs may change for new releases without a deprecation process.
/// A [TollStop] will not be given until the previous warning of that type has been passed.
/// For example, a route with [TollStop] 120 meters and [TollStop] 160 meters ahead,
/// the first [TollStop.distanceToTollStopInMeters] is 120 meters
/// and the next [TollStop.distanceToTollStopInMeters] is then 40 meters,
/// since that is the distance between the first and second warnings.
abstract class TollStopWarningListener {
  /// This Abstract class
  /// should be implemented in order to receive information on the upcoming toll booth structure.
  ///
  /// The warner might also warn about gates/checkpoints for vignette, border checkpoints
  /// and similar structures on the street.
  ///
  /// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected
  /// behaviors. Related APIs may change for new releases without a deprecation process.
  /// A [TollStop] will not be given until the previous warning of that type has been passed.
  /// For example, a route with [TollStop] 120 meters and [TollStop] 160 meters ahead,
  /// the first [TollStop.distanceToTollStopInMeters] is 120 meters
  /// and the next [TollStop.distanceToTollStopInMeters] is then 40 meters,
  /// since that is the distance between the first and second warnings.

  factory TollStopWarningListener(
    void Function(TollStop) onTollStopWarningLambda,

  ) => TollStopWarningListener$Lambdas(
    onTollStopWarningLambda,

  );

  /// Called whenever a new [TollStop] is available.
  ///
  /// [tollStop] The upcoming toll stop.
  ///
  void onTollStopWarning(TollStop tollStop);
}


// TollStopWarningListener "private" section, not exported.

final _sdkNavigationTollstopwarninglistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_navigation_TollStopWarningListener_register_finalizer'));
final _sdkNavigationTollstopwarninglistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TollStopWarningListener_copy_handle'));
final _sdkNavigationTollstopwarninglistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TollStopWarningListener_release_handle'));
final _sdkNavigationTollstopwarninglistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_navigation_TollStopWarningListener_create_proxy'));
final _sdkNavigationTollstopwarninglistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TollStopWarningListener_get_type_id'));


class TollStopWarningListener$Lambdas implements TollStopWarningListener {
  void Function(TollStop) onTollStopWarningLambda;

  TollStopWarningListener$Lambdas(
    this.onTollStopWarningLambda,

  );

  @override
  void onTollStopWarning(TollStop tollStop) =>
    onTollStopWarningLambda(tollStop);
}

class TollStopWarningListener$Impl extends __lib.NativeBase implements TollStopWarningListener {

  TollStopWarningListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onTollStopWarning(TollStop tollStop) {
    final _onTollStopWarningFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_TollStopWarningListener_onTollStopWarning__TollStop'));
    final _tollStopHandle = sdkNavigationTollstopToFfi(tollStop);
    final _handle = this.handle;
    _onTollStopWarningFfi(_handle, __lib.LibraryContext.isolateId, _tollStopHandle);
    sdkNavigationTollstopReleaseFfiHandle(_tollStopHandle);

  }


}

int _sdkNavigationTollstopwarninglisteneronTollStopWarningStatic(Object _obj, Pointer<Void> tollStop) {

  try {
    (_obj as TollStopWarningListener).onTollStopWarning(sdkNavigationTollstopFromFfi(tollStop));
  } finally {
    sdkNavigationTollstopReleaseFfiHandle(tollStop);
  }
  return 0;
}


Pointer<Void> sdkNavigationTollstopwarninglistenerToFfi(TollStopWarningListener value) {
  if (value is __lib.NativeBase) return _sdkNavigationTollstopwarninglistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkNavigationTollstopwarninglistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationTollstopwarninglisteneronTollStopWarningStatic, __lib.unknownError)
  );

  return result;
}

TollStopWarningListener sdkNavigationTollstopwarninglistenerFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is TollStopWarningListener) return instance;

  final _typeIdHandle = _sdkNavigationTollstopwarninglistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkNavigationTollstopwarninglistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : TollStopWarningListener$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkNavigationTollstopwarninglistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkNavigationTollstopwarninglistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkNavigationTollstopwarninglistenerReleaseHandle(handle);

Pointer<Void> sdkNavigationTollstopwarninglistenerToFfiNullable(TollStopWarningListener? value) =>
  value != null ? sdkNavigationTollstopwarninglistenerToFfi(value) : Pointer<Void>.fromAddress(0);

TollStopWarningListener? sdkNavigationTollstopwarninglistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkNavigationTollstopwarninglistenerFromFfi(handle) : null;

void sdkNavigationTollstopwarninglistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationTollstopwarninglistenerReleaseHandle(handle);

// End of TollStopWarningListener "private" section.


