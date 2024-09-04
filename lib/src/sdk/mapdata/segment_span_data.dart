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
import 'package:here_sdk/src/_native_base.dart' as __lib;
import 'package:here_sdk/src/_token_cache.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/localized_texts.dart';
import 'package:here_sdk/src/sdk/mapdata/allowed_transport_modes.dart';
import 'package:here_sdk/src/sdk/mapdata/local_road_characteristic.dart';
import 'package:here_sdk/src/sdk/mapdata/physical_attributes.dart';
import 'package:here_sdk/src/sdk/mapdata/road_usages.dart';
import 'package:here_sdk/src/sdk/mapdata/segment_speed_limit.dart';
import 'package:here_sdk/src/sdk/routing/functional_road_class.dart';
import 'package:here_sdk/src/sdk/routing/localized_road_numbers.dart';
import 'package:here_sdk/src/sdk/routing/travel_direction.dart';

/// Contains attributes that are not necessarily constant on a full segment.
///
/// A Span is a portion of a Segment where the requested attributes are constant.
///
/// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
/// Related APIs may change for new releases without a deprecation process.
abstract class SegmentSpanData {

  /// Gets the start offset in meters of the span.
  int get startOffsetInMeters;

  /// Gets the length of this span in meters.
  int get spanLengthInMeters;

  /// Gets the [TravelDirection] object for the portion of the segment.
  TravelDirection? get travelDirection;

  /// Gets the [AllowedTransportModes] object for the positive direction.
  AllowedTransportModes? get positiveDirectionAllowedTransportModes;

  /// Gets the [AllowedTransportModes] object for the negative direction.
  AllowedTransportModes? get negativeDirectionAllowedTransportModes;

  /// Gets the [FunctionalRoadClass] object representing the polyline of this section.
  FunctionalRoadClass? get functionalRoadClass;

  /// Gets the [SegmentSpeedLimit] object representing the speed limit of this segment span.
  SegmentSpeedLimit? get positiveDirectionSpeedLimit;

  /// Gets the [SegmentSpeedLimit] object representing the speed limit of this segment span.
  SegmentSpeedLimit? get negativeDirectionSpeedLimit;

  /// Gets the average speed in the positive direction.
  double? get positiveDirectionBaseSpeedInMetersPerSecond;

  /// Gets the average speed in the negative direction.
  double? get negativeDirectionBaseSpeedInMetersPerSecond;

  /// Gets the local road characteristics.
  List<LocalRoadCharacteristic>? get localRoadCharacteristics;

  /// The street names on the span.
  LocalizedTexts? get streetNames;

  /// Gets the road numbers on the span enriched with information specific to _route numbers_
  /// of a road such as I-10, US-50, or A3.
  LocalizedRoadNumbers? get roadNumbers;

  /// Gets the physical attributes.
  PhysicalAttributes? get physicalAttributes;

  /// Gets the road usages.
  RoadUsages? get roadUsages;

}


// SegmentSpanData "private" section, not exported.

final _sdkMapdataSegmentspandataRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapdata_SegmentSpanData_register_finalizer'));
final _sdkMapdataSegmentspandataCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_SegmentSpanData_copy_handle'));
final _sdkMapdataSegmentspandataReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_SegmentSpanData_release_handle'));


class SegmentSpanData$Impl extends __lib.NativeBase implements SegmentSpanData {

  SegmentSpanData$Impl(Pointer<Void> handle) : super(handle);

  @override
  int get startOffsetInMeters {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_mapdata_SegmentSpanData_startOffsetInMeters_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }


  @override
  int get spanLengthInMeters {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_mapdata_SegmentSpanData_spanLengthInMeters_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }


