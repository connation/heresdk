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
import 'package:here_sdk/src/sdk/transport/hazardous_material.dart';
import 'package:here_sdk/src/sdk/transport/tunnel_category.dart';

/// Represents restriction on transport of hazardous materials.
///
/// **Note:** This is a beta release of this feature.
/// Related APIs may change for new releases without a deprecation process.

class HazardousMaterialRestriction {
  /// Restricted hazardous material.
  HazardousMaterial? hazardousMaterial;

  /// Tunnel category to restrict transport of specific goods.
  TunnelCategory? tunnelCategory;

  HazardousMaterialRestriction._(this.hazardousMaterial, this.tunnelCategory);
  /// Creates hazardous material restriction for specified material.
  /// [hazardousMaterial] Restricted hazardous material.
  HazardousMaterialRestriction(this.hazardousMaterial)
      : tunnelCategory = null;
  /// Creates hazardous material restriction for specified tunnel category.
  /// [tunnelCategory] Tunnel category to restrict transport of specific goods.
  HazardousMaterialRestriction.tunnelCategory(this.tunnelCategory)
      : hazardousMaterial = null;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! HazardousMaterialRestriction) return false;
    HazardousMaterialRestriction _other = other;
    return hazardousMaterial == _other.hazardousMaterial &&
        tunnelCategory == _other.tunnelCategory;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + hazardousMaterial.hashCode;
    result = 31 * result + tunnelCategory.hashCode;
    return result;
  }
}


// HazardousMaterialRestriction "private" section, not exported.

final _sdkTransportHazardousmaterialrestrictionCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_transport_HazardousMaterialRestriction_create_handle'));
final _sdkTransportHazardousmaterialrestrictionReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_transport_HazardousMaterialRestriction_release_handle'));
final _sdkTransportHazardousmaterialrestrictionGetFieldhazardousMaterial = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_HazardousMaterialRestriction_get_field_hazardousMaterial'));
final _sdkTransportHazardousmaterialrestrictionGetFieldtunnelCategory = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_HazardousMaterialRestriction_get_field_tunnelCategory'));



Pointer<Void> sdkTransportHazardousmaterialrestrictionToFfi(HazardousMaterialRestriction value) {
  final _hazardousMaterialHandle = sdkTransportHazardousmaterialToFfiNullable(value.hazardousMaterial);
  final _tunnelCategoryHandle = sdkTransportTunnelcategoryToFfiNullable(value.tunnelCategory);
  final _result = _sdkTransportHazardousmaterialrestrictionCreateHandle(_hazardousMaterialHandle, _tunnelCategoryHandle);
  sdkTransportHazardousmaterialReleaseFfiHandleNullable(_hazardousMaterialHandle);
  sdkTransportTunnelcategoryReleaseFfiHandleNullable(_tunnelCategoryHandle);
  return _result;
}

HazardousMaterialRestriction sdkTransportHazardousmaterialrestrictionFromFfi(Pointer<Void> handle) {
  final _hazardousMaterialHandle = _sdkTransportHazardousmaterialrestrictionGetFieldhazardousMaterial(handle);
  final _tunnelCategoryHandle = _sdkTransportHazardousmaterialrestrictionGetFieldtunnelCategory(handle);
  try {
    return HazardousMaterialRestriction._(
      sdkTransportHazardousmaterialFromFfiNullable(_hazardousMaterialHandle), 
      sdkTransportTunnelcategoryFromFfiNullable(_tunnelCategoryHandle)
    );
  } finally {
    sdkTransportHazardousmaterialReleaseFfiHandleNullable(_hazardousMaterialHandle);
    sdkTransportTunnelcategoryReleaseFfiHandleNullable(_tunnelCategoryHandle);
  }
}

void sdkTransportHazardousmaterialrestrictionReleaseFfiHandle(Pointer<Void> handle) => _sdkTransportHazardousmaterialrestrictionReleaseHandle(handle);

// Nullable HazardousMaterialRestriction

final _sdkTransportHazardousmaterialrestrictionCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_HazardousMaterialRestriction_create_handle_nullable'));
final _sdkTransportHazardousmaterialrestrictionReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_transport_HazardousMaterialRestriction_release_handle_nullable'));
final _sdkTransportHazardousmaterialrestrictionGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_HazardousMaterialRestriction_get_value_nullable'));

Pointer<Void> sdkTransportHazardousmaterialrestrictionToFfiNullable(HazardousMaterialRestriction? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkTransportHazardousmaterialrestrictionToFfi(value);
  final result = _sdkTransportHazardousmaterialrestrictionCreateHandleNullable(_handle);
  sdkTransportHazardousmaterialrestrictionReleaseFfiHandle(_handle);
  return result;
}

HazardousMaterialRestriction? sdkTransportHazardousmaterialrestrictionFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkTransportHazardousmaterialrestrictionGetValueNullable(handle);
  final result = sdkTransportHazardousmaterialrestrictionFromFfi(_handle);
  sdkTransportHazardousmaterialrestrictionReleaseFfiHandle(_handle);
  return result;
}

void sdkTransportHazardousmaterialrestrictionReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkTransportHazardousmaterialrestrictionReleaseHandleNullable(handle);

// End of HazardousMaterialRestriction "private" section.


