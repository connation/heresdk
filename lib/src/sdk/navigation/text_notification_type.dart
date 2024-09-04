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

/// Different types of text notifications.
enum TextNotificationType {
    /// Notifications which contain the information about the next maneuver.
    /// e.g. "Now turn right"
    maneuver,
    /// Notifications which contain the information about the next safety camera warner.
    /// e.g."Speed camera ahead"
    safetyCameraWarning,
    /// Notifications which contain the information about the next safety camera warner.
    /// e.g."Speed camera ahead"
    @Deprecated("Will be removed in v4.21.0. Please use the method with [TextNotificationType.safetyCameraWarning] parameter instead.")
    speedCameraWarning
}

// TextNotificationType "private" section, not exported.

int sdkNavigationTextnotificationtypeToFfi(TextNotificationType value) {
  switch (value) {
  case TextNotificationType.maneuver:
    return 0;
  case TextNotificationType.safetyCameraWarning:
    return 1;
  case TextNotificationType.speedCameraWarning:
    return 2;
  default:
    throw StateError("Invalid enum value $value for TextNotificationType enum.");
  }
}

TextNotificationType sdkNavigationTextnotificationtypeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return TextNotificationType.maneuver;
  case 1:
    return TextNotificationType.safetyCameraWarning;
  case 2:
    return TextNotificationType.speedCameraWarning;
  default:
    throw StateError("Invalid numeric value $handle for TextNotificationType enum.");
  }
}

void sdkNavigationTextnotificationtypeReleaseFfiHandle(int handle) {}

final _sdkNavigationTextnotificationtypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_navigation_TextNotificationType_create_handle_nullable'));
final _sdkNavigationTextnotificationtypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TextNotificationType_release_handle_nullable'));
final _sdkNavigationTextnotificationtypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TextNotificationType_get_value_nullable'));

Pointer<Void> sdkNavigationTextnotificationtypeToFfiNullable(TextNotificationType? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationTextnotificationtypeToFfi(value);
  final result = _sdkNavigationTextnotificationtypeCreateHandleNullable(_handle);
  sdkNavigationTextnotificationtypeReleaseFfiHandle(_handle);
  return result;
}

TextNotificationType? sdkNavigationTextnotificationtypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationTextnotificationtypeGetValueNullable(handle);
  final result = sdkNavigationTextnotificationtypeFromFfi(_handle);
  sdkNavigationTextnotificationtypeReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationTextnotificationtypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationTextnotificationtypeReleaseHandleNullable(handle);

// End of TextNotificationType "private" section.


