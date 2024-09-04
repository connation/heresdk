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
import 'package:here_sdk/src/sdk/core/geo_box.dart';
import 'package:here_sdk/src/sdk/venue/control/venue.dart';
import 'package:here_sdk/src/sdk/venue/data/venue_geometry.dart';
import 'package:here_sdk/src/sdk/venue/data/venue_topology.dart';

/// Specifies the  for renderers.
///
/// Venue map
/// uses this  to render venues on the map.
/// @nodoc
abstract class Renderer {
  /// Specifies the  for renderers.
  ///
  /// Venue map
  /// uses this  to render venues on the map.
  /// @nodoc

  factory Renderer(
    bool Function(VenueGeometry) centerLambda,
    void Function(Venue) addVenueLambda,
    void Function(Venue) removeVenueLambda,
    void Function(Venue) selectVenueLambda,
    void Function() updateLambda,
    void Function(Venue, List<VenueGeometry>) updateGeometriesLambda,
    void Function(Venue, List<VenueTopology>) updateTopologiesLambda,
    double Function() zoomLevelGetLambda,
    GeoBox Function() viewRectangleGetLambda
  ) => Renderer$Lambdas(
    centerLambda,
    addVenueLambda,
    removeVenueLambda,
    selectVenueLambda,
    updateLambda,
    updateGeometriesLambda,
    updateTopologiesLambda,
    zoomLevelGetLambda,
    viewRectangleGetLambda
  );

  /// Centers the camera on a given geometry.
  ///
  /// [geometry] The geometry to center on.
  ///
  /// Returns [bool]. True on success and false otherwise.
  ///
  bool center(VenueGeometry geometry);
  /// Adds a venue to the map.
  ///
  /// [venue] The venue to add.
  ///
  void addVenue(Venue venue);
  /// Removes a venue from the map.
  ///
  /// [venue] The venue to remove.
  ///
  void removeVenue(Venue venue);
  /// Selects a venue on the map.
  ///
  /// A previously selected venue will be deselected.
  ///
  /// [venue] The venue to select.
  ///
  void selectVenue(Venue venue);
  /// Method should be called when the renderer is required to be updated.
  ///
  void update();
  /// Method should be called when specific geometries require a visual update.
  ///
  /// [venue] The venue where geometries are located.
  ///
  /// [geometries] The geometries that require a visual update.
  ///
  void updateGeometries(Venue venue, List<VenueGeometry> geometries);
  /// Method should be called when specific topologies require a visual update.
  ///
  /// [venue] The venue where topologies are located.
  ///
  /// [topologies] The topologies that require a visual update.
  ///
  void updateTopologies(Venue venue, List<VenueTopology> topologies);
  /// Gets the zoom level of the map.
  double get zoomLevel;

  /// Gets the current view rectangle of the map.
  GeoBox get viewRectangle;

}


// Renderer "private" section, not exported.

final _sdkVenueControlRendererRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_venue_control_Renderer_register_finalizer'));
final _sdkVenueControlRendererCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_control_Renderer_copy_handle'));
final _sdkVenueControlRendererReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_control_Renderer_release_handle'));
final _sdkVenueControlRendererCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer)
  >('here_sdk_sdk_venue_control_Renderer_create_proxy'));
final _sdkVenueControlRendererGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_control_Renderer_get_type_id'));








class Renderer$Lambdas implements Renderer {
  bool Function(VenueGeometry) centerLambda;
  void Function(Venue) addVenueLambda;
  void Function(Venue) removeVenueLambda;
  void Function(Venue) selectVenueLambda;
  void Function() updateLambda;
  void Function(Venue, List<VenueGeometry>) updateGeometriesLambda;
  void Function(Venue, List<VenueTopology>) updateTopologiesLambda;
  double Function() zoomLevelGetLambda;
  GeoBox Function() viewRectangleGetLambda;

  Renderer$Lambdas(
    this.centerLambda,
    this.addVenueLambda,
    this.removeVenueLambda,
    this.selectVenueLambda,
    this.updateLambda,
    this.updateGeometriesLambda,
    this.updateTopologiesLambda,
    this.zoomLevelGetLambda,
    this.viewRectangleGetLambda
  );

