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

/// This enum represents the type of the [Milestone].
enum MilestoneType {
    /// A [Milestone] that corresponds to stopover waypoint.
    stopover,
    /// A [Milestone] that corresponds to passthrough waypoint.
    passthrough
}

// MilestoneType "private" section, not exported.

int sdkNavigationMilestonetypeToFfi(MilestoneType value) {
  switch (value) {
  case MilestoneType.stopover:
    return 0;
  case MilestoneType.passthrough:
    return 1;
  default:
    throw StateError("Invalid enum value $value for MilestoneType enum.");
  }
}

MilestoneType sdkNavigationMilestonetypeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return MilestoneType.stopover;
  case 1:
    return MilestoneType.passthrough;
  default:
    throw StateError("Invalid numeric value $handle for MilestoneType enum.");
  }
}

void sdkNavigationMilestonetypeReleaseFfiHandle(int handle) {}

final _sdkNavigationMilestonetypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_navigation_MilestoneType_create_handle_nullable'));
final _sdkNavigationMilestonetypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_MilestoneType_release_handle_nullable'));
final _sdkNavigationMilestonetypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_MilestoneType_get_value_nullable'));

Pointer<Void> sdkNavigationMilestonetypeToFfiNullable(MilestoneType? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationMilestonetypeToFfi(value);
  final result = _sdkNavigationMilestonetypeCreateHandleNullable(_handle);
  sdkNavigationMilestonetypeReleaseFfiHandle(_handle);
  return result;
}

MilestoneType? sdkNavigationMilestonetypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationMilestonetypeGetValueNullable(handle);
  final result = sdkNavigationMilestonetypeFromFfi(_handle);
  sdkNavigationMilestonetypeReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationMilestonetypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationMilestonetypeReleaseHandleNullable(handle);

// End of MilestoneType "private" section.


