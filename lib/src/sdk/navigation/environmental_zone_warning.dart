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
import 'package:here_sdk/src/sdk/core/localized_texts.dart';
import 'package:here_sdk/src/sdk/navigation/distance_type.dart';

/// Represents Environmental zones.

class EnvironmentalZoneWarning {
  /// The distance from the current location to the environmental zone.
  double distanceInMeters;

  /// Indicates if the specified zone is ahead of the vehicle or has just passed by. If it is
  /// ahead, then [EnvironmentalZoneWarning.distanceInMeters] is greater than 0.
  DistanceType distanceType;

  /// Indicates the environmental zone id in the map data.
  String zoneId;

  /// Indicates the official name of the environmental zone.
  String name;

  /// Indicates the description of the environmental zone in the available languages.
  LocalizedTexts description;

  /// Indicates the website of the environmental zone, if available.
  String? websiteUrl;

  /// Creates a new instance.

  /// [distanceInMeters] The distance from the current location to the environmental zone.

  /// [distanceType] Indicates if the specified zone is ahead of the vehicle or has just passed by. If it is
  /// ahead, then [EnvironmentalZoneWarning.distanceInMeters] is greater than 0.

  /// [zoneId] Indicates the environmental zone id in the map data.

  /// [name] Indicates the official name of the environmental zone.

  /// [description] Indicates the description of the environmental zone in the available languages.

  /// [websiteUrl] Indicates the website of the environmental zone, if available.

  EnvironmentalZoneWarning._(this.distanceInMeters, this.distanceType, this.zoneId, this.name, this.description, this.websiteUrl);
  EnvironmentalZoneWarning(double distanceInMeters, DistanceType distanceType, String zoneId, String name)
    : distanceInMeters = distanceInMeters, distanceType = distanceType, zoneId = zoneId, name = name, description = LocalizedTexts(), websiteUrl = null;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! EnvironmentalZoneWarning) return false;
    EnvironmentalZoneWarning _other = other;
    return distanceInMeters == _other.distanceInMeters &&
        distanceType == _other.distanceType &&
        zoneId == _other.zoneId &&
        name == _other.name &&
        description == _other.description &&
        websiteUrl == _other.websiteUrl;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + distanceInMeters.hashCode;
    result = 31 * result + distanceType.hashCode;
    result = 31 * result + zoneId.hashCode;
    result = 31 * result + name.hashCode;
    result = 31 * result + description.hashCode;
    result = 31 * result + websiteUrl.hashCode;
    return result;
  }
}


// EnvironmentalZoneWarning "private" section, not exported.

