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
import 'package:here_sdk/src/sdk/navigation/distance_type.dart';
import 'package:here_sdk/src/sdk/routing/route_railway_crossing_type.dart';

/// A railway crossing.
///
/// The main field describing the railway crossing is [RailwayCrossingWarning.type] specifying
/// whether the railway crossing is protected by a barrier or not.
/// Use [NavigatorInterface.railwayCrossingWarningListener] to get notifications about upcoming railway crossings.

class RailwayCrossingWarning {
  /// Distance to the railway crossing in meters.
  double distanceToRailwayCrossingInMeters;

  /// Type of railway crossing, specifying whether it is protected by a barrier or not.
  RouteRailwayCrossingType type;

  /// The distance type for the warning, e.g. a warning for a new railway crossing ahead or a warning
  /// for passing a railway crossing.
  DistanceType distanceType;

  /// Creates a new instance.

  /// [distanceToRailwayCrossingInMeters] Distance to the railway crossing in meters.

  /// [type] Type of railway crossing, specifying whether it is protected by a barrier or not.

  /// [distanceType] The distance type for the warning, e.g. a warning for a new railway crossing ahead or a warning
  /// for passing a railway crossing.

  RailwayCrossingWarning._(this.distanceToRailwayCrossingInMeters, this.type, this.distanceType);
  RailwayCrossingWarning(double distanceToRailwayCrossingInMeters, DistanceType distanceType)
    : distanceToRailwayCrossingInMeters = distanceToRailwayCrossingInMeters, type = RouteRailwayCrossingType.unknown, distanceType = distanceType;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! RailwayCrossingWarning) return false;
    RailwayCrossingWarning _other = other;
    return distanceToRailwayCrossingInMeters == _other.distanceToRailwayCrossingInMeters &&
        type == _other.type &&
        distanceType == _other.distanceType;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + distanceToRailwayCrossingInMeters.hashCode;
    result = 31 * result + type.hashCode;
    result = 31 * result + distanceType.hashCode;
    return result;
  }
}


// RailwayCrossingWarning "private" section, not exported.

final _sdkNavigationRailwaycrossingwarningCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double, Uint32, Uint32),
    Pointer<Void> Function(double, int, int)
  >('here_sdk_sdk_navigation_RailwayCrossingWarning_create_handle'));
final _sdkNavigationRailwaycrossingwarningReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RailwayCrossingWarning_release_handle'));
final _sdkNavigationRailwaycrossingwarningGetFielddistanceToRailwayCrossingInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RailwayCrossingWarning_get_field_distanceToRailwayCrossingInMeters'));
final _sdkNavigationRailwaycrossingwarningGetFieldtype = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RailwayCrossingWarning_get_field_type'));
final _sdkNavigationRailwaycrossingwarningGetFielddistanceType = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RailwayCrossingWarning_get_field_distanceType'));



Pointer<Void> sdkNavigationRailwaycrossingwarningToFfi(RailwayCrossingWarning value) {
  final _distanceToRailwayCrossingInMetersHandle = (value.distanceToRailwayCrossingInMeters);
  final _typeHandle = sdkRoutingRouterailwaycrossingtypeToFfi(value.type);
  final _distanceTypeHandle = sdkNavigationDistancetypeToFfi(value.distanceType);
  final _result = _sdkNavigationRailwaycrossingwarningCreateHandle(_distanceToRailwayCrossingInMetersHandle, _typeHandle, _distanceTypeHandle);
  
  sdkRoutingRouterailwaycrossingtypeReleaseFfiHandle(_typeHandle);
  sdkNavigationDistancetypeReleaseFfiHandle(_distanceTypeHandle);
  return _result;
}

RailwayCrossingWarning sdkNavigationRailwaycrossingwarningFromFfi(Pointer<Void> handle) {
  final _distanceToRailwayCrossingInMetersHandle = _sdkNavigationRailwaycrossingwarningGetFielddistanceToRailwayCrossingInMeters(handle);
  final _typeHandle = _sdkNavigationRailwaycrossingwarningGetFieldtype(handle);
  final _distanceTypeHandle = _sdkNavigationRailwaycrossingwarningGetFielddistanceType(handle);
  try {
    return RailwayCrossingWarning._(
      (_distanceToRailwayCrossingInMetersHandle), 
      sdkRoutingRouterailwaycrossingtypeFromFfi(_typeHandle), 
      sdkNavigationDistancetypeFromFfi(_distanceTypeHandle)
    );
  } finally {
    
    sdkRoutingRouterailwaycrossingtypeReleaseFfiHandle(_typeHandle);
    sdkNavigationDistancetypeReleaseFfiHandle(_distanceTypeHandle);
  }
}

void sdkNavigationRailwaycrossingwarningReleaseFfiHandle(Pointer<Void> handle) => _sdkNavigationRailwaycrossingwarningReleaseHandle(handle);

// Nullable RailwayCrossingWarning

final _sdkNavigationRailwaycrossingwarningCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RailwayCrossingWarning_create_handle_nullable'));
final _sdkNavigationRailwaycrossingwarningReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RailwayCrossingWarning_release_handle_nullable'));
final _sdkNavigationRailwaycrossingwarningGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RailwayCrossingWarning_get_value_nullable'));

Pointer<Void> sdkNavigationRailwaycrossingwarningToFfiNullable(RailwayCrossingWarning? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationRailwaycrossingwarningToFfi(value);
  final result = _sdkNavigationRailwaycrossingwarningCreateHandleNullable(_handle);
  sdkNavigationRailwaycrossingwarningReleaseFfiHandle(_handle);
  return result;
}

RailwayCrossingWarning? sdkNavigationRailwaycrossingwarningFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationRailwaycrossingwarningGetValueNullable(handle);
  final result = sdkNavigationRailwaycrossingwarningFromFfi(_handle);
  sdkNavigationRailwaycrossingwarningReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationRailwaycrossingwarningReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationRailwaycrossingwarningReleaseHandleNullable(handle);

// End of RailwayCrossingWarning "private" section.