  @override
  bool center(VenueGeometry geometry) =>
    centerLambda(geometry);
  @override
  void addVenue(Venue venue) =>
    addVenueLambda(venue);
  @override
  void removeVenue(Venue venue) =>
    removeVenueLambda(venue);
  @override
  void selectVenue(Venue venue) =>
    selectVenueLambda(venue);
  @override
  void update() =>
    updateLambda();
  @override
  void updateGeometries(Venue venue, List<VenueGeometry> geometries) =>
    updateGeometriesLambda(venue, geometries);
  @override
  void updateTopologies(Venue venue, List<VenueTopology> topologies) =>
    updateTopologiesLambda(venue, topologies);
  @override
  double get zoomLevel => zoomLevelGetLambda();
  @override
  GeoBox get viewRectangle => viewRectangleGetLambda();
}

class Renderer$Impl extends __lib.NativeBase implements Renderer {

  Renderer$Impl(Pointer<Void> handle) : super(handle);

  @override
  bool center(VenueGeometry geometry) {
    final _centerFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Pointer<Void>), int Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_control_Renderer_center__VenueGeometry'));
    final _geometryHandle = sdkVenueDataVenuegeometryToFfi(geometry);
    final _handle = this.handle;
    final __resultHandle = _centerFfi(_handle, __lib.LibraryContext.isolateId, _geometryHandle);
    sdkVenueDataVenuegeometryReleaseFfiHandle(_geometryHandle);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  void addVenue(Venue venue) {
    final _addVenueFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_control_Renderer_addVenue__Venue'));
    final _venueHandle = sdkVenueControlVenueToFfi(venue);
    final _handle = this.handle;
    _addVenueFfi(_handle, __lib.LibraryContext.isolateId, _venueHandle);
    sdkVenueControlVenueReleaseFfiHandle(_venueHandle);

  }

  @override
  void removeVenue(Venue venue) {
    final _removeVenueFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_control_Renderer_removeVenue__Venue'));
    final _venueHandle = sdkVenueControlVenueToFfi(venue);
    final _handle = this.handle;
    _removeVenueFfi(_handle, __lib.LibraryContext.isolateId, _venueHandle);
    sdkVenueControlVenueReleaseFfiHandle(_venueHandle);

  }

  @override
  void selectVenue(Venue venue) {
    final _selectVenueFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_control_Renderer_selectVenue__Venue'));
    final _venueHandle = sdkVenueControlVenueToFfi(venue);
    final _handle = this.handle;
    _selectVenueFfi(_handle, __lib.LibraryContext.isolateId, _venueHandle);
    sdkVenueControlVenueReleaseFfiHandle(_venueHandle);

  }

  @override
  void update() {
    final _updateFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_venue_control_Renderer_update'));
    final _handle = this.handle;
    _updateFfi(_handle, __lib.LibraryContext.isolateId);

  }

  @override
  void updateGeometries(Venue venue, List<VenueGeometry> geometries) {
    final _updateGeometriesFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_venue_control_Renderer_updateGeometries__Venue_ListOf_sdk_venue_data_VenueGeometry'));
    final _venueHandle = sdkVenueControlVenueToFfi(venue);
    final _geometriesHandle = venuecoreBindingslistofSdkVenueDataVenuegeometryToFfi(geometries);
    final _handle = this.handle;
    _updateGeometriesFfi(_handle, __lib.LibraryContext.isolateId, _venueHandle, _geometriesHandle);
    sdkVenueControlVenueReleaseFfiHandle(_venueHandle);
    venuecoreBindingslistofSdkVenueDataVenuegeometryReleaseFfiHandle(_geometriesHandle);

  }

  @override
  void updateTopologies(Venue venue, List<VenueTopology> topologies) {
    final _updateTopologiesFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_venue_control_Renderer_updateTopologies__Venue_ListOf_sdk_venue_data_VenueTopology'));
    final _venueHandle = sdkVenueControlVenueToFfi(venue);
    final _topologiesHandle = venuecoreBindingslistofSdkVenueDataVenuetopologyToFfi(topologies);
    final _handle = this.handle;
    _updateTopologiesFfi(_handle, __lib.LibraryContext.isolateId, _venueHandle, _topologiesHandle);
    sdkVenueControlVenueReleaseFfiHandle(_venueHandle);
    venuecoreBindingslistofSdkVenueDataVenuetopologyReleaseFfiHandle(_topologiesHandle);

  }

