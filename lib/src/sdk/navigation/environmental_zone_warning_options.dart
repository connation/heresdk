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

/// Environmental zone warning options.
///
/// Set the options to [NavigatorInterface.environmentalZoneWarningOptions]
/// for filtering of environmental zone notifications.

class EnvironmentalZoneWarningOptions {
  /// Distance setting for highways, in meters. Defaults to 1500 meters.
  /// **Note:** The road type (highway, rural or urban) is given by the speed limit on that particular road at the specified
  /// position and not by the actual road classification. Details about which speed limits are associated to which road type
  /// can be found in [DistanceType].
  int highwayWarningDistanceInMeters;

  /// Distance setting for rural roads, in meters. Defaults to 750 meters.
  /// **Note:** The road type (highway, rural or urban) is given by the speed limit on that particular road at the specified
  /// position and not by the actual road classification. Details about which speed limits are associated to which road type
  /// can be found in [DistanceType].
  int ruralWarningDistanceInMeters;

  /// Distance setting for urban roads, in meters. Defaults to 500 meters.
  /// **Note:** The road type (highway, rural or urban) is given by the speed limit on that particular road at the specified
  /// position and not by the actual road classification. Details about which speed limits are associated to which road type
  /// can be found in [DistanceType].
  int urbanWarningDistanceInMeters;

  /// Creates a new instance.

  /// [highwayWarningDistanceInMeters] Distance setting for highways, in meters. Defaults to 1500 meters.
  /// **Note:** The road type (highway, rural or urban) is given by the speed limit on that particular road at the specified
  /// position and not by the actual road classification. Details about which speed limits are associated to which road type
  /// can be found in [DistanceType].

  /// [ruralWarningDistanceInMeters] Distance setting for rural roads, in meters. Defaults to 750 meters.
  /// **Note:** The road type (highway, rural or urban) is given by the speed limit on that particular road at the specified
  /// position and not by the actual road classification. Details about which speed limits are associated to which road type
  /// can be found in [DistanceType].

  /// [urbanWarningDistanceInMeters] Distance setting for urban roads, in meters. Defaults to 500 meters.
  /// **Note:** The road type (highway, rural or urban) is given by the speed limit on that particular road at the specified
  /// position and not by the actual road classification. Details about which speed limits are associated to which road type
  /// can be found in [DistanceType].

  EnvironmentalZoneWarningOptions._(this.highwayWarningDistanceInMeters, this.ruralWarningDistanceInMeters, this.urbanWarningDistanceInMeters);
  EnvironmentalZoneWarningOptions()
    : highwayWarningDistanceInMeters = 1500, ruralWarningDistanceInMeters = 750, urbanWarningDistanceInMeters = 500;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! EnvironmentalZoneWarningOptions) return false;
    EnvironmentalZoneWarningOptions _other = other;
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


// EnvironmentalZoneWarningOptions "private" section, not exported.

final _sdkNavigationEnvironmentalzonewarningoptionsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int32, Int32, Int32),
    Pointer<Void> Function(int, int, int)
  >('here_sdk_sdk_navigation_EnvironmentalZoneWarningOptions_create_handle'));
final _sdkNavigationEnvironmentalzonewarningoptionsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_EnvironmentalZoneWarningOptions_release_handle'));
final _sdkNavigationEnvironmentalzonewarningoptionsGetFieldhighwayWarningDistanceInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_EnvironmentalZoneWarningOptions_get_field_highwayWarningDistanceInMeters'));
final _sdkNavigationEnvironmentalzonewarningoptionsGetFieldruralWarningDistanceInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_EnvironmentalZoneWarningOptions_get_field_ruralWarningDistanceInMeters'));
final _sdkNavigationEnvironmentalzonewarningoptionsGetFieldurbanWarningDistanceInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_EnvironmentalZoneWarningOptions_get_field_urbanWarningDistanceInMeters'));



Pointer<Void> sdkNavigationEnvironmentalzonewarningoptionsToFfi(EnvironmentalZoneWarningOptions value) {
  final _highwayWarningDistanceInMetersHandle = (value.highwayWarningDistanceInMeters);
  final _ruralWarningDistanceInMetersHandle = (value.ruralWarningDistanceInMeters);
  final _urbanWarningDistanceInMetersHandle = (value.urbanWarningDistanceInMeters);
  final _result = _sdkNavigationEnvironmentalzonewarningoptionsCreateHandle(_highwayWarningDistanceInMetersHandle, _ruralWarningDistanceInMetersHandle, _urbanWarningDistanceInMetersHandle);
  
  
  
  return _result;
}

EnvironmentalZoneWarningOptions sdkNavigationEnvironmentalzonewarningoptionsFromFfi(Pointer<Void> handle) {
  final _highwayWarningDistanceInMetersHandle = _sdkNavigationEnvironmentalzonewarningoptionsGetFieldhighwayWarningDistanceInMeters(handle);
  final _ruralWarningDistanceInMetersHandle = _sdkNavigationEnvironmentalzonewarningoptionsGetFieldruralWarningDistanceInMeters(handle);
  final _urbanWarningDistanceInMetersHandle = _sdkNavigationEnvironmentalzonewarningoptionsGetFieldurbanWarningDistanceInMeters(handle);
  try {
    return EnvironmentalZoneWarningOptions._(
      (_highwayWarningDistanceInMetersHandle), 
      (_ruralWarningDistanceInMetersHandle), 
      (_urbanWarningDistanceInMetersHandle)
    );
  } finally {
    
    
    
  }
}

void sdkNavigationEnvironmentalzonewarningoptionsReleaseFfiHandle(Pointer<Void> handle) => _sdkNavigationEnvironmentalzonewarningoptionsReleaseHandle(handle);

// Nullable EnvironmentalZoneWarningOptions

final _sdkNavigationEnvironmentalzonewarningoptionsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_EnvironmentalZoneWarningOptions_create_handle_nullable'));
final _sdkNavigationEnvironmentalzonewarningoptionsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_EnvironmentalZoneWarningOptions_release_handle_nullable'));
final _sdkNavigationEnvironmentalzonewarningoptionsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_EnvironmentalZoneWarningOptions_get_value_nullable'));

Pointer<Void> sdkNavigationEnvironmentalzonewarningoptionsToFfiNullable(EnvironmentalZoneWarningOptions? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationEnvironmentalzonewarningoptionsToFfi(value);
  final result = _sdkNavigationEnvironmentalzonewarningoptionsCreateHandleNullable(_handle);
  sdkNavigationEnvironmentalzonewarningoptionsReleaseFfiHandle(_handle);
  return result;
}

EnvironmentalZoneWarningOptions? sdkNavigationEnvironmentalzonewarningoptionsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationEnvironmentalzonewarningoptionsGetValueNullable(handle);
  final result = sdkNavigationEnvironmentalzonewarningoptionsFromFfi(_handle);
  sdkNavigationEnvironmentalzonewarningoptionsReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationEnvironmentalzonewarningoptionsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationEnvironmentalzonewarningoptionsReleaseHandleNullable(handle);

// End of EnvironmentalZoneWarningOptions "private" section.


