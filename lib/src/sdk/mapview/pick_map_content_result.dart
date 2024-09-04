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
import 'package:here_sdk/src/_native_base.dart' as __lib;
import 'package:here_sdk/src/_token_cache.dart' as __lib;
import 'package:here_sdk/src/_type_repository.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';
import 'package:here_sdk/src/sdk/core/localized_text.dart';
import 'package:here_sdk/src/sdk/core/picked_place.dart';
import 'package:here_sdk/src/sdk/traffic/traffic_incident_base.dart';
import 'package:here_sdk/src/sdk/traffic/traffic_incident_impact.dart';
import 'package:here_sdk/src/sdk/traffic/traffic_incident_type.dart';

/// A class that contains possible results from picking map content on the map scene.
abstract class PickMapContentResult {

  /// Gets a list of picked places containing the POIs at the location of picking.
  List<PickedPlace> get pickedPlaces;

  /// Gets the list of traffic incidents at the location of picking.
  List<PickTrafficIncidentResult> get trafficIncidents;

  /// Gets the list of vehicle restrictions at the location of picking, sorted
  /// by distance to the center of the picking rectangle.
  List<PickVehicleRestrictionsResult> get vehicleRestrictions;

}

/// Carries the result of picking a vehicle restriction object.

class PickVehicleRestrictionsResult {
  /// The text of the vehicle restriction. It will vary depending on the region. For example
  /// for a height restriction the text might be 5.5m in Germany and 12'5" in the US.
  /// The text might be empty for example in case of a general truck restriction.
  String text;

  /// The geographic coordinates of the vehicle restriction.
  GeoCoordinates coordinates;

  /// The type of vehicle restriction. It can have the following values:
  /// - A restriction like "HEIGHT" or "WEIGHT". For a list of possible values of this kind
  ///   check [the vehicle restriction type documentation](https://www.here.com/docs/bundle/map-content-schema-data-specification/page/topics_schema/transportrestriction.restrictiontype.html).
  ///   Please note that the specific axles categories are generalized to AXLES_AMOUNT or
  ///   AXLES_IN_GROUP_AMOUNT respectively.
  /// - A hazardous material restriction like "HARMFUL_TO_WATER" or "EXPLOSIVES". For a list of
  ///   possible values of this kind check [the hazardous materials documentation](https://www.here.com/docs/bundle/map-content-schema-data-specification/page/topics_schema/hazardousmaterialtype.html)
  /// - A tunnel category like "TUNNEL_CATEGORY_E". These are also documented in
  ///   [the hazardous materials documentation](https://www.here.com/docs/bundle/map-content-schema-data-specification/page/topics_schema/hazardousmaterialtype.html)
  String restrictionType;

  /// Category of the restriction. Empty if not specified.
  String restrictionCategory;

  /// Country code in ISO 3166-1 alpha-2 format. Empty if not specified.
  String countryCode;

  /// A string representing the validity time intervals of the sign in GDF time domains format
  /// according to ISO 14825. If there are no times of validity then the string will be empty.
  String timeIntervals;

