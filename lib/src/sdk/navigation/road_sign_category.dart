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

/// Road sign category defining a general purpose of the sign.
enum RoadSignCategory {
    /// Unknown road sign category.
    unknown,
    /// Regulatory sign category.
    regulatorySign,
    /// Informative sign category.
    informativeSign,
    /// Warning sign category.
    warningSign
}

// RoadSignCategory "private" section, not exported.

int sdkNavigationRoadsigncategoryToFfi(RoadSignCategory value) {
  switch (value) {
  case RoadSignCategory.unknown:
    return 0;
  case RoadSignCategory.regulatorySign:
    return 1;
  case RoadSignCategory.informativeSign:
    return 2;
  case RoadSignCategory.warningSign:
    return 3;
  default:
    throw StateError("Invalid enum value $value for RoadSignCategory enum.");
  }
}

RoadSignCategory sdkNavigationRoadsigncategoryFromFfi(int handle) {
  switch (handle) {
  case 0:
    return RoadSignCategory.unknown;
  case 1:
    return RoadSignCategory.regulatorySign;
  case 2:
    return RoadSignCategory.informativeSign;
  case 3:
    return RoadSignCategory.warningSign;
  default:
    throw StateError("Invalid numeric value $handle for RoadSignCategory enum.");
  }
}

void sdkNavigationRoadsigncategoryReleaseFfiHandle(int handle) {}

final _sdkNavigationRoadsigncategoryCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_navigation_RoadSignCategory_create_handle_nullable'));
final _sdkNavigationRoadsigncategoryReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadSignCategory_release_handle_nullable'));
final _sdkNavigationRoadsigncategoryGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadSignCategory_get_value_nullable'));

Pointer<Void> sdkNavigationRoadsigncategoryToFfiNullable(RoadSignCategory? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationRoadsigncategoryToFfi(value);
  final result = _sdkNavigationRoadsigncategoryCreateHandleNullable(_handle);
  sdkNavigationRoadsigncategoryReleaseFfiHandle(_handle);
  return result;
}

RoadSignCategory? sdkNavigationRoadsigncategoryFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationRoadsigncategoryGetValueNullable(handle);
  final result = sdkNavigationRoadsigncategoryFromFfi(_handle);
  sdkNavigationRoadsigncategoryReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationRoadsigncategoryReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationRoadsigncategoryReleaseHandleNullable(handle);

// End of RoadSignCategory "private" section.


