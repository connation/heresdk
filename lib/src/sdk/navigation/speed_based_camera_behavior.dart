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
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/anchor2_d.dart';
import 'package:here_sdk/src/sdk/mapview/map_measure.dart';
import 'package:here_sdk/src/sdk/navigation/camera_behavior.dart';
import 'package:meta/meta.dart';

/// Use this class to follow the current location of the user, zooming in and out and changing
/// camera tilt according to the current speed.
///
/// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected
/// behaviors. Related APIs may change for new releases without a deprecation process.
abstract class SpeedBasedCameraBehavior implements CameraBehavior {
  /// Creates a new instance of this class.
  ///
  factory SpeedBasedCameraBehavior() => $prototype.make();

  /// Sets the profile.
  ///
  /// The speed ranges within the profile can overlap in order to prevent oscillations between
  /// adjacent levels.
  /// Provided profile must satisfy following conditions:
  /// - profile must not be empty
  /// - each speed range must be valid (fromMetersPerSecond must be less then toMetersPerSecond)
  /// - ranges must be sorted by fromMetersPerSecond and toMetersPerSecond
  /// - gaps between ranges are not allowed
  ///   Invalid profile will be rejected and error message logged with explanation of violated restriction.
  ///
  /// [profile] The new profile value.
  ///
  void setProfile(List<SpeedBasedCameraBehaviorProfileValue> profile);
  /// Gets the profile.
  ///
  /// The speed ranges within the profile can overlap in order to prevent oscillations between
  /// adjacent levels.
  ///
  /// Returns [List<SpeedBasedCameraBehaviorProfileValue>]. The profile.
  ///
  List<SpeedBasedCameraBehaviorProfileValue> getProfile();

  /// Returns [List<SpeedBasedCameraBehaviorProfileValue>]. the default 3D profile.
  ///
  static List<SpeedBasedCameraBehaviorProfileValue> default3DProfile() => $prototype.default3DProfile();

  /// Returns [List<SpeedBasedCameraBehaviorProfileValue>]. the default 2D profile.
  ///
  static List<SpeedBasedCameraBehaviorProfileValue> default2DProfile() => $prototype.default2DProfile();

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = SpeedBasedCameraBehavior$Impl(Pointer<Void>.fromAddress(0));
}

/// A single profile value which indicates the speed range in which it applies to its zoom and
/// tilt configuration.

class SpeedBasedCameraBehaviorProfileValue {
  /// Start speed of the range.
  double fromMetersPerSecond;

  /// End speed of the range.
  double toMetersPerSecond;

  /// Zoom configuration.
  MapMeasure zoom;

  /// Tilt configuration.
  double tiltInDegrees;

  /// Creates a new instance.

  /// [fromMetersPerSecond] Start speed of the range.

  /// [toMetersPerSecond] End speed of the range.

  /// [zoom] Zoom configuration.

  /// [tiltInDegrees] Tilt configuration.

  SpeedBasedCameraBehaviorProfileValue(this.fromMetersPerSecond, this.toMetersPerSecond, this.zoom, this.tiltInDegrees);
}


// SpeedBasedCameraBehaviorProfileValue "private" section, not exported.

final _sdkNavigationSpeedbasedcamerabehaviorProfilevalueCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double, Double, Pointer<Void>, Double),
    Pointer<Void> Function(double, double, Pointer<Void>, double)
  >('here_sdk_sdk_navigation_SpeedBasedCameraBehavior_ProfileValue_create_handle'));
final _sdkNavigationSpeedbasedcamerabehaviorProfilevalueReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpeedBasedCameraBehavior_ProfileValue_release_handle'));
final _sdkNavigationSpeedbasedcamerabehaviorProfilevalueGetFieldfromMetersPerSecond = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpeedBasedCameraBehavior_ProfileValue_get_field_fromMetersPerSecond'));
final _sdkNavigationSpeedbasedcamerabehaviorProfilevalueGetFieldtoMetersPerSecond = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpeedBasedCameraBehavior_ProfileValue_get_field_toMetersPerSecond'));
final _sdkNavigationSpeedbasedcamerabehaviorProfilevalueGetFieldzoom = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpeedBasedCameraBehavior_ProfileValue_get_field_zoom'));
final _sdkNavigationSpeedbasedcamerabehaviorProfilevalueGetFieldtiltInDegrees = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpeedBasedCameraBehavior_ProfileValue_get_field_tiltInDegrees'));



