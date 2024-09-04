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

/// Type of realistic view
/// @nodoc
enum RealisticViewType {
    /// Unknown realistic view type
    unknown,
    /// Junction
    junction,
    /// Service station
    serviceStation,
    /// Toll collection station
    tollCollectionStation
}

// RealisticViewType "private" section, not exported.

int sdkNavigationRealisticviewtypeToFfi(RealisticViewType value) {
  switch (value) {
  case RealisticViewType.unknown:
    return 0;
  case RealisticViewType.junction:
    return 1;
  case RealisticViewType.serviceStation:
    return 2;
  case RealisticViewType.tollCollectionStation:
    return 3;
  default:
    throw StateError("Invalid enum value $value for RealisticViewType enum.");
  }
}

RealisticViewType sdkNavigationRealisticviewtypeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return RealisticViewType.unknown;
  case 1:
    return RealisticViewType.junction;
  case 2:
    return RealisticViewType.serviceStation;
  case 3:
    return RealisticViewType.tollCollectionStation;
  default:
    throw StateError("Invalid numeric value $handle for RealisticViewType enum.");
  }
}

void sdkNavigationRealisticviewtypeReleaseFfiHandle(int handle) {}

final _sdkNavigationRealisticviewtypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_navigation_RealisticViewType_create_handle_nullable'));
final _sdkNavigationRealisticviewtypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RealisticViewType_release_handle_nullable'));
final _sdkNavigationRealisticviewtypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RealisticViewType_get_value_nullable'));

Pointer<Void> sdkNavigationRealisticviewtypeToFfiNullable(RealisticViewType? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationRealisticviewtypeToFfi(value);
  final result = _sdkNavigationRealisticviewtypeCreateHandleNullable(_handle);
  sdkNavigationRealisticviewtypeReleaseFfiHandle(_handle);
  return result;
}

RealisticViewType? sdkNavigationRealisticviewtypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationRealisticviewtypeGetValueNullable(handle);
  final result = sdkNavigationRealisticviewtypeFromFfi(_handle);
  sdkNavigationRealisticviewtypeReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationRealisticviewtypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationRealisticviewtypeReleaseHandleNullable(handle);

// End of RealisticViewType "private" section.


