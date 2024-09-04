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

/// Specifies possible errors from map data accessing.
///
/// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected
/// behaviors. Related APIs may change for new releases without a deprecation process.
enum SegmentDataLoaderErrorCode {
    /// Generic internal error.
    internalError,
    /// An invalid input parameter.
    invalidParameters
}

// SegmentDataLoaderErrorCode "private" section, not exported.

int sdkMapdataSegmentdataloadererrorcodeToFfi(SegmentDataLoaderErrorCode value) {
  switch (value) {
  case SegmentDataLoaderErrorCode.internalError:
    return 1;
  case SegmentDataLoaderErrorCode.invalidParameters:
    return 2;
  default:
    throw StateError("Invalid enum value $value for SegmentDataLoaderErrorCode enum.");
  }
}

SegmentDataLoaderErrorCode sdkMapdataSegmentdataloadererrorcodeFromFfi(int handle) {
  switch (handle) {
  case 1:
    return SegmentDataLoaderErrorCode.internalError;
  case 2:
    return SegmentDataLoaderErrorCode.invalidParameters;
  default:
    throw StateError("Invalid numeric value $handle for SegmentDataLoaderErrorCode enum.");
  }
}

void sdkMapdataSegmentdataloadererrorcodeReleaseFfiHandle(int handle) {}

final _sdkMapdataSegmentdataloadererrorcodeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_mapdata_SegmentDataLoaderErrorCode_create_handle_nullable'));
final _sdkMapdataSegmentdataloadererrorcodeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_SegmentDataLoaderErrorCode_release_handle_nullable'));
final _sdkMapdataSegmentdataloadererrorcodeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_SegmentDataLoaderErrorCode_get_value_nullable'));

Pointer<Void> sdkMapdataSegmentdataloadererrorcodeToFfiNullable(SegmentDataLoaderErrorCode? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapdataSegmentdataloadererrorcodeToFfi(value);
  final result = _sdkMapdataSegmentdataloadererrorcodeCreateHandleNullable(_handle);
  sdkMapdataSegmentdataloadererrorcodeReleaseFfiHandle(_handle);
  return result;
}

SegmentDataLoaderErrorCode? sdkMapdataSegmentdataloadererrorcodeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapdataSegmentdataloadererrorcodeGetValueNullable(handle);
  final result = sdkMapdataSegmentdataloadererrorcodeFromFfi(_handle);
  sdkMapdataSegmentdataloadererrorcodeReleaseFfiHandle(_handle);
  return result;
}

void sdkMapdataSegmentdataloadererrorcodeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapdataSegmentdataloadererrorcodeReleaseHandleNullable(handle);

// End of SegmentDataLoaderErrorCode "private" section.


