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
import 'package:here_sdk/src/sdk/navigation/general_warning_road_sign_type.dart';
import 'package:here_sdk/src/sdk/navigation/road_sign_category.dart';
import 'package:here_sdk/src/sdk/navigation/road_sign_type.dart';
import 'package:here_sdk/src/sdk/navigation/road_sign_vehicle_type.dart';

/// Road sign warning options.
///
/// Set the options to [NavigatorInterface.roadSignWarningOptions] for
/// filtering of road sign notifications.

class RoadSignWarningOptions {
  /// The list of road sign types for which a warning will be given. If the list is empty, road
  /// signs are not filtered by type.
  List<RoadSignType> typesFilter;

  /// The list of road sign categories for which a warning will be given. If the list is empty,
  /// road signs are not filtered by category.
  List<RoadSignCategory> categoriesFilter;

  /// The list of road sign general warning types for which a warning will be given. If the list is
  /// empty, road signs are not filtered by general warning type.
  List<GeneralWarningRoadSignType> generalWarningTypesFilter;

  /// The list of road sign vehicle types for which a warning will be given. If the list is empty,
  /// road signs are not filtered by vehicle type, which means that you get road sign warnings for all vehicle types.
  ///
  /// **Example:** For a filter that contains only bus and trucks you will only receive specific road sign warnings for
  /// bus and trucks - you will not get signs for the other types, such as heavy trucks or motorhomes.
  /// Furthermore, you will _not_ get any signs that are generally applicable for all vehicles. For example,
  /// you cannot set a filter that allows to get signs for trucks _and_ cars. If you want to get signs for standard vehicles
  /// like cars, then the only option is to set an empty list as filter.
  List<RoadSignVehicleType> vehicleTypesFilter;

  /// Warning distance setting for highways, in meters. Defaults to 1500 meters.
  /// **Note:** The road type (highway, rural or urban) is given by the speed limit on that particular road at the specified
  /// position and not by the actual road classification. Details about which speed limits are associated to which road type
  /// can be found in [DistanceType].
  int highwayWarningDistanceInMeters;

  /// Warning distance setting for rural roads, in meters. Defaults to 750 meters.
  /// **Note:** The road type (highway, rural or urban) is given by the speed limit on that particular road at the specified
  /// position and not by the actual road classification. Details about which speed limits are associated to which road type
  /// can be found in [DistanceType].
  int ruralWarningDistanceInMeters;

  /// Warning distance setting for urban roads, in meters. Defaults to 500 meters.
  /// **Note:** The road type (highway, rural or urban) is given by the speed limit on that particular road at the specified
  /// position and not by the actual road classification. Details about which speed limits are associated to which road type
  /// can be found in [DistanceType].
  int urbanWarningDistanceInMeters;

  /// Creates a new instance.

  /// [typesFilter] The list of road sign types for which a warning will be given. If the list is empty, road
  /// signs are not filtered by type.

  /// [categoriesFilter] The list of road sign categories for which a warning will be given. If the list is empty,
  /// road signs are not filtered by category.

  /// [generalWarningTypesFilter] The list of road sign general warning types for which a warning will be given. If the list is
  /// empty, road signs are not filtered by general warning type.

  /// [vehicleTypesFilter] The list of road sign vehicle types for which a warning will be given. If the list is empty,
  /// road signs are not filtered by vehicle type, which means that you get road sign warnings for all vehicle types.
  ///
  /// **Example:** For a filter that contains only bus and trucks you will only receive specific road sign warnings for
  /// bus and trucks - you will not get signs for the other types, such as heavy trucks or motorhomes.
  /// Furthermore, you will _not_ get any signs that are generally applicable for all vehicles. For example,
  /// you cannot set a filter that allows to get signs for trucks _and_ cars. If you want to get signs for standard vehicles
  /// like cars, then the only option is to set an empty list as filter.

  /// [highwayWarningDistanceInMeters] Warning distance setting for highways, in meters. Defaults to 1500 meters.
  /// **Note:** The road type (highway, rural or urban) is given by the speed limit on that particular road at the specified
  /// position and not by the actual road classification. Details about which speed limits are associated to which road type
  /// can be found in [DistanceType].

  /// [ruralWarningDistanceInMeters] Warning distance setting for rural roads, in meters. Defaults to 750 meters.
  /// **Note:** The road type (highway, rural or urban) is given by the speed limit on that particular road at the specified
  /// position and not by the actual road classification. Details about which speed limits are associated to which road type
  /// can be found in [DistanceType].

  /// [urbanWarningDistanceInMeters] Warning distance setting for urban roads, in meters. Defaults to 500 meters.
  /// **Note:** The road type (highway, rural or urban) is given by the speed limit on that particular road at the specified
  /// position and not by the actual road classification. Details about which speed limits are associated to which road type
  /// can be found in [DistanceType].

