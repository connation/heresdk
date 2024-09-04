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

/// Specifies the navigation names.
/// @nodoc
abstract class NavName {

}


// NavName "private" section, not exported.

final _sdkVenueStyleNavnameRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_venue_style_NavName_register_finalizer'));
final _sdkVenueStyleNavnameCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_style_NavName_copy_handle'));
final _sdkVenueStyleNavnameReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_style_NavName_release_handle'));


class NavName$Impl extends __lib.NativeBase implements NavName {

  NavName$Impl(Pointer<Void> handle) : super(handle);


}

Pointer<Void> sdkVenueStyleNavnameToFfi(NavName value) =>
  _sdkVenueStyleNavnameCopyHandle((value as __lib.NativeBase).handle);

NavName sdkVenueStyleNavnameFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is NavName) return instance;

  final _copiedHandle = _sdkVenueStyleNavnameCopyHandle(handle);
  final result = NavName$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkVenueStyleNavnameRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkVenueStyleNavnameReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkVenueStyleNavnameReleaseHandle(handle);

Pointer<Void> sdkVenueStyleNavnameToFfiNullable(NavName? value) =>
  value != null ? sdkVenueStyleNavnameToFfi(value) : Pointer<Void>.fromAddress(0);

NavName? sdkVenueStyleNavnameFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkVenueStyleNavnameFromFfi(handle) : null;

void sdkVenueStyleNavnameReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkVenueStyleNavnameReleaseHandle(handle);

// End of NavName "private" section.


