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

/// Type of a border crossing given in a [BorderCrossingWarning].
enum BorderCrossingType {
    /// Indicates the crossing of a country border.
    country,
    /// Indicates the crossing of a state border inside the same country.
    state
}

// BorderCrossingType "private" section, not exported.

int sdkNavigationBordercrossingtypeToFfi(BorderCrossingType value) {
  switch (value) {
  case BorderCrossingType.country:
    return 0;
  case BorderCrossingType.state:
    return 1;
  default:
    throw StateError("Invalid enum value $value for BorderCrossingType enum.");
  }
}

BorderCrossingType sdkNavigationBordercrossingtypeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return BorderCrossingType.country;
  case 1:
    return BorderCrossingType.state;
  default:
    throw StateError("Invalid numeric value $handle for BorderCrossingType enum.");
  }
}

void sdkNavigationBordercrossingtypeReleaseFfiHandle(int handle) {}

final _sdkNavigationBordercrossingtypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_navigation_BorderCrossingType_create_handle_nullable'));
final _sdkNavigationBordercrossingtypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_BorderCrossingType_release_handle_nullable'));
final _sdkNavigationBordercrossingtypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_BorderCrossingType_get_value_nullable'));

Pointer<Void> sdkNavigationBordercrossingtypeToFfiNullable(BorderCrossingType? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationBordercrossingtypeToFfi(value);
  final result = _sdkNavigationBordercrossingtypeCreateHandleNullable(_handle);
  sdkNavigationBordercrossingtypeReleaseFfiHandle(_handle);
  return result;
}

BorderCrossingType? sdkNavigationBordercrossingtypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationBordercrossingtypeGetValueNullable(handle);
  final result = sdkNavigationBordercrossingtypeFromFfi(_handle);
  sdkNavigationBordercrossingtypeReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationBordercrossingtypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationBordercrossingtypeReleaseHandleNullable(handle);

// End of BorderCrossingType "private" section.


