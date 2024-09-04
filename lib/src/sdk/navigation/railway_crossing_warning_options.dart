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

/// Railway crossing warning options.
///
/// Set the options to [NavigatorInterface.railwayCrossingWarningOptions]
/// in order to enable them.

class RailwayCrossingWarningOptions {
  /// Warning distance setting for highways, in meters. Defaults to 1500 meters.
  /// **Note:** The road type (highway, rural or urban) is given by the speed limit on that particular road at the specified
  /// position and not by the actual road classification. Details about which speed limits are associated to which road type
  /// can be found in [DistanceType].
  int highwayWarningDistanceInMeters;

  /// Warning distance setting for rural roads, in meters. Defaults to 750 meters.
  /// **Note:** The road type (highway, rural or urban) is given by the speed limit on that particular road at the specified
  /// position and not by the actual road classification. Details about which speed limits are associated to which road type
  /// can be found in [DistanceType].
  int ruralWarningDistanceInMeters;

  /// Warning distance setting for urban roads, in meters. Defaults to 500 meters.
  /// **Note:** The road type (highway, rural or urban) is given by the speed limit on that particular road at the specified
  /// position and not by the actual road classification. Details about which speed limits are associated to which road type
  /// can be found in [DistanceType].
  int urbanWarningDistanceInMeters;

  /// Creates a new instance.

  /// [highwayWarningDistanceInMeters] Warning distance setting for highways, in meters. Defaults to 1500 meters.
  /// **Note:** The road type (highway, rural or urban) is given by the speed limit on that particular road at the specified
  /// position and not by the actual road classification. Details about which speed limits are associated to which road type
  /// can be found in [DistanceType].

  /// [ruralWarningDistanceInMeters] Warning distance setting for rural roads, in meters. Defaults to 750 meters.
  /// **Note:** The road type (highway, rural or urban) is given by the speed limit on that particular road at the specified
  /// position and not by the actual road classification. Details about which speed limits are associated to which road type
  /// can be found in [DistanceType].

  /// [urbanWarningDistanceInMeters] Warning distance setting for urban roads, in meters. Defaults to 500 meters.
  /// **Note:** The road type (highway, rural or urban) is given by the speed limit on that particular road at the specified
  /// position and not by the actual road classification. Details about which speed limits are associated to which road type
  /// can be found in [DistanceType].

  RailwayCrossingWarningOptions._(this.highwayWarningDistanceInMeters, this.ruralWarningDistanceInMeters, this.urbanWarningDistanceInMeters);
  RailwayCrossingWarningOptions()
    : highwayWarningDistanceInMeters = 1500, ruralWarningDistanceInMeters = 750, urbanWarningDistanceInMeters = 500;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! RailwayCrossingWarningOptions) return false;
    RailwayCrossingWarningOptions _other = other;
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


// RailwayCrossingWarningOptions "private" section, not exported.

final _sdkNavigationRailwaycrossingwarningoptionsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int32, Int32, Int32),
    Pointer<Void> Function(int, int, int)
  >('here_sdk_sdk_navigation_RailwayCrossingWarningOptions_create_handle'));
final _sdkNavigationRailwaycrossingwarningoptionsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RailwayCrossingWarningOptions_release_handle'));
final _sdkNavigationRailwaycrossingwarningoptionsGetFieldhighwayWarningDistanceInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RailwayCrossingWarningOptions_get_field_highwayWarningDistanceInMeters'));
final _sdkNavigationRailwaycrossingwarningoptionsGetFieldruralWarningDistanceInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RailwayCrossingWarningOptions_get_field_ruralWarningDistanceInMeters'));
final _sdkNavigationRailwaycrossingwarningoptionsGetFieldurbanWarningDistanceInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RailwayCrossingWarningOptions_get_field_urbanWarningDistanceInMeters'));



Pointer<Void> sdkNavigationRailwaycrossingwarningoptionsToFfi(RailwayCrossingWarningOptions value) {
  final _highwayWarningDistanceInMetersHandle = (value.highwayWarningDistanceInMeters);
  final _ruralWarningDistanceInMetersHandle = (value.ruralWarningDistanceInMeters);
  final _urbanWarningDistanceInMetersHandle = (value.urbanWarningDistanceInMeters);
  final _result = _sdkNavigationRailwaycrossingwarningoptionsCreateHandle(_highwayWarningDistanceInMetersHandle, _ruralWarningDistanceInMetersHandle, _urbanWarningDistanceInMetersHandle);
  
  
  
  return _result;
}

RailwayCrossingWarningOptions sdkNavigationRailwaycrossingwarningoptionsFromFfi(Pointer<Void> handle) {
  final _highwayWarningDistanceInMetersHandle = _sdkNavigationRailwaycrossingwarningoptionsGetFieldhighwayWarningDistanceInMeters(handle);
  final _ruralWarningDistanceInMetersHandle = _sdkNavigationRailwaycrossingwarningoptionsGetFieldruralWarningDistanceInMeters(handle);
  final _urbanWarningDistanceInMetersHandle = _sdkNavigationRailwaycrossingwarningoptionsGetFieldurbanWarningDistanceInMeters(handle);
  try {
    return RailwayCrossingWarningOptions._(
      (_highwayWarningDistanceInMetersHandle), 
      (_ruralWarningDistanceInMetersHandle), 
      (_urbanWarningDistanceInMetersHandle)
    );
  } finally {
    
    
    
  }
}

void sdkNavigationRailwaycrossingwarningoptionsReleaseFfiHandle(Pointer<Void> handle) => _sdkNavigationRailwaycrossingwarningoptionsReleaseHandle(handle);

// Nullable RailwayCrossingWarningOptions

final _sdkNavigationRailwaycrossingwarningoptionsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RailwayCrossingWarningOptions_create_handle_nullable'));
final _sdkNavigationRailwaycrossingwarningoptionsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RailwayCrossingWarningOptions_release_handle_nullable'));
final _sdkNavigationRailwaycrossingwarningoptionsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RailwayCrossingWarningOptions_get_value_nullable'));

Pointer<Void> sdkNavigationRailwaycrossingwarningoptionsToFfiNullable(RailwayCrossingWarningOptions? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationRailwaycrossingwarningoptionsToFfi(value);
  final result = _sdkNavigationRailwaycrossingwarningoptionsCreateHandleNullable(_handle);
  sdkNavigationRailwaycrossingwarningoptionsReleaseFfiHandle(_handle);
  return result;
}

RailwayCrossingWarningOptions? sdkNavigationRailwaycrossingwarningoptionsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationRailwaycrossingwarningoptionsGetValueNullable(handle);
  final result = sdkNavigationRailwaycrossingwarningoptionsFromFfi(_handle);
  sdkNavigationRailwaycrossingwarningoptionsReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationRailwaycrossingwarningoptionsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationRailwaycrossingwarningoptionsReleaseHandleNullable(handle);

// End of RailwayCrossingWarningOptions "private" section.