Pointer<Void> sdkNavigationSpeedbasedcamerabehaviorProfilevalueToFfi(SpeedBasedCameraBehaviorProfileValue value) {
  final _fromMetersPerSecondHandle = (value.fromMetersPerSecond);
  final _toMetersPerSecondHandle = (value.toMetersPerSecond);
  final _zoomHandle = sdkMapviewMapmeasureToFfi(value.zoom);
  final _tiltInDegreesHandle = (value.tiltInDegrees);
  final _result = _sdkNavigationSpeedbasedcamerabehaviorProfilevalueCreateHandle(_fromMetersPerSecondHandle, _toMetersPerSecondHandle, _zoomHandle, _tiltInDegreesHandle);
  
  
  sdkMapviewMapmeasureReleaseFfiHandle(_zoomHandle);
  
  return _result;
}

SpeedBasedCameraBehaviorProfileValue sdkNavigationSpeedbasedcamerabehaviorProfilevalueFromFfi(Pointer<Void> handle) {
  final _fromMetersPerSecondHandle = _sdkNavigationSpeedbasedcamerabehaviorProfilevalueGetFieldfromMetersPerSecond(handle);
  final _toMetersPerSecondHandle = _sdkNavigationSpeedbasedcamerabehaviorProfilevalueGetFieldtoMetersPerSecond(handle);
  final _zoomHandle = _sdkNavigationSpeedbasedcamerabehaviorProfilevalueGetFieldzoom(handle);
  final _tiltInDegreesHandle = _sdkNavigationSpeedbasedcamerabehaviorProfilevalueGetFieldtiltInDegrees(handle);
  try {
    return SpeedBasedCameraBehaviorProfileValue(
      (_fromMetersPerSecondHandle), 
      (_toMetersPerSecondHandle), 
      sdkMapviewMapmeasureFromFfi(_zoomHandle), 
      (_tiltInDegreesHandle)
    );
  } finally {
    
    
    sdkMapviewMapmeasureReleaseFfiHandle(_zoomHandle);
    
  }
}

void sdkNavigationSpeedbasedcamerabehaviorProfilevalueReleaseFfiHandle(Pointer<Void> handle) => _sdkNavigationSpeedbasedcamerabehaviorProfilevalueReleaseHandle(handle);

// Nullable SpeedBasedCameraBehaviorProfileValue

final _sdkNavigationSpeedbasedcamerabehaviorProfilevalueCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpeedBasedCameraBehavior_ProfileValue_create_handle_nullable'));
final _sdkNavigationSpeedbasedcamerabehaviorProfilevalueReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpeedBasedCameraBehavior_ProfileValue_release_handle_nullable'));
final _sdkNavigationSpeedbasedcamerabehaviorProfilevalueGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpeedBasedCameraBehavior_ProfileValue_get_value_nullable'));

Pointer<Void> sdkNavigationSpeedbasedcamerabehaviorProfilevalueToFfiNullable(SpeedBasedCameraBehaviorProfileValue? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationSpeedbasedcamerabehaviorProfilevalueToFfi(value);
  final result = _sdkNavigationSpeedbasedcamerabehaviorProfilevalueCreateHandleNullable(_handle);
  sdkNavigationSpeedbasedcamerabehaviorProfilevalueReleaseFfiHandle(_handle);
  return result;
}

SpeedBasedCameraBehaviorProfileValue? sdkNavigationSpeedbasedcamerabehaviorProfilevalueFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationSpeedbasedcamerabehaviorProfilevalueGetValueNullable(handle);
  final result = sdkNavigationSpeedbasedcamerabehaviorProfilevalueFromFfi(_handle);
  sdkNavigationSpeedbasedcamerabehaviorProfilevalueReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationSpeedbasedcamerabehaviorProfilevalueReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationSpeedbasedcamerabehaviorProfilevalueReleaseHandleNullable(handle);

// End of SpeedBasedCameraBehaviorProfileValue "private" section.

// SpeedBasedCameraBehavior "private" section, not exported.

final _sdkNavigationSpeedbasedcamerabehaviorRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_navigation_SpeedBasedCameraBehavior_register_finalizer'));
final _sdkNavigationSpeedbasedcamerabehaviorCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpeedBasedCameraBehavior_copy_handle'));
final _sdkNavigationSpeedbasedcamerabehaviorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpeedBasedCameraBehavior_release_handle'));
final _sdkNavigationSpeedbasedcamerabehaviorGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpeedBasedCameraBehavior_get_type_id'));







/// @nodoc
@visibleForTesting
class SpeedBasedCameraBehavior$Impl extends __lib.NativeBase implements SpeedBasedCameraBehavior {

  SpeedBasedCameraBehavior$Impl(Pointer<Void> handle) : super(handle);


