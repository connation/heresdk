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

/// Specifies which data should be loaded by the [SegmentDataLoader.loadData] function.
///
/// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected
/// behaviors. Related APIs may change for new releases without a deprecation process.

class SegmentDataLoaderOptions {
  /// If it is true, the [SegmentSpanData.travelDirection] will be loaded.
  bool loadTravelDirection;

  /// If it is true, the [SegmentSpanData.functionalRoadClass] will be loaded.
  bool loadFunctionalRoadClass;

  /// If it is true, [SegmentSpanData.positiveDirectionAllowedTransportModes] and
  /// [SegmentSpanData.negativeDirectionAllowedTransportModes] will be loaded.
  bool loadAllowedTransportModes;

  /// If it is true, [SegmentSpanData.positiveDirectionSpeedLimit] and
  /// [SegmentSpanData.negativeDirectionSpeedLimit] will be loaded.
  bool loadSpeedLimits;

  /// If it is true, [SegmentSpanData.positiveDirectionBaseSpeedInMetersPerSecond]
  /// and [SegmentSpanData.negativeDirectionBaseSpeedInMetersPerSecond] will be loaded.
  bool loadBaseSpeeds;

  /// If it is true, [SegmentSpanData.localRoadCharacteristics] will be loaded.
  bool loadLocalRoadCharacteristics;

  /// If it is true, [SegmentSpanData.streetNames] and [SegmentSpanData.roadNumbers] and will be loaded.
  bool loadStreetNamesAndRoadNumbers;

  /// If it is true, [SegmentSpanData.physicalAttributes] and
  /// [SegmentSpanData.roadUsages] will be loaded.
  bool loadRoadAttributes;

  /// Creates a new instance.

  /// [loadTravelDirection] If it is true, the [SegmentSpanData.travelDirection] will be loaded.

  /// [loadFunctionalRoadClass] If it is true, the [SegmentSpanData.functionalRoadClass] will be loaded.

  /// [loadAllowedTransportModes] If it is true, [SegmentSpanData.positiveDirectionAllowedTransportModes] and
  /// [SegmentSpanData.negativeDirectionAllowedTransportModes] will be loaded.

  /// [loadSpeedLimits] If it is true, [SegmentSpanData.positiveDirectionSpeedLimit] and
  /// [SegmentSpanData.negativeDirectionSpeedLimit] will be loaded.

  /// [loadBaseSpeeds] If it is true, [SegmentSpanData.positiveDirectionBaseSpeedInMetersPerSecond]
  /// and [SegmentSpanData.negativeDirectionBaseSpeedInMetersPerSecond] will be loaded.

  /// [loadLocalRoadCharacteristics] If it is true, [SegmentSpanData.localRoadCharacteristics] will be loaded.

  /// [loadStreetNamesAndRoadNumbers] If it is true, [SegmentSpanData.streetNames] and [SegmentSpanData.roadNumbers] and will be loaded.

  /// [loadRoadAttributes] If it is true, [SegmentSpanData.physicalAttributes] and
  /// [SegmentSpanData.roadUsages] will be loaded.

  SegmentDataLoaderOptions._(this.loadTravelDirection, this.loadFunctionalRoadClass, this.loadAllowedTransportModes, this.loadSpeedLimits, this.loadBaseSpeeds, this.loadLocalRoadCharacteristics, this.loadStreetNamesAndRoadNumbers, this.loadRoadAttributes);
  SegmentDataLoaderOptions()
    : loadTravelDirection = false, loadFunctionalRoadClass = false, loadAllowedTransportModes = false, loadSpeedLimits = false, loadBaseSpeeds = false, loadLocalRoadCharacteristics = false, loadStreetNamesAndRoadNumbers = false, loadRoadAttributes = false;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SegmentDataLoaderOptions) return false;
    SegmentDataLoaderOptions _other = other;
    return loadTravelDirection == _other.loadTravelDirection &&
        loadFunctionalRoadClass == _other.loadFunctionalRoadClass &&
        loadAllowedTransportModes == _other.loadAllowedTransportModes &&
        loadSpeedLimits == _other.loadSpeedLimits &&
        loadBaseSpeeds == _other.loadBaseSpeeds &&
        loadLocalRoadCharacteristics == _other.loadLocalRoadCharacteristics &&
        loadStreetNamesAndRoadNumbers == _other.loadStreetNamesAndRoadNumbers &&
        loadRoadAttributes == _other.loadRoadAttributes;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + loadTravelDirection.hashCode;
    result = 31 * result + loadFunctionalRoadClass.hashCode;
    result = 31 * result + loadAllowedTransportModes.hashCode;
    result = 31 * result + loadSpeedLimits.hashCode;
    result = 31 * result + loadBaseSpeeds.hashCode;
    result = 31 * result + loadLocalRoadCharacteristics.hashCode;
    result = 31 * result + loadStreetNamesAndRoadNumbers.hashCode;
    result = 31 * result + loadRoadAttributes.hashCode;
    return result;
  }
}


