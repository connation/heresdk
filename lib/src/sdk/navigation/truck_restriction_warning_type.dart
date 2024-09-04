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

/// Type of the truck restriction warning.
///
/// **Note**: This is a beta release of this feature, so there could be a few bugs and unexpected
/// behaviors. Related APIs may change for new releases without a deprecation process.
@Deprecated("Will be removed in v4.20.0. Please check all TruckRestrictionWarning fields in order to announce/display the correct truck restriction.")
enum TruckRestrictionWarningType {
    /// A general restriction that disallows trucks.
    general,
    /// A weight restriction.
    weight,
    /// A dimension restriction.
    dimension
}

// TruckRestrictionWarningType "private" section, not exported.

int sdkNavigationTruckrestrictionwarningtypeToFfi(TruckRestrictionWarningType value) {
  switch (value) {
  case TruckRestrictionWarningType.general:
    return 0;
  case TruckRestrictionWarningType.weight:
    return 1;
  case TruckRestrictionWarningType.dimension:
    return 2;
  default:
    throw StateError("Invalid enum value $value for TruckRestrictionWarningType enum.");
  }
}

TruckRestrictionWarningType sdkNavigationTruckrestrictionwarningtypeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return TruckRestrictionWarningType.general;
  case 1:
    return TruckRestrictionWarningType.weight;
  case 2:
    return TruckRestrictionWarningType.dimension;
  default:
    throw StateError("Invalid numeric value $handle for TruckRestrictionWarningType enum.");
  }
}

void sdkNavigationTruckrestrictionwarningtypeReleaseFfiHandle(int handle) {}

final _sdkNavigationTruckrestrictionwarningtypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_navigation_TruckRestrictionWarningType_create_handle_nullable'));
final _sdkNavigationTruckrestrictionwarningtypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TruckRestrictionWarningType_release_handle_nullable'));
final _sdkNavigationTruckrestrictionwarningtypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TruckRestrictionWarningType_get_value_nullable'));

Pointer<Void> sdkNavigationTruckrestrictionwarningtypeToFfiNullable(TruckRestrictionWarningType? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationTruckrestrictionwarningtypeToFfi(value);
  final result = _sdkNavigationTruckrestrictionwarningtypeCreateHandleNullable(_handle);
  sdkNavigationTruckrestrictionwarningtypeReleaseFfiHandle(_handle);
  return result;
}

TruckRestrictionWarningType? sdkNavigationTruckrestrictionwarningtypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationTruckrestrictionwarningtypeGetValueNullable(handle);
  final result = sdkNavigationTruckrestrictionwarningtypeFromFfi(_handle);
  sdkNavigationTruckrestrictionwarningtypeReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationTruckrestrictionwarningtypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationTruckrestrictionwarningtypeReleaseHandleNullable(handle);

// End of TruckRestrictionWarningType "private" section.


