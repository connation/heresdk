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

/// Specifies the icon properties.
/// @nodoc
abstract class Icon {

  /// Gets the icon in SVG Tiny format.
  String get svg;

  /// Gets the path to a file containing the icon in SVG Tiny format.
  String get svgPath;

}


// Icon "private" section, not exported.

final _sdkVenueStyleIconRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_venue_style_Icon_register_finalizer'));
final _sdkVenueStyleIconCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_style_Icon_copy_handle'));
final _sdkVenueStyleIconReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_style_Icon_release_handle'));


class Icon$Impl extends __lib.NativeBase implements Icon {

  Icon$Impl(Pointer<Void> handle) : super(handle);

  @override
  String get svg {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_style_Icon_svg_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  String get svgPath {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_style_Icon_svgPath_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }



}

Pointer<Void> sdkVenueStyleIconToFfi(Icon value) =>
  _sdkVenueStyleIconCopyHandle((value as __lib.NativeBase).handle);

Icon sdkVenueStyleIconFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is Icon) return instance;

  final _copiedHandle = _sdkVenueStyleIconCopyHandle(handle);
  final result = Icon$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkVenueStyleIconRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkVenueStyleIconReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkVenueStyleIconReleaseHandle(handle);

Pointer<Void> sdkVenueStyleIconToFfiNullable(Icon? value) =>
  value != null ? sdkVenueStyleIconToFfi(value) : Pointer<Void>.fromAddress(0);

Icon? sdkVenueStyleIconFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkVenueStyleIconFromFfi(handle) : null;

void sdkVenueStyleIconReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkVenueStyleIconReleaseHandle(handle);

// End of Icon "private" section.