  /// Creates a new instance.
  /// [text] The text of the vehicle restriction. It will vary depending on the region. For example
  /// for a height restriction the text might be 5.5m in Germany and 12'5" in the US.
  /// The text might be empty for example in case of a general truck restriction.
  /// [coordinates] The geographic coordinates of the vehicle restriction.
  /// [restrictionType] The type of vehicle restriction. It can have the following values:
  /// - A restriction like "HEIGHT" or "WEIGHT". For a list of possible values of this kind
  ///   check [the vehicle restriction type documentation](https://www.here.com/docs/bundle/map-content-schema-data-specification/page/topics_schema/transportrestriction.restrictiontype.html).
  ///   Please note that the specific axles categories are generalized to AXLES_AMOUNT or
  ///   AXLES_IN_GROUP_AMOUNT respectively.
  /// - A hazardous material restriction like "HARMFUL_TO_WATER" or "EXPLOSIVES". For a list of
  ///   possible values of this kind check [the hazardous materials documentation](https://www.here.com/docs/bundle/map-content-schema-data-specification/page/topics_schema/hazardousmaterialtype.html)
  /// - A tunnel category like "TUNNEL_CATEGORY_E". These are also documented in
  ///   [the hazardous materials documentation](https://www.here.com/docs/bundle/map-content-schema-data-specification/page/topics_schema/hazardousmaterialtype.html)
  /// [restrictionCategory] Category of the restriction. Empty if not specified.
  /// [countryCode] Country code in ISO 3166-1 alpha-2 format. Empty if not specified.
  /// [timeIntervals] A string representing the validity time intervals of the sign in GDF time domains format
  /// according to ISO 14825. If there are no times of validity then the string will be empty.
  PickVehicleRestrictionsResult.withCategoryAndCountryCode(this.text, this.coordinates, this.restrictionType, this.restrictionCategory, this.countryCode, this.timeIntervals);
  /// Creates a new instance.
  /// [text] The text of the vehicle restriction. It will vary depending on the region. For example
  /// for a height restriction the text might be 5.5m in Germany and 12'5" in the US.
  /// The text might be empty for example in case of a general truck restriction.
  /// [coordinates] The geographic coordinates of the vehicle restriction.
  /// [restrictionType] The type of vehicle restriction. It can have the following values:
  /// - A restriction like "HEIGHT" or "WEIGHT". For a list of possible values of this kind
  ///   check [the vehicle restriction type documentation](https://www.here.com/docs/bundle/map-content-schema-data-specification/page/topics_schema/transportrestriction.restrictiontype.html).
  ///   Please note that the specific axles categories are generalized to AXLES_AMOUNT or
  ///   AXLES_IN_GROUP_AMOUNT respectively.
  /// - A hazardous material restriction like "HARMFUL_TO_WATER" or "EXPLOSIVES". For a list of
  ///   possible values of this kind check [the hazardous materials documentation](https://www.here.com/docs/bundle/map-content-schema-data-specification/page/topics_schema/hazardousmaterialtype.html)
  /// - A tunnel category like "TUNNEL_CATEGORY_E". These are also documented in
  ///   [the hazardous materials documentation](https://www.here.com/docs/bundle/map-content-schema-data-specification/page/topics_schema/hazardousmaterialtype.html)
  /// [timeIntervals] A string representing the validity time intervals of the sign in GDF time domains format
  /// according to ISO 14825. If there are no times of validity then the string will be empty.
  PickVehicleRestrictionsResult(this.text, this.coordinates, this.restrictionType, this.timeIntervals)
      : restrictionCategory = "", countryCode = "";
}


// PickVehicleRestrictionsResult "private" section, not exported.

final _sdkMapviewPickmapcontentresultVehiclerestrictionresultCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_mapview_PickMapContentResult_VehicleRestrictionResult_create_handle'));
final _sdkMapviewPickmapcontentresultVehiclerestrictionresultReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_PickMapContentResult_VehicleRestrictionResult_release_handle'));
final _sdkMapviewPickmapcontentresultVehiclerestrictionresultGetFieldtext = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_PickMapContentResult_VehicleRestrictionResult_get_field_text'));
final _sdkMapviewPickmapcontentresultVehiclerestrictionresultGetFieldcoordinates = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_PickMapContentResult_VehicleRestrictionResult_get_field_coordinates'));
final _sdkMapviewPickmapcontentresultVehiclerestrictionresultGetFieldrestrictionType = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_PickMapContentResult_VehicleRestrictionResult_get_field_restrictionType'));
final _sdkMapviewPickmapcontentresultVehiclerestrictionresultGetFieldrestrictionCategory = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_PickMapContentResult_VehicleRestrictionResult_get_field_restrictionCategory'));
final _sdkMapviewPickmapcontentresultVehiclerestrictionresultGetFieldcountryCode = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_PickMapContentResult_VehicleRestrictionResult_get_field_countryCode'));
final _sdkMapviewPickmapcontentresultVehiclerestrictionresultGetFieldtimeIntervals = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_PickMapContentResult_VehicleRestrictionResult_get_field_timeIntervals'));



