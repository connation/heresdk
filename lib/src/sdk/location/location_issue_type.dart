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

/// Indicates the type of issue that affects location retrieval.
enum LocationIssueType {
    /// Device not supported by hd gnss.
    hdgnssDeviceNotSupported,
    /// OS version not supported by hd gnss.
    hdgnssOsVersionNotSupported,
    /// Data connection to assistance server not available.
    hdgnssConnectionNotAvailable,
    /// Satellite measurement quality is degraded.
    hdgnssDegradedMeasurementQuality,
    /// Satellite measurement quality is insufficient, requested position accuracy may not be available.
    hdgnssInsufficientMeasurementQuality,
    /// Requested feature needs a license.
    featureNotLicensed,
    /// Requested feature not available in the used SDK edition.
    featureNotIncluded,
    /// Sensor positioning not available.
    sensorPositioningNotAvailable,
    /// Not able to resolve position.
    positionNotFound,
    /// No usable cell tower measurements available.
    positionNoCellMeasurements,
    /// No usable Wi-Fi access point measurements available.
    positionNoWlanMeasurements,
    /// Cellular tower measurement scanning failed.
    positionCellScanError,
    /// Wi-Fi access point measurement scanning failed.
    positionWlanScanError
}

// LocationIssueType "private" section, not exported.

int sdkLocationLocationissuetypeToFfi(LocationIssueType value) {
  switch (value) {
  case LocationIssueType.hdgnssDeviceNotSupported:
    return 0;
  case LocationIssueType.hdgnssOsVersionNotSupported:
    return 1;
  case LocationIssueType.hdgnssConnectionNotAvailable:
    return 2;
  case LocationIssueType.hdgnssDegradedMeasurementQuality:
    return 3;
  case LocationIssueType.hdgnssInsufficientMeasurementQuality:
    return 4;
  case LocationIssueType.featureNotLicensed:
    return 5;
  case LocationIssueType.featureNotIncluded:
    return 6;
  case LocationIssueType.sensorPositioningNotAvailable:
    return 7;
  case LocationIssueType.positionNotFound:
    return 8;
  case LocationIssueType.positionNoCellMeasurements:
    return 9;
  case LocationIssueType.positionNoWlanMeasurements:
    return 10;
  case LocationIssueType.positionCellScanError:
    return 11;
  case LocationIssueType.positionWlanScanError:
    return 12;
  default:
    throw StateError("Invalid enum value $value for LocationIssueType enum.");
  }
}

LocationIssueType sdkLocationLocationissuetypeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return LocationIssueType.hdgnssDeviceNotSupported;
  case 1:
    return LocationIssueType.hdgnssOsVersionNotSupported;
  case 2:
    return LocationIssueType.hdgnssConnectionNotAvailable;
  case 3:
    return LocationIssueType.hdgnssDegradedMeasurementQuality;
  case 4:
    return LocationIssueType.hdgnssInsufficientMeasurementQuality;
  case 5:
    return LocationIssueType.featureNotLicensed;
  case 6:
    return LocationIssueType.featureNotIncluded;
  case 7:
    return LocationIssueType.sensorPositioningNotAvailable;
  case 8:
    return LocationIssueType.positionNotFound;
  case 9:
    return LocationIssueType.positionNoCellMeasurements;
  case 10:
    return LocationIssueType.positionNoWlanMeasurements;
  case 11:
    return LocationIssueType.positionCellScanError;
  case 12:
    return LocationIssueType.positionWlanScanError;
  default:
    throw StateError("Invalid numeric value $handle for LocationIssueType enum.");
  }
}

void sdkLocationLocationissuetypeReleaseFfiHandle(int handle) {}

final _sdkLocationLocationissuetypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_location_LocationIssueType_create_handle_nullable'));
final _sdkLocationLocationissuetypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_location_LocationIssueType_release_handle_nullable'));
final _sdkLocationLocationissuetypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_location_LocationIssueType_get_value_nullable'));

Pointer<Void> sdkLocationLocationissuetypeToFfiNullable(LocationIssueType? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkLocationLocationissuetypeToFfi(value);
  final result = _sdkLocationLocationissuetypeCreateHandleNullable(_handle);
  sdkLocationLocationissuetypeReleaseFfiHandle(_handle);
  return result;
}

LocationIssueType? sdkLocationLocationissuetypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkLocationLocationissuetypeGetValueNullable(handle);
  final result = sdkLocationLocationissuetypeFromFfi(_handle);
  sdkLocationLocationissuetypeReleaseFfiHandle(_handle);
  return result;
}

void sdkLocationLocationissuetypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkLocationLocationissuetypeReleaseHandleNullable(handle);

// End of LocationIssueType "private" section.


