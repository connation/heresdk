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
import 'package:collection/collection.dart';
import 'package:here_sdk/src/_library_context.dart' as __lib;
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/navigation/distance_type.dart';
import 'package:here_sdk/src/sdk/navigation/toll_booth_lane.dart';

/// A class that provides information for a toll stop with multiple toll booths.

class TollStop {
  /// Indicates if the specified toll stop is ahead of the vehicle or has just passed by.
  DistanceType distanceType;

  /// Distance to the toll stop in meters.
  double distanceToTollStopInMeters;

  /// Describes the features of the booth for the lane.
  /// The lanes are sorted from left to right: The lane at index 0 represents the leftmost lane and
  /// the last index represents the rightmost lane. This is valid for right-hand and left-hand driving
  /// countries. An empty list means that the complex junction has been passed and that the lane information is not
  /// valid anymore. Exactly one event with a non-empty list is delivered before reaching a complex junction and
  /// one event with an empty list afterwards.
  ///
  /// **Note:** Lanes going in opposite direction are not included in the list.
  List<TollBoothLane> lanes;

  /// Creates a new instance.

  /// [distanceType] Indicates if the specified toll stop is ahead of the vehicle or has just passed by.

  /// [distanceToTollStopInMeters] Distance to the toll stop in meters.

  /// [lanes] Describes the features of the booth for the lane.
  /// The lanes are sorted from left to right: The lane at index 0 represents the leftmost lane and
  /// the last index represents the rightmost lane. This is valid for right-hand and left-hand driving
  /// countries. An empty list means that the complex junction has been passed and that the lane information is not
  /// valid anymore. Exactly one event with a non-empty list is delivered before reaching a complex junction and
  /// one event with an empty list afterwards.
  ///
  /// **Note:** Lanes going in opposite direction are not included in the list.

  TollStop(this.distanceType, this.distanceToTollStopInMeters, this.lanes);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TollStop) return false;
    TollStop _other = other;
    return distanceType == _other.distanceType &&
        distanceToTollStopInMeters == _other.distanceToTollStopInMeters &&
        DeepCollectionEquality().equals(lanes, _other.lanes);
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + distanceType.hashCode;
    result = 31 * result + distanceToTollStopInMeters.hashCode;
    result = 31 * result + DeepCollectionEquality().hash(lanes);
    return result;
  }
}


// TollStop "private" section, not exported.

final _sdkNavigationTollstopCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32, Double, Pointer<Void>),
    Pointer<Void> Function(int, double, Pointer<Void>)
  >('here_sdk_sdk_navigation_TollStop_create_handle'));
final _sdkNavigationTollstopReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TollStop_release_handle'));
final _sdkNavigationTollstopGetFielddistanceType = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TollStop_get_field_distanceType'));
final _sdkNavigationTollstopGetFielddistanceToTollStopInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TollStop_get_field_distanceToTollStopInMeters'));
final _sdkNavigationTollstopGetFieldlanes = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TollStop_get_field_lanes'));



Pointer<Void> sdkNavigationTollstopToFfi(TollStop value) {
  final _distanceTypeHandle = sdkNavigationDistancetypeToFfi(value.distanceType);
  final _distanceToTollStopInMetersHandle = (value.distanceToTollStopInMeters);
  final _lanesHandle = heresdkNavigationBindingslistofSdkNavigationTollboothlaneToFfi(value.lanes);
  final _result = _sdkNavigationTollstopCreateHandle(_distanceTypeHandle, _distanceToTollStopInMetersHandle, _lanesHandle);
  sdkNavigationDistancetypeReleaseFfiHandle(_distanceTypeHandle);
  
  heresdkNavigationBindingslistofSdkNavigationTollboothlaneReleaseFfiHandle(_lanesHandle);
  return _result;
}

TollStop sdkNavigationTollstopFromFfi(Pointer<Void> handle) {
  final _distanceTypeHandle = _sdkNavigationTollstopGetFielddistanceType(handle);
  final _distanceToTollStopInMetersHandle = _sdkNavigationTollstopGetFielddistanceToTollStopInMeters(handle);
  final _lanesHandle = _sdkNavigationTollstopGetFieldlanes(handle);
  try {
    return TollStop(
      sdkNavigationDistancetypeFromFfi(_distanceTypeHandle), 
      (_distanceToTollStopInMetersHandle), 
      heresdkNavigationBindingslistofSdkNavigationTollboothlaneFromFfi(_lanesHandle)
    );
  } finally {
    sdkNavigationDistancetypeReleaseFfiHandle(_distanceTypeHandle);
    
    heresdkNavigationBindingslistofSdkNavigationTollboothlaneReleaseFfiHandle(_lanesHandle);
  }
}

void sdkNavigationTollstopReleaseFfiHandle(Pointer<Void> handle) => _sdkNavigationTollstopReleaseHandle(handle);

// Nullable TollStop

final _sdkNavigationTollstopCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TollStop_create_handle_nullable'));
final _sdkNavigationTollstopReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TollStop_release_handle_nullable'));
final _sdkNavigationTollstopGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TollStop_get_value_nullable'));

Pointer<Void> sdkNavigationTollstopToFfiNullable(TollStop? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationTollstopToFfi(value);
  final result = _sdkNavigationTollstopCreateHandleNullable(_handle);
  sdkNavigationTollstopReleaseFfiHandle(_handle);
  return result;
}

TollStop? sdkNavigationTollstopFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationTollstopGetValueNullable(handle);
  final result = sdkNavigationTollstopFromFfi(_handle);
  sdkNavigationTollstopReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationTollstopReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationTollstopReleaseHandleNullable(handle);

// End of TollStop "private" section.


