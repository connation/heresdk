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
import 'package:here_sdk/src/sdk/core/integer_range.dart';
import 'package:here_sdk/src/sdk/core/time_rule.dart';
import 'package:here_sdk/src/sdk/navigation/dimension_restriction.dart';
import 'package:here_sdk/src/sdk/navigation/distance_type.dart';
import 'package:here_sdk/src/sdk/navigation/truck_restriction_warning_type.dart';
import 'package:here_sdk/src/sdk/navigation/weight_restriction.dart';
import 'package:here_sdk/src/sdk/transport/hazardous_material.dart';
import 'package:here_sdk/src/sdk/transport/truck_road_type.dart';
import 'package:here_sdk/src/sdk/transport/tunnel_category.dart';

/// Represents truck restrictions.
///
/// For example, there can be a bridge ahead not high enough to pass a big truck
/// or there can be a road ahead where the weight of the truck is beyond it's permissible weight.

class TruckRestrictionWarning {
  /// The distance from the current location to the restriction.
  double distanceInMeters;

  /// Weight restriction.
  /// It is `null` when there is no known weight restriction ahead.
  WeightRestriction? weightRestriction;

  /// Vehicle dimension restrictions.
  /// It is `null` when there is no known dimension restriction ahead.
  DimensionRestriction? dimensionRestriction;

  /// Indicates if the specified truck restriction is ahead of the vehicle or has just passed by. If it is ahead, then [TruckRestrictionWarning.distanceInMeters] is greater than 0.
  DistanceType distanceType;

  /// Indicates the type of the truck restriction warning.
  ///
  /// **Note**: This is a beta release of this feature, so there could be a few bugs and unexpected
  /// behaviors. Related APIs may change for new releases without a deprecation process.
  @Deprecated("Will be removed in v4.20.0. Please check all TruckRestrictionWarning fields in order to announce/display the correct truck restriction.")
  TruckRestrictionWarningType type;

  /// The trailer count for which the current restriction applies.
  /// If the field is 'null' then the current restriction does not have a condition based on trailers count.
  IntegerRange? trailerCount;

  /// Time rule indicating the time periods for which the restriction applies.
  /// If the field is 'null' then the restriction is applicable at anytime.
  TimeRule? timeRule;

  /// Truck road type restriction.
  TruckRoadType? truckRoadType;

  /// Hazardous materials.
  List<HazardousMaterial> hazardousMaterials;

  /// Tunnel category.
  TunnelCategory? tunnelCategory;

  /// The axle count for which the current restriction applies.
  /// If the field is 'null' then the current restriction does not have a condition based on axle count.
  IntegerRange? axleCount;

  /// Creates a new instance.

  /// [distanceInMeters] The distance from the current location to the restriction.

  /// [weightRestriction] Weight restriction.
  /// It is `null` when there is no known weight restriction ahead.

  /// [dimensionRestriction] Vehicle dimension restrictions.
  /// It is `null` when there is no known dimension restriction ahead.

  /// [distanceType] Indicates if the specified truck restriction is ahead of the vehicle or has just passed by. If it is ahead, then [TruckRestrictionWarning.distanceInMeters] is greater than 0.

  /// [type] Indicates the type of the truck restriction warning.
  ///
  /// **Note**: This is a beta release of this feature, so there could be a few bugs and unexpected
  /// behaviors. Related APIs may change for new releases without a deprecation process.

  /// [trailerCount] The trailer count for which the current restriction applies.
  /// If the field is 'null' then the current restriction does not have a condition based on trailers count.

  /// [timeRule] Time rule indicating the time periods for which the restriction applies.
  /// If the field is 'null' then the restriction is applicable at anytime.

  /// [truckRoadType] Truck road type restriction.

  /// [hazardousMaterials] Hazardous materials.

  /// [tunnelCategory] Tunnel category.

  /// [axleCount] The axle count for which the current restriction applies.
  /// If the field is 'null' then the current restriction does not have a condition based on axle count.

