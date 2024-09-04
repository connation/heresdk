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
import 'package:here_sdk/src/sdk/core/color.dart';
import 'package:here_sdk/src/sdk/core/named_color.dart';

/// This struct contains colors for the route progress visualization.

class RouteProgressColors {
  /// Color of the route part that lies ahead of the current location.
  ui.Color ahead;

  /// Color of the route part that lies behind of the current location.
  ui.Color behind;

  /// Color of the dashed line between the map-matched and the off-road destinations.
  ui.Color offRoad;

  /// Outline color of the route part that lies ahead of the current location.
  ui.Color outlineAhead;

  /// Outline color of the route part that lies behind of the current location.
  ui.Color outlineBehind;

  /// Creates a new instance.

  /// [ahead] Color of the route part that lies ahead of the current location.

  /// [behind] Color of the route part that lies behind of the current location.

  /// [offRoad] Color of the dashed line between the map-matched and the off-road destinations.

  /// [outlineAhead] Outline color of the route part that lies ahead of the current location.

  /// [outlineBehind] Outline color of the route part that lies behind of the current location.

  RouteProgressColors._(this.ahead, this.behind, this.offRoad, this.outlineAhead, this.outlineBehind);
  RouteProgressColors(ui.Color ahead, ui.Color behind, ui.Color outlineAhead, ui.Color outlineBehind)
    : ahead = ahead, behind = behind, offRoad = NamedColor.white, outlineAhead = outlineAhead, outlineBehind = outlineBehind;
}


// RouteProgressColors "private" section, not exported.

final _sdkNavigationRouteprogresscolorsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_navigation_RouteProgressColors_create_handle'));
final _sdkNavigationRouteprogresscolorsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RouteProgressColors_release_handle'));
final _sdkNavigationRouteprogresscolorsGetFieldahead = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RouteProgressColors_get_field_ahead'));
final _sdkNavigationRouteprogresscolorsGetFieldbehind = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RouteProgressColors_get_field_behind'));
final _sdkNavigationRouteprogresscolorsGetFieldoffRoad = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RouteProgressColors_get_field_offRoad'));
final _sdkNavigationRouteprogresscolorsGetFieldoutlineAhead = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RouteProgressColors_get_field_outlineAhead'));
final _sdkNavigationRouteprogresscolorsGetFieldoutlineBehind = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RouteProgressColors_get_field_outlineBehind'));



Pointer<Void> sdkNavigationRouteprogresscolorsToFfi(RouteProgressColors value) {
  final _aheadHandle = sdkCoreColorToFfi(value.ahead);
  final _behindHandle = sdkCoreColorToFfi(value.behind);
  final _offRoadHandle = sdkCoreColorToFfi(value.offRoad);
  final _outlineAheadHandle = sdkCoreColorToFfi(value.outlineAhead);
  final _outlineBehindHandle = sdkCoreColorToFfi(value.outlineBehind);
  final _result = _sdkNavigationRouteprogresscolorsCreateHandle(_aheadHandle, _behindHandle, _offRoadHandle, _outlineAheadHandle, _outlineBehindHandle);
  sdkCoreColorReleaseFfiHandle(_aheadHandle);
  sdkCoreColorReleaseFfiHandle(_behindHandle);
  sdkCoreColorReleaseFfiHandle(_offRoadHandle);
  sdkCoreColorReleaseFfiHandle(_outlineAheadHandle);
  sdkCoreColorReleaseFfiHandle(_outlineBehindHandle);
  return _result;
}

RouteProgressColors sdkNavigationRouteprogresscolorsFromFfi(Pointer<Void> handle) {
  final _aheadHandle = _sdkNavigationRouteprogresscolorsGetFieldahead(handle);
  final _behindHandle = _sdkNavigationRouteprogresscolorsGetFieldbehind(handle);
  final _offRoadHandle = _sdkNavigationRouteprogresscolorsGetFieldoffRoad(handle);
  final _outlineAheadHandle = _sdkNavigationRouteprogresscolorsGetFieldoutlineAhead(handle);
  final _outlineBehindHandle = _sdkNavigationRouteprogresscolorsGetFieldoutlineBehind(handle);
  try {
    return RouteProgressColors._(
      sdkCoreColorFromFfi(_aheadHandle), 
      sdkCoreColorFromFfi(_behindHandle), 
      sdkCoreColorFromFfi(_offRoadHandle), 
      sdkCoreColorFromFfi(_outlineAheadHandle), 
      sdkCoreColorFromFfi(_outlineBehindHandle)
    );
  } finally {
    sdkCoreColorReleaseFfiHandle(_aheadHandle);
    sdkCoreColorReleaseFfiHandle(_behindHandle);
    sdkCoreColorReleaseFfiHandle(_offRoadHandle);
    sdkCoreColorReleaseFfiHandle(_outlineAheadHandle);
    sdkCoreColorReleaseFfiHandle(_outlineBehindHandle);
  }
}

void sdkNavigationRouteprogresscolorsReleaseFfiHandle(Pointer<Void> handle) => _sdkNavigationRouteprogresscolorsReleaseHandle(handle);

// Nullable RouteProgressColors

final _sdkNavigationRouteprogresscolorsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RouteProgressColors_create_handle_nullable'));
final _sdkNavigationRouteprogresscolorsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RouteProgressColors_release_handle_nullable'));
final _sdkNavigationRouteprogresscolorsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RouteProgressColors_get_value_nullable'));

Pointer<Void> sdkNavigationRouteprogresscolorsToFfiNullable(RouteProgressColors? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationRouteprogresscolorsToFfi(value);
  final result = _sdkNavigationRouteprogresscolorsCreateHandleNullable(_handle);
  sdkNavigationRouteprogresscolorsReleaseFfiHandle(_handle);
  return result;
}

RouteProgressColors? sdkNavigationRouteprogresscolorsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationRouteprogresscolorsGetValueNullable(handle);
  final result = sdkNavigationRouteprogresscolorsFromFfi(_handle);
  sdkNavigationRouteprogresscolorsReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationRouteprogresscolorsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationRouteprogresscolorsReleaseHandleNullable(handle);

// End of RouteProgressColors "private" section.


