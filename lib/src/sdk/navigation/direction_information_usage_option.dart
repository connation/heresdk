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

/// Indicates the option of direction information included in the notification.
enum DirectionInformationUsageOption {
    /// No direction information is included in the notification. Notification example: 'Now turn left to join the
    /// highway.'
    none,
    /// Road information (either street name or road number based on the maneuver action) is included in the notification,
    /// if available. Street name is included mainly for non-highway-related maneuver, whilst road number is included
    /// in case of highway-related maneuver. Notification example: 'Now turn left to join the I-83 South.'
    roadInformationOnly,
    /// Both Road information (either street name or road number based on the maneuver action) and signpost direction are
    /// included in the notification, or either one, if available. Street name is included mainly for non-highway-related
    /// maneuver, whilst road number is included in case of highway-related maneuver. Notification example: 'Now turn left
    /// to join the I-83 South towards Baltimore.'
    roadInformationAndSignpostDirection
}

// DirectionInformationUsageOption "private" section, not exported.

int sdkNavigationDirectioninformationusageoptionToFfi(DirectionInformationUsageOption value) {
  switch (value) {
  case DirectionInformationUsageOption.none:
    return 0;
  case DirectionInformationUsageOption.roadInformationOnly:
    return 1;
  case DirectionInformationUsageOption.roadInformationAndSignpostDirection:
    return 2;
  default:
    throw StateError("Invalid enum value $value for DirectionInformationUsageOption enum.");
  }
}

DirectionInformationUsageOption sdkNavigationDirectioninformationusageoptionFromFfi(int handle) {
  switch (handle) {
  case 0:
    return DirectionInformationUsageOption.none;
  case 1:
    return DirectionInformationUsageOption.roadInformationOnly;
  case 2:
    return DirectionInformationUsageOption.roadInformationAndSignpostDirection;
  default:
    throw StateError("Invalid numeric value $handle for DirectionInformationUsageOption enum.");
  }
}

void sdkNavigationDirectioninformationusageoptionReleaseFfiHandle(int handle) {}

final _sdkNavigationDirectioninformationusageoptionCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_navigation_DirectionInformationUsageOption_create_handle_nullable'));
final _sdkNavigationDirectioninformationusageoptionReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_DirectionInformationUsageOption_release_handle_nullable'));
final _sdkNavigationDirectioninformationusageoptionGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_DirectionInformationUsageOption_get_value_nullable'));

Pointer<Void> sdkNavigationDirectioninformationusageoptionToFfiNullable(DirectionInformationUsageOption? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationDirectioninformationusageoptionToFfi(value);
  final result = _sdkNavigationDirectioninformationusageoptionCreateHandleNullable(_handle);
  sdkNavigationDirectioninformationusageoptionReleaseFfiHandle(_handle);
  return result;
}

DirectionInformationUsageOption? sdkNavigationDirectioninformationusageoptionFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationDirectioninformationusageoptionGetValueNullable(handle);
  final result = sdkNavigationDirectioninformationusageoptionFromFfi(_handle);
  sdkNavigationDirectioninformationusageoptionReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationDirectioninformationusageoptionReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationDirectioninformationusageoptionReleaseHandleNullable(handle);

// End of DirectionInformationUsageOption "private" section.


