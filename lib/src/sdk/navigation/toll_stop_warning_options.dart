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

/// Toll stop warning options.
///
/// Set the options to [NavigatorInterface.tollStopWarningOptions]
/// for filtering of toll stop notifications.

class TollStopWarningOptions {
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

  TollStopWarningOptions._(this.highwayWarningDistanceInMeters, this.ruralWarningDistanceInMeters, this.urbanWarningDistanceInMeters);
  TollStopWarningOptions()
    : highwayWarningDistanceInMeters = 1500, ruralWarningDistanceInMeters = 750, urbanWarningDistanceInMeters = 500;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TollStopWarningOptions) return false;
    TollStopWarningOptions _other = other;
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


// TollStopWarningOptions "private" section, not exported.

final _sdkNavigationTollstopwarningoptionsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int32, Int32, Int32),
    Pointer<Void> Function(int, int, int)
  >('here_sdk_sdk_navigation_TollStopWarningOptions_create_handle'));
final _sdkNavigationTollstopwarningoptionsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TollStopWarningOptions_release_handle'));
final _sdkNavigationTollstopwarningoptionsGetFieldhighwayWarningDistanceInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TollStopWarningOptions_get_field_highwayWarningDistanceInMeters'));
final _sdkNavigationTollstopwarningoptionsGetFieldruralWarningDistanceInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TollStopWarningOptions_get_field_ruralWarningDistanceInMeters'));
final _sdkNavigationTollstopwarningoptionsGetFieldurbanWarningDistanceInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TollStopWarningOptions_get_field_urbanWarningDistanceInMeters'));



Pointer<Void> sdkNavigationTollstopwarningoptionsToFfi(TollStopWarningOptions value) {
  final _highwayWarningDistanceInMetersHandle = (value.highwayWarningDistanceInMeters);
  final _ruralWarningDistanceInMetersHandle = (value.ruralWarningDistanceInMeters);
  final _urbanWarningDistanceInMetersHandle = (value.urbanWarningDistanceInMeters);
  final _result = _sdkNavigationTollstopwarningoptionsCreateHandle(_highwayWarningDistanceInMetersHandle, _ruralWarningDistanceInMetersHandle, _urbanWarningDistanceInMetersHandle);
  
  
  
  return _result;
}

TollStopWarningOptions sdkNavigationTollstopwarningoptionsFromFfi(Pointer<Void> handle) {
  final _highwayWarningDistanceInMetersHandle = _sdkNavigationTollstopwarningoptionsGetFieldhighwayWarningDistanceInMeters(handle);
  final _ruralWarningDistanceInMetersHandle = _sdkNavigationTollstopwarningoptionsGetFieldruralWarningDistanceInMeters(handle);
  final _urbanWarningDistanceInMetersHandle = _sdkNavigationTollstopwarningoptionsGetFieldurbanWarningDistanceInMeters(handle);
  try {
    return TollStopWarningOptions._(
      (_highwayWarningDistanceInMetersHandle), 
      (_ruralWarningDistanceInMetersHandle), 
      (_urbanWarningDistanceInMetersHandle)
    );
  } finally {
    
    
    
  }
}

void sdkNavigationTollstopwarningoptionsReleaseFfiHandle(Pointer<Void> handle) => _sdkNavigationTollstopwarningoptionsReleaseHandle(handle);

// Nullable TollStopWarningOptions

final _sdkNavigationTollstopwarningoptionsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TollStopWarningOptions_create_handle_nullable'));
final _sdkNavigationTollstopwarningoptionsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TollStopWarningOptions_release_handle_nullable'));
final _sdkNavigationTollstopwarningoptionsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TollStopWarningOptions_get_value_nullable'));

Pointer<Void> sdkNavigationTollstopwarningoptionsToFfiNullable(TollStopWarningOptions? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationTollstopwarningoptionsToFfi(value);
  final result = _sdkNavigationTollstopwarningoptionsCreateHandleNullable(_handle);
  sdkNavigationTollstopwarningoptionsReleaseFfiHandle(_handle);
  return result;
}

TollStopWarningOptions? sdkNavigationTollstopwarningoptionsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationTollstopwarningoptionsGetValueNullable(handle);
  final result = sdkNavigationTollstopwarningoptionsFromFfi(_handle);
  sdkNavigationTollstopwarningoptionsReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationTollstopwarningoptionsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationTollstopwarningoptionsReleaseHandleNullable(handle);

// End of TollStopWarningOptions "private" section.


