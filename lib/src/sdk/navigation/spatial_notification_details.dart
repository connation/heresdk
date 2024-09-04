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
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/navigation/spatial_audio_cue_panning.dart';

/// This class provides all the information for a spatial text notification, including the
/// maneuver data and extra data which is required to set the direction of spatialization
/// of the audio cue.

class SpatialNotificationDetails {
  /// Initial desired angular position of the upcoming audio cue. For example, for a maneuver such as
  /// "Turn right on" (`ManeuverAction.RightTurn`) we want to create a spatial audio arc trajectory
  /// from the front to the right, mimicking the maneuver geometry.
  /// In this case, it is good practice to start the trajectory from an initial azimuth that is located
  /// slightly on the opposite direction of the maneuver (e.g. slightly starting from "front-left")
  /// and terminate the trajectory fully on the right side. The initial azimuth angle of such
  /// a trajectory would be, for example, -5.0 (slightly front-left).
  /// This azimuth value is needed to set the position of the audio renderer before starting to play
  /// the audio cue to avoid unwanted audio "jumps".
  /// The orientation in space for [SpatialNotificationDetails.initialAzimuthInDegrees] can be represented by the
  /// following angular values:
  ///
  /// |  Front |  Right | Rear  | Left  |
  /// |:----:|:----:|:----:|:----:|
  /// |  0° | +90° | +- 180 | -90° |
  double initialAzimuthInDegrees;

  /// Object to start the angular panning when spatialization of the text notification is desired
  SpatialAudioCuePanning audioCuePanning;

  /// Estimation of the required time to play an audio cue at speech rate 1.0.
  /// For example the cue "Turn right on Name-Of-A-Street" will playback over an X number of milliseconds.
  /// Therefore, an estimation of this audio cue duration is needed to correctly sync the movement
  /// of sound to the cue (so that audio movement and audio duration match).
  Duration estimatedAudioCueDuration;

  /// Creates a new instance.

  /// [initialAzimuthInDegrees] Initial desired angular position of the upcoming audio cue. For example, for a maneuver such as
  /// "Turn right on" (`ManeuverAction.RightTurn`) we want to create a spatial audio arc trajectory
  /// from the front to the right, mimicking the maneuver geometry.
  /// In this case, it is good practice to start the trajectory from an initial azimuth that is located
  /// slightly on the opposite direction of the maneuver (e.g. slightly starting from "front-left")
  /// and terminate the trajectory fully on the right side. The initial azimuth angle of such
  /// a trajectory would be, for example, -5.0 (slightly front-left).
  /// This azimuth value is needed to set the position of the audio renderer before starting to play
  /// the audio cue to avoid unwanted audio "jumps".
  /// The orientation in space for [SpatialNotificationDetails.initialAzimuthInDegrees] can be represented by the
  /// following angular values:
  ///
  /// |  Front |  Right | Rear  | Left  |
  /// |:----:|:----:|:----:|:----:|
  /// |  0° | +90° | +- 180 | -90° |

  /// [audioCuePanning] Object to start the angular panning when spatialization of the text notification is desired

  /// [estimatedAudioCueDuration] Estimation of the required time to play an audio cue at speech rate 1.0.
  /// For example the cue "Turn right on Name-Of-A-Street" will playback over an X number of milliseconds.
  /// Therefore, an estimation of this audio cue duration is needed to correctly sync the movement
  /// of sound to the cue (so that audio movement and audio duration match).

  SpatialNotificationDetails(this.initialAzimuthInDegrees, this.audioCuePanning, this.estimatedAudioCueDuration);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SpatialNotificationDetails) return false;
    SpatialNotificationDetails _other = other;
    return initialAzimuthInDegrees == _other.initialAzimuthInDegrees &&
        audioCuePanning == _other.audioCuePanning &&
        estimatedAudioCueDuration == _other.estimatedAudioCueDuration;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + initialAzimuthInDegrees.hashCode;
    result = 31 * result + audioCuePanning.hashCode;
    result = 31 * result + estimatedAudioCueDuration.hashCode;
    return result;
  }
}


// SpatialNotificationDetails "private" section, not exported.

final _sdkNavigationSpatialnotificationdetailsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double, Pointer<Void>, Uint64),
    Pointer<Void> Function(double, Pointer<Void>, int)
  >('here_sdk_sdk_navigation_SpatialNotificationDetails_create_handle'));
final _sdkNavigationSpatialnotificationdetailsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpatialNotificationDetails_release_handle'));
final _sdkNavigationSpatialnotificationdetailsGetFieldinitialAzimuthInDegrees = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpatialNotificationDetails_get_field_initialAzimuthInDegrees'));
final _sdkNavigationSpatialnotificationdetailsGetFieldaudioCuePanning = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpatialNotificationDetails_get_field_audioCuePanning'));
final _sdkNavigationSpatialnotificationdetailsGetFieldestimatedAudioCueDuration = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpatialNotificationDetails_get_field_estimatedAudioCueDuration'));



Pointer<Void> sdkNavigationSpatialnotificationdetailsToFfi(SpatialNotificationDetails value) {
  final _initialAzimuthInDegreesHandle = (value.initialAzimuthInDegrees);
  final _audioCuePanningHandle = sdkNavigationSpatialaudiocuepanningToFfi(value.audioCuePanning);
  final _estimatedAudioCueDurationHandle = durationToFfi(value.estimatedAudioCueDuration);
  final _result = _sdkNavigationSpatialnotificationdetailsCreateHandle(_initialAzimuthInDegreesHandle, _audioCuePanningHandle, _estimatedAudioCueDurationHandle);
  
  sdkNavigationSpatialaudiocuepanningReleaseFfiHandle(_audioCuePanningHandle);
  durationReleaseFfiHandle(_estimatedAudioCueDurationHandle);
  return _result;
}

SpatialNotificationDetails sdkNavigationSpatialnotificationdetailsFromFfi(Pointer<Void> handle) {
  final _initialAzimuthInDegreesHandle = _sdkNavigationSpatialnotificationdetailsGetFieldinitialAzimuthInDegrees(handle);
  final _audioCuePanningHandle = _sdkNavigationSpatialnotificationdetailsGetFieldaudioCuePanning(handle);
  final _estimatedAudioCueDurationHandle = _sdkNavigationSpatialnotificationdetailsGetFieldestimatedAudioCueDuration(handle);
  try {
    return SpatialNotificationDetails(
      (_initialAzimuthInDegreesHandle), 
      sdkNavigationSpatialaudiocuepanningFromFfi(_audioCuePanningHandle), 
      durationFromFfi(_estimatedAudioCueDurationHandle)
    );
  } finally {
    
    sdkNavigationSpatialaudiocuepanningReleaseFfiHandle(_audioCuePanningHandle);
    durationReleaseFfiHandle(_estimatedAudioCueDurationHandle);
  }
}

void sdkNavigationSpatialnotificationdetailsReleaseFfiHandle(Pointer<Void> handle) => _sdkNavigationSpatialnotificationdetailsReleaseHandle(handle);

// Nullable SpatialNotificationDetails

final _sdkNavigationSpatialnotificationdetailsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpatialNotificationDetails_create_handle_nullable'));
final _sdkNavigationSpatialnotificationdetailsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpatialNotificationDetails_release_handle_nullable'));
final _sdkNavigationSpatialnotificationdetailsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpatialNotificationDetails_get_value_nullable'));

Pointer<Void> sdkNavigationSpatialnotificationdetailsToFfiNullable(SpatialNotificationDetails? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationSpatialnotificationdetailsToFfi(value);
  final result = _sdkNavigationSpatialnotificationdetailsCreateHandleNullable(_handle);
  sdkNavigationSpatialnotificationdetailsReleaseFfiHandle(_handle);
  return result;
}

SpatialNotificationDetails? sdkNavigationSpatialnotificationdetailsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationSpatialnotificationdetailsGetValueNullable(handle);
  final result = sdkNavigationSpatialnotificationdetailsFromFfi(_handle);
  sdkNavigationSpatialnotificationdetailsReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationSpatialnotificationdetailsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationSpatialnotificationdetailsReleaseHandleNullable(handle);

// End of SpatialNotificationDetails "private" section.


