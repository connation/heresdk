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

/// Indicates a user's progress along a [Section].

class SectionProgress {
  /// The distance in meters from current location until the end of the [Section].
  /// Note that the value is accumulated per section, and that the last section contains the overall
  /// distance to the destination.
  /// Defaults to 0.
  int remainingDistanceInMeters;

  /// The estimated time in seconds from current location until the end of the [Section]
  /// is reached, including traffic delays if available.
  /// Note that the value is accumulated per section, and that the last section contains the overall
  /// duration until the destination is reached.
  /// Defaults to 0 seconds.
  Duration remainingDuration;

  /// The estimated traffic delay in seconds from current location until the end of the
  /// [Section] is reached.
  /// Note that the value is accumulated per section, and that the last section contains the overall
  /// traffic delay until the destination is reached. The delay might be a negative value:
  /// Negative values indicate that the part of this section can be traversed faster than usual.
  /// Note that this is based on a delay value received at the moment of route calculation.
  /// Defaults to 0 seconds.
  Duration trafficDelay;

  /// Creates a new instance.

  /// [remainingDistanceInMeters] The distance in meters from current location until the end of the [Section].
  /// Note that the value is accumulated per section, and that the last section contains the overall
  /// distance to the destination.
  /// Defaults to 0.

  /// [remainingDuration] The estimated time in seconds from current location until the end of the [Section]
  /// is reached, including traffic delays if available.
  /// Note that the value is accumulated per section, and that the last section contains the overall
  /// duration until the destination is reached.
  /// Defaults to 0 seconds.

  /// [trafficDelay] The estimated traffic delay in seconds from current location until the end of the
  /// [Section] is reached.
  /// Note that the value is accumulated per section, and that the last section contains the overall
  /// traffic delay until the destination is reached. The delay might be a negative value:
  /// Negative values indicate that the part of this section can be traversed faster than usual.
  /// Note that this is based on a delay value received at the moment of route calculation.
  /// Defaults to 0 seconds.

  SectionProgress._(this.remainingDistanceInMeters, this.remainingDuration, this.trafficDelay);
  SectionProgress()
    : remainingDistanceInMeters = 0, remainingDuration = const Duration(seconds: 0), trafficDelay = const Duration(seconds: 0);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SectionProgress) return false;
    SectionProgress _other = other;
    return remainingDistanceInMeters == _other.remainingDistanceInMeters &&
        remainingDuration == _other.remainingDuration &&
        trafficDelay == _other.trafficDelay;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + remainingDistanceInMeters.hashCode;
    result = 31 * result + remainingDuration.hashCode;
    result = 31 * result + trafficDelay.hashCode;
    return result;
  }
}


// SectionProgress "private" section, not exported.

final _sdkNavigationSectionprogressCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int32, Uint64, Uint64),
    Pointer<Void> Function(int, int, int)
  >('here_sdk_sdk_navigation_SectionProgress_create_handle'));
final _sdkNavigationSectionprogressReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SectionProgress_release_handle'));
final _sdkNavigationSectionprogressGetFieldremainingDistanceInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SectionProgress_get_field_remainingDistanceInMeters'));
final _sdkNavigationSectionprogressGetFieldremainingDuration = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SectionProgress_get_field_remainingDuration'));
final _sdkNavigationSectionprogressGetFieldtrafficDelay = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SectionProgress_get_field_trafficDelay'));



Pointer<Void> sdkNavigationSectionprogressToFfi(SectionProgress value) {
  final _remainingDistanceInMetersHandle = (value.remainingDistanceInMeters);
  final _remainingDurationHandle = durationToFfi(value.remainingDuration);
  final _trafficDelayHandle = durationToFfi(value.trafficDelay);
  final _result = _sdkNavigationSectionprogressCreateHandle(_remainingDistanceInMetersHandle, _remainingDurationHandle, _trafficDelayHandle);
  
  durationReleaseFfiHandle(_remainingDurationHandle);
  durationReleaseFfiHandle(_trafficDelayHandle);
  return _result;
}

SectionProgress sdkNavigationSectionprogressFromFfi(Pointer<Void> handle) {
  final _remainingDistanceInMetersHandle = _sdkNavigationSectionprogressGetFieldremainingDistanceInMeters(handle);
  final _remainingDurationHandle = _sdkNavigationSectionprogressGetFieldremainingDuration(handle);
  final _trafficDelayHandle = _sdkNavigationSectionprogressGetFieldtrafficDelay(handle);
  try {
    return SectionProgress._(
      (_remainingDistanceInMetersHandle), 
      durationFromFfi(_remainingDurationHandle), 
      durationFromFfi(_trafficDelayHandle)
    );
  } finally {
    
    durationReleaseFfiHandle(_remainingDurationHandle);
    durationReleaseFfiHandle(_trafficDelayHandle);
  }
}

void sdkNavigationSectionprogressReleaseFfiHandle(Pointer<Void> handle) => _sdkNavigationSectionprogressReleaseHandle(handle);

// Nullable SectionProgress

final _sdkNavigationSectionprogressCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SectionProgress_create_handle_nullable'));
final _sdkNavigationSectionprogressReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SectionProgress_release_handle_nullable'));
final _sdkNavigationSectionprogressGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SectionProgress_get_value_nullable'));

Pointer<Void> sdkNavigationSectionprogressToFfiNullable(SectionProgress? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationSectionprogressToFfi(value);
  final result = _sdkNavigationSectionprogressCreateHandleNullable(_handle);
  sdkNavigationSectionprogressReleaseFfiHandle(_handle);
  return result;
}

SectionProgress? sdkNavigationSectionprogressFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationSectionprogressGetValueNullable(handle);
  final result = sdkNavigationSectionprogressFromFfi(_handle);
  sdkNavigationSectionprogressReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationSectionprogressReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationSectionprogressReleaseHandleNullable(handle);

// End of SectionProgress "private" section.