// SegmentDataLoaderOptions "private" section, not exported.

final _sdkMapdataSegmentdataloaderoptionsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint8, Uint8, Uint8, Uint8, Uint8, Uint8, Uint8, Uint8),
    Pointer<Void> Function(int, int, int, int, int, int, int, int)
  >('here_sdk_sdk_mapdata_SegmentDataLoaderOptions_create_handle'));
final _sdkMapdataSegmentdataloaderoptionsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_SegmentDataLoaderOptions_release_handle'));
final _sdkMapdataSegmentdataloaderoptionsGetFieldloadTravelDirection = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_SegmentDataLoaderOptions_get_field_loadTravelDirection'));
final _sdkMapdataSegmentdataloaderoptionsGetFieldloadFunctionalRoadClass = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_SegmentDataLoaderOptions_get_field_loadFunctionalRoadClass'));
final _sdkMapdataSegmentdataloaderoptionsGetFieldloadAllowedTransportModes = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_SegmentDataLoaderOptions_get_field_loadAllowedTransportModes'));
final _sdkMapdataSegmentdataloaderoptionsGetFieldloadSpeedLimits = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_SegmentDataLoaderOptions_get_field_loadSpeedLimits'));
final _sdkMapdataSegmentdataloaderoptionsGetFieldloadBaseSpeeds = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_SegmentDataLoaderOptions_get_field_loadBaseSpeeds'));
final _sdkMapdataSegmentdataloaderoptionsGetFieldloadLocalRoadCharacteristics = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_SegmentDataLoaderOptions_get_field_loadLocalRoadCharacteristics'));
final _sdkMapdataSegmentdataloaderoptionsGetFieldloadStreetNamesAndRoadNumbers = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_SegmentDataLoaderOptions_get_field_loadStreetNamesAndRoadNumbers'));
final _sdkMapdataSegmentdataloaderoptionsGetFieldloadRoadAttributes = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_SegmentDataLoaderOptions_get_field_loadRoadAttributes'));



Pointer<Void> sdkMapdataSegmentdataloaderoptionsToFfi(SegmentDataLoaderOptions value) {
  final _loadTravelDirectionHandle = booleanToFfi(value.loadTravelDirection);
  final _loadFunctionalRoadClassHandle = booleanToFfi(value.loadFunctionalRoadClass);
  final _loadAllowedTransportModesHandle = booleanToFfi(value.loadAllowedTransportModes);
  final _loadSpeedLimitsHandle = booleanToFfi(value.loadSpeedLimits);
  final _loadBaseSpeedsHandle = booleanToFfi(value.loadBaseSpeeds);
  final _loadLocalRoadCharacteristicsHandle = booleanToFfi(value.loadLocalRoadCharacteristics);
  final _loadStreetNamesAndRoadNumbersHandle = booleanToFfi(value.loadStreetNamesAndRoadNumbers);
  final _loadRoadAttributesHandle = booleanToFfi(value.loadRoadAttributes);
  final _result = _sdkMapdataSegmentdataloaderoptionsCreateHandle(_loadTravelDirectionHandle, _loadFunctionalRoadClassHandle, _loadAllowedTransportModesHandle, _loadSpeedLimitsHandle, _loadBaseSpeedsHandle, _loadLocalRoadCharacteristicsHandle, _loadStreetNamesAndRoadNumbersHandle, _loadRoadAttributesHandle);
  booleanReleaseFfiHandle(_loadTravelDirectionHandle);
  booleanReleaseFfiHandle(_loadFunctionalRoadClassHandle);
  booleanReleaseFfiHandle(_loadAllowedTransportModesHandle);
  booleanReleaseFfiHandle(_loadSpeedLimitsHandle);
  booleanReleaseFfiHandle(_loadBaseSpeedsHandle);
  booleanReleaseFfiHandle(_loadLocalRoadCharacteristicsHandle);
  booleanReleaseFfiHandle(_loadStreetNamesAndRoadNumbersHandle);
  booleanReleaseFfiHandle(_loadRoadAttributesHandle);
  return _result;
}

