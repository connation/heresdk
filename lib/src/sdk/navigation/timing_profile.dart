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

/// Identifies the timing profile used for emitting notifications and warnings.
enum TimingProfile {
    /// Timing profile used when the speed is slow.
    slowSpeed,
    /// Timing profile used when the speed is regular.
    regularSpeed,
    /// Timing profile used when the speed is fast.
    fastSpeed
}

// TimingProfile "private" section, not exported.

int sdkNavigationTimingprofileToFfi(TimingProfile value) {
  switch (value) {
  case TimingProfile.slowSpeed:
    return 0;
  case TimingProfile.regularSpeed:
    return 1;
  case TimingProfile.fastSpeed:
    return 2;
  default:
    throw StateError("Invalid enum value $value for TimingProfile enum.");
  }
}

TimingProfile sdkNavigationTimingprofileFromFfi(int handle) {
  switch (handle) {
  case 0:
    return TimingProfile.slowSpeed;
  case 1:
    return TimingProfile.regularSpeed;
  case 2:
    return TimingProfile.fastSpeed;
  default:
    throw StateError("Invalid numeric value $handle for TimingProfile enum.");
  }
}

void sdkNavigationTimingprofileReleaseFfiHandle(int handle) {}

final _sdkNavigationTimingprofileCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_navigation_TimingProfile_create_handle_nullable'));
final _sdkNavigationTimingprofileReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TimingProfile_release_handle_nullable'));
final _sdkNavigationTimingprofileGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TimingProfile_get_value_nullable'));

Pointer<Void> sdkNavigationTimingprofileToFfiNullable(TimingProfile? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationTimingprofileToFfi(value);
  final result = _sdkNavigationTimingprofileCreateHandleNullable(_handle);
  sdkNavigationTimingprofileReleaseFfiHandle(_handle);
  return result;
}

TimingProfile? sdkNavigationTimingprofileFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationTimingprofileGetValueNullable(handle);
  final result = sdkNavigationTimingprofileFromFfi(_handle);
  sdkNavigationTimingprofileReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationTimingprofileReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationTimingprofileReleaseHandleNullable(handle);

// End of TimingProfile "private" section.