  RoadSignWarningOptions._(this.typesFilter, this.categoriesFilter, this.generalWarningTypesFilter, this.vehicleTypesFilter, this.highwayWarningDistanceInMeters, this.ruralWarningDistanceInMeters, this.urbanWarningDistanceInMeters);
  RoadSignWarningOptions()
    : typesFilter = [], categoriesFilter = [], generalWarningTypesFilter = [], vehicleTypesFilter = [], highwayWarningDistanceInMeters = 1500, ruralWarningDistanceInMeters = 750, urbanWarningDistanceInMeters = 500;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! RoadSignWarningOptions) return false;
    RoadSignWarningOptions _other = other;
    return DeepCollectionEquality().equals(typesFilter, _other.typesFilter) &&
        DeepCollectionEquality().equals(categoriesFilter, _other.categoriesFilter) &&
        DeepCollectionEquality().equals(generalWarningTypesFilter, _other.generalWarningTypesFilter) &&
        DeepCollectionEquality().equals(vehicleTypesFilter, _other.vehicleTypesFilter) &&
        highwayWarningDistanceInMeters == _other.highwayWarningDistanceInMeters &&
        ruralWarningDistanceInMeters == _other.ruralWarningDistanceInMeters &&
        urbanWarningDistanceInMeters == _other.urbanWarningDistanceInMeters;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + DeepCollectionEquality().hash(typesFilter);
    result = 31 * result + DeepCollectionEquality().hash(categoriesFilter);
    result = 31 * result + DeepCollectionEquality().hash(generalWarningTypesFilter);
    result = 31 * result + DeepCollectionEquality().hash(vehicleTypesFilter);
    result = 31 * result + highwayWarningDistanceInMeters.hashCode;
    result = 31 * result + ruralWarningDistanceInMeters.hashCode;
    result = 31 * result + urbanWarningDistanceInMeters.hashCode;
    return result;
  }
}


// RoadSignWarningOptions "private" section, not exported.

final _sdkNavigationRoadsignwarningoptionsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Int32, Int32, Int32),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, int, int, int)
  >('here_sdk_sdk_navigation_RoadSignWarningOptions_create_handle'));
final _sdkNavigationRoadsignwarningoptionsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadSignWarningOptions_release_handle'));
final _sdkNavigationRoadsignwarningoptionsGetFieldtypesFilter = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadSignWarningOptions_get_field_typesFilter'));
final _sdkNavigationRoadsignwarningoptionsGetFieldcategoriesFilter = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadSignWarningOptions_get_field_categoriesFilter'));
final _sdkNavigationRoadsignwarningoptionsGetFieldgeneralWarningTypesFilter = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadSignWarningOptions_get_field_generalWarningTypesFilter'));
final _sdkNavigationRoadsignwarningoptionsGetFieldvehicleTypesFilter = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadSignWarningOptions_get_field_vehicleTypesFilter'));
final _sdkNavigationRoadsignwarningoptionsGetFieldhighwayWarningDistanceInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadSignWarningOptions_get_field_highwayWarningDistanceInMeters'));
final _sdkNavigationRoadsignwarningoptionsGetFieldruralWarningDistanceInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadSignWarningOptions_get_field_ruralWarningDistanceInMeters'));
final _sdkNavigationRoadsignwarningoptionsGetFieldurbanWarningDistanceInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadSignWarningOptions_get_field_urbanWarningDistanceInMeters'));



Pointer<Void> sdkNavigationRoadsignwarningoptionsToFfi(RoadSignWarningOptions value) {
  final _typesFilterHandle = heresdkNavigationBindingslistofSdkNavigationRoadsigntypeToFfi(value.typesFilter);
  final _categoriesFilterHandle = heresdkNavigationBindingslistofSdkNavigationRoadsigncategoryToFfi(value.categoriesFilter);
  final _generalWarningTypesFilterHandle = heresdkNavigationBindingslistofSdkNavigationGeneralwarningroadsigntypeToFfi(value.generalWarningTypesFilter);
  final _vehicleTypesFilterHandle = heresdkNavigationBindingslistofSdkNavigationRoadsignvehicletypeToFfi(value.vehicleTypesFilter);
  final _highwayWarningDistanceInMetersHandle = (value.highwayWarningDistanceInMeters);
  final _ruralWarningDistanceInMetersHandle = (value.ruralWarningDistanceInMeters);
  final _urbanWarningDistanceInMetersHandle = (value.urbanWarningDistanceInMeters);
  final _result = _sdkNavigationRoadsignwarningoptionsCreateHandle(_typesFilterHandle, _categoriesFilterHandle, _generalWarningTypesFilterHandle, _vehicleTypesFilterHandle, _highwayWarningDistanceInMetersHandle, _ruralWarningDistanceInMetersHandle, _urbanWarningDistanceInMetersHandle);
  heresdkNavigationBindingslistofSdkNavigationRoadsigntypeReleaseFfiHandle(_typesFilterHandle);
  heresdkNavigationBindingslistofSdkNavigationRoadsigncategoryReleaseFfiHandle(_categoriesFilterHandle);
  heresdkNavigationBindingslistofSdkNavigationGeneralwarningroadsigntypeReleaseFfiHandle(_generalWarningTypesFilterHandle);
  heresdkNavigationBindingslistofSdkNavigationRoadsignvehicletypeReleaseFfiHandle(_vehicleTypesFilterHandle);
  
  
  
  return _result;
}

