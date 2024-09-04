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
import 'package:here_sdk/src/sdk/navigation/lane_access.dart';
import 'package:here_sdk/src/sdk/navigation/toll_booth.dart';

/// A class that provides information for a toll booth.

class TollBoothLane {
  /// Indicates the toll stop for this particular booth.
  TollBooth booth;

  /// Indicates the access of the lane.
  LaneAccess access;

  /// Creates a new instance.

  /// [booth] Indicates the toll stop for this particular booth.

  /// [access] Indicates the access of the lane.

  TollBoothLane(this.booth, this.access);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TollBoothLane) return false;
    TollBoothLane _other = other;
    return booth == _other.booth &&
        access == _other.access;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + booth.hashCode;
    result = 31 * result + access.hashCode;
    return result;
  }
}


// TollBoothLane "private" section, not exported.

final _sdkNavigationTollboothlaneCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_navigation_TollBoothLane_create_handle'));
final _sdkNavigationTollboothlaneReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TollBoothLane_release_handle'));
final _sdkNavigationTollboothlaneGetFieldbooth = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TollBoothLane_get_field_booth'));
final _sdkNavigationTollboothlaneGetFieldaccess = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TollBoothLane_get_field_access'));



Pointer<Void> sdkNavigationTollboothlaneToFfi(TollBoothLane value) {
  final _boothHandle = sdkNavigationTollboothToFfi(value.booth);
  final _accessHandle = sdkNavigationLaneaccessToFfi(value.access);
  final _result = _sdkNavigationTollboothlaneCreateHandle(_boothHandle, _accessHandle);
  sdkNavigationTollboothReleaseFfiHandle(_boothHandle);
  sdkNavigationLaneaccessReleaseFfiHandle(_accessHandle);
  return _result;
}

TollBoothLane sdkNavigationTollboothlaneFromFfi(Pointer<Void> handle) {
  final _boothHandle = _sdkNavigationTollboothlaneGetFieldbooth(handle);
  final _accessHandle = _sdkNavigationTollboothlaneGetFieldaccess(handle);
  try {
    return TollBoothLane(
      sdkNavigationTollboothFromFfi(_boothHandle), 
      sdkNavigationLaneaccessFromFfi(_accessHandle)
    );
  } finally {
    sdkNavigationTollboothReleaseFfiHandle(_boothHandle);
    sdkNavigationLaneaccessReleaseFfiHandle(_accessHandle);
  }
}

void sdkNavigationTollboothlaneReleaseFfiHandle(Pointer<Void> handle) => _sdkNavigationTollboothlaneReleaseHandle(handle);

// Nullable TollBoothLane

final _sdkNavigationTollboothlaneCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TollBoothLane_create_handle_nullable'));
final _sdkNavigationTollboothlaneReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TollBoothLane_release_handle_nullable'));
final _sdkNavigationTollboothlaneGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TollBoothLane_get_value_nullable'));

Pointer<Void> sdkNavigationTollboothlaneToFfiNullable(TollBoothLane? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationTollboothlaneToFfi(value);
  final result = _sdkNavigationTollboothlaneCreateHandleNullable(_handle);
  sdkNavigationTollboothlaneReleaseFfiHandle(_handle);
  return result;
}

TollBoothLane? sdkNavigationTollboothlaneFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationTollboothlaneGetValueNullable(handle);
  final result = sdkNavigationTollboothlaneFromFfi(_handle);
  sdkNavigationTollboothlaneReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationTollboothlaneReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationTollboothlaneReleaseHandleNullable(handle);

// End of TollBoothLane "private" section.