final _sdkNavigationEnvironmentalzonewarningCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double, Uint32, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(double, int, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_navigation_EnvironmentalZoneWarning_create_handle'));
final _sdkNavigationEnvironmentalzonewarningReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_EnvironmentalZoneWarning_release_handle'));
final _sdkNavigationEnvironmentalzonewarningGetFielddistanceInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_EnvironmentalZoneWarning_get_field_distanceInMeters'));
final _sdkNavigationEnvironmentalzonewarningGetFielddistanceType = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_EnvironmentalZoneWarning_get_field_distanceType'));
final _sdkNavigationEnvironmentalzonewarningGetFieldzoneId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_EnvironmentalZoneWarning_get_field_zoneId'));
final _sdkNavigationEnvironmentalzonewarningGetFieldname = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_EnvironmentalZoneWarning_get_field_name'));
final _sdkNavigationEnvironmentalzonewarningGetFielddescription = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_EnvironmentalZoneWarning_get_field_description'));
final _sdkNavigationEnvironmentalzonewarningGetFieldwebsiteUrl = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_EnvironmentalZoneWarning_get_field_websiteUrl'));



Pointer<Void> sdkNavigationEnvironmentalzonewarningToFfi(EnvironmentalZoneWarning value) {
  final _distanceInMetersHandle = (value.distanceInMeters);
  final _distanceTypeHandle = sdkNavigationDistancetypeToFfi(value.distanceType);
  final _zoneIdHandle = stringToFfi(value.zoneId);
  final _nameHandle = stringToFfi(value.name);
  final _descriptionHandle = sdkCoreLocalizedtextsToFfi(value.description);
  final _websiteUrlHandle = stringToFfiNullable(value.websiteUrl);
  final _result = _sdkNavigationEnvironmentalzonewarningCreateHandle(_distanceInMetersHandle, _distanceTypeHandle, _zoneIdHandle, _nameHandle, _descriptionHandle, _websiteUrlHandle);
  
  sdkNavigationDistancetypeReleaseFfiHandle(_distanceTypeHandle);
  stringReleaseFfiHandle(_zoneIdHandle);
  stringReleaseFfiHandle(_nameHandle);
  sdkCoreLocalizedtextsReleaseFfiHandle(_descriptionHandle);
  stringReleaseFfiHandleNullable(_websiteUrlHandle);
  return _result;
}

EnvironmentalZoneWarning sdkNavigationEnvironmentalzonewarningFromFfi(Pointer<Void> handle) {
  final _distanceInMetersHandle = _sdkNavigationEnvironmentalzonewarningGetFielddistanceInMeters(handle);
  final _distanceTypeHandle = _sdkNavigationEnvironmentalzonewarningGetFielddistanceType(handle);
  final _zoneIdHandle = _sdkNavigationEnvironmentalzonewarningGetFieldzoneId(handle);
  final _nameHandle = _sdkNavigationEnvironmentalzonewarningGetFieldname(handle);
  final _descriptionHandle = _sdkNavigationEnvironmentalzonewarningGetFielddescription(handle);
  final _websiteUrlHandle = _sdkNavigationEnvironmentalzonewarningGetFieldwebsiteUrl(handle);
  try {
    return EnvironmentalZoneWarning._(
      (_distanceInMetersHandle), 
      sdkNavigationDistancetypeFromFfi(_distanceTypeHandle), 
      stringFromFfi(_zoneIdHandle), 
      stringFromFfi(_nameHandle), 
      sdkCoreLocalizedtextsFromFfi(_descriptionHandle), 
      stringFromFfiNullable(_websiteUrlHandle)
    );
  } finally {
    
    sdkNavigationDistancetypeReleaseFfiHandle(_distanceTypeHandle);
    stringReleaseFfiHandle(_zoneIdHandle);
    stringReleaseFfiHandle(_nameHandle);
    sdkCoreLocalizedtextsReleaseFfiHandle(_descriptionHandle);
    stringReleaseFfiHandleNullable(_websiteUrlHandle);
  }
}

void sdkNavigationEnvironmentalzonewarningReleaseFfiHandle(Pointer<Void> handle) => _sdkNavigationEnvironmentalzonewarningReleaseHandle(handle);

// Nullable EnvironmentalZoneWarning

final _sdkNavigationEnvironmentalzonewarningCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_EnvironmentalZoneWarning_create_handle_nullable'));
final _sdkNavigationEnvironmentalzonewarningReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_EnvironmentalZoneWarning_release_handle_nullable'));
final _sdkNavigationEnvironmentalzonewarningGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_EnvironmentalZoneWarning_get_value_nullable'));

Pointer<Void> sdkNavigationEnvironmentalzonewarningToFfiNullable(EnvironmentalZoneWarning? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationEnvironmentalzonewarningToFfi(value);
  final result = _sdkNavigationEnvironmentalzonewarningCreateHandleNullable(_handle);
  sdkNavigationEnvironmentalzonewarningReleaseFfiHandle(_handle);
  return result;
}

EnvironmentalZoneWarning? sdkNavigationEnvironmentalzonewarningFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationEnvironmentalzonewarningGetValueNullable(handle);
  final result = sdkNavigationEnvironmentalzonewarningFromFfi(_handle);
  sdkNavigationEnvironmentalzonewarningReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationEnvironmentalzonewarningReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationEnvironmentalzonewarningReleaseHandleNullable(handle);

// End of EnvironmentalZoneWarning "private" section.