SegmentDataLoaderOptions sdkMapdataSegmentdataloaderoptionsFromFfi(Pointer<Void> handle) {
  final _loadTravelDirectionHandle = _sdkMapdataSegmentdataloaderoptionsGetFieldloadTravelDirection(handle);
  final _loadFunctionalRoadClassHandle = _sdkMapdataSegmentdataloaderoptionsGetFieldloadFunctionalRoadClass(handle);
  final _loadAllowedTransportModesHandle = _sdkMapdataSegmentdataloaderoptionsGetFieldloadAllowedTransportModes(handle);
  final _loadSpeedLimitsHandle = _sdkMapdataSegmentdataloaderoptionsGetFieldloadSpeedLimits(handle);
  final _loadBaseSpeedsHandle = _sdkMapdataSegmentdataloaderoptionsGetFieldloadBaseSpeeds(handle);
  final _loadLocalRoadCharacteristicsHandle = _sdkMapdataSegmentdataloaderoptionsGetFieldloadLocalRoadCharacteristics(handle);
  final _loadStreetNamesAndRoadNumbersHandle = _sdkMapdataSegmentdataloaderoptionsGetFieldloadStreetNamesAndRoadNumbers(handle);
  final _loadRoadAttributesHandle = _sdkMapdataSegmentdataloaderoptionsGetFieldloadRoadAttributes(handle);
  try {
    return SegmentDataLoaderOptions._(
      booleanFromFfi(_loadTravelDirectionHandle), 
      booleanFromFfi(_loadFunctionalRoadClassHandle), 
      booleanFromFfi(_loadAllowedTransportModesHandle), 
      booleanFromFfi(_loadSpeedLimitsHandle), 
      booleanFromFfi(_loadBaseSpeedsHandle), 
      booleanFromFfi(_loadLocalRoadCharacteristicsHandle), 
      booleanFromFfi(_loadStreetNamesAndRoadNumbersHandle), 
      booleanFromFfi(_loadRoadAttributesHandle)
    );
  } finally {
    booleanReleaseFfiHandle(_loadTravelDirectionHandle);
    booleanReleaseFfiHandle(_loadFunctionalRoadClassHandle);
    booleanReleaseFfiHandle(_loadAllowedTransportModesHandle);
    booleanReleaseFfiHandle(_loadSpeedLimitsHandle);
    booleanReleaseFfiHandle(_loadBaseSpeedsHandle);
    booleanReleaseFfiHandle(_loadLocalRoadCharacteristicsHandle);
    booleanReleaseFfiHandle(_loadStreetNamesAndRoadNumbersHandle);
    booleanReleaseFfiHandle(_loadRoadAttributesHandle);
  }
}

void sdkMapdataSegmentdataloaderoptionsReleaseFfiHandle(Pointer<Void> handle) => _sdkMapdataSegmentdataloaderoptionsReleaseHandle(handle);

// Nullable SegmentDataLoaderOptions

final _sdkMapdataSegmentdataloaderoptionsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_SegmentDataLoaderOptions_create_handle_nullable'));
final _sdkMapdataSegmentdataloaderoptionsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_SegmentDataLoaderOptions_release_handle_nullable'));
final _sdkMapdataSegmentdataloaderoptionsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_SegmentDataLoaderOptions_get_value_nullable'));

Pointer<Void> sdkMapdataSegmentdataloaderoptionsToFfiNullable(SegmentDataLoaderOptions? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapdataSegmentdataloaderoptionsToFfi(value);
  final result = _sdkMapdataSegmentdataloaderoptionsCreateHandleNullable(_handle);
  sdkMapdataSegmentdataloaderoptionsReleaseFfiHandle(_handle);
  return result;
}

SegmentDataLoaderOptions? sdkMapdataSegmentdataloaderoptionsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapdataSegmentdataloaderoptionsGetValueNullable(handle);
  final result = sdkMapdataSegmentdataloaderoptionsFromFfi(_handle);
  sdkMapdataSegmentdataloaderoptionsReleaseFfiHandle(_handle);
  return result;
}

void sdkMapdataSegmentdataloaderoptionsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapdataSegmentdataloaderoptionsReleaseHandleNullable(handle);

// End of SegmentDataLoaderOptions "private" section.


