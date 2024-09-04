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

/// Weather type attached to `RoadSignWarning` or `VehicleRestriction.Condition` which limits the conditions for which the sign is applicable.
enum WeatherType {
    /// Unknown weather type.
    unknown,
    /// Rain weather type.
    rain,
    /// Snow weather type.
    snow,
    /// Fog weather type.
    fog
}

// WeatherType "private" section, not exported.

int sdkNavigationWeathertypeToFfi(WeatherType value) {
  switch (value) {
  case WeatherType.unknown:
    return 0;
  case WeatherType.rain:
    return 1;
  case WeatherType.snow:
    return 2;
  case WeatherType.fog:
    return 3;
  default:
    throw StateError("Invalid enum value $value for WeatherType enum.");
  }
}

WeatherType sdkNavigationWeathertypeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return WeatherType.unknown;
  case 1:
    return WeatherType.rain;
  case 2:
    return WeatherType.snow;
  case 3:
    return WeatherType.fog;
  default:
    throw StateError("Invalid numeric value $handle for WeatherType enum.");
  }
}

void sdkNavigationWeathertypeReleaseFfiHandle(int handle) {}

final _sdkNavigationWeathertypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_navigation_WeatherType_create_handle_nullable'));
final _sdkNavigationWeathertypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_WeatherType_release_handle_nullable'));
final _sdkNavigationWeathertypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_WeatherType_get_value_nullable'));

Pointer<Void> sdkNavigationWeathertypeToFfiNullable(WeatherType? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationWeathertypeToFfi(value);
  final result = _sdkNavigationWeathertypeCreateHandleNullable(_handle);
  sdkNavigationWeathertypeReleaseFfiHandle(_handle);
  return result;
}

WeatherType? sdkNavigationWeathertypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationWeathertypeGetValueNullable(handle);
  final result = sdkNavigationWeathertypeFromFfi(_handle);
  sdkNavigationWeathertypeReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationWeathertypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationWeathertypeReleaseHandleNullable(handle);

// End of WeatherType "private" section.


