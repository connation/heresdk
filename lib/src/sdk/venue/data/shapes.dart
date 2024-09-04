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
import 'package:here_sdk/src/sdk/core/geo_box.dart';
import 'package:here_sdk/src/sdk/venue/data/venue_geometry.dart';
import 'package:here_sdk/src/sdk/venue/style/venue_geometry_style.dart';

/// Specifies a list of geo shape which in combination represent a complete Geometry.
/// @nodoc
abstract class Shapes {

  /// Gets an id of the geometry to which this shape is associated.
  String get identifier;

  /// Gets a type of the shape.
  VenueGeometryGeometryType get geometryType;

  /// Gets a bounding box of the shape.
  GeoBox get boundingBox;

  /// Gets a nesting depth of the shape. Returns 0 for
  /// the shapes that represent the base shape.
  int get nestingDepth;

  /// Gets a style of the shape.
  VenueGeometryStyle? get style;

  /// Gets a space type of the shape.
  String get spaceType;

}


// Shapes "private" section, not exported.

final _sdkVenueDataShapesRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_venue_data_Shapes_register_finalizer'));
final _sdkVenueDataShapesCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_data_Shapes_copy_handle'));
final _sdkVenueDataShapesReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_data_Shapes_release_handle'));


class Shapes$Impl extends __lib.NativeBase implements Shapes {

  Shapes$Impl(Pointer<Void> handle) : super(handle);

  @override
  String get identifier {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_Shapes_identifier_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  VenueGeometryGeometryType get geometryType {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_Shapes_geometryType_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkVenueDataVenuegeometryGeometrytypeFromFfi(__resultHandle);
    } finally {
      sdkVenueDataVenuegeometryGeometrytypeReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  GeoBox get boundingBox {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_Shapes_boundingBox_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreGeoboxFromFfi(__resultHandle);
    } finally {
      sdkCoreGeoboxReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  int get nestingDepth {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_Shapes_nestingDepth_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }


  @override
  VenueGeometryStyle? get style {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_Shapes_style_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkVenueStyleVenuegeometrystyleFromFfiNullable(__resultHandle);
    } finally {
      sdkVenueStyleVenuegeometrystyleReleaseFfiHandleNullable(__resultHandle);

    }

  }


  @override
  String get spaceType {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_Shapes_spaceType_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }



}

Pointer<Void> sdkVenueDataShapesToFfi(Shapes value) =>
  _sdkVenueDataShapesCopyHandle((value as __lib.NativeBase).handle);

Shapes sdkVenueDataShapesFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is Shapes) return instance;

  final _copiedHandle = _sdkVenueDataShapesCopyHandle(handle);
  final result = Shapes$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkVenueDataShapesRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkVenueDataShapesReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkVenueDataShapesReleaseHandle(handle);

Pointer<Void> sdkVenueDataShapesToFfiNullable(Shapes? value) =>
  value != null ? sdkVenueDataShapesToFfi(value) : Pointer<Void>.fromAddress(0);

Shapes? sdkVenueDataShapesFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkVenueDataShapesFromFfi(handle) : null;

void sdkVenueDataShapesReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkVenueDataShapesReleaseHandle(handle);

// End of Shapes "private" section.


