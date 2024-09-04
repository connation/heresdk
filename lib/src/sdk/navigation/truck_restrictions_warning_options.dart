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

/// Truck restrictions warning options.
///
/// Set the options to [NavigatorInterface.truckRestrictionsWarningOptions]
/// for filtering of truck restrictions notifications.

class TruckRestrictionsWarningOptions {
  /// If set to true, all the truck restrictions notifications which have a time
  /// restriction, which does not apply for the current time will not be given.
  /// If the value is false, all truck restrictions will be given regardless
  /// of the time restrictions that they might have.
  bool filterOutInactiveTimeDependentRestrictions;

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

  /// [filterOutInactiveTimeDependentRestrictions] If set to true, all the truck restrictions notifications which have a time
  /// restriction, which does not apply for the current time will not be given.
  /// If the value is false, all truck restrictions will be given regardless
  /// of the time restrictions that they might have.

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

  TruckRestrictionsWarningOptions._(this.filterOutInactiveTimeDependentRestrictions, this.highwayWarningDistanceInMeters, this.ruralWarningDistanceInMeters, this.urbanWarningDistanceInMeters);
  TruckRestrictionsWarningOptions()
    : filterOutInactiveTimeDependentRestrictions = false, highwayWarningDistanceInMeters = 1500, ruralWarningDistanceInMeters = 750, urbanWarningDistanceInMeters = 500;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TruckRestrictionsWarningOptions) return false;
    TruckRestrictionsWarningOptions _other = other;
    return filterOutInactiveTimeDependentRestrictions == _other.filterOutInactiveTimeDependentRestrictions &&
        highwayWarningDistanceInMeters == _other.highwayWarningDistanceInMeters &&
        ruralWarningDistanceInMeters == _other.ruralWarningDistanceInMeters &&
        urbanWarningDistanceInMeters == _other.urbanWarningDistanceInMeters;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + filterOutInactiveTimeDependentRestrictions.hashCode;
    result = 31 * result + highwayWarningDistanceInMeters.hashCode;
    result = 31 * result + ruralWarningDistanceInMeters.hashCode;
    result = 31 * result + urbanWarningDistanceInMeters.hashCode;
    return result;
  }
}


// TruckRestrictionsWarningOptions "private" section, not exported.

final _sdkNavigationTruckrestrictionswarningoptionsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint8, Int32, Int32, Int32),
    Pointer<Void> Function(int, int, int, int)
  >('here_sdk_sdk_navigation_TruckRestrictionsWarningOptions_create_handle'));
final _sdkNavigationTruckrestrictionswarningoptionsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TruckRestrictionsWarningOptions_release_handle'));
final _sdkNavigationTruckrestrictionswarningoptionsGetFieldfilterOutInactiveTimeDependentRestrictions = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TruckRestrictionsWarningOptions_get_field_filterOutInactiveTimeDependentRestrictions'));
final _sdkNavigationTruckrestrictionswarningoptionsGetFieldhighwayWarningDistanceInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TruckRestrictionsWarningOptions_get_field_highwayWarningDistanceInMeters'));
final _sdkNavigationTruckrestrictionswarningoptionsGetFieldruralWarningDistanceInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TruckRestrictionsWarningOptions_get_field_ruralWarningDistanceInMeters'));
final _sdkNavigationTruckrestrictionswarningoptionsGetFieldurbanWarningDistanceInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TruckRestrictionsWarningOptions_get_field_urbanWarningDistanceInMeters'));



Pointer<Void> sdkNavigationTruckrestrictionswarningoptionsToFfi(TruckRestrictionsWarningOptions value) {
  final _filterOutInactiveTimeDependentRestrictionsHandle = booleanToFfi(value.filterOutInactiveTimeDependentRestrictions);
  final _highwayWarningDistanceInMetersHandle = (value.highwayWarningDistanceInMeters);
  final _ruralWarningDistanceInMetersHandle = (value.ruralWarningDistanceInMeters);
  final _urbanWarningDistanceInMetersHandle = (value.urbanWarningDistanceInMeters);
  final _result = _sdkNavigationTruckrestrictionswarningoptionsCreateHandle(_filterOutInactiveTimeDependentRestrictionsHandle, _highwayWarningDistanceInMetersHandle, _ruralWarningDistanceInMetersHandle, _urbanWarningDistanceInMetersHandle);
  booleanReleaseFfiHandle(_filterOutInactiveTimeDependentRestrictionsHandle);
  
  
  
  return _result;
}

TruckRestrictionsWarningOptions sdkNavigationTruckrestrictionswarningoptionsFromFfi(Pointer<Void> handle) {
  final _filterOutInactiveTimeDependentRestrictionsHandle = _sdkNavigationTruckrestrictionswarningoptionsGetFieldfilterOutInactiveTimeDependentRestrictions(handle);
  final _highwayWarningDistanceInMetersHandle = _sdkNavigationTruckrestrictionswarningoptionsGetFieldhighwayWarningDistanceInMeters(handle);
  final _ruralWarningDistanceInMetersHandle = _sdkNavigationTruckrestrictionswarningoptionsGetFieldruralWarningDistanceInMeters(handle);
  final _urbanWarningDistanceInMetersHandle = _sdkNavigationTruckrestrictionswarningoptionsGetFieldurbanWarningDistanceInMeters(handle);
  try {
    return TruckRestrictionsWarningOptions._(
      booleanFromFfi(_filterOutInactiveTimeDependentRestrictionsHandle), 
      (_highwayWarningDistanceInMetersHandle), 
      (_ruralWarningDistanceInMetersHandle), 
      (_urbanWarningDistanceInMetersHandle)
    );
  } finally {
    booleanReleaseFfiHandle(_filterOutInactiveTimeDependentRestrictionsHandle);
    
    
    
  }
}

void sdkNavigationTruckrestrictionswarningoptionsReleaseFfiHandle(Pointer<Void> handle) => _sdkNavigationTruckrestrictionswarningoptionsReleaseHandle(handle);

// Nullable TruckRestrictionsWarningOptions

final _sdkNavigationTruckrestrictionswarningoptionsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TruckRestrictionsWarningOptions_create_handle_nullable'));
final _sdkNavigationTruckrestrictionswarningoptionsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TruckRestrictionsWarningOptions_release_handle_nullable'));
final _sdkNavigationTruckrestrictionswarningoptionsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TruckRestrictionsWarningOptions_get_value_nullable'));

Pointer<Void> sdkNavigationTruckrestrictionswarningoptionsToFfiNullable(TruckRestrictionsWarningOptions? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationTruckrestrictionswarningoptionsToFfi(value);
  final result = _sdkNavigationTruckrestrictionswarningoptionsCreateHandleNullable(_handle);
  sdkNavigationTruckrestrictionswarningoptionsReleaseFfiHandle(_handle);
  return result;
}

TruckRestrictionsWarningOptions? sdkNavigationTruckrestrictionswarningoptionsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationTruckrestrictionswarningoptionsGetValueNullable(handle);
  final result = sdkNavigationTruckrestrictionswarningoptionsFromFfi(_handle);
  sdkNavigationTruckrestrictionswarningoptionsReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationTruckrestrictionswarningoptionsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationTruckrestrictionswarningoptionsReleaseHandleNullable(handle);

// End of TruckRestrictionsWarningOptions "private" section.


