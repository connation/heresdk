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

/// Danger zone warning options.
///
/// Set the options to [NavigatorInterface.dangerZoneWarningOptions]
/// for filtering of danger zone notifications.

class DangerZoneWarningOptions {
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

  DangerZoneWarningOptions._(this.highwayWarningDistanceInMeters, this.ruralWarningDistanceInMeters, this.urbanWarningDistanceInMeters);
  DangerZoneWarningOptions()
    : highwayWarningDistanceInMeters = 1500, ruralWarningDistanceInMeters = 750, urbanWarningDistanceInMeters = 500;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! DangerZoneWarningOptions) return false;
    DangerZoneWarningOptions _other = other;
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


// DangerZoneWarningOptions "private" section, not exported.

final _sdkNavigationDangerzonewarningoptionsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int32, Int32, Int32),
    Pointer<Void> Function(int, int, int)
  >('here_sdk_sdk_navigation_DangerZoneWarningOptions_create_handle'));
final _sdkNavigationDangerzonewarningoptionsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_DangerZoneWarningOptions_release_handle'));
final _sdkNavigationDangerzonewarningoptionsGetFieldhighwayWarningDistanceInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_DangerZoneWarningOptions_get_field_highwayWarningDistanceInMeters'));
final _sdkNavigationDangerzonewarningoptionsGetFieldruralWarningDistanceInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_DangerZoneWarningOptions_get_field_ruralWarningDistanceInMeters'));
final _sdkNavigationDangerzonewarningoptionsGetFieldurbanWarningDistanceInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_DangerZoneWarningOptions_get_field_urbanWarningDistanceInMeters'));



Pointer<Void> sdkNavigationDangerzonewarningoptionsToFfi(DangerZoneWarningOptions value) {
  final _highwayWarningDistanceInMetersHandle = (value.highwayWarningDistanceInMeters);
  final _ruralWarningDistanceInMetersHandle = (value.ruralWarningDistanceInMeters);
  final _urbanWarningDistanceInMetersHandle = (value.urbanWarningDistanceInMeters);
  final _result = _sdkNavigationDangerzonewarningoptionsCreateHandle(_highwayWarningDistanceInMetersHandle, _ruralWarningDistanceInMetersHandle, _urbanWarningDistanceInMetersHandle);
  
  
  
  return _result;
}

DangerZoneWarningOptions sdkNavigationDangerzonewarningoptionsFromFfi(Pointer<Void> handle) {
  final _highwayWarningDistanceInMetersHandle = _sdkNavigationDangerzonewarningoptionsGetFieldhighwayWarningDistanceInMeters(handle);
  final _ruralWarningDistanceInMetersHandle = _sdkNavigationDangerzonewarningoptionsGetFieldruralWarningDistanceInMeters(handle);
  final _urbanWarningDistanceInMetersHandle = _sdkNavigationDangerzonewarningoptionsGetFieldurbanWarningDistanceInMeters(handle);
  try {
    return DangerZoneWarningOptions._(
      (_highwayWarningDistanceInMetersHandle), 
      (_ruralWarningDistanceInMetersHandle), 
      (_urbanWarningDistanceInMetersHandle)
    );
  } finally {
    
    
    
  }
}

void sdkNavigationDangerzonewarningoptionsReleaseFfiHandle(Pointer<Void> handle) => _sdkNavigationDangerzonewarningoptionsReleaseHandle(handle);

// Nullable DangerZoneWarningOptions

final _sdkNavigationDangerzonewarningoptionsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_DangerZoneWarningOptions_create_handle_nullable'));
final _sdkNavigationDangerzonewarningoptionsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_DangerZoneWarningOptions_release_handle_nullable'));
final _sdkNavigationDangerzonewarningoptionsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_DangerZoneWarningOptions_get_value_nullable'));

Pointer<Void> sdkNavigationDangerzonewarningoptionsToFfiNullable(DangerZoneWarningOptions? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationDangerzonewarningoptionsToFfi(value);
  final result = _sdkNavigationDangerzonewarningoptionsCreateHandleNullable(_handle);
  sdkNavigationDangerzonewarningoptionsReleaseFfiHandle(_handle);
  return result;
}

DangerZoneWarningOptions? sdkNavigationDangerzonewarningoptionsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationDangerzonewarningoptionsGetValueNullable(handle);
  final result = sdkNavigationDangerzonewarningoptionsFromFfi(_handle);
  sdkNavigationDangerzonewarningoptionsReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationDangerzonewarningoptionsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationDangerzonewarningoptionsReleaseHandleNullable(handle);

// End of DangerZoneWarningOptions "private" section.


