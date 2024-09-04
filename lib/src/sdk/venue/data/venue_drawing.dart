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
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/geo_box.dart';
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';
import 'package:here_sdk/src/sdk/venue/data/property.dart';
import 'package:here_sdk/src/sdk/venue/data/venue_geometry.dart';
import 'package:here_sdk/src/sdk/venue/data/venue_geometry_filter_type.dart';
import 'package:here_sdk/src/sdk/venue/data/venue_level.dart';
import 'package:here_sdk/src/sdk/venue/data/venue_model.dart';
import 'package:here_sdk/src/sdk/venue/data/venue_topology.dart';

/// Represents a drawing inside the [VenueModel].
///
/// The drawing can be
/// a separate building in a complex of buildings, or show a different
/// view of a venue. For example, in an airport, one drawing can be used
/// as an overview of all buildings in this venue, while other drawings
/// contains details for each terminal in this airport.
abstract class VenueDrawing {

  /// Gets a geometry by an id.
  ///
  /// [geometryId] The id of the geometry.
  ///
  /// Returns [VenueGeometry?]. The geometry with the given id or `null`.
  ///
  VenueGeometry? getGeometryByIdentifier(String geometryId);
  /// Gets a geometry by the [VenueGeometryInternalAddress].
  ///
  /// [geometryAddress] The internal address as a String.
  ///
  /// Returns [VenueGeometry?]. The geometry with the given address or `null`.
  ///
  VenueGeometry? getGeometryByAddress(String geometryAddress);
  /// Gets filtered geometries in an ascending order.
  ///
  /// [filter] The filter string.
  ///
  /// [filterType] The filter type.
  ///
  /// Returns [List<VenueGeometry>]. The list of the filtered geometries or an empty list.
  ///
  List<VenueGeometry> filterGeometry(String filter, VenueGeometryFilterType filterType);
  /// Gets an id of the drawing.
  String get identifier;

  /// Checks if this is a root drawing of the venue.
  bool get isIsRoot;

  /// Gets a parent venue model.
  VenueModel get venueModel;

  /// Gets levels of the drawing.
  List<VenueLevel> get levels;

  /// Gets a center of the drawing.
  GeoCoordinates get center;

  /// Gets a bounding box of the drawing.
  GeoBox get boundingBox;

  /// Gets properties of the drawing.
  Map<String, Property> get properties;

  /// Gets geometries ordered by a name in an ascending order.
  List<VenueGeometry> get geometriesByName;

  /// Gets geometries mapped by icon names.
  Map<String, List<VenueGeometry>> get geometriesByIconNames;

  /// Gets a list of topologies of the drawing.
  List<VenueTopology> get topologies;

}


// VenueDrawing "private" section, not exported.

final _sdkVenueDataVenuedrawingRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_venue_data_VenueDrawing_register_finalizer'));
final _sdkVenueDataVenuedrawingCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_data_VenueDrawing_copy_handle'));
final _sdkVenueDataVenuedrawingReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_data_VenueDrawing_release_handle'));





class VenueDrawing$Impl extends __lib.NativeBase implements VenueDrawing {

  VenueDrawing$Impl(Pointer<Void> handle) : super(handle);

