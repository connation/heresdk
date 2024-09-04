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

/// Specifies the label names.
/// @nodoc
abstract class LabelName {

}


// LabelName "private" section, not exported.

final _sdkVenueStyleLabelnameRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_venue_style_LabelName_register_finalizer'));
final _sdkVenueStyleLabelnameCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_style_LabelName_copy_handle'));
final _sdkVenueStyleLabelnameReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_style_LabelName_release_handle'));


class LabelName$Impl extends __lib.NativeBase implements LabelName {

  LabelName$Impl(Pointer<Void> handle) : super(handle);


}

Pointer<Void> sdkVenueStyleLabelnameToFfi(LabelName value) =>
  _sdkVenueStyleLabelnameCopyHandle((value as __lib.NativeBase).handle);

LabelName sdkVenueStyleLabelnameFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is LabelName) return instance;

  final _copiedHandle = _sdkVenueStyleLabelnameCopyHandle(handle);
  final result = LabelName$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkVenueStyleLabelnameRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkVenueStyleLabelnameReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkVenueStyleLabelnameReleaseHandle(handle);

Pointer<Void> sdkVenueStyleLabelnameToFfiNullable(LabelName? value) =>
  value != null ? sdkVenueStyleLabelnameToFfi(value) : Pointer<Void>.fromAddress(0);

LabelName? sdkVenueStyleLabelnameFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkVenueStyleLabelnameFromFfi(handle) : null;

void sdkVenueStyleLabelnameReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkVenueStyleLabelnameReleaseHandle(handle);

// End of LabelName "private" section.