  TruckRestrictionWarning._(this.distanceInMeters, this.weightRestriction, this.dimensionRestriction, this.distanceType, this.type, this.trailerCount, this.timeRule, this.truckRoadType, this.hazardousMaterials, this.tunnelCategory, this.axleCount);
  /// Creates a new instance.
  /// [distanceInMeters] The distance from the current location to the restriction.
  /// [weightRestriction] Weight restriction.
  /// It is `null` when there is no known weight restriction ahead.
  /// [dimensionRestriction] Vehicle dimension restrictions.
  /// It is `null` when there is no known dimension restriction ahead.
  /// [distanceType] Indicates if the specified truck restriction is ahead of the vehicle or has just passed by. If it is ahead, then [TruckRestrictionWarning.distanceInMeters] is greater than 0.
  /// [type] Indicates the type of the truck restriction warning.
  ///
  /// **Note**: This is a beta release of this feature, so there could be a few bugs and unexpected
  /// behaviors. Related APIs may change for new releases without a deprecation process.
  /// [trailerCount] The trailer count for which the current restriction applies.
  /// If the field is 'null' then the current restriction does not have a condition based on trailers count.
  /// [timeRule] Time rule indicating the time periods for which the restriction applies.
  /// If the field is 'null' then the restriction is applicable at anytime.
  @Deprecated("Will be removed in v4.20.0. Use the constructor containing all fields instead.")
  TruckRestrictionWarning(this.distanceInMeters, this.weightRestriction, this.dimensionRestriction, this.distanceType, this.type, this.trailerCount, this.timeRule)
      : truckRoadType = null, hazardousMaterials = [], tunnelCategory = null, axleCount = null;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TruckRestrictionWarning) return false;
    TruckRestrictionWarning _other = other;
    return distanceInMeters == _other.distanceInMeters &&
        weightRestriction == _other.weightRestriction &&
        dimensionRestriction == _other.dimensionRestriction &&
        distanceType == _other.distanceType &&
        type == _other.type &&
        trailerCount == _other.trailerCount &&
        timeRule == _other.timeRule &&
        truckRoadType == _other.truckRoadType &&
        DeepCollectionEquality().equals(hazardousMaterials, _other.hazardousMaterials) &&
        tunnelCategory == _other.tunnelCategory &&
        axleCount == _other.axleCount;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + distanceInMeters.hashCode;
    result = 31 * result + weightRestriction.hashCode;
    result = 31 * result + dimensionRestriction.hashCode;
    result = 31 * result + distanceType.hashCode;
    result = 31 * result + type.hashCode;
    result = 31 * result + trailerCount.hashCode;
    result = 31 * result + timeRule.hashCode;
    result = 31 * result + truckRoadType.hashCode;
    result = 31 * result + DeepCollectionEquality().hash(hazardousMaterials);
    result = 31 * result + tunnelCategory.hashCode;
    result = 31 * result + axleCount.hashCode;
    return result;
  }
}


// TruckRestrictionWarning "private" section, not exported.

final _sdkNavigationTruckrestrictionwarningCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double, Pointer<Void>, Pointer<Void>, Uint32, Uint32, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(double, Pointer<Void>, Pointer<Void>, int, int, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_navigation_TruckRestrictionWarning_create_handle'));
final _sdkNavigationTruckrestrictionwarningReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TruckRestrictionWarning_release_handle'));
final _sdkNavigationTruckrestrictionwarningGetFielddistanceInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TruckRestrictionWarning_get_field_distanceInMeters'));
final _sdkNavigationTruckrestrictionwarningGetFieldweightRestriction = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TruckRestrictionWarning_get_field_weightRestriction'));
final _sdkNavigationTruckrestrictionwarningGetFielddimensionRestriction = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TruckRestrictionWarning_get_field_dimensionRestriction'));
final _sdkNavigationTruckrestrictionwarningGetFielddistanceType = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TruckRestrictionWarning_get_field_distanceType'));
final _sdkNavigationTruckrestrictionwarningGetFieldtype = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TruckRestrictionWarning_get_field_type'));
final _sdkNavigationTruckrestrictionwarningGetFieldtrailerCount = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TruckRestrictionWarning_get_field_trailerCount'));
final _sdkNavigationTruckrestrictionwarningGetFieldtimeRule = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TruckRestrictionWarning_get_field_timeRule'));
final _sdkNavigationTruckrestrictionwarningGetFieldtruckRoadType = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TruckRestrictionWarning_get_field_truckRoadType'));
final _sdkNavigationTruckrestrictionwarningGetFieldhazardousMaterials = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TruckRestrictionWarning_get_field_hazardousMaterials'));
final _sdkNavigationTruckrestrictionwarningGetFieldtunnelCategory = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TruckRestrictionWarning_get_field_tunnelCategory'));
final _sdkNavigationTruckrestrictionwarningGetFieldaxleCount = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TruckRestrictionWarning_get_field_axleCount'));



Pointer<Void> sdkNavigationTruckrestrictionwarningToFfi(TruckRestrictionWarning value) {
  final _distanceInMetersHandle = (value.distanceInMeters);
  final _weightRestrictionHandle = sdkNavigationWeightrestrictionToFfiNullable(value.weightRestriction);
  final _dimensionRestrictionHandle = sdkNavigationDimensionrestrictionToFfiNullable(value.dimensionRestriction);
  final _distanceTypeHandle = sdkNavigationDistancetypeToFfi(value.distanceType);
  final _typeHandle = sdkNavigationTruckrestrictionwarningtypeToFfi(value.type);
  final _trailerCountHandle = sdkCoreIntegerrangeToFfiNullable(value.trailerCount);
  final _timeRuleHandle = sdkCoreTimeruleToFfiNullable(value.timeRule);
  final _truckRoadTypeHandle = sdkTransportTruckroadtypeToFfiNullable(value.truckRoadType);
  final _hazardousMaterialsHandle = heresdkNavigationBindingslistofSdkTransportHazardousmaterialToFfi(value.hazardousMaterials);
  final _tunnelCategoryHandle = sdkTransportTunnelcategoryToFfiNullable(value.tunnelCategory);
  final _axleCountHandle = sdkCoreIntegerrangeToFfiNullable(value.axleCount);
  final _result = _sdkNavigationTruckrestrictionwarningCreateHandle(_distanceInMetersHandle, _weightRestrictionHandle, _dimensionRestrictionHandle, _distanceTypeHandle, _typeHandle, _trailerCountHandle, _timeRuleHandle, _truckRoadTypeHandle, _hazardousMaterialsHandle, _tunnelCategoryHandle, _axleCountHandle);
  
  sdkNavigationWeightrestrictionReleaseFfiHandleNullable(_weightRestrictionHandle);
  sdkNavigationDimensionrestrictionReleaseFfiHandleNullable(_dimensionRestrictionHandle);
  sdkNavigationDistancetypeReleaseFfiHandle(_distanceTypeHandle);
  sdkNavigationTruckrestrictionwarningtypeReleaseFfiHandle(_typeHandle);
  sdkCoreIntegerrangeReleaseFfiHandleNullable(_trailerCountHandle);
  sdkCoreTimeruleReleaseFfiHandleNullable(_timeRuleHandle);
  sdkTransportTruckroadtypeReleaseFfiHandleNullable(_truckRoadTypeHandle);
  heresdkNavigationBindingslistofSdkTransportHazardousmaterialReleaseFfiHandle(_hazardousMaterialsHandle);
  sdkTransportTunnelcategoryReleaseFfiHandleNullable(_tunnelCategoryHandle);
  sdkCoreIntegerrangeReleaseFfiHandleNullable(_axleCountHandle);
  return _result;
}

TruckRestrictionWarning sdkNavigationTruckrestrictionwarningFromFfi(Pointer<Void> handle) {
  final _distanceInMetersHandle = _sdkNavigationTruckrestrictionwarningGetFielddistanceInMeters(handle);
  final _weightRestrictionHandle = _sdkNavigationTruckrestrictionwarningGetFieldweightRestriction(handle);
  final _dimensionRestrictionHandle = _sdkNavigationTruckrestrictionwarningGetFielddimensionRestriction(handle);
  final _distanceTypeHandle = _sdkNavigationTruckrestrictionwarningGetFielddistanceType(handle);
  final _typeHandle = _sdkNavigationTruckrestrictionwarningGetFieldtype(handle);
  final _trailerCountHandle = _sdkNavigationTruckrestrictionwarningGetFieldtrailerCount(handle);
  final _timeRuleHandle = _sdkNavigationTruckrestrictionwarningGetFieldtimeRule(handle);
  final _truckRoadTypeHandle = _sdkNavigationTruckrestrictionwarningGetFieldtruckRoadType(handle);
  final _hazardousMaterialsHandle = _sdkNavigationTruckrestrictionwarningGetFieldhazardousMaterials(handle);
  final _tunnelCategoryHandle = _sdkNavigationTruckrestrictionwarningGetFieldtunnelCategory(handle);
  final _axleCountHandle = _sdkNavigationTruckrestrictionwarningGetFieldaxleCount(handle);
  try {
    return TruckRestrictionWarning._(
      (_distanceInMetersHandle), 
      sdkNavigationWeightrestrictionFromFfiNullable(_weightRestrictionHandle), 
      sdkNavigationDimensionrestrictionFromFfiNullable(_dimensionRestrictionHandle), 
      sdkNavigationDistancetypeFromFfi(_distanceTypeHandle), 
      sdkNavigationTruckrestrictionwarningtypeFromFfi(_typeHandle), 
      sdkCoreIntegerrangeFromFfiNullable(_trailerCountHandle), 
      sdkCoreTimeruleFromFfiNullable(_timeRuleHandle), 
      sdkTransportTruckroadtypeFromFfiNullable(_truckRoadTypeHandle), 
      heresdkNavigationBindingslistofSdkTransportHazardousmaterialFromFfi(_hazardousMaterialsHandle), 
      sdkTransportTunnelcategoryFromFfiNullable(_tunnelCategoryHandle), 
      sdkCoreIntegerrangeFromFfiNullable(_axleCountHandle)
    );
  } finally {
    
    sdkNavigationWeightrestrictionReleaseFfiHandleNullable(_weightRestrictionHandle);
    sdkNavigationDimensionrestrictionReleaseFfiHandleNullable(_dimensionRestrictionHandle);
    sdkNavigationDistancetypeReleaseFfiHandle(_distanceTypeHandle);
    sdkNavigationTruckrestrictionwarningtypeReleaseFfiHandle(_typeHandle);
    sdkCoreIntegerrangeReleaseFfiHandleNullable(_trailerCountHandle);
    sdkCoreTimeruleReleaseFfiHandleNullable(_timeRuleHandle);
    sdkTransportTruckroadtypeReleaseFfiHandleNullable(_truckRoadTypeHandle);
    heresdkNavigationBindingslistofSdkTransportHazardousmaterialReleaseFfiHandle(_hazardousMaterialsHandle);
    sdkTransportTunnelcategoryReleaseFfiHandleNullable(_tunnelCategoryHandle);
    sdkCoreIntegerrangeReleaseFfiHandleNullable(_axleCountHandle);
  }
}

void sdkNavigationTruckrestrictionwarningReleaseFfiHandle(Pointer<Void> handle) => _sdkNavigationTruckrestrictionwarningReleaseHandle(handle);

// Nullable TruckRestrictionWarning

final _sdkNavigationTruckrestrictionwarningCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TruckRestrictionWarning_create_handle_nullable'));
final _sdkNavigationTruckrestrictionwarningReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TruckRestrictionWarning_release_handle_nullable'));
final _sdkNavigationTruckrestrictionwarningGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TruckRestrictionWarning_get_value_nullable'));

Pointer<Void> sdkNavigationTruckrestrictionwarningToFfiNullable(TruckRestrictionWarning? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationTruckrestrictionwarningToFfi(value);
  final result = _sdkNavigationTruckrestrictionwarningCreateHandleNullable(_handle);
  sdkNavigationTruckrestrictionwarningReleaseFfiHandle(_handle);
  return result;
}

TruckRestrictionWarning? sdkNavigationTruckrestrictionwarningFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationTruckrestrictionwarningGetValueNullable(handle);
  final result = sdkNavigationTruckrestrictionwarningFromFfi(_handle);
  sdkNavigationTruckrestrictionwarningReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationTruckrestrictionwarningReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationTruckrestrictionwarningReleaseHandleNullable(handle);

// End of TruckRestrictionWarning "private" section.


