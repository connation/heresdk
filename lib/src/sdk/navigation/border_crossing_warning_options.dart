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

/// Border crossing warning options.
///
/// Set the options to [NavigatorInterface.borderCrossingWarningOptions]
/// in order to enable them.

class BorderCrossingWarningOptions {
  /// If set to true, all the state border crossing notifications will not be given.
  /// If the value is false, all border crossing notifications will be given for
  /// both country borders and state borders. By default, the
  /// [BorderCrossingWarningOptions.filterOutStateBorderWarnings] is set to false.
  bool filterOutStateBorderWarnings;

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

  /// [filterOutStateBorderWarnings] If set to true, all the state border crossing notifications will not be given.
  /// If the value is false, all border crossing notifications will be given for
  /// both country borders and state borders. By default, the
  /// [BorderCrossingWarningOptions.filterOutStateBorderWarnings] is set to false.

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

  BorderCrossingWarningOptions._(this.filterOutStateBorderWarnings, this.highwayWarningDistanceInMeters, this.ruralWarningDistanceInMeters, this.urbanWarningDistanceInMeters);
  BorderCrossingWarningOptions()
    : filterOutStateBorderWarnings = false, highwayWarningDistanceInMeters = 1500, ruralWarningDistanceInMeters = 750, urbanWarningDistanceInMeters = 500;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! BorderCrossingWarningOptions) return false;
    BorderCrossingWarningOptions _other = other;
    return filterOutStateBorderWarnings == _other.filterOutStateBorderWarnings &&
        highwayWarningDistanceInMeters == _other.highwayWarningDistanceInMeters &&
        ruralWarningDistanceInMeters == _other.ruralWarningDistanceInMeters &&
        urbanWarningDistanceInMeters == _other.urbanWarningDistanceInMeters;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + filterOutStateBorderWarnings.hashCode;
    result = 31 * result + highwayWarningDistanceInMeters.hashCode;
    result = 31 * result + ruralWarningDistanceInMeters.hashCode;
    result = 31 * result + urbanWarningDistanceInMeters.hashCode;
    return result;
  }
}


// BorderCrossingWarningOptions "private" section, not exported.

final _sdkNavigationBordercrossingwarningoptionsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint8, Int32, Int32, Int32),
    Pointer<Void> Function(int, int, int, int)
  >('here_sdk_sdk_navigation_BorderCrossingWarningOptions_create_handle'));
final _sdkNavigationBordercrossingwarningoptionsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_BorderCrossingWarningOptions_release_handle'));
final _sdkNavigationBordercrossingwarningoptionsGetFieldfilterOutStateBorderWarnings = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_BorderCrossingWarningOptions_get_field_filterOutStateBorderWarnings'));
final _sdkNavigationBordercrossingwarningoptionsGetFieldhighwayWarningDistanceInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_BorderCrossingWarningOptions_get_field_highwayWarningDistanceInMeters'));
final _sdkNavigationBordercrossingwarningoptionsGetFieldruralWarningDistanceInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_BorderCrossingWarningOptions_get_field_ruralWarningDistanceInMeters'));
final _sdkNavigationBordercrossingwarningoptionsGetFieldurbanWarningDistanceInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_BorderCrossingWarningOptions_get_field_urbanWarningDistanceInMeters'));



Pointer<Void> sdkNavigationBordercrossingwarningoptionsToFfi(BorderCrossingWarningOptions value) {
  final _filterOutStateBorderWarningsHandle = booleanToFfi(value.filterOutStateBorderWarnings);
  final _highwayWarningDistanceInMetersHandle = (value.highwayWarningDistanceInMeters);
  final _ruralWarningDistanceInMetersHandle = (value.ruralWarningDistanceInMeters);
  final _urbanWarningDistanceInMetersHandle = (value.urbanWarningDistanceInMeters);
  final _result = _sdkNavigationBordercrossingwarningoptionsCreateHandle(_filterOutStateBorderWarningsHandle, _highwayWarningDistanceInMetersHandle, _ruralWarningDistanceInMetersHandle, _urbanWarningDistanceInMetersHandle);
  booleanReleaseFfiHandle(_filterOutStateBorderWarningsHandle);
  
  
  
  return _result;
}

BorderCrossingWarningOptions sdkNavigationBordercrossingwarningoptionsFromFfi(Pointer<Void> handle) {
  final _filterOutStateBorderWarningsHandle = _sdkNavigationBordercrossingwarningoptionsGetFieldfilterOutStateBorderWarnings(handle);
  final _highwayWarningDistanceInMetersHandle = _sdkNavigationBordercrossingwarningoptionsGetFieldhighwayWarningDistanceInMeters(handle);
  final _ruralWarningDistanceInMetersHandle = _sdkNavigationBordercrossingwarningoptionsGetFieldruralWarningDistanceInMeters(handle);
  final _urbanWarningDistanceInMetersHandle = _sdkNavigationBordercrossingwarningoptionsGetFieldurbanWarningDistanceInMeters(handle);
  try {
    return BorderCrossingWarningOptions._(
      booleanFromFfi(_filterOutStateBorderWarningsHandle), 
      (_highwayWarningDistanceInMetersHandle), 
      (_ruralWarningDistanceInMetersHandle), 
      (_urbanWarningDistanceInMetersHandle)
    );
  } finally {
    booleanReleaseFfiHandle(_filterOutStateBorderWarningsHandle);
    
    
    
  }
}

void sdkNavigationBordercrossingwarningoptionsReleaseFfiHandle(Pointer<Void> handle) => _sdkNavigationBordercrossingwarningoptionsReleaseHandle(handle);

// Nullable BorderCrossingWarningOptions

final _sdkNavigationBordercrossingwarningoptionsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_BorderCrossingWarningOptions_create_handle_nullable'));
final _sdkNavigationBordercrossingwarningoptionsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_BorderCrossingWarningOptions_release_handle_nullable'));
final _sdkNavigationBordercrossingwarningoptionsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_BorderCrossingWarningOptions_get_value_nullable'));

Pointer<Void> sdkNavigationBordercrossingwarningoptionsToFfiNullable(BorderCrossingWarningOptions? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationBordercrossingwarningoptionsToFfi(value);
  final result = _sdkNavigationBordercrossingwarningoptionsCreateHandleNullable(_handle);
  sdkNavigationBordercrossingwarningoptionsReleaseFfiHandle(_handle);
  return result;
}

BorderCrossingWarningOptions? sdkNavigationBordercrossingwarningoptionsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationBordercrossingwarningoptionsGetValueNullable(handle);
  final result = sdkNavigationBordercrossingwarningoptionsFromFfi(_handle);
  sdkNavigationBordercrossingwarningoptionsReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationBordercrossingwarningoptionsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationBordercrossingwarningoptionsReleaseHandleNullable(handle);

// End of BorderCrossingWarningOptions "private" section.