Pointer<Void> sdkMapviewPickmapcontentresultVehiclerestrictionresultToFfi(PickVehicleRestrictionsResult value) {
  final _textHandle = stringToFfi(value.text);
  final _coordinatesHandle = sdkCoreGeocoordinatesToFfi(value.coordinates);
  final _restrictionTypeHandle = stringToFfi(value.restrictionType);
  final _restrictionCategoryHandle = stringToFfi(value.restrictionCategory);
  final _countryCodeHandle = stringToFfi(value.countryCode);
  final _timeIntervalsHandle = stringToFfi(value.timeIntervals);
  final _result = _sdkMapviewPickmapcontentresultVehiclerestrictionresultCreateHandle(_textHandle, _coordinatesHandle, _restrictionTypeHandle, _restrictionCategoryHandle, _countryCodeHandle, _timeIntervalsHandle);
  stringReleaseFfiHandle(_textHandle);
  sdkCoreGeocoordinatesReleaseFfiHandle(_coordinatesHandle);
  stringReleaseFfiHandle(_restrictionTypeHandle);
  stringReleaseFfiHandle(_restrictionCategoryHandle);
  stringReleaseFfiHandle(_countryCodeHandle);
  stringReleaseFfiHandle(_timeIntervalsHandle);
  return _result;
}

PickVehicleRestrictionsResult sdkMapviewPickmapcontentresultVehiclerestrictionresultFromFfi(Pointer<Void> handle) {
  final _textHandle = _sdkMapviewPickmapcontentresultVehiclerestrictionresultGetFieldtext(handle);
  final _coordinatesHandle = _sdkMapviewPickmapcontentresultVehiclerestrictionresultGetFieldcoordinates(handle);
  final _restrictionTypeHandle = _sdkMapviewPickmapcontentresultVehiclerestrictionresultGetFieldrestrictionType(handle);
  final _restrictionCategoryHandle = _sdkMapviewPickmapcontentresultVehiclerestrictionresultGetFieldrestrictionCategory(handle);
  final _countryCodeHandle = _sdkMapviewPickmapcontentresultVehiclerestrictionresultGetFieldcountryCode(handle);
  final _timeIntervalsHandle = _sdkMapviewPickmapcontentresultVehiclerestrictionresultGetFieldtimeIntervals(handle);
  try {
    return PickVehicleRestrictionsResult.withCategoryAndCountryCode(
      stringFromFfi(_textHandle), 
      sdkCoreGeocoordinatesFromFfi(_coordinatesHandle), 
      stringFromFfi(_restrictionTypeHandle), 
      stringFromFfi(_restrictionCategoryHandle), 
      stringFromFfi(_countryCodeHandle), 
      stringFromFfi(_timeIntervalsHandle)
    );
  } finally {
    stringReleaseFfiHandle(_textHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_coordinatesHandle);
    stringReleaseFfiHandle(_restrictionTypeHandle);
    stringReleaseFfiHandle(_restrictionCategoryHandle);
    stringReleaseFfiHandle(_countryCodeHandle);
    stringReleaseFfiHandle(_timeIntervalsHandle);
  }
}

void sdkMapviewPickmapcontentresultVehiclerestrictionresultReleaseFfiHandle(Pointer<Void> handle) => _sdkMapviewPickmapcontentresultVehiclerestrictionresultReleaseHandle(handle);

// Nullable PickVehicleRestrictionsResult

final _sdkMapviewPickmapcontentresultVehiclerestrictionresultCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_PickMapContentResult_VehicleRestrictionResult_create_handle_nullable'));
final _sdkMapviewPickmapcontentresultVehiclerestrictionresultReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_PickMapContentResult_VehicleRestrictionResult_release_handle_nullable'));
final _sdkMapviewPickmapcontentresultVehiclerestrictionresultGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_PickMapContentResult_VehicleRestrictionResult_get_value_nullable'));

