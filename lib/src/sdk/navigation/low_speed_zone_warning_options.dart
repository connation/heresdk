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

/// Low speed zone warning options.
///
/// Set the options to [NavigatorInterface.lowSpeedZoneWarningOptions]
/// in order to enable them.

class LowSpeedZoneWarningOptions {
  /// Warning distance setting for highways, in meters. Defaults to 1500 meters.
  int highwayWarningDistanceInMeters;

  /// Warning distance setting for rural, in meters. Defaults to 750 meters.
  int ruralWarningDistanceInMeters;

  /// Warning distance setting for urban, in meters. Defaults to 500 meters.
  int urbanWarningDistanceInMeters;

  /// Creates a new instance.

  /// [highwayWarningDistanceInMeters] Warning distance setting for highways, in meters. Defaults to 1500 meters.

  /// [ruralWarningDistanceInMeters] Warning distance setting for rural, in meters. Defaults to 750 meters.

  /// [urbanWarningDistanceInMeters] Warning distance setting for urban, in meters. Defaults to 500 meters.

  LowSpeedZoneWarningOptions._(this.highwayWarningDistanceInMeters, this.ruralWarningDistanceInMeters, this.urbanWarningDistanceInMeters);
  LowSpeedZoneWarningOptions()
    : highwayWarningDistanceInMeters = 1500, ruralWarningDistanceInMeters = 750, urbanWarningDistanceInMeters = 500;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! LowSpeedZoneWarningOptions) return false;
    LowSpeedZoneWarningOptions _other = other;
    return highwayWarningDistanceInMeters == _other.highwayWarningDistanceInMeters &&
        ruralWarningDistanceInMeters == _other.ruralWarningDistanceInMeters &&
        urbanWarningDistanceInMeters == _other.urbanWarningDistanceInMeters;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + highwayWarningDistanceInMeters.hashCode;
    result = 31 * result + ruralWarningDistanceInMeters.hashCode;
    result = 31 * result + urbanWarningDistanceInMeters.hashCode;
    return result;
  }
}


// LowSpeedZoneWarningOptions "private" section, not exported.

final _sdkNavigationLowspeedzonewarningoptionsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int32, Int32, Int32),
    Pointer<Void> Function(int, int, int)
  >('here_sdk_sdk_navigation_LowSpeedZoneWarningOptions_create_handle'));
final _sdkNavigationLowspeedzonewarningoptionsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LowSpeedZoneWarningOptions_release_handle'));
final _sdkNavigationLowspeedzonewarningoptionsGetFieldhighwayWarningDistanceInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LowSpeedZoneWarningOptions_get_field_highwayWarningDistanceInMeters'));
final _sdkNavigationLowspeedzonewarningoptionsGetFieldruralWarningDistanceInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LowSpeedZoneWarningOptions_get_field_ruralWarningDistanceInMeters'));
final _sdkNavigationLowspeedzonewarningoptionsGetFieldurbanWarningDistanceInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LowSpeedZoneWarningOptions_get_field_urbanWarningDistanceInMeters'));



Pointer<Void> sdkNavigationLowspeedzonewarningoptionsToFfi(LowSpeedZoneWarningOptions value) {
  final _highwayWarningDistanceInMetersHandle = (value.highwayWarningDistanceInMeters);
  final _ruralWarningDistanceInMetersHandle = (value.ruralWarningDistanceInMeters);
  final _urbanWarningDistanceInMetersHandle = (value.urbanWarningDistanceInMeters);
  final _result = _sdkNavigationLowspeedzonewarningoptionsCreateHandle(_highwayWarningDistanceInMetersHandle, _ruralWarningDistanceInMetersHandle, _urbanWarningDistanceInMetersHandle);
  
  
  
  return _result;
}

LowSpeedZoneWarningOptions sdkNavigationLowspeedzonewarningoptionsFromFfi(Pointer<Void> handle) {
  final _highwayWarningDistanceInMetersHandle = _sdkNavigationLowspeedzonewarningoptionsGetFieldhighwayWarningDistanceInMeters(handle);
  final _ruralWarningDistanceInMetersHandle = _sdkNavigationLowspeedzonewarningoptionsGetFieldruralWarningDistanceInMeters(handle);
  final _urbanWarningDistanceInMetersHandle = _sdkNavigationLowspeedzonewarningoptionsGetFieldurbanWarningDistanceInMeters(handle);
  try {
    return LowSpeedZoneWarningOptions._(
      (_highwayWarningDistanceInMetersHandle), 
      (_ruralWarningDistanceInMetersHandle), 
      (_urbanWarningDistanceInMetersHandle)
    );
  } finally {
    
    
    
  }
}

void sdkNavigationLowspeedzonewarningoptionsReleaseFfiHandle(Pointer<Void> handle) => _sdkNavigationLowspeedzonewarningoptionsReleaseHandle(handle);

// Nullable LowSpeedZoneWarningOptions

final _sdkNavigationLowspeedzonewarningoptionsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LowSpeedZoneWarningOptions_create_handle_nullable'));
final _sdkNavigationLowspeedzonewarningoptionsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LowSpeedZoneWarningOptions_release_handle_nullable'));
final _sdkNavigationLowspeedzonewarningoptionsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LowSpeedZoneWarningOptions_get_value_nullable'));

Pointer<Void> sdkNavigationLowspeedzonewarningoptionsToFfiNullable(LowSpeedZoneWarningOptions? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationLowspeedzonewarningoptionsToFfi(value);
  final result = _sdkNavigationLowspeedzonewarningoptionsCreateHandleNullable(_handle);
  sdkNavigationLowspeedzonewarningoptionsReleaseFfiHandle(_handle);
  return result;
}

LowSpeedZoneWarningOptions? sdkNavigationLowspeedzonewarningoptionsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationLowspeedzonewarningoptionsGetValueNullable(handle);
  final result = sdkNavigationLowspeedzonewarningoptionsFromFfi(_handle);
  sdkNavigationLowspeedzonewarningoptionsReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationLowspeedzonewarningoptionsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationLowspeedzonewarningoptionsReleaseHandleNullable(handle);

// End of LowSpeedZoneWarningOptions "private" section.


