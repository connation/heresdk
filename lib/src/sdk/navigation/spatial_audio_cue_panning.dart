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
import 'package:here_sdk/src/sdk/navigation/custom_panning_data.dart';
import 'package:here_sdk/src/sdk/navigation/spatial_trajectory_data.dart';

/// Use the [SpatialAudioCuePanning] to notify each of the azimuths which compose a spatial audio
/// trajectory along the audio cue.
abstract class SpatialAudioCuePanning {

  /// This method will retrieve a stream of azimuth values to be passed onto the spatial audio renderer.
  ///
  /// An optional custom value for [CustomPanningData.estimatedAudioCueDuration],
  /// [CustomPanningData.initialAzimuthInDegrees],  or its [CustomPanningData.sweepAzimuthInDegrees]
  /// can be here defined if the default data does not fully match the utilized Language or TTS engine
  /// or angle expectations.
  /// If startAngularPanning is called to spatialize the audio cue of a new maneuver before the full
  /// completion of a previous spatial audio trajectory, then [EventTextListener] will retrieve
  /// the azimuth values of the new maneuver.
  ///
  /// [nextCustomPanningData] Defines a new set of values related to spatial audio panning.
  /// When [CustomPanningData] is initialized as `null`, the default set of values provided by HERE SDK
  /// will be used instead.
  ///
  /// [azimuthCallback] Callback that will signal the next azimuth required to complete a spatial audio trajectory
  /// once the angular panning has started.
  /// Azimuth angular values are retrieved individually until the full duration of the audio trajectory
  /// has been reached,
  /// or a new text message has started its angular panning.
  ///
  void startAngularPanning(CustomPanningData? nextCustomPanningData, SpatialAudioCuePanningspatialAzimuthStarted azimuthCallback);
}

/// Called once `startAngularPanning()` starts.
///
/// [p0] The angular panning information of the current spatial trajectory.
typedef SpatialAudioCuePanningspatialAzimuthStarted = void Function(SpatialTrajectoryData);

// SpatialAudioCuePanningspatialAzimuthStarted "private" section, not exported.

final _sdkNavigationSpatialaudiocuepanningSpatialazimuthcallbackRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_navigation_SpatialAudioCuePanning_SpatialAzimuthCallback_register_finalizer'));
final _sdkNavigationSpatialaudiocuepanningSpatialazimuthcallbackCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpatialAudioCuePanning_SpatialAzimuthCallback_copy_handle'));
final _sdkNavigationSpatialaudiocuepanningSpatialazimuthcallbackReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpatialAudioCuePanning_SpatialAzimuthCallback_release_handle'));
final _sdkNavigationSpatialaudiocuepanningSpatialazimuthcallbackCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_navigation_SpatialAudioCuePanning_SpatialAzimuthCallback_create_proxy'));

class SpatialAudioCuePanningspatialAzimuthStarted$Impl {
  final Pointer<Void> handle;
  SpatialAudioCuePanningspatialAzimuthStarted$Impl(this.handle);

  void spatialAzimuthStarted(SpatialTrajectoryData p0) {
    final _spatialAzimuthStartedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_SpatialAudioCuePanning_SpatialAzimuthCallback_call__SpatialTrajectoryData'));
    final _p0Handle = sdkNavigationSpatialtrajectorydataToFfi(p0);
    final _handle = this.handle;
    _spatialAzimuthStartedFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle);
    sdkNavigationSpatialtrajectorydataReleaseFfiHandle(_p0Handle);

  }

}

int _sdkNavigationSpatialaudiocuepanningSpatialazimuthcallbackspatialAzimuthStartedStatic(Object _obj, Pointer<Void> p0) {
  
  try {
    (_obj as SpatialAudioCuePanningspatialAzimuthStarted)(sdkNavigationSpatialtrajectorydataFromFfi(p0));
  } finally {
    sdkNavigationSpatialtrajectorydataReleaseFfiHandle(p0);
  }
  return 0;
}

Pointer<Void> sdkNavigationSpatialaudiocuepanningSpatialazimuthcallbackToFfi(SpatialAudioCuePanningspatialAzimuthStarted value) =>
  _sdkNavigationSpatialaudiocuepanningSpatialazimuthcallbackCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle, Pointer<Void>)>(_sdkNavigationSpatialaudiocuepanningSpatialazimuthcallbackspatialAzimuthStartedStatic, __lib.unknownError)
  );