Pointer<Void> sdkMapviewPickmapcontentresultVehiclerestrictionresultToFfiNullable(PickVehicleRestrictionsResult? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewPickmapcontentresultVehiclerestrictionresultToFfi(value);
  final result = _sdkMapviewPickmapcontentresultVehiclerestrictionresultCreateHandleNullable(_handle);
  sdkMapviewPickmapcontentresultVehiclerestrictionresultReleaseFfiHandle(_handle);
  return result;
}

PickVehicleRestrictionsResult? sdkMapviewPickmapcontentresultVehiclerestrictionresultFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewPickmapcontentresultVehiclerestrictionresultGetValueNullable(handle);
  final result = sdkMapviewPickmapcontentresultVehiclerestrictionresultFromFfi(_handle);
  sdkMapviewPickmapcontentresultVehiclerestrictionresultReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewPickmapcontentresultVehiclerestrictionresultReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewPickmapcontentresultVehiclerestrictionresultReleaseHandleNullable(handle);

// End of PickVehicleRestrictionsResult "private" section.
/// Carries the result of picking a Carto traffic incident object.
///
/// Description of incident is currently not present in our map data, so
/// [TrafficIncidentBase.description] always returns an empty string.
abstract class PickTrafficIncidentResult implements TrafficIncidentBase {

  /// Gets the unique traffic event ID.
  /// Can be referenced when checking for updated traffic information
  /// for the specified event.
  String get originalId;

  /// Gets the geographic coordinates of the traffic incident.
  GeoCoordinates get coordinates;

}


// PickTrafficIncidentResult "private" section, not exported.

final _sdkMapviewPickmapcontentresultTrafficincidentresultRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_PickMapContentResult_TrafficIncidentResult_register_finalizer'));
final _sdkMapviewPickmapcontentresultTrafficincidentresultCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_PickMapContentResult_TrafficIncidentResult_copy_handle'));
final _sdkMapviewPickmapcontentresultTrafficincidentresultReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_PickMapContentResult_TrafficIncidentResult_release_handle'));
final _sdkMapviewPickmapcontentresultTrafficincidentresultGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_PickMapContentResult_TrafficIncidentResult_get_type_id'));


class PickTrafficIncidentResult$Impl extends __lib.NativeBase implements PickTrafficIncidentResult {

  PickTrafficIncidentResult$Impl(Pointer<Void> handle) : super(handle);

