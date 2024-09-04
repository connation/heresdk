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
import 'package:here_sdk/src/sdk/venue/style/icon.dart';

/// Specifies the icon information.
/// @nodoc
abstract class IconInfo {

  /// Gets the URL of the icon.
  String get url;

  /// Gets the name of the icon.
  String get name;

  /// Gets the icon.
  Icon get icon;

}


// IconInfo "private" section, not exported.

final _sdkVenueStyleIconinfoRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_venue_style_IconInfo_register_finalizer'));
final _sdkVenueStyleIconinfoCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_style_IconInfo_copy_handle'));
final _sdkVenueStyleIconinfoReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_style_IconInfo_release_handle'));


class IconInfo$Impl extends __lib.NativeBase implements IconInfo {

  IconInfo$Impl(Pointer<Void> handle) : super(handle);

  @override
  String get url {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_style_IconInfo_url_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  String get name {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_style_IconInfo_name_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  Icon get icon {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_style_IconInfo_icon_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkVenueStyleIconFromFfi(__resultHandle);
    } finally {
      sdkVenueStyleIconReleaseFfiHandle(__resultHandle);

    }

  }



}

Pointer<Void> sdkVenueStyleIconinfoToFfi(IconInfo value) =>
  _sdkVenueStyleIconinfoCopyHandle((value as __lib.NativeBase).handle);

IconInfo sdkVenueStyleIconinfoFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is IconInfo) return instance;

  final _copiedHandle = _sdkVenueStyleIconinfoCopyHandle(handle);
  final result = IconInfo$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkVenueStyleIconinfoRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkVenueStyleIconinfoReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkVenueStyleIconinfoReleaseHandle(handle);

Pointer<Void> sdkVenueStyleIconinfoToFfiNullable(IconInfo? value) =>
  value != null ? sdkVenueStyleIconinfoToFfi(value) : Pointer<Void>.fromAddress(0);

IconInfo? sdkVenueStyleIconinfoFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkVenueStyleIconinfoFromFfi(handle) : null;

void sdkVenueStyleIconinfoReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkVenueStyleIconinfoReleaseHandle(handle);

// End of IconInfo "private" section.


