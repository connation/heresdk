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
import 'package:here_sdk/src/sdk/core/country_code.dart';
import 'package:here_sdk/src/sdk/mapview/icon_provider_internal.dart';
import 'package:here_sdk/src/sdk/transport/vehicle_restriction.dart';
import 'package:meta/meta.dart';

/// Factory for creating vehicle restriction icon attributes for `IconProvider` based
/// on contents of `VehicleRestriction`.
/// @nodoc
abstract class VehicleRestrictionIconAttributesFactory {

  /// Creates vehicle restriction icon attributes for `IconProvider` based on contents
  /// of `VehicleRestriction` and country code.
  ///
  /// [restriction] The VehicleRestriction for which to generate icon attributes.
  ///
  /// [countryCode] The code of a country to tailor the icon for.
  ///
  static IconProviderInternalVehicleRestrictionIconAttributes createVehicleRestrictionIconAttributes(VehicleRestriction restriction, CountryCode? countryCode) => $prototype.createVehicleRestrictionIconAttributes(restriction, countryCode);

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = VehicleRestrictionIconAttributesFactory$Impl(Pointer<Void>.fromAddress(0));
}


// VehicleRestrictionIconAttributesFactory "private" section, not exported.

final _sdkMapviewVehiclerestrictioniconattributesfactoryRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_VehicleRestrictionIconAttributesFactory_register_finalizer'));
final _sdkMapviewVehiclerestrictioniconattributesfactoryCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_VehicleRestrictionIconAttributesFactory_copy_handle'));
final _sdkMapviewVehiclerestrictioniconattributesfactoryReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_VehicleRestrictionIconAttributesFactory_release_handle'));



/// @nodoc
@visibleForTesting
class VehicleRestrictionIconAttributesFactory$Impl extends __lib.NativeBase implements VehicleRestrictionIconAttributesFactory {

  VehicleRestrictionIconAttributesFactory$Impl(Pointer<Void> handle) : super(handle);

  IconProviderInternalVehicleRestrictionIconAttributes createVehicleRestrictionIconAttributes(VehicleRestriction restriction, CountryCode? countryCode) {
    final _createVehicleRestrictionIconAttributesFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_mapview_VehicleRestrictionIconAttributesFactory_createVehicleRestrictionIconAttributes__VehicleRestriction_CountryCode_'));
    final _restrictionHandle = sdkTransportVehiclerestrictionToFfi(restriction);
    final _countryCodeHandle = sdkCoreCountrycodeToFfiNullable(countryCode);
    final __resultHandle = _createVehicleRestrictionIconAttributesFfi(__lib.LibraryContext.isolateId, _restrictionHandle, _countryCodeHandle);
    sdkTransportVehiclerestrictionReleaseFfiHandle(_restrictionHandle);
    sdkCoreCountrycodeReleaseFfiHandleNullable(_countryCodeHandle);
    try {
      return sdkMapviewIconproviderinternalVehiclerestrictioniconattributesFromFfi(__resultHandle);
    } finally {
      sdkMapviewIconproviderinternalVehiclerestrictioniconattributesReleaseFfiHandle(__resultHandle);

    }

  }


}

Pointer<Void> sdkMapviewVehiclerestrictioniconattributesfactoryToFfi(VehicleRestrictionIconAttributesFactory value) =>
  _sdkMapviewVehiclerestrictioniconattributesfactoryCopyHandle((value as __lib.NativeBase).handle);

VehicleRestrictionIconAttributesFactory sdkMapviewVehiclerestrictioniconattributesfactoryFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is VehicleRestrictionIconAttributesFactory) return instance;

  final _copiedHandle = _sdkMapviewVehiclerestrictioniconattributesfactoryCopyHandle(handle);
  final result = VehicleRestrictionIconAttributesFactory$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMapviewVehiclerestrictioniconattributesfactoryRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewVehiclerestrictioniconattributesfactoryReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewVehiclerestrictioniconattributesfactoryReleaseHandle(handle);

Pointer<Void> sdkMapviewVehiclerestrictioniconattributesfactoryToFfiNullable(VehicleRestrictionIconAttributesFactory? value) =>
  value != null ? sdkMapviewVehiclerestrictioniconattributesfactoryToFfi(value) : Pointer<Void>.fromAddress(0);

VehicleRestrictionIconAttributesFactory? sdkMapviewVehiclerestrictioniconattributesfactoryFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewVehiclerestrictioniconattributesfactoryFromFfi(handle) : null;

void sdkMapviewVehiclerestrictioniconattributesfactoryReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewVehiclerestrictioniconattributesfactoryReleaseHandle(handle);

// End of VehicleRestrictionIconAttributesFactory "private" section.