  /// Gets the zoom level of the map.
  double get zoomLevel {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Float Function(Pointer<Void>, Int32), double Function(Pointer<Void>, int)>('here_sdk_sdk_venue_control_Renderer_zoomLevel_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }


  /// Gets the current view rectangle of the map.
  GeoBox get viewRectangle {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_control_Renderer_viewRectangle_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreGeoboxFromFfi(__resultHandle);
    } finally {
      sdkCoreGeoboxReleaseFfiHandle(__resultHandle);

    }

  }



}

int _sdkVenueControlRenderercenterStatic(Object _obj, Pointer<Void> geometry, Pointer<Uint8> _result) {
  bool? _resultObject;
  try {
    _resultObject = (_obj as Renderer).center(sdkVenueDataVenuegeometryFromFfi(geometry));
    _result.value = booleanToFfi(_resultObject);
  } finally {
    sdkVenueDataVenuegeometryReleaseFfiHandle(geometry);
  }
  return 0;
}
int _sdkVenueControlRendereraddVenueStatic(Object _obj, Pointer<Void> venue) {

  try {
    (_obj as Renderer).addVenue(sdkVenueControlVenueFromFfi(venue));
  } finally {
    sdkVenueControlVenueReleaseFfiHandle(venue);
  }
  return 0;
}
int _sdkVenueControlRendererremoveVenueStatic(Object _obj, Pointer<Void> venue) {

  try {
    (_obj as Renderer).removeVenue(sdkVenueControlVenueFromFfi(venue));
  } finally {
    sdkVenueControlVenueReleaseFfiHandle(venue);
  }
  return 0;
}
int _sdkVenueControlRendererselectVenueStatic(Object _obj, Pointer<Void> venue) {

  try {
    (_obj as Renderer).selectVenue(sdkVenueControlVenueFromFfi(venue));
  } finally {
    sdkVenueControlVenueReleaseFfiHandle(venue);
  }
  return 0;
}
int _sdkVenueControlRendererupdateStatic(Object _obj) {

  try {
    (_obj as Renderer).update();
  } finally {
  }
  return 0;
}
int _sdkVenueControlRendererupdateGeometriesStatic(Object _obj, Pointer<Void> venue, Pointer<Void> geometries) {

  try {
    (_obj as Renderer).updateGeometries(sdkVenueControlVenueFromFfi(venue), venuecoreBindingslistofSdkVenueDataVenuegeometryFromFfi(geometries));
  } finally {
    sdkVenueControlVenueReleaseFfiHandle(venue);
    venuecoreBindingslistofSdkVenueDataVenuegeometryReleaseFfiHandle(geometries);
  }
  return 0;
}
int _sdkVenueControlRendererupdateTopologiesStatic(Object _obj, Pointer<Void> venue, Pointer<Void> topologies) {

  try {
    (_obj as Renderer).updateTopologies(sdkVenueControlVenueFromFfi(venue), venuecoreBindingslistofSdkVenueDataVenuetopologyFromFfi(topologies));
  } finally {
    sdkVenueControlVenueReleaseFfiHandle(venue);
    venuecoreBindingslistofSdkVenueDataVenuetopologyReleaseFfiHandle(topologies);
  }
  return 0;
}

int _sdkVenueControlRendererzoomLevelGetStatic(Object _obj, Pointer<Float> _result) {
  _result.value = ((_obj as Renderer).zoomLevel);
  return 0;
}
int _sdkVenueControlRendererviewRectangleGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkCoreGeoboxToFfi((_obj as Renderer).viewRectangle);
  return 0;
}

Pointer<Void> sdkVenueControlRendererToFfi(Renderer value) {
  if (value is __lib.NativeBase) return _sdkVenueControlRendererCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkVenueControlRendererCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>, Pointer<Uint8>)>(_sdkVenueControlRenderercenterStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkVenueControlRendereraddVenueStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkVenueControlRendererremoveVenueStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkVenueControlRendererselectVenueStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle)>(_sdkVenueControlRendererupdateStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>, Pointer<Void>)>(_sdkVenueControlRendererupdateGeometriesStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>, Pointer<Void>)>(_sdkVenueControlRendererupdateTopologiesStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Float>)>(_sdkVenueControlRendererzoomLevelGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkVenueControlRendererviewRectangleGetStatic, __lib.unknownError)
  );

  return result;
}

Renderer sdkVenueControlRendererFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is Renderer) return instance;

  final _typeIdHandle = _sdkVenueControlRendererGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkVenueControlRendererCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : Renderer$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkVenueControlRendererRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkVenueControlRendererReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkVenueControlRendererReleaseHandle(handle);

Pointer<Void> sdkVenueControlRendererToFfiNullable(Renderer? value) =>
  value != null ? sdkVenueControlRendererToFfi(value) : Pointer<Void>.fromAddress(0);

Renderer? sdkVenueControlRendererFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkVenueControlRendererFromFfi(handle) : null;

void sdkVenueControlRendererReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkVenueControlRendererReleaseHandle(handle);

// End of Renderer "private" section.


