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
import 'package:here_sdk/src/sdk/core/country_code.dart';
import 'package:here_sdk/src/sdk/navigation/border_crossing_type.dart';
import 'package:here_sdk/src/sdk/navigation/distance_type.dart';
import 'package:here_sdk/src/sdk/transport/general_vehicle_speed_limits.dart';

/// A border crossing.
///
/// The main fields describing the border crossing are [BorderCrossingWarning.type] specifying whether the border crossing
/// is given for a country border or for a state border and [BorderCrossingWarning.countryCode] which should be present
/// at all times, regardless if the warning is a country border or a state border.
/// A border crossing must contain a known [BorderCrossingWarning.type] and a [BorderCrossingWarning.countryCode]. The [BorderCrossingWarning.stateCode]
/// is optional.
/// Use [NavigatorInterface.borderCrossingWarningListener] to get notifications about upcoming country or state border crossings.

class BorderCrossingWarning {
  /// Distance to the border crossing in meters.
  double distanceToBorderCrossingInMeters;

  /// Type of border crossing.
  BorderCrossingType type;

  /// Country code for the country after the border crossing. It can be the same as the current country
  /// if the border crossing warning is given for a state border crossing.
  CountryCode countryCode;

  /// The state code after the border crossing. It represents the state / province code. It is a 1 to 3 upper-case
  /// characters string that follows the ISO 3166-2 standard, but without the preceding country code (e.g. for Texas,
  /// the state code will be TX). It will be `null` for countries without states or countries in which the states
  /// have very similar regulations (e.g. for Germany there will be no state borders).
  String? stateCode;

  /// The general speed limits in the country / state after border crossing.
  GeneralVehicleSpeedLimits speedLimits;

  /// The distance type for the warning, e.g. a warning for a new border crossing ahead or a warning for
  /// passing a border crossing. Since the border crossing warning is given relative to a single position on
  /// the route, [DistanceType.reached] will never be given for this warning.
  DistanceType distanceType;

  /// Creates a new instance.

  /// [distanceToBorderCrossingInMeters] Distance to the border crossing in meters.

  /// [type] Type of border crossing.

  /// [countryCode] Country code for the country after the border crossing. It can be the same as the current country
  /// if the border crossing warning is given for a state border crossing.

  /// [stateCode] The state code after the border crossing. It represents the state / province code. It is a 1 to 3 upper-case
  /// characters string that follows the ISO 3166-2 standard, but without the preceding country code (e.g. for Texas,
  /// the state code will be TX). It will be `null` for countries without states or countries in which the states
  /// have very similar regulations (e.g. for Germany there will be no state borders).

  /// [speedLimits] The general speed limits in the country / state after border crossing.

  /// [distanceType] The distance type for the warning, e.g. a warning for a new border crossing ahead or a warning for
  /// passing a border crossing. Since the border crossing warning is given relative to a single position on
  /// the route, [DistanceType.reached] will never be given for this warning.

  BorderCrossingWarning._(this.distanceToBorderCrossingInMeters, this.type, this.countryCode, this.stateCode, this.speedLimits, this.distanceType);
  BorderCrossingWarning(double distanceToBorderCrossingInMeters, BorderCrossingType type, CountryCode countryCode, GeneralVehicleSpeedLimits speedLimits, DistanceType distanceType)
    : distanceToBorderCrossingInMeters = distanceToBorderCrossingInMeters, type = type, countryCode = countryCode, stateCode = null, speedLimits = speedLimits, distanceType = distanceType;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! BorderCrossingWarning) return false;
    BorderCrossingWarning _other = other;
    return distanceToBorderCrossingInMeters == _other.distanceToBorderCrossingInMeters &&
        type == _other.type &&
        countryCode == _other.countryCode &&
        stateCode == _other.stateCode &&
        speedLimits == _other.speedLimits &&
        distanceType == _other.distanceType;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + distanceToBorderCrossingInMeters.hashCode;
    result = 31 * result + type.hashCode;
    result = 31 * result + countryCode.hashCode;
    result = 31 * result + stateCode.hashCode;
    result = 31 * result + speedLimits.hashCode;
    result = 31 * result + distanceType.hashCode;
    return result;
  }
}


// BorderCrossingWarning "private" section, not exported.

final _sdkNavigationBordercrossingwarningCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double, Uint32, Uint32, Pointer<Void>, Pointer<Void>, Uint32),
    Pointer<Void> Function(double, int, int, Pointer<Void>, Pointer<Void>, int)
  >('here_sdk_sdk_navigation_BorderCrossingWarning_create_handle'));
final _sdkNavigationBordercrossingwarningReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_BorderCrossingWarning_release_handle'));
final _sdkNavigationBordercrossingwarningGetFielddistanceToBorderCrossingInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_BorderCrossingWarning_get_field_distanceToBorderCrossingInMeters'));
final _sdkNavigationBordercrossingwarningGetFieldtype = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_BorderCrossingWarning_get_field_type'));
final _sdkNavigationBordercrossingwarningGetFieldcountryCode = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_BorderCrossingWarning_get_field_countryCode'));
final _sdkNavigationBordercrossingwarningGetFieldstateCode = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_BorderCrossingWarning_get_field_stateCode'));
final _sdkNavigationBordercrossingwarningGetFieldspeedLimits = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_BorderCrossingWarning_get_field_speedLimits'));
final _sdkNavigationBordercrossingwarningGetFielddistanceType = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_BorderCrossingWarning_get_field_distanceType'));



Pointer<Void> sdkNavigationBordercrossingwarningToFfi(BorderCrossingWarning value) {
  final _distanceToBorderCrossingInMetersHandle = (value.distanceToBorderCrossingInMeters);
  final _typeHandle = sdkNavigationBordercrossingtypeToFfi(value.type);
  final _countryCodeHandle = sdkCoreCountrycodeToFfi(value.countryCode);
  final _stateCodeHandle = stringToFfiNullable(value.stateCode);
  final _speedLimitsHandle = sdkTransportGeneralvehiclespeedlimitsToFfi(value.speedLimits);
  final _distanceTypeHandle = sdkNavigationDistancetypeToFfi(value.distanceType);
  final _result = _sdkNavigationBordercrossingwarningCreateHandle(_distanceToBorderCrossingInMetersHandle, _typeHandle, _countryCodeHandle, _stateCodeHandle, _speedLimitsHandle, _distanceTypeHandle);
  
  sdkNavigationBordercrossingtypeReleaseFfiHandle(_typeHandle);
  sdkCoreCountrycodeReleaseFfiHandle(_countryCodeHandle);
  stringReleaseFfiHandleNullable(_stateCodeHandle);
  sdkTransportGeneralvehiclespeedlimitsReleaseFfiHandle(_speedLimitsHandle);
  sdkNavigationDistancetypeReleaseFfiHandle(_distanceTypeHandle);
  return _result;
}

BorderCrossingWarning sdkNavigationBordercrossingwarningFromFfi(Pointer<Void> handle) {
  final _distanceToBorderCrossingInMetersHandle = _sdkNavigationBordercrossingwarningGetFielddistanceToBorderCrossingInMeters(handle);
  final _typeHandle = _sdkNavigationBordercrossingwarningGetFieldtype(handle);
  final _countryCodeHandle = _sdkNavigationBordercrossingwarningGetFieldcountryCode(handle);
  final _stateCodeHandle = _sdkNavigationBordercrossingwarningGetFieldstateCode(handle);
  final _speedLimitsHandle = _sdkNavigationBordercrossingwarningGetFieldspeedLimits(handle);
  final _distanceTypeHandle = _sdkNavigationBordercrossingwarningGetFielddistanceType(handle);
  try {
    return BorderCrossingWarning._(
      (_distanceToBorderCrossingInMetersHandle), 
      sdkNavigationBordercrossingtypeFromFfi(_typeHandle), 
      sdkCoreCountrycodeFromFfi(_countryCodeHandle), 
      stringFromFfiNullable(_stateCodeHandle), 
      sdkTransportGeneralvehiclespeedlimitsFromFfi(_speedLimitsHandle), 
      sdkNavigationDistancetypeFromFfi(_distanceTypeHandle)
    );
  } finally {
    
    sdkNavigationBordercrossingtypeReleaseFfiHandle(_typeHandle);
    sdkCoreCountrycodeReleaseFfiHandle(_countryCodeHandle);
    stringReleaseFfiHandleNullable(_stateCodeHandle);
    sdkTransportGeneralvehiclespeedlimitsReleaseFfiHandle(_speedLimitsHandle);
    sdkNavigationDistancetypeReleaseFfiHandle(_distanceTypeHandle);
  }
}

void sdkNavigationBordercrossingwarningReleaseFfiHandle(Pointer<Void> handle) => _sdkNavigationBordercrossingwarningReleaseHandle(handle);

// Nullable BorderCrossingWarning

final _sdkNavigationBordercrossingwarningCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_BorderCrossingWarning_create_handle_nullable'));
final _sdkNavigationBordercrossingwarningReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_BorderCrossingWarning_release_handle_nullable'));
final _sdkNavigationBordercrossingwarningGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_BorderCrossingWarning_get_value_nullable'));

Pointer<Void> sdkNavigationBordercrossingwarningToFfiNullable(BorderCrossingWarning? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationBordercrossingwarningToFfi(value);
  final result = _sdkNavigationBordercrossingwarningCreateHandleNullable(_handle);
  sdkNavigationBordercrossingwarningReleaseFfiHandle(_handle);
  return result;
}

BorderCrossingWarning? sdkNavigationBordercrossingwarningFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationBordercrossingwarningGetValueNullable(handle);
  final result = sdkNavigationBordercrossingwarningFromFfi(_handle);
  sdkNavigationBordercrossingwarningReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationBordercrossingwarningReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationBordercrossingwarningReleaseHandleNullable(handle);

// End of BorderCrossingWarning "private" section.


