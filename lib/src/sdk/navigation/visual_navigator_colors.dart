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
import 'dart:ui' as ui;
import 'package:here_sdk/src/_library_context.dart' as __lib;
import 'package:here_sdk/src/_native_base.dart' as __lib;
import 'package:here_sdk/src/_token_cache.dart' as __lib;
import 'package:here_sdk/src/sdk/core/color.dart';
import 'package:here_sdk/src/sdk/navigation/route_progress_colors.dart';
import 'package:here_sdk/src/sdk/routing/section_transport_mode.dart';
import 'package:meta/meta.dart';

/// This class contains colors used by [VisualNavigator] to render
/// the route and the maneuver arrow visualization.
abstract class VisualNavigatorColors {

  /// Sets route color for visualization.
  ///
  /// [sectionTransportMode] The section transport mode.
  ///
  /// [routeProgressColors] The route progress colors.
  ///
  void setRouteProgressColors(SectionTransportMode sectionTransportMode, RouteProgressColors routeProgressColors);
  /// Gets route color for visualization.
  ///
  /// [sectionTransportMode] The section transport mode.
  ///
  /// Returns [RouteProgressColors]. The route color for visualization.
  ///
  RouteProgressColors getRouteProgressColors(SectionTransportMode sectionTransportMode);
  /// Retrieves HERE day color presets for route and maneuver arrow visualization.
  ///
  /// Returns [VisualNavigatorColors]. HERE day color presets for route and maneuver arrow visualization.
  ///
  static VisualNavigatorColors dayColors() => $prototype.dayColors();
  /// Retrieves HERE night color presets for route and maneuver arrow visualization.
  ///
  /// Returns [VisualNavigatorColors]. HERE night color presets for route and maneuver arrow visualization.
  ///
  static VisualNavigatorColors nightColors() => $prototype.nightColors();
  /// Gets the color used to draw maneuver arrows.
  ui.Color get maneuverArrowColor;
  /// Sets the color used to draw maneuver arrows. The alpha channel is ignored. The color is
  /// interpreted as fully opaque.
  set maneuverArrowColor(ui.Color value);


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = VisualNavigatorColors$Impl(Pointer<Void>.fromAddress(0));
}


// VisualNavigatorColors "private" section, not exported.

final _sdkNavigationVisualnavigatorcolorsRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_navigation_VisualNavigatorColors_register_finalizer'));
final _sdkNavigationVisualnavigatorcolorsCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_VisualNavigatorColors_copy_handle'));
final _sdkNavigationVisualnavigatorcolorsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_VisualNavigatorColors_release_handle'));






/// @nodoc
@visibleForTesting
class VisualNavigatorColors$Impl extends __lib.NativeBase implements VisualNavigatorColors {

  VisualNavigatorColors$Impl(Pointer<Void> handle) : super(handle);

  @override
  void setRouteProgressColors(SectionTransportMode sectionTransportMode, RouteProgressColors routeProgressColors) {
    final _setRouteProgressColorsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32, Pointer<Void>), void Function(Pointer<Void>, int, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigatorColors_setRouteProgressColors__SectionTransportMode_RouteProgressColors'));
    final _sectionTransportModeHandle = sdkRoutingSectiontransportmodeToFfi(sectionTransportMode);
    final _routeProgressColorsHandle = sdkNavigationRouteprogresscolorsToFfi(routeProgressColors);
    final _handle = this.handle;
    _setRouteProgressColorsFfi(_handle, __lib.LibraryContext.isolateId, _sectionTransportModeHandle, _routeProgressColorsHandle);
    sdkRoutingSectiontransportmodeReleaseFfiHandle(_sectionTransportModeHandle);
    sdkNavigationRouteprogresscolorsReleaseFfiHandle(_routeProgressColorsHandle);

  }

  @override
  RouteProgressColors getRouteProgressColors(SectionTransportMode sectionTransportMode) {
    final _getRouteProgressColorsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Uint32), Pointer<Void> Function(Pointer<Void>, int, int)>('here_sdk_sdk_navigation_VisualNavigatorColors_getRouteProgressColors__SectionTransportMode'));
    final _sectionTransportModeHandle = sdkRoutingSectiontransportmodeToFfi(sectionTransportMode);
    final _handle = this.handle;
    final __resultHandle = _getRouteProgressColorsFfi(_handle, __lib.LibraryContext.isolateId, _sectionTransportModeHandle);
    sdkRoutingSectiontransportmodeReleaseFfiHandle(_sectionTransportModeHandle);
    try {
      return sdkNavigationRouteprogresscolorsFromFfi(__resultHandle);
    } finally {
      sdkNavigationRouteprogresscolorsReleaseFfiHandle(__resultHandle);

    }

  }

  VisualNavigatorColors dayColors() {
    final _dayColorsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('here_sdk_sdk_navigation_VisualNavigatorColors_dayColors'));
    final __resultHandle = _dayColorsFfi(__lib.LibraryContext.isolateId);
    try {
      return sdkNavigationVisualnavigatorcolorsFromFfi(__resultHandle);
    } finally {
      sdkNavigationVisualnavigatorcolorsReleaseFfiHandle(__resultHandle);

    }

  }

  VisualNavigatorColors nightColors() {
    final _nightColorsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('here_sdk_sdk_navigation_VisualNavigatorColors_nightColors'));
    final __resultHandle = _nightColorsFfi(__lib.LibraryContext.isolateId);
    try {
      return sdkNavigationVisualnavigatorcolorsFromFfi(__resultHandle);
    } finally {
      sdkNavigationVisualnavigatorcolorsReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  ui.Color get maneuverArrowColor {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigatorColors_maneuverArrowColor_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreColorFromFfi(__resultHandle);
    } finally {
      sdkCoreColorReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set maneuverArrowColor(ui.Color value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigatorColors_maneuverArrowColor_set__Color'));
    final _valueHandle = sdkCoreColorToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkCoreColorReleaseFfiHandle(_valueHandle);

  }



}

Pointer<Void> sdkNavigationVisualnavigatorcolorsToFfi(VisualNavigatorColors value) =>
  _sdkNavigationVisualnavigatorcolorsCopyHandle((value as __lib.NativeBase).handle);

VisualNavigatorColors sdkNavigationVisualnavigatorcolorsFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is VisualNavigatorColors) return instance;

  final _copiedHandle = _sdkNavigationVisualnavigatorcolorsCopyHandle(handle);
  final result = VisualNavigatorColors$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkNavigationVisualnavigatorcolorsRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkNavigationVisualnavigatorcolorsReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkNavigationVisualnavigatorcolorsReleaseHandle(handle);

Pointer<Void> sdkNavigationVisualnavigatorcolorsToFfiNullable(VisualNavigatorColors? value) =>
  value != null ? sdkNavigationVisualnavigatorcolorsToFfi(value) : Pointer<Void>.fromAddress(0);

VisualNavigatorColors? sdkNavigationVisualnavigatorcolorsFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkNavigationVisualnavigatorcolorsFromFfi(handle) : null;

void sdkNavigationVisualnavigatorcolorsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationVisualnavigatorcolorsReleaseHandle(handle);

// End of VisualNavigatorColors "private" section.


