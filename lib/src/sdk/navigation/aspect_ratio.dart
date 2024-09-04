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

/// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected
/// behaviors.
///
/// Related APIs may change for new releases without a deprecation process.
enum AspectRatio {
    /// The aspect ratio of the image will be 3:4.
    aspectRatio3X4,
    /// The aspect ratio of the image will be 16:9.
    aspectRatio16X9
}

// AspectRatio "private" section, not exported.

int sdkNavigationAspectratioToFfi(AspectRatio value) {
  switch (value) {
  case AspectRatio.aspectRatio3X4:
    return 0;
  case AspectRatio.aspectRatio16X9:
    return 1;
  default:
    throw StateError("Invalid enum value $value for AspectRatio enum.");
  }
}

AspectRatio sdkNavigationAspectratioFromFfi(int handle) {
  switch (handle) {
  case 0:
    return AspectRatio.aspectRatio3X4;
  case 1:
    return AspectRatio.aspectRatio16X9;
  default:
    throw StateError("Invalid numeric value $handle for AspectRatio enum.");
  }
}

void sdkNavigationAspectratioReleaseFfiHandle(int handle) {}

final _sdkNavigationAspectratioCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_navigation_AspectRatio_create_handle_nullable'));
final _sdkNavigationAspectratioReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_AspectRatio_release_handle_nullable'));
final _sdkNavigationAspectratioGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_AspectRatio_get_value_nullable'));

Pointer<Void> sdkNavigationAspectratioToFfiNullable(AspectRatio? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationAspectratioToFfi(value);
  final result = _sdkNavigationAspectratioCreateHandleNullable(_handle);
  sdkNavigationAspectratioReleaseFfiHandle(_handle);
  return result;
}

AspectRatio? sdkNavigationAspectratioFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationAspectratioGetValueNullable(handle);
  final result = sdkNavigationAspectratioFromFfi(_handle);
  sdkNavigationAspectratioReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationAspectratioReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationAspectratioReleaseHandleNullable(handle);

// End of AspectRatio "private" section.


