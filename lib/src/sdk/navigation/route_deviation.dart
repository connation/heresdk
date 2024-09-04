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
import 'package:here_sdk/src/sdk/navigation/navigable_location.dart';

/// Contains all the relevant information on a deviation from the route.

class RouteDeviation {
  /// The last known location on the route.
  NavigableLocation? lastLocationOnRoute;

  /// Indicates the index of the last traveled route section.
  int lastTraveledSectionIndex;

  /// Offset in meter to the last visited position on the route section defined by the last traveled section index.
  int traveledDistanceOnLastSectionInMeters;

  /// The current location.
  NavigableLocation currentLocation;

  /// Creates a new instance.
  /// [lastLocationOnRoute] The last known location on the route.
  /// [lastTraveledSectionIndex] Indicates the index of the last traveled route section.
  /// [traveledDistanceOnLastSectionInMeters] Offset in meter to the last visited position on the route section defined by the last traveled section index.
  /// [currentLocation] The current location.
  RouteDeviation.withTraveledDistance(this.lastLocationOnRoute, this.lastTraveledSectionIndex, this.traveledDistanceOnLastSectionInMeters, this.currentLocation);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! RouteDeviation) return false;
    RouteDeviation _other = other;
    return lastLocationOnRoute == _other.lastLocationOnRoute &&
        lastTraveledSectionIndex == _other.lastTraveledSectionIndex &&
        traveledDistanceOnLastSectionInMeters == _other.traveledDistanceOnLastSectionInMeters &&
        currentLocation == _other.currentLocation;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + lastLocationOnRoute.hashCode;
    result = 31 * result + lastTraveledSectionIndex.hashCode;
    result = 31 * result + traveledDistanceOnLastSectionInMeters.hashCode;
    result = 31 * result + currentLocation.hashCode;
    return result;
  }
}


// RouteDeviation "private" section, not exported.

final _sdkNavigationRoutedeviationCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Int32, Int32, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, int, int, Pointer<Void>)
  >('here_sdk_sdk_navigation_RouteDeviation_create_handle'));
final _sdkNavigationRoutedeviationReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RouteDeviation_release_handle'));
final _sdkNavigationRoutedeviationGetFieldlastLocationOnRoute = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RouteDeviation_get_field_lastLocationOnRoute'));
final _sdkNavigationRoutedeviationGetFieldlastTraveledSectionIndex = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RouteDeviation_get_field_lastTraveledSectionIndex'));
final _sdkNavigationRoutedeviationGetFieldtraveledDistanceOnLastSectionInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RouteDeviation_get_field_traveledDistanceOnLastSectionInMeters'));
final _sdkNavigationRoutedeviationGetFieldcurrentLocation = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RouteDeviation_get_field_currentLocation'));



Pointer<Void> sdkNavigationRoutedeviationToFfi(RouteDeviation value) {
  final _lastLocationOnRouteHandle = sdkNavigationNavigablelocationToFfiNullable(value.lastLocationOnRoute);
  final _lastTraveledSectionIndexHandle = (value.lastTraveledSectionIndex);
  final _traveledDistanceOnLastSectionInMetersHandle = (value.traveledDistanceOnLastSectionInMeters);
  final _currentLocationHandle = sdkNavigationNavigablelocationToFfi(value.currentLocation);
  final _result = _sdkNavigationRoutedeviationCreateHandle(_lastLocationOnRouteHandle, _lastTraveledSectionIndexHandle, _traveledDistanceOnLastSectionInMetersHandle, _currentLocationHandle);
  sdkNavigationNavigablelocationReleaseFfiHandleNullable(_lastLocationOnRouteHandle);
  
  
  sdkNavigationNavigablelocationReleaseFfiHandle(_currentLocationHandle);
  return _result;
}

RouteDeviation sdkNavigationRoutedeviationFromFfi(Pointer<Void> handle) {
  final _lastLocationOnRouteHandle = _sdkNavigationRoutedeviationGetFieldlastLocationOnRoute(handle);
  final _lastTraveledSectionIndexHandle = _sdkNavigationRoutedeviationGetFieldlastTraveledSectionIndex(handle);
  final _traveledDistanceOnLastSectionInMetersHandle = _sdkNavigationRoutedeviationGetFieldtraveledDistanceOnLastSectionInMeters(handle);
  final _currentLocationHandle = _sdkNavigationRoutedeviationGetFieldcurrentLocation(handle);
  try {
    return RouteDeviation.withTraveledDistance(
      sdkNavigationNavigablelocationFromFfiNullable(_lastLocationOnRouteHandle), 
      (_lastTraveledSectionIndexHandle), 
      (_traveledDistanceOnLastSectionInMetersHandle), 
      sdkNavigationNavigablelocationFromFfi(_currentLocationHandle)
    );
  } finally {
    sdkNavigationNavigablelocationReleaseFfiHandleNullable(_lastLocationOnRouteHandle);
    
    
    sdkNavigationNavigablelocationReleaseFfiHandle(_currentLocationHandle);
  }
}

void sdkNavigationRoutedeviationReleaseFfiHandle(Pointer<Void> handle) => _sdkNavigationRoutedeviationReleaseHandle(handle);

// Nullable RouteDeviation

final _sdkNavigationRoutedeviationCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RouteDeviation_create_handle_nullable'));
final _sdkNavigationRoutedeviationReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RouteDeviation_release_handle_nullable'));
final _sdkNavigationRoutedeviationGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RouteDeviation_get_value_nullable'));

Pointer<Void> sdkNavigationRoutedeviationToFfiNullable(RouteDeviation? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationRoutedeviationToFfi(value);
  final result = _sdkNavigationRoutedeviationCreateHandleNullable(_handle);
  sdkNavigationRoutedeviationReleaseFfiHandle(_handle);
  return result;
}

RouteDeviation? sdkNavigationRoutedeviationFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationRoutedeviationGetValueNullable(handle);
  final result = sdkNavigationRoutedeviationFromFfi(_handle);
  sdkNavigationRoutedeviationReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationRoutedeviationReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationRoutedeviationReleaseHandleNullable(handle);

// End of RouteDeviation "private" section.