  @override
  String get originalId {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_PickMapContentResult_TrafficIncidentResult_originalId_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  GeoCoordinates get coordinates {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_PickMapContentResult_TrafficIncidentResult_coordinates_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreGeocoordinatesFromFfi(__resultHandle);
    } finally {
      sdkCoreGeocoordinatesReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  TrafficIncidentImpact get impact {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_PickMapContentResult_TrafficIncidentResult_impact_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkTrafficTrafficincidentimpactFromFfi(__resultHandle);
    } finally {
      sdkTrafficTrafficincidentimpactReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  TrafficIncidentType get type {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_PickMapContentResult_TrafficIncidentResult_type_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkTrafficTrafficincidenttypeFromFfi(__resultHandle);
    } finally {
      sdkTrafficTrafficincidenttypeReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  LocalizedText get description {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_PickMapContentResult_TrafficIncidentResult_description_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreLocalizedtextFromFfi(__resultHandle);
    } finally {
      sdkCoreLocalizedtextReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  DateTime? get startTime {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_PickMapContentResult_TrafficIncidentResult_startTime_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return dateFromFfiNullable(__resultHandle);
    } finally {
      dateReleaseFfiHandleNullable(__resultHandle);

    }

  }


  @override
  DateTime? get endTime {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_PickMapContentResult_TrafficIncidentResult_endTime_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return dateFromFfiNullable(__resultHandle);
    } finally {
      dateReleaseFfiHandleNullable(__resultHandle);

    }

  }



}

Pointer<Void> sdkMapviewPickmapcontentresultTrafficincidentresultToFfi(PickTrafficIncidentResult value) =>
  _sdkMapviewPickmapcontentresultTrafficincidentresultCopyHandle((value as __lib.NativeBase).handle);

PickTrafficIncidentResult sdkMapviewPickmapcontentresultTrafficincidentresultFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is PickTrafficIncidentResult) return instance;

  final _typeIdHandle = _sdkMapviewPickmapcontentresultTrafficincidentresultGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkMapviewPickmapcontentresultTrafficincidentresultCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : PickTrafficIncidentResult$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMapviewPickmapcontentresultTrafficincidentresultRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewPickmapcontentresultTrafficincidentresultReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewPickmapcontentresultTrafficincidentresultReleaseHandle(handle);

Pointer<Void> sdkMapviewPickmapcontentresultTrafficincidentresultToFfiNullable(PickTrafficIncidentResult? value) =>
  value != null ? sdkMapviewPickmapcontentresultTrafficincidentresultToFfi(value) : Pointer<Void>.fromAddress(0);

PickTrafficIncidentResult? sdkMapviewPickmapcontentresultTrafficincidentresultFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewPickmapcontentresultTrafficincidentresultFromFfi(handle) : null;

void sdkMapviewPickmapcontentresultTrafficincidentresultReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewPickmapcontentresultTrafficincidentresultReleaseHandle(handle);

// End of PickTrafficIncidentResult "private" section.

// PickMapContentResult "private" section, not exported.

final _sdkMapviewPickmapcontentresultRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_PickMapContentResult_register_finalizer'));
final _sdkMapviewPickmapcontentresultCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_PickMapContentResult_copy_handle'));
final _sdkMapviewPickmapcontentresultReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_PickMapContentResult_release_handle'));


class PickMapContentResult$Impl extends __lib.NativeBase implements PickMapContentResult {

  PickMapContentResult$Impl(Pointer<Void> handle) : super(handle);

  @override
  List<PickedPlace> get pickedPlaces {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_PickMapContentResult_pickedPlaces_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return heresdkMapviewHarpBindingslistofSdkCorePickedplaceFromFfi(__resultHandle);
    } finally {
      heresdkMapviewHarpBindingslistofSdkCorePickedplaceReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  List<PickTrafficIncidentResult> get trafficIncidents {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_PickMapContentResult_trafficIncidents_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return heresdkMapviewHarpBindingslistofSdkMapviewPickmapcontentresultTrafficincidentresultFromFfi(__resultHandle);
    } finally {
      heresdkMapviewHarpBindingslistofSdkMapviewPickmapcontentresultTrafficincidentresultReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  List<PickVehicleRestrictionsResult> get vehicleRestrictions {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_PickMapContentResult_vehicleRestrictions_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return heresdkMapviewHarpBindingslistofSdkMapviewPickmapcontentresultVehiclerestrictionresultFromFfi(__resultHandle);
    } finally {
      heresdkMapviewHarpBindingslistofSdkMapviewPickmapcontentresultVehiclerestrictionresultReleaseFfiHandle(__resultHandle);

    }

  }



}

Pointer<Void> sdkMapviewPickmapcontentresultToFfi(PickMapContentResult value) =>
  _sdkMapviewPickmapcontentresultCopyHandle((value as __lib.NativeBase).handle);

PickMapContentResult sdkMapviewPickmapcontentresultFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is PickMapContentResult) return instance;

  final _copiedHandle = _sdkMapviewPickmapcontentresultCopyHandle(handle);
  final result = PickMapContentResult$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMapviewPickmapcontentresultRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewPickmapcontentresultReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewPickmapcontentresultReleaseHandle(handle);

Pointer<Void> sdkMapviewPickmapcontentresultToFfiNullable(PickMapContentResult? value) =>
  value != null ? sdkMapviewPickmapcontentresultToFfi(value) : Pointer<Void>.fromAddress(0);

PickMapContentResult? sdkMapviewPickmapcontentresultFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewPickmapcontentresultFromFfi(handle) : null;

void sdkMapviewPickmapcontentresultReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewPickmapcontentresultReleaseHandle(handle);

// End of PickMapContentResult "private" section.


