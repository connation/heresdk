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

/// Specifies the navigation properties.
/// @nodoc
abstract class NavProperties {

}


// NavProperties "private" section, not exported.

final _sdkVenueStyleNavpropertiesRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_venue_style_NavProperties_register_finalizer'));
final _sdkVenueStyleNavpropertiesCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_style_NavProperties_copy_handle'));
final _sdkVenueStyleNavpropertiesReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_style_NavProperties_release_handle'));


class NavProperties$Impl extends __lib.NativeBase implements NavProperties {

  NavProperties$Impl(Pointer<Void> handle) : super(handle);


}

Pointer<Void> sdkVenueStyleNavpropertiesToFfi(NavProperties value) =>
  _sdkVenueStyleNavpropertiesCopyHandle((value as __lib.NativeBase).handle);

NavProperties sdkVenueStyleNavpropertiesFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is NavProperties) return instance;

  final _copiedHandle = _sdkVenueStyleNavpropertiesCopyHandle(handle);
  final result = NavProperties$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkVenueStyleNavpropertiesRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkVenueStyleNavpropertiesReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkVenueStyleNavpropertiesReleaseHandle(handle);

Pointer<Void> sdkVenueStyleNavpropertiesToFfiNullable(NavProperties? value) =>
  value != null ? sdkVenueStyleNavpropertiesToFfi(value) : Pointer<Void>.fromAddress(0);

NavProperties? sdkVenueStyleNavpropertiesFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkVenueStyleNavpropertiesFromFfi(handle) : null;

void sdkVenueStyleNavpropertiesReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkVenueStyleNavpropertiesReleaseHandle(handle);

// End of NavProperties "private" section.


