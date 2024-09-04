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

/// Specifies possible errors that may occur during loading of indoor maps
enum VenueErrorCode {
    /// No network
    noNetwork,
    /// Meta data missing error.
    noMetaDataFound,
    /// HRN not provided
    hrnMissing,
    /// HRN missmatch.
    hrnMismatch,
    /// Default collection missing.
    noDefaultCollection,
    /// Map ID not found.
    mapIdNotFound,
    /// Map data incorrect
    mapDataIncorrect,
    /// Internal Server error
    internalServerError,
    /// Service unavailable
    serviceUnavailable,
    /// Invalid authentication token
    tokenInvalid,
    /// No map available in collection
    noMapInCollection
}

// VenueErrorCode "private" section, not exported.

int sdkVenueControlVenueerrorcodeToFfi(VenueErrorCode value) {
  switch (value) {
  case VenueErrorCode.noNetwork:
    return 1;
  case VenueErrorCode.noMetaDataFound:
    return 2;
  case VenueErrorCode.hrnMissing:
    return 3;
  case VenueErrorCode.hrnMismatch:
    return 4;
  case VenueErrorCode.noDefaultCollection:
    return 5;
  case VenueErrorCode.mapIdNotFound:
    return 6;
  case VenueErrorCode.mapDataIncorrect:
    return 7;
  case VenueErrorCode.internalServerError:
    return 8;
  case VenueErrorCode.serviceUnavailable:
    return 9;
  case VenueErrorCode.tokenInvalid:
    return 10;
  case VenueErrorCode.noMapInCollection:
    return 11;
  default:
    throw StateError("Invalid enum value $value for VenueErrorCode enum.");
  }
}

VenueErrorCode sdkVenueControlVenueerrorcodeFromFfi(int handle) {
  switch (handle) {
  case 1:
    return VenueErrorCode.noNetwork;
  case 2:
    return VenueErrorCode.noMetaDataFound;
  case 3:
    return VenueErrorCode.hrnMissing;
  case 4:
    return VenueErrorCode.hrnMismatch;
  case 5:
    return VenueErrorCode.noDefaultCollection;
  case 6:
    return VenueErrorCode.mapIdNotFound;
  case 7:
    return VenueErrorCode.mapDataIncorrect;
  case 8:
    return VenueErrorCode.internalServerError;
  case 9:
    return VenueErrorCode.serviceUnavailable;
  case 10:
    return VenueErrorCode.tokenInvalid;
  case 11:
    return VenueErrorCode.noMapInCollection;
  default:
    throw StateError("Invalid numeric value $handle for VenueErrorCode enum.");
  }
}

void sdkVenueControlVenueerrorcodeReleaseFfiHandle(int handle) {}

final _sdkVenueControlVenueerrorcodeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_venue_control_VenueErrorCode_create_handle_nullable'));
final _sdkVenueControlVenueerrorcodeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_control_VenueErrorCode_release_handle_nullable'));
final _sdkVenueControlVenueerrorcodeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_venue_control_VenueErrorCode_get_value_nullable'));

Pointer<Void> sdkVenueControlVenueerrorcodeToFfiNullable(VenueErrorCode? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkVenueControlVenueerrorcodeToFfi(value);
  final result = _sdkVenueControlVenueerrorcodeCreateHandleNullable(_handle);
  sdkVenueControlVenueerrorcodeReleaseFfiHandle(_handle);
  return result;
}

VenueErrorCode? sdkVenueControlVenueerrorcodeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkVenueControlVenueerrorcodeGetValueNullable(handle);
  final result = sdkVenueControlVenueerrorcodeFromFfi(_handle);
  sdkVenueControlVenueerrorcodeReleaseFfiHandle(_handle);
  return result;
}

void sdkVenueControlVenueerrorcodeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkVenueControlVenueerrorcodeReleaseHandleNullable(handle);

// End of VenueErrorCode "private" section.


