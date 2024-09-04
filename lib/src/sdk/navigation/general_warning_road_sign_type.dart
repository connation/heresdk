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

/// Type of a general warning that [RoadSignWarning] represents.
enum GeneralWarningRoadSignType {
    /// Unknown general warning road sign type.
    unknown,
    /// Object overhang general road sign type.
    objectOverhang,
    /// Risk of grounding general road sign type.
    riskOfGrounding,
    /// Animal crossing general road sign type.
    animalCrossing,
    /// Accident hazard general road sign type.
    accidentHazard
}

// GeneralWarningRoadSignType "private" section, not exported.

int sdkNavigationGeneralwarningroadsigntypeToFfi(GeneralWarningRoadSignType value) {
  switch (value) {
  case GeneralWarningRoadSignType.unknown:
    return 0;
  case GeneralWarningRoadSignType.objectOverhang:
    return 1;
  case GeneralWarningRoadSignType.riskOfGrounding:
    return 2;
  case GeneralWarningRoadSignType.animalCrossing:
    return 3;
  case GeneralWarningRoadSignType.accidentHazard:
    return 4;
  default:
    throw StateError("Invalid enum value $value for GeneralWarningRoadSignType enum.");
  }
}

GeneralWarningRoadSignType sdkNavigationGeneralwarningroadsigntypeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return GeneralWarningRoadSignType.unknown;
  case 1:
    return GeneralWarningRoadSignType.objectOverhang;
  case 2:
    return GeneralWarningRoadSignType.riskOfGrounding;
  case 3:
    return GeneralWarningRoadSignType.animalCrossing;
  case 4:
    return GeneralWarningRoadSignType.accidentHazard;
  default:
    throw StateError("Invalid numeric value $handle for GeneralWarningRoadSignType enum.");
  }
}

void sdkNavigationGeneralwarningroadsigntypeReleaseFfiHandle(int handle) {}

final _sdkNavigationGeneralwarningroadsigntypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_navigation_GeneralWarningRoadSignType_create_handle_nullable'));
final _sdkNavigationGeneralwarningroadsigntypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_GeneralWarningRoadSignType_release_handle_nullable'));
final _sdkNavigationGeneralwarningroadsigntypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_GeneralWarningRoadSignType_get_value_nullable'));

Pointer<Void> sdkNavigationGeneralwarningroadsigntypeToFfiNullable(GeneralWarningRoadSignType? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationGeneralwarningroadsigntypeToFfi(value);
  final result = _sdkNavigationGeneralwarningroadsigntypeCreateHandleNullable(_handle);
  sdkNavigationGeneralwarningroadsigntypeReleaseFfiHandle(_handle);
  return result;
}

GeneralWarningRoadSignType? sdkNavigationGeneralwarningroadsigntypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationGeneralwarningroadsigntypeGetValueNullable(handle);
  final result = sdkNavigationGeneralwarningroadsigntypeFromFfi(_handle);
  sdkNavigationGeneralwarningroadsigntypeReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationGeneralwarningroadsigntypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationGeneralwarningroadsigntypeReleaseHandleNullable(handle);

// End of GeneralWarningRoadSignType "private" section.