  @override
  VenueGeometry? getGeometryByIdentifier(String geometryId) {
    final _getGeometryByIdentifierFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_data_VenueDrawing_getGeometryById__String'));
    final _geometryIdHandle = stringToFfi(geometryId);
    final _handle = this.handle;
    final __resultHandle = _getGeometryByIdentifierFfi(_handle, __lib.LibraryContext.isolateId, _geometryIdHandle);
    stringReleaseFfiHandle(_geometryIdHandle);
    try {
      return sdkVenueDataVenuegeometryFromFfiNullable(__resultHandle);
    } finally {
      sdkVenueDataVenuegeometryReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  VenueGeometry? getGeometryByAddress(String geometryAddress) {
    final _getGeometryByAddressFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_data_VenueDrawing_getGeometryByAddress__String'));
    final _geometryAddressHandle = stringToFfi(geometryAddress);
    final _handle = this.handle;
    final __resultHandle = _getGeometryByAddressFfi(_handle, __lib.LibraryContext.isolateId, _geometryAddressHandle);
    stringReleaseFfiHandle(_geometryAddressHandle);
    try {
      return sdkVenueDataVenuegeometryFromFfiNullable(__resultHandle);
    } finally {
      sdkVenueDataVenuegeometryReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  List<VenueGeometry> filterGeometry(String filter, VenueGeometryFilterType filterType) {
    final _filterGeometryFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Uint32), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueDrawing_filterGeometry__String_VenueGeometryFilterType'));
    final _filterHandle = stringToFfi(filter);
    final _filterTypeHandle = sdkVenueDataVenuegeometryfiltertypeToFfi(filterType);
    final _handle = this.handle;
    final __resultHandle = _filterGeometryFfi(_handle, __lib.LibraryContext.isolateId, _filterHandle, _filterTypeHandle);
    stringReleaseFfiHandle(_filterHandle);
    sdkVenueDataVenuegeometryfiltertypeReleaseFfiHandle(_filterTypeHandle);
    try {
      return venuecoreBindingslistofSdkVenueDataVenuegeometryFromFfi(__resultHandle);
    } finally {
      venuecoreBindingslistofSdkVenueDataVenuegeometryReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  String get identifier {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueDrawing_identifier_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  bool get isIsRoot {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueDrawing_isIsRoot_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  VenueModel get venueModel {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueDrawing_venueModel_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkVenueDataVenuemodelFromFfi(__resultHandle);
    } finally {
      sdkVenueDataVenuemodelReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  List<VenueLevel> get levels {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueDrawing_levels_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return venuecoreBindingslistofSdkVenueDataVenuelevelFromFfi(__resultHandle);
    } finally {
      venuecoreBindingslistofSdkVenueDataVenuelevelReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  GeoCoordinates get center {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueDrawing_center_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreGeocoordinatesFromFfi(__resultHandle);
    } finally {
      sdkCoreGeocoordinatesReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  GeoBox get boundingBox {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueDrawing_boundingBox_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreGeoboxFromFfi(__resultHandle);
    } finally {
      sdkCoreGeoboxReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  Map<String, Property> get properties {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueDrawing_properties_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return venuecoreBindingsmapofStringToSdkVenueDataPropertyFromFfi(__resultHandle);
    } finally {
      venuecoreBindingsmapofStringToSdkVenueDataPropertyReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  List<VenueGeometry> get geometriesByName {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueDrawing_geometriesByName_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return venuecoreBindingslistofSdkVenueDataVenuegeometryFromFfi(__resultHandle);
    } finally {
      venuecoreBindingslistofSdkVenueDataVenuegeometryReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  Map<String, List<VenueGeometry>> get geometriesByIconNames {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueDrawing_geometriesByIconNames_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return venuecoreBindingsmapofStringToVenuecoreBindingslistofSdkVenueDataVenuegeometryFromFfi(__resultHandle);
    } finally {
      venuecoreBindingsmapofStringToVenuecoreBindingslistofSdkVenueDataVenuegeometryReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  List<VenueTopology> get topologies {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueDrawing_topologies_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return venuecoreBindingslistofSdkVenueDataVenuetopologyFromFfi(__resultHandle);
    } finally {
      venuecoreBindingslistofSdkVenueDataVenuetopologyReleaseFfiHandle(__resultHandle);

    }

  }



}

Pointer<Void> sdkVenueDataVenuedrawingToFfi(VenueDrawing value) =>
  _sdkVenueDataVenuedrawingCopyHandle((value as __lib.NativeBase).handle);

VenueDrawing sdkVenueDataVenuedrawingFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is VenueDrawing) return instance;

  final _copiedHandle = _sdkVenueDataVenuedrawingCopyHandle(handle);
  final result = VenueDrawing$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkVenueDataVenuedrawingRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkVenueDataVenuedrawingReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkVenueDataVenuedrawingReleaseHandle(handle);

Pointer<Void> sdkVenueDataVenuedrawingToFfiNullable(VenueDrawing? value) =>
  value != null ? sdkVenueDataVenuedrawingToFfi(value) : Pointer<Void>.fromAddress(0);

VenueDrawing? sdkVenueDataVenuedrawingFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkVenueDataVenuedrawingFromFfi(handle) : null;

void sdkVenueDataVenuedrawingReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkVenueDataVenuedrawingReleaseHandle(handle);

// End of VenueDrawing "private" section.


