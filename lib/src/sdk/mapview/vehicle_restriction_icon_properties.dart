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
import 'package:here_sdk/src/sdk/core/country_code.dart';
import 'package:here_sdk/src/sdk/transport/vehicle_restriction.dart';

/// Encapsulates properties for generating vehicle restriction icons
/// using `IconProvider`.

class VehicleRestrictionIconProperties {
  /// Vehicle restriction to generate icon for.
  VehicleRestriction restriction;

  /// Specifies country specific version of the icon. Ignored
  /// if there is no country specific version of requested icon.
  CountryCode? countryCode;

  /// Creates icon properties for specified restriction.
  /// [restriction] Vehicle restriction to generate icon for.
  VehicleRestrictionIconProperties(this.restriction)
      : countryCode = null;
  /// Creates icon properties for specified restriction and country.
  /// [restriction] Vehicle restriction to generate icon for.
  /// [countryCode] Specifies country specific version of the icon. Ignored
  /// if there is no country specific version of requested icon.
  VehicleRestrictionIconProperties.withCountryCode(this.restriction, this.countryCode);
}


// VehicleRestrictionIconProperties "private" section, not exported.

final _sdkMapviewVehiclerestrictioniconpropertiesCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_mapview_VehicleRestrictionIconProperties_create_handle'));
final _sdkMapviewVehiclerestrictioniconpropertiesReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_VehicleRestrictionIconProperties_release_handle'));
final _sdkMapviewVehiclerestrictioniconpropertiesGetFieldrestriction = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_VehicleRestrictionIconProperties_get_field_restriction'));
final _sdkMapviewVehiclerestrictioniconpropertiesGetFieldcountryCode = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_VehicleRestrictionIconProperties_get_field_countryCode'));



Pointer<Void> sdkMapviewVehiclerestrictioniconpropertiesToFfi(VehicleRestrictionIconProperties value) {
  final _restrictionHandle = sdkTransportVehiclerestrictionToFfi(value.restriction);
  final _countryCodeHandle = sdkCoreCountrycodeToFfiNullable(value.countryCode);
  final _result = _sdkMapviewVehiclerestrictioniconpropertiesCreateHandle(_restrictionHandle, _countryCodeHandle);
  sdkTransportVehiclerestrictionReleaseFfiHandle(_restrictionHandle);
  sdkCoreCountrycodeReleaseFfiHandleNullable(_countryCodeHandle);
  return _result;
}

VehicleRestrictionIconProperties sdkMapviewVehiclerestrictioniconpropertiesFromFfi(Pointer<Void> handle) {
  final _restrictionHandle = _sdkMapviewVehiclerestrictioniconpropertiesGetFieldrestriction(handle);
  final _countryCodeHandle = _sdkMapviewVehiclerestrictioniconpropertiesGetFieldcountryCode(handle);
  try {
    return VehicleRestrictionIconProperties.withCountryCode(
      sdkTransportVehiclerestrictionFromFfi(_restrictionHandle), 
      sdkCoreCountrycodeFromFfiNullable(_countryCodeHandle)
    );
  } finally {
    sdkTransportVehiclerestrictionReleaseFfiHandle(_restrictionHandle);
    sdkCoreCountrycodeReleaseFfiHandleNullable(_countryCodeHandle);
  }
}

void sdkMapviewVehiclerestrictioniconpropertiesReleaseFfiHandle(Pointer<Void> handle) => _sdkMapviewVehiclerestrictioniconpropertiesReleaseHandle(handle);

// Nullable VehicleRestrictionIconProperties

final _sdkMapviewVehiclerestrictioniconpropertiesCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_VehicleRestrictionIconProperties_create_handle_nullable'));
final _sdkMapviewVehiclerestrictioniconpropertiesReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_VehicleRestrictionIconProperties_release_handle_nullable'));
final _sdkMapviewVehiclerestrictioniconpropertiesGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_VehicleRestrictionIconProperties_get_value_nullable'));

Pointer<Void> sdkMapviewVehiclerestrictioniconpropertiesToFfiNullable(VehicleRestrictionIconProperties? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewVehiclerestrictioniconpropertiesToFfi(value);
  final result = _sdkMapviewVehiclerestrictioniconpropertiesCreateHandleNullable(_handle);
  sdkMapviewVehiclerestrictioniconpropertiesReleaseFfiHandle(_handle);
  return result;
}

VehicleRestrictionIconProperties? sdkMapviewVehiclerestrictioniconpropertiesFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewVehiclerestrictioniconpropertiesGetValueNullable(handle);
  final result = sdkMapviewVehiclerestrictioniconpropertiesFromFfi(_handle);
  sdkMapviewVehiclerestrictioniconpropertiesReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewVehiclerestrictioniconpropertiesReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewVehiclerestrictioniconpropertiesReleaseHandleNullable(handle);

// End of VehicleRestrictionIconProperties "private" section.


