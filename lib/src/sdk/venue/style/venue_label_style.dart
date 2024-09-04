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
import 'package:meta/meta.dart';

/// Represents a style of the label.
abstract class VenueLabelStyle {
  /// Creates a custom label style with specific parameters.
  ///
  /// [fillColor] The fill color.
  ///
  /// [outlineColor] The outline color.
  ///
  /// [outlineWidth] The width color.
  ///
  /// [maxFont] The max font.
  ///
  factory VenueLabelStyle(ui.Color fillColor, ui.Color outlineColor, double outlineWidth, int maxFont) => $prototype.make(fillColor, outlineColor, outlineWidth, maxFont);

  /// Gets a maximum font size for this label style.
  int get maxFont;

  /// Gets a fill color for this label style.
  ui.Color get fillColor;

  /// Gets an outline color or `null` if an outline color
  /// has not been set for this label style.
  ui.Color? get outlineColor;

  /// Gets an outline width for this label style.
  double get outlineWidth;


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = VenueLabelStyle$Impl(Pointer<Void>.fromAddress(0));
}


// VenueLabelStyle "private" section, not exported.

final _sdkVenueStyleVenuelabelstyleRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_venue_style_VenueLabelStyle_register_finalizer'));
final _sdkVenueStyleVenuelabelstyleCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_style_VenueLabelStyle_copy_handle'));
final _sdkVenueStyleVenuelabelstyleReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_style_VenueLabelStyle_release_handle'));



/// @nodoc
@visibleForTesting
class VenueLabelStyle$Impl extends __lib.NativeBase implements VenueLabelStyle {

  VenueLabelStyle$Impl(Pointer<Void> handle) : super(handle);


  VenueLabelStyle make(ui.Color fillColor, ui.Color outlineColor, double outlineWidth, int maxFont) {
    final _result_handle = _make(fillColor, outlineColor, outlineWidth, maxFont);
    final _result = VenueLabelStyle$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkVenueStyleVenuelabelstyleRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _make(ui.Color fillColor, ui.Color outlineColor, double outlineWidth, int maxFont) {
    final _makeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Float, Int32), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, double, int)>('here_sdk_sdk_venue_style_VenueLabelStyle_make__Color_Color_Float_Int'));
    final _fillColorHandle = sdkCoreColorToFfi(fillColor);
    final _outlineColorHandle = sdkCoreColorToFfi(outlineColor);
    final _outlineWidthHandle = (outlineWidth);
    final _maxFontHandle = (maxFont);
    final __resultHandle = _makeFfi(__lib.LibraryContext.isolateId, _fillColorHandle, _outlineColorHandle, _outlineWidthHandle, _maxFontHandle);
    sdkCoreColorReleaseFfiHandle(_fillColorHandle);
    sdkCoreColorReleaseFfiHandle(_outlineColorHandle);


    return __resultHandle;
  }

  @override
  int get maxFont {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_venue_style_VenueLabelStyle_maxFont_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }


  @override
  ui.Color get fillColor {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_style_VenueLabelStyle_fillColor_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreColorFromFfi(__resultHandle);
    } finally {
      sdkCoreColorReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  ui.Color? get outlineColor {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_style_VenueLabelStyle_outlineColor_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreColorFromFfiNullable(__resultHandle);
    } finally {
      sdkCoreColorReleaseFfiHandleNullable(__resultHandle);

    }

  }


  @override
  double get outlineWidth {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Float Function(Pointer<Void>, Int32), double Function(Pointer<Void>, int)>('here_sdk_sdk_venue_style_VenueLabelStyle_outlineWidth_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }



}

Pointer<Void> sdkVenueStyleVenuelabelstyleToFfi(VenueLabelStyle value) =>
  _sdkVenueStyleVenuelabelstyleCopyHandle((value as __lib.NativeBase).handle);

VenueLabelStyle sdkVenueStyleVenuelabelstyleFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is VenueLabelStyle) return instance;

  final _copiedHandle = _sdkVenueStyleVenuelabelstyleCopyHandle(handle);
  final result = VenueLabelStyle$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkVenueStyleVenuelabelstyleRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkVenueStyleVenuelabelstyleReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkVenueStyleVenuelabelstyleReleaseHandle(handle);

Pointer<Void> sdkVenueStyleVenuelabelstyleToFfiNullable(VenueLabelStyle? value) =>
  value != null ? sdkVenueStyleVenuelabelstyleToFfi(value) : Pointer<Void>.fromAddress(0);

VenueLabelStyle? sdkVenueStyleVenuelabelstyleFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkVenueStyleVenuelabelstyleFromFfi(handle) : null;

void sdkVenueStyleVenuelabelstyleReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkVenueStyleVenuelabelstyleReleaseHandle(handle);

// End of VenueLabelStyle "private" section.