  @override
  TravelDirection? get travelDirection {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapdata_SegmentSpanData_travelDirection_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkRoutingTraveldirectionFromFfiNullable(__resultHandle);
    } finally {
      sdkRoutingTraveldirectionReleaseFfiHandleNullable(__resultHandle);

    }

  }


  @override
  AllowedTransportModes? get positiveDirectionAllowedTransportModes {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapdata_SegmentSpanData_positiveDirectionAllowedTransportModes_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkMapdataAllowedtransportmodesFromFfiNullable(__resultHandle);
    } finally {
      sdkMapdataAllowedtransportmodesReleaseFfiHandleNullable(__resultHandle);

    }

  }


  @override
  AllowedTransportModes? get negativeDirectionAllowedTransportModes {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapdata_SegmentSpanData_negativeDirectionAllowedTransportModes_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkMapdataAllowedtransportmodesFromFfiNullable(__resultHandle);
    } finally {
      sdkMapdataAllowedtransportmodesReleaseFfiHandleNullable(__resultHandle);

    }

  }


  @override
  FunctionalRoadClass? get functionalRoadClass {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapdata_SegmentSpanData_functionalRoadClass_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkRoutingFunctionalroadclassFromFfiNullable(__resultHandle);
    } finally {
      sdkRoutingFunctionalroadclassReleaseFfiHandleNullable(__resultHandle);

    }

  }


  @override
  SegmentSpeedLimit? get positiveDirectionSpeedLimit {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapdata_SegmentSpanData_positiveDirectionSpeedLimit_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkMapdataSegmentspeedlimitFromFfiNullable(__resultHandle);
    } finally {
      sdkMapdataSegmentspeedlimitReleaseFfiHandleNullable(__resultHandle);

    }

  }


  @override
  SegmentSpeedLimit? get negativeDirectionSpeedLimit {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapdata_SegmentSpanData_negativeDirectionSpeedLimit_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkMapdataSegmentspeedlimitFromFfiNullable(__resultHandle);
    } finally {
      sdkMapdataSegmentspeedlimitReleaseFfiHandleNullable(__resultHandle);

    }

  }


  @override
  double? get positiveDirectionBaseSpeedInMetersPerSecond {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapdata_SegmentSpanData_positiveDirectionBaseSpeedInMetersPerSecond_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return doubleFromFfiNullable(__resultHandle);
    } finally {
      doubleReleaseFfiHandleNullable(__resultHandle);

    }

  }


  @override
  double? get negativeDirectionBaseSpeedInMetersPerSecond {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapdata_SegmentSpanData_negativeDirectionBaseSpeedInMetersPerSecond_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return doubleFromFfiNullable(__resultHandle);
    } finally {
      doubleReleaseFfiHandleNullable(__resultHandle);

    }

  }


  @override
  List<LocalRoadCharacteristic>? get localRoadCharacteristics {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapdata_SegmentSpanData_localRoadCharacteristics_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return heresdkMapdataBindingslistofSdkMapdataLocalroadcharacteristicFromFfiNullable(__resultHandle);
    } finally {
      heresdkMapdataBindingslistofSdkMapdataLocalroadcharacteristicReleaseFfiHandleNullable(__resultHandle);

    }

  }


  @override
  LocalizedTexts? get streetNames {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapdata_SegmentSpanData_streetNames_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreLocalizedtextsFromFfiNullable(__resultHandle);
    } finally {
      sdkCoreLocalizedtextsReleaseFfiHandleNullable(__resultHandle);

    }

  }


  @override
  LocalizedRoadNumbers? get roadNumbers {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapdata_SegmentSpanData_roadNumbers_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkRoutingLocalizedroadnumbersFromFfiNullable(__resultHandle);
    } finally {
      sdkRoutingLocalizedroadnumbersReleaseFfiHandleNullable(__resultHandle);

    }

  }


  @override
  PhysicalAttributes? get physicalAttributes {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapdata_SegmentSpanData_physicalAttributes_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkMapdataPhysicalattributesFromFfiNullable(__resultHandle);
    } finally {
      sdkMapdataPhysicalattributesReleaseFfiHandleNullable(__resultHandle);

    }

  }


  @override
  RoadUsages? get roadUsages {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapdata_SegmentSpanData_roadUsages_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkMapdataRoadusagesFromFfiNullable(__resultHandle);
    } finally {
      sdkMapdataRoadusagesReleaseFfiHandleNullable(__resultHandle);

    }

  }



}

Pointer<Void> sdkMapdataSegmentspandataToFfi(SegmentSpanData value) =>
  _sdkMapdataSegmentspandataCopyHandle((value as __lib.NativeBase).handle);

SegmentSpanData sdkMapdataSegmentspandataFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is SegmentSpanData) return instance;

  final _copiedHandle = _sdkMapdataSegmentspandataCopyHandle(handle);
  final result = SegmentSpanData$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMapdataSegmentspandataRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapdataSegmentspandataReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapdataSegmentspandataReleaseHandle(handle);

Pointer<Void> sdkMapdataSegmentspandataToFfiNullable(SegmentSpanData? value) =>
  value != null ? sdkMapdataSegmentspandataToFfi(value) : Pointer<Void>.fromAddress(0);

SegmentSpanData? sdkMapdataSegmentspandataFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapdataSegmentspandataFromFfi(handle) : null;

void sdkMapdataSegmentspandataReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapdataSegmentspandataReleaseHandle(handle);

// End of SegmentSpanData "private" section.