  SpeedBasedCameraBehavior make() {
    final _result_handle = _make();
    final _result = SpeedBasedCameraBehavior$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkNavigationSpeedbasedcamerabehaviorRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _make() {
    final _makeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('here_sdk_sdk_navigation_SpeedBasedCameraBehavior_make'));
    final __resultHandle = _makeFfi(__lib.LibraryContext.isolateId);
    return __resultHandle;
  }

  @override
  void setProfile(List<SpeedBasedCameraBehaviorProfileValue> profile) {
    final _setProfileFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_SpeedBasedCameraBehavior_setProfile__ListOf_sdk_navigation_SpeedBasedCameraBehavior_ProfileValue'));
    final _profileHandle = heresdkVisualNavigationBindingslistofSdkNavigationSpeedbasedcamerabehaviorProfilevalueToFfi(profile);
    final _handle = this.handle;
    _setProfileFfi(_handle, __lib.LibraryContext.isolateId, _profileHandle);
    heresdkVisualNavigationBindingslistofSdkNavigationSpeedbasedcamerabehaviorProfilevalueReleaseFfiHandle(_profileHandle);

  }

  @override
  List<SpeedBasedCameraBehaviorProfileValue> getProfile() {
    final _getProfileFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_SpeedBasedCameraBehavior_getProfile'));
    final _handle = this.handle;
    final __resultHandle = _getProfileFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return heresdkVisualNavigationBindingslistofSdkNavigationSpeedbasedcamerabehaviorProfilevalueFromFfi(__resultHandle);
    } finally {
      heresdkVisualNavigationBindingslistofSdkNavigationSpeedbasedcamerabehaviorProfilevalueReleaseFfiHandle(__resultHandle);

    }

  }

  List<SpeedBasedCameraBehaviorProfileValue> default3DProfile() {
    final _default3DProfileFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('here_sdk_sdk_navigation_SpeedBasedCameraBehavior_default3DProfile'));
    final __resultHandle = _default3DProfileFfi(__lib.LibraryContext.isolateId);
    try {
      return heresdkVisualNavigationBindingslistofSdkNavigationSpeedbasedcamerabehaviorProfilevalueFromFfi(__resultHandle);
    } finally {
      heresdkVisualNavigationBindingslistofSdkNavigationSpeedbasedcamerabehaviorProfilevalueReleaseFfiHandle(__resultHandle);

    }

  }

  List<SpeedBasedCameraBehaviorProfileValue> default2DProfile() {
    final _default2DProfileFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('here_sdk_sdk_navigation_SpeedBasedCameraBehavior_default2DProfile'));
    final __resultHandle = _default2DProfileFfi(__lib.LibraryContext.isolateId);
    try {
      return heresdkVisualNavigationBindingslistofSdkNavigationSpeedbasedcamerabehaviorProfilevalueFromFfi(__resultHandle);
    } finally {
      heresdkVisualNavigationBindingslistofSdkNavigationSpeedbasedcamerabehaviorProfilevalueReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  Anchor2D get normalizedPrincipalPoint {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_SpeedBasedCameraBehavior_normalizedPrincipalPoint_get'));
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
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_SpeedBasedCameraBehavior_normalizedPrincipalPoint_set'));
    final _valueHandle = sdkCoreAnchor2dToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkCoreAnchor2dReleaseFfiHandle(_valueHandle);

  }



}

Pointer<Void> sdkNavigationSpeedbasedcamerabehaviorToFfi(SpeedBasedCameraBehavior value) =>
  _sdkNavigationSpeedbasedcamerabehaviorCopyHandle((value as __lib.NativeBase).handle);

SpeedBasedCameraBehavior sdkNavigationSpeedbasedcamerabehaviorFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is SpeedBasedCameraBehavior) return instance;

  final _typeIdHandle = _sdkNavigationSpeedbasedcamerabehaviorGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkNavigationSpeedbasedcamerabehaviorCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : SpeedBasedCameraBehavior$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkNavigationSpeedbasedcamerabehaviorRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkNavigationSpeedbasedcamerabehaviorReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkNavigationSpeedbasedcamerabehaviorReleaseHandle(handle);

Pointer<Void> sdkNavigationSpeedbasedcamerabehaviorToFfiNullable(SpeedBasedCameraBehavior? value) =>
  value != null ? sdkNavigationSpeedbasedcamerabehaviorToFfi(value) : Pointer<Void>.fromAddress(0);

SpeedBasedCameraBehavior? sdkNavigationSpeedbasedcamerabehaviorFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkNavigationSpeedbasedcamerabehaviorFromFfi(handle) : null;

void sdkNavigationSpeedbasedcamerabehaviorReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationSpeedbasedcamerabehaviorReleaseHandle(handle);

// End of SpeedBasedCameraBehavior "private" section.


