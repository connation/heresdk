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
import 'package:here_sdk/src/sdk/routing/avoidance_options.dart';
import 'package:here_sdk/src/sdk/routing/max_speed_on_segment.dart';
import 'package:here_sdk/src/sdk/routing/route_options.dart';
import 'package:here_sdk/src/sdk/routing/route_text_options.dart';
import 'package:here_sdk/src/sdk/routing/toll_options.dart';
import 'package:here_sdk/src/sdk/transport/car_specifications.dart';

/// All the options to specify how a car route should be calculated.

class CarOptions {
  /// Specifies the common route calculation options.
  RouteOptions routeOptions;

  /// Customize textual content returned from the route calculation, such
  /// as localization, format, and unit system.
  RouteTextOptions textOptions;

  /// Options to specify restrictions for route calculations. By default
  /// no restrictions are applied.
  AvoidanceOptions avoidanceOptions;

  /// Options to specify how the tolls should be calculated,
  /// such as transponders, vehicle category, and emission type.
  TollOptions tollOptions;

  /// Segments with restriction on maximum [DynamicSpeedInfo.baseSpeedInMetersPerSecond].
  List<MaxSpeedOnSegment> maxSpeedOnSegments;

  /// Detailed car specifications such as dimensions and weight.
  CarSpecifications carSpecifications;

  /// Creates a new instance.

  /// [routeOptions] Specifies the common route calculation options.

  /// [textOptions] Customize textual content returned from the route calculation, such
  /// as localization, format, and unit system.

  /// [avoidanceOptions] Options to specify restrictions for route calculations. By default
  /// no restrictions are applied.

  /// [tollOptions] Options to specify how the tolls should be calculated,
  /// such as transponders, vehicle category, and emission type.

  /// [maxSpeedOnSegments] Segments with restriction on maximum [DynamicSpeedInfo.baseSpeedInMetersPerSecond].

  /// [carSpecifications] Detailed car specifications such as dimensions and weight.

  CarOptions._(this.routeOptions, this.textOptions, this.avoidanceOptions, this.tollOptions, this.maxSpeedOnSegments, this.carSpecifications);
  CarOptions()
    : routeOptions = RouteOptions.withDefaults(), textOptions = RouteTextOptions(), avoidanceOptions = AvoidanceOptions(), tollOptions = TollOptions(), maxSpeedOnSegments = [], carSpecifications = CarSpecifications();
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CarOptions) return false;
    CarOptions _other = other;
    return routeOptions == _other.routeOptions &&
        textOptions == _other.textOptions &&
        avoidanceOptions == _other.avoidanceOptions &&
        tollOptions == _other.tollOptions &&
        DeepCollectionEquality().equals(maxSpeedOnSegments, _other.maxSpeedOnSegments) &&
        carSpecifications == _other.carSpecifications;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + routeOptions.hashCode;
    result = 31 * result + textOptions.hashCode;
    result = 31 * result + avoidanceOptions.hashCode;
    result = 31 * result + tollOptions.hashCode;
    result = 31 * result + DeepCollectionEquality().hash(maxSpeedOnSegments);
    result = 31 * result + carSpecifications.hashCode;
    return result;
  }
}


// CarOptions "private" section, not exported.

final _sdkRoutingCaroptionsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_routing_CarOptions_create_handle'));
final _sdkRoutingCaroptionsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_CarOptions_release_handle'));
final _sdkRoutingCaroptionsGetFieldrouteOptions = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_CarOptions_get_field_routeOptions'));
final _sdkRoutingCaroptionsGetFieldtextOptions = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_CarOptions_get_field_textOptions'));
final _sdkRoutingCaroptionsGetFieldavoidanceOptions = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_CarOptions_get_field_avoidanceOptions'));
final _sdkRoutingCaroptionsGetFieldtollOptions = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_CarOptions_get_field_tollOptions'));
final _sdkRoutingCaroptionsGetFieldmaxSpeedOnSegments = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_CarOptions_get_field_maxSpeedOnSegments'));
final _sdkRoutingCaroptionsGetFieldcarSpecifications = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_CarOptions_get_field_carSpecifications'));



