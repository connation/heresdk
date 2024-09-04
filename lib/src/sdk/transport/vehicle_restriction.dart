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
import 'package:here_sdk/src/sdk/core/integer_range.dart';
import 'package:here_sdk/src/sdk/navigation/weather_type.dart';
import 'package:here_sdk/src/sdk/transport/hazardous_material_restriction.dart';
import 'package:here_sdk/src/sdk/transport/specific_restriction.dart';
import 'package:here_sdk/src/sdk/transport/time_restriction.dart';
import 'package:here_sdk/src/sdk/transport/truck_type.dart';

/// Represents a vehicle restriction.
///
/// **Note:** This is a beta release of this feature.
/// Related APIs may change for new releases without a deprecation process.

class VehicleRestriction {
  /// Specific restriction.
  SpecificRestriction? restriction;

  /// Restriction on transport of hazardous materials and max allowed tunnel category.
  HazardousMaterialRestriction? hazmatRestriction;

  /// Restriction applies during specific time.
  TimeRestriction? timeRestriction;

  /// Type of weather in which restriction applies.
  WeatherType? weather;

  /// Restriction applies to a specific type of a truck.
  TruckType? truckType;

  /// Number of trailers for which the restriction applies.
  IntegerRange? trailerCount;

  /// The axle count for which the current restriction applies.
  /// Can be used in conjunction with [RestrictionType.weightPerAxleCount]
  /// to specify restriction based on weight per number of axles.
  IntegerRange? axleCount;

  /// Number of axles in a group for which the current restriction applies.
  /// Can be used in conjunction with [RestrictionType.weightPerAxleGroup]
  /// to specify restriction based on weight per axle group.
  IntegerRange? axleCountInGroup;

  VehicleRestriction._(this.restriction, this.hazmatRestriction, this.timeRestriction, this.weather, this.truckType, this.trailerCount, this.axleCount, this.axleCountInGroup);
  /// Creates an unconditional restriction.
  /// [restriction] Specific restriction.
  VehicleRestriction(this.restriction)
      : hazmatRestriction = null, timeRestriction = null, weather = null, truckType = null, trailerCount = null, axleCount = null, axleCountInGroup = null;
  /// Creates an uncoditional general restriction.
  VehicleRestriction.generalRestriction()
      : restriction = null, hazmatRestriction = null, timeRestriction = null, weather = null, truckType = null, trailerCount = null, axleCount = null, axleCountInGroup = null;
}


// VehicleRestriction "private" section, not exported.

final _sdkTransportVehiclerestrictionCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_transport_VehicleRestriction_create_handle'));
final _sdkTransportVehiclerestrictionReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_transport_VehicleRestriction_release_handle'));
final _sdkTransportVehiclerestrictionGetFieldrestriction = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_VehicleRestriction_get_field_restriction'));
final _sdkTransportVehiclerestrictionGetFieldhazmatRestriction = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_VehicleRestriction_get_field_hazmatRestriction'));
final _sdkTransportVehiclerestrictionGetFieldtimeRestriction = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_VehicleRestriction_get_field_timeRestriction'));
final _sdkTransportVehiclerestrictionGetFieldweather = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_VehicleRestriction_get_field_weather'));
final _sdkTransportVehiclerestrictionGetFieldtruckType = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_VehicleRestriction_get_field_truckType'));
final _sdkTransportVehiclerestrictionGetFieldtrailerCount = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_VehicleRestriction_get_field_trailerCount'));
final _sdkTransportVehiclerestrictionGetFieldaxleCount = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_VehicleRestriction_get_field_axleCount'));
final _sdkTransportVehiclerestrictionGetFieldaxleCountInGroup = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_VehicleRestriction_get_field_axleCountInGroup'));



Pointer<Void> sdkTransportVehiclerestrictionToFfi(VehicleRestriction value) {
  final _restrictionHandle = sdkTransportSpecificrestrictionToFfiNullable(value.restriction);
  final _hazmatRestrictionHandle = sdkTransportHazardousmaterialrestrictionToFfiNullable(value.hazmatRestriction);
  final _timeRestrictionHandle = sdkTransportTimerestrictionToFfiNullable(value.timeRestriction);
  final _weatherHandle = sdkNavigationWeathertypeToFfiNullable(value.weather);
  final _truckTypeHandle = sdkTransportTrucktypeToFfiNullable(value.truckType);
  final _trailerCountHandle = sdkCoreIntegerrangeToFfiNullable(value.trailerCount);
  final _axleCountHandle = sdkCoreIntegerrangeToFfiNullable(value.axleCount);
  final _axleCountInGroupHandle = sdkCoreIntegerrangeToFfiNullable(value.axleCountInGroup);
  final _result = _sdkTransportVehiclerestrictionCreateHandle(_restrictionHandle, _hazmatRestrictionHandle, _timeRestrictionHandle, _weatherHandle, _truckTypeHandle, _trailerCountHandle, _axleCountHandle, _axleCountInGroupHandle);
  sdkTransportSpecificrestrictionReleaseFfiHandleNullable(_restrictionHandle);
  sdkTransportHazardousmaterialrestrictionReleaseFfiHandleNullable(_hazmatRestrictionHandle);
  sdkTransportTimerestrictionReleaseFfiHandleNullable(_timeRestrictionHandle);
  sdkNavigationWeathertypeReleaseFfiHandleNullable(_weatherHandle);
  sdkTransportTrucktypeReleaseFfiHandleNullable(_truckTypeHandle);
  sdkCoreIntegerrangeReleaseFfiHandleNullable(_trailerCountHandle);
  sdkCoreIntegerrangeReleaseFfiHandleNullable(_axleCountHandle);
  sdkCoreIntegerrangeReleaseFfiHandleNullable(_axleCountInGroupHandle);
  return _result;
}