SpatialAudioCuePanningspatialAzimuthStarted sdkNavigationSpatialaudiocuepanningSpatialazimuthcallbackFromFfi(Pointer<Void> handle) {
  final _copiedHandle = _sdkNavigationSpatialaudiocuepanningSpatialazimuthcallbackCopyHandle(handle);
  final _impl = SpatialAudioCuePanningspatialAzimuthStarted$Impl(_copiedHandle);
  final result = (SpatialTrajectoryData p0) => _impl.spatialAzimuthStarted(p0);
  _sdkNavigationSpatialaudiocuepanningSpatialazimuthcallbackRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkNavigationSpatialaudiocuepanningSpatialazimuthcallbackReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkNavigationSpatialaudiocuepanningSpatialazimuthcallbackReleaseHandle(handle);

// Nullable SpatialAudioCuePanningspatialAzimuthStarted

final _sdkNavigationSpatialaudiocuepanningSpatialazimuthcallbackCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpatialAudioCuePanning_SpatialAzimuthCallback_create_handle_nullable'));
final _sdkNavigationSpatialaudiocuepanningSpatialazimuthcallbackReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpatialAudioCuePanning_SpatialAzimuthCallback_release_handle_nullable'));
final _sdkNavigationSpatialaudiocuepanningSpatialazimuthcallbackGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpatialAudioCuePanning_SpatialAzimuthCallback_get_value_nullable'));

Pointer<Void> sdkNavigationSpatialaudiocuepanningSpatialazimuthcallbackToFfiNullable(SpatialAudioCuePanningspatialAzimuthStarted? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationSpatialaudiocuepanningSpatialazimuthcallbackToFfi(value);
  final result = _sdkNavigationSpatialaudiocuepanningSpatialazimuthcallbackCreateHandleNullable(_handle);
  sdkNavigationSpatialaudiocuepanningSpatialazimuthcallbackReleaseFfiHandle(_handle);
  return result;
}

SpatialAudioCuePanningspatialAzimuthStarted? sdkNavigationSpatialaudiocuepanningSpatialazimuthcallbackFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationSpatialaudiocuepanningSpatialazimuthcallbackGetValueNullable(handle);
  final result = sdkNavigationSpatialaudiocuepanningSpatialazimuthcallbackFromFfi(_handle);
  sdkNavigationSpatialaudiocuepanningSpatialazimuthcallbackReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationSpatialaudiocuepanningSpatialazimuthcallbackReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationSpatialaudiocuepanningSpatialazimuthcallbackReleaseHandleNullable(handle);

// End of SpatialAudioCuePanningspatialAzimuthStarted "private" section.

// SpatialAudioCuePanning "private" section, not exported.

final _sdkNavigationSpatialaudiocuepanningRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_navigation_SpatialAudioCuePanning_register_finalizer'));
final _sdkNavigationSpatialaudiocuepanningCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpatialAudioCuePanning_copy_handle'));
final _sdkNavigationSpatialaudiocuepanningReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpatialAudioCuePanning_release_handle'));



class SpatialAudioCuePanning$Impl extends __lib.NativeBase implements SpatialAudioCuePanning {

  SpatialAudioCuePanning$Impl(Pointer<Void> handle) : super(handle);

  @override
  void startAngularPanning(CustomPanningData? nextCustomPanningData, SpatialAudioCuePanningspatialAzimuthStarted azimuthCallback) {
    final _startAngularPanningFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_navigation_SpatialAudioCuePanning_startAngularPanning__CustomPanningData__SpatialAzimuthCallback'));
    final _nextCustomPanningDataHandle = sdkNavigationCustompanningdataToFfiNullable(nextCustomPanningData);
    final _azimuthCallbackHandle = sdkNavigationSpatialaudiocuepanningSpatialazimuthcallbackToFfi(azimuthCallback);
    final _handle = this.handle;
    _startAngularPanningFfi(_handle, __lib.LibraryContext.isolateId, _nextCustomPanningDataHandle, _azimuthCallbackHandle);
    sdkNavigationCustompanningdataReleaseFfiHandleNullable(_nextCustomPanningDataHandle);
    sdkNavigationSpatialaudiocuepanningSpatialazimuthcallbackReleaseFfiHandle(_azimuthCallbackHandle);

  }


}

Pointer<Void> sdkNavigationSpatialaudiocuepanningToFfi(SpatialAudioCuePanning value) =>
  _sdkNavigationSpatialaudiocuepanningCopyHandle((value as __lib.NativeBase).handle);

SpatialAudioCuePanning sdkNavigationSpatialaudiocuepanningFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is SpatialAudioCuePanning) return instance;

  final _copiedHandle = _sdkNavigationSpatialaudiocuepanningCopyHandle(handle);
  final result = SpatialAudioCuePanning$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkNavigationSpatialaudiocuepanningRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkNavigationSpatialaudiocuepanningReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkNavigationSpatialaudiocuepanningReleaseHandle(handle);

Pointer<Void> sdkNavigationSpatialaudiocuepanningToFfiNullable(SpatialAudioCuePanning? value) =>
  value != null ? sdkNavigationSpatialaudiocuepanningToFfi(value) : Pointer<Void>.fromAddress(0);

SpatialAudioCuePanning? sdkNavigationSpatialaudiocuepanningFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkNavigationSpatialaudiocuepanningFromFfi(handle) : null;

void sdkNavigationSpatialaudiocuepanningReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationSpatialaudiocuepanningReleaseHandle(handle);

// End of SpatialAudioCuePanning "private" section.