Pointer<Void> sdkRoutingCaroptionsToFfi(CarOptions value) {
  final _routeOptionsHandle = sdkRoutingRouteoptionsToFfi(value.routeOptions);
  final _textOptionsHandle = sdkRoutingRoutetextoptionsToFfi(value.textOptions);
  final _avoidanceOptionsHandle = sdkRoutingAvoidanceoptionsToFfi(value.avoidanceOptions);
  final _tollOptionsHandle = sdkRoutingTolloptionsToFfi(value.tollOptions);
  final _maxSpeedOnSegmentsHandle = heresdkRoutingCommonBindingslistofSdkRoutingMaxspeedonsegmentToFfi(value.maxSpeedOnSegments);
  final _carSpecificationsHandle = sdkTransportCarspecificationsToFfi(value.carSpecifications);
  final _result = _sdkRoutingCaroptionsCreateHandle(_routeOptionsHandle, _textOptionsHandle, _avoidanceOptionsHandle, _tollOptionsHandle, _maxSpeedOnSegmentsHandle, _carSpecificationsHandle);
  sdkRoutingRouteoptionsReleaseFfiHandle(_routeOptionsHandle);
  sdkRoutingRoutetextoptionsReleaseFfiHandle(_textOptionsHandle);
  sdkRoutingAvoidanceoptionsReleaseFfiHandle(_avoidanceOptionsHandle);
  sdkRoutingTolloptionsReleaseFfiHandle(_tollOptionsHandle);
  heresdkRoutingCommonBindingslistofSdkRoutingMaxspeedonsegmentReleaseFfiHandle(_maxSpeedOnSegmentsHandle);
  sdkTransportCarspecificationsReleaseFfiHandle(_carSpecificationsHandle);
  return _result;
}

CarOptions sdkRoutingCaroptionsFromFfi(Pointer<Void> handle) {
  final _routeOptionsHandle = _sdkRoutingCaroptionsGetFieldrouteOptions(handle);
  final _textOptionsHandle = _sdkRoutingCaroptionsGetFieldtextOptions(handle);
  final _avoidanceOptionsHandle = _sdkRoutingCaroptionsGetFieldavoidanceOptions(handle);
  final _tollOptionsHandle = _sdkRoutingCaroptionsGetFieldtollOptions(handle);
  final _maxSpeedOnSegmentsHandle = _sdkRoutingCaroptionsGetFieldmaxSpeedOnSegments(handle);
  final _carSpecificationsHandle = _sdkRoutingCaroptionsGetFieldcarSpecifications(handle);
  try {
    return CarOptions._(
      sdkRoutingRouteoptionsFromFfi(_routeOptionsHandle), 
      sdkRoutingRoutetextoptionsFromFfi(_textOptionsHandle), 
      sdkRoutingAvoidanceoptionsFromFfi(_avoidanceOptionsHandle), 
      sdkRoutingTolloptionsFromFfi(_tollOptionsHandle), 
      heresdkRoutingCommonBindingslistofSdkRoutingMaxspeedonsegmentFromFfi(_maxSpeedOnSegmentsHandle), 
      sdkTransportCarspecificationsFromFfi(_carSpecificationsHandle)
    );
  } finally {
    sdkRoutingRouteoptionsReleaseFfiHandle(_routeOptionsHandle);
    sdkRoutingRoutetextoptionsReleaseFfiHandle(_textOptionsHandle);
    sdkRoutingAvoidanceoptionsReleaseFfiHandle(_avoidanceOptionsHandle);
    sdkRoutingTolloptionsReleaseFfiHandle(_tollOptionsHandle);
    heresdkRoutingCommonBindingslistofSdkRoutingMaxspeedonsegmentReleaseFfiHandle(_maxSpeedOnSegmentsHandle);
    sdkTransportCarspecificationsReleaseFfiHandle(_carSpecificationsHandle);
  }
}

void sdkRoutingCaroptionsReleaseFfiHandle(Pointer<Void> handle) => _sdkRoutingCaroptionsReleaseHandle(handle);

// Nullable CarOptions

final _sdkRoutingCaroptionsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_CarOptions_create_handle_nullable'));
final _sdkRoutingCaroptionsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_CarOptions_release_handle_nullable'));
final _sdkRoutingCaroptionsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_CarOptions_get_value_nullable'));

Pointer<Void> sdkRoutingCaroptionsToFfiNullable(CarOptions? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingCaroptionsToFfi(value);
  final result = _sdkRoutingCaroptionsCreateHandleNullable(_handle);
  sdkRoutingCaroptionsReleaseFfiHandle(_handle);
  return result;
}

CarOptions? sdkRoutingCaroptionsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingCaroptionsGetValueNullable(handle);
  final result = sdkRoutingCaroptionsFromFfi(_handle);
  sdkRoutingCaroptionsReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingCaroptionsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingCaroptionsReleaseHandleNullable(handle);

// End of CarOptions "private" section.