VehicleRestriction sdkTransportVehiclerestrictionFromFfi(Pointer<Void> handle) {
  final _restrictionHandle = _sdkTransportVehiclerestrictionGetFieldrestriction(handle);
  final _hazmatRestrictionHandle = _sdkTransportVehiclerestrictionGetFieldhazmatRestriction(handle);
  final _timeRestrictionHandle = _sdkTransportVehiclerestrictionGetFieldtimeRestriction(handle);
  final _weatherHandle = _sdkTransportVehiclerestrictionGetFieldweather(handle);
  final _truckTypeHandle = _sdkTransportVehiclerestrictionGetFieldtruckType(handle);
  final _trailerCountHandle = _sdkTransportVehiclerestrictionGetFieldtrailerCount(handle);
  final _axleCountHandle = _sdkTransportVehiclerestrictionGetFieldaxleCount(handle);
  final _axleCountInGroupHandle = _sdkTransportVehiclerestrictionGetFieldaxleCountInGroup(handle);
  try {
    return VehicleRestriction._(
      sdkTransportSpecificrestrictionFromFfiNullable(_restrictionHandle), 
      sdkTransportHazardousmaterialrestrictionFromFfiNullable(_hazmatRestrictionHandle), 
      sdkTransportTimerestrictionFromFfiNullable(_timeRestrictionHandle), 
      sdkNavigationWeathertypeFromFfiNullable(_weatherHandle), 
      sdkTransportTrucktypeFromFfiNullable(_truckTypeHandle), 
      sdkCoreIntegerrangeFromFfiNullable(_trailerCountHandle), 
      sdkCoreIntegerrangeFromFfiNullable(_axleCountHandle), 
      sdkCoreIntegerrangeFromFfiNullable(_axleCountInGroupHandle)
    );
  } finally {
    sdkTransportSpecificrestrictionReleaseFfiHandleNullable(_restrictionHandle);
    sdkTransportHazardousmaterialrestrictionReleaseFfiHandleNullable(_hazmatRestrictionHandle);
    sdkTransportTimerestrictionReleaseFfiHandleNullable(_timeRestrictionHandle);
    sdkNavigationWeathertypeReleaseFfiHandleNullable(_weatherHandle);
    sdkTransportTrucktypeReleaseFfiHandleNullable(_truckTypeHandle);
    sdkCoreIntegerrangeReleaseFfiHandleNullable(_trailerCountHandle);
    sdkCoreIntegerrangeReleaseFfiHandleNullable(_axleCountHandle);
    sdkCoreIntegerrangeReleaseFfiHandleNullable(_axleCountInGroupHandle);
  }
}

void sdkTransportVehiclerestrictionReleaseFfiHandle(Pointer<Void> handle) => _sdkTransportVehiclerestrictionReleaseHandle(handle);

// Nullable VehicleRestriction

final _sdkTransportVehiclerestrictionCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_VehicleRestriction_create_handle_nullable'));
final _sdkTransportVehiclerestrictionReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_transport_VehicleRestriction_release_handle_nullable'));
final _sdkTransportVehiclerestrictionGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_VehicleRestriction_get_value_nullable'));

Pointer<Void> sdkTransportVehiclerestrictionToFfiNullable(VehicleRestriction? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkTransportVehiclerestrictionToFfi(value);
  final result = _sdkTransportVehiclerestrictionCreateHandleNullable(_handle);
  sdkTransportVehiclerestrictionReleaseFfiHandle(_handle);
  return result;
}

VehicleRestriction? sdkTransportVehiclerestrictionFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkTransportVehiclerestrictionGetValueNullable(handle);
  final result = sdkTransportVehiclerestrictionFromFfi(_handle);
  sdkTransportVehiclerestrictionReleaseFfiHandle(_handle);
  return result;
}

void sdkTransportVehiclerestrictionReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkTransportVehiclerestrictionReleaseHandleNullable(handle);

// End of VehicleRestriction "private" section.


