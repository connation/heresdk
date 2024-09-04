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
import 'package:here_sdk/src/builtin_types__conversion.dart';

/// Describes the posted speed limit on the segment span.
///
/// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
/// Related APIs may change for new releases without a deprecation process.

class SegmentSpeedLimit {
  /// Spped limit in meter per seconds.
  double? speedLimitInMeterPerSeconds;

  /// Indication that speed limit is unlimited.
  bool speedLimitIsUnlimited;

  /// Creates a new instance with default values.

  /// [speedLimitInMeterPerSeconds] Spped limit in meter per seconds.

  /// [speedLimitIsUnlimited] Indication that speed limit is unlimited.

  SegmentSpeedLimit._(this.speedLimitInMeterPerSeconds, this.speedLimitIsUnlimited);
  SegmentSpeedLimit(bool speedLimitIsUnlimited)
    : speedLimitInMeterPerSeconds = null, speedLimitIsUnlimited = speedLimitIsUnlimited;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SegmentSpeedLimit) return false;
    SegmentSpeedLimit _other = other;
    return speedLimitInMeterPerSeconds == _other.speedLimitInMeterPerSeconds &&
        speedLimitIsUnlimited == _other.speedLimitIsUnlimited;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + speedLimitInMeterPerSeconds.hashCode;
    result = 31 * result + speedLimitIsUnlimited.hashCode;
    return result;
  }
}


// SegmentSpeedLimit "private" section, not exported.

final _sdkMapdataSegmentspeedlimitCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Uint8),
    Pointer<Void> Function(Pointer<Void>, int)
  >('here_sdk_sdk_mapdata_SegmentSpeedLimit_create_handle'));
final _sdkMapdataSegmentspeedlimitReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_SegmentSpeedLimit_release_handle'));
final _sdkMapdataSegmentspeedlimitGetFieldspeedLimitInMeterPerSeconds = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_SegmentSpeedLimit_get_field_speedLimitInMeterPerSeconds'));
final _sdkMapdataSegmentspeedlimitGetFieldspeedLimitIsUnlimited = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_SegmentSpeedLimit_get_field_speedLimitIsUnlimited'));



Pointer<Void> sdkMapdataSegmentspeedlimitToFfi(SegmentSpeedLimit value) {
  final _speedLimitInMeterPerSecondsHandle = doubleToFfiNullable(value.speedLimitInMeterPerSeconds);
  final _speedLimitIsUnlimitedHandle = booleanToFfi(value.speedLimitIsUnlimited);
  final _result = _sdkMapdataSegmentspeedlimitCreateHandle(_speedLimitInMeterPerSecondsHandle, _speedLimitIsUnlimitedHandle);
  doubleReleaseFfiHandleNullable(_speedLimitInMeterPerSecondsHandle);
  booleanReleaseFfiHandle(_speedLimitIsUnlimitedHandle);
  return _result;
}

SegmentSpeedLimit sdkMapdataSegmentspeedlimitFromFfi(Pointer<Void> handle) {
  final _speedLimitInMeterPerSecondsHandle = _sdkMapdataSegmentspeedlimitGetFieldspeedLimitInMeterPerSeconds(handle);
  final _speedLimitIsUnlimitedHandle = _sdkMapdataSegmentspeedlimitGetFieldspeedLimitIsUnlimited(handle);
  try {
    return SegmentSpeedLimit._(
      doubleFromFfiNullable(_speedLimitInMeterPerSecondsHandle), 
      booleanFromFfi(_speedLimitIsUnlimitedHandle)
    );
  } finally {
    doubleReleaseFfiHandleNullable(_speedLimitInMeterPerSecondsHandle);
    booleanReleaseFfiHandle(_speedLimitIsUnlimitedHandle);
  }
}

void sdkMapdataSegmentspeedlimitReleaseFfiHandle(Pointer<Void> handle) => _sdkMapdataSegmentspeedlimitReleaseHandle(handle);

// Nullable SegmentSpeedLimit

final _sdkMapdataSegmentspeedlimitCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_SegmentSpeedLimit_create_handle_nullable'));
final _sdkMapdataSegmentspeedlimitReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_SegmentSpeedLimit_release_handle_nullable'));
final _sdkMapdataSegmentspeedlimitGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_SegmentSpeedLimit_get_value_nullable'));

Pointer<Void> sdkMapdataSegmentspeedlimitToFfiNullable(SegmentSpeedLimit? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapdataSegmentspeedlimitToFfi(value);
  final result = _sdkMapdataSegmentspeedlimitCreateHandleNullable(_handle);
  sdkMapdataSegmentspeedlimitReleaseFfiHandle(_handle);
  return result;
}

SegmentSpeedLimit? sdkMapdataSegmentspeedlimitFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapdataSegmentspeedlimitGetValueNullable(handle);
  final result = sdkMapdataSegmentspeedlimitFromFfi(_handle);
  sdkMapdataSegmentspeedlimitReleaseFfiHandle(_handle);
  return result;
}

void sdkMapdataSegmentspeedlimitReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapdataSegmentspeedlimitReleaseHandleNullable(handle);

// End of SegmentSpeedLimit "private" section.