RoadSignWarningOptions sdkNavigationRoadsignwarningoptionsFromFfi(Pointer<Void> handle) {
  final _typesFilterHandle = _sdkNavigationRoadsignwarningoptionsGetFieldtypesFilter(handle);
  final _categoriesFilterHandle = _sdkNavigationRoadsignwarningoptionsGetFieldcategoriesFilter(handle);
  final _generalWarningTypesFilterHandle = _sdkNavigationRoadsignwarningoptionsGetFieldgeneralWarningTypesFilter(handle);
  final _vehicleTypesFilterHandle = _sdkNavigationRoadsignwarningoptionsGetFieldvehicleTypesFilter(handle);
  final _highwayWarningDistanceInMetersHandle = _sdkNavigationRoadsignwarningoptionsGetFieldhighwayWarningDistanceInMeters(handle);
  final _ruralWarningDistanceInMetersHandle = _sdkNavigationRoadsignwarningoptionsGetFieldruralWarningDistanceInMeters(handle);
  final _urbanWarningDistanceInMetersHandle = _sdkNavigationRoadsignwarningoptionsGetFieldurbanWarningDistanceInMeters(handle);
  try {
    return RoadSignWarningOptions._(
      heresdkNavigationBindingslistofSdkNavigationRoadsigntypeFromFfi(_typesFilterHandle), 
      heresdkNavigationBindingslistofSdkNavigationRoadsigncategoryFromFfi(_categoriesFilterHandle), 
      heresdkNavigationBindingslistofSdkNavigationGeneralwarningroadsigntypeFromFfi(_generalWarningTypesFilterHandle), 
      heresdkNavigationBindingslistofSdkNavigationRoadsignvehicletypeFromFfi(_vehicleTypesFilterHandle), 
      (_highwayWarningDistanceInMetersHandle), 
      (_ruralWarningDistanceInMetersHandle), 
      (_urbanWarningDistanceInMetersHandle)
    );
  } finally {
    heresdkNavigationBindingslistofSdkNavigationRoadsigntypeReleaseFfiHandle(_typesFilterHandle);
    heresdkNavigationBindingslistofSdkNavigationRoadsigncategoryReleaseFfiHandle(_categoriesFilterHandle);
    heresdkNavigationBindingslistofSdkNavigationGeneralwarningroadsigntypeReleaseFfiHandle(_generalWarningTypesFilterHandle);
    heresdkNavigationBindingslistofSdkNavigationRoadsignvehicletypeReleaseFfiHandle(_vehicleTypesFilterHandle);
    
    
    
  }
}

void sdkNavigationRoadsignwarningoptionsReleaseFfiHandle(Pointer<Void> handle) => _sdkNavigationRoadsignwarningoptionsReleaseHandle(handle);

// Nullable RoadSignWarningOptions

final _sdkNavigationRoadsignwarningoptionsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadSignWarningOptions_create_handle_nullable'));
final _sdkNavigationRoadsignwarningoptionsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadSignWarningOptions_release_handle_nullable'));
final _sdkNavigationRoadsignwarningoptionsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadSignWarningOptions_get_value_nullable'));

Pointer<Void> sdkNavigationRoadsignwarningoptionsToFfiNullable(RoadSignWarningOptions? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationRoadsignwarningoptionsToFfi(value);
  final result = _sdkNavigationRoadsignwarningoptionsCreateHandleNullable(_handle);
  sdkNavigationRoadsignwarningoptionsReleaseFfiHandle(_handle);
  return result;
}

RoadSignWarningOptions? sdkNavigationRoadsignwarningoptionsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationRoadsignwarningoptionsGetValueNullable(handle);
  final result = sdkNavigationRoadsignwarningoptionsFromFfi(_handle);
  sdkNavigationRoadsignwarningoptionsReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationRoadsignwarningoptionsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationRoadsignwarningoptionsReleaseHandleNullable(handle);

// End of RoadSignWarningOptions "private" section.


