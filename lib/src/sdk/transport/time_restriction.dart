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
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/time_rule.dart';
import 'package:here_sdk/src/sdk/transport/transport_type.dart';

/// Represents restriction based on time.
///
/// **Note:** This is a beta release of this feature.
/// Related APIs may change for new releases without a deprecation process.

class TimeRestriction {
  /// The category of the time restriction.
  TimeRestrictionCategory category;

  /// Specifies to which transportation types the time rules apply.
  List<TransportType> applicability;

  /// Time rule in TimeDomain format, which is part of the GDF specification.
  TimeRule? timeRule;

  /// Creates a new instance.

  /// [category] The category of the time restriction.

  /// [applicability] Specifies to which transportation types the time rules apply.

  /// [timeRule] Time rule in TimeDomain format, which is part of the GDF specification.

  TimeRestriction._(this.category, this.applicability, this.timeRule);
  TimeRestriction()
    : category = TimeRestrictionCategory.prohibited, applicability = [], timeRule = null;
}

/// Category of time restriction.
enum TimeRestrictionCategory {
    /// It is prohibited to go in one or both directions.
    prohibited,
    /// Restriction applies seasonally.
    seasonal
}

// TimeRestrictionCategory "private" section, not exported.

int sdkTransportTimerestrictionCategoryToFfi(TimeRestrictionCategory value) {
  switch (value) {
  case TimeRestrictionCategory.prohibited:
    return 0;
  case TimeRestrictionCategory.seasonal:
    return 1;
  default:
    throw StateError("Invalid enum value $value for TimeRestrictionCategory enum.");
  }
}

TimeRestrictionCategory sdkTransportTimerestrictionCategoryFromFfi(int handle) {
  switch (handle) {
  case 0:
    return TimeRestrictionCategory.prohibited;
  case 1:
    return TimeRestrictionCategory.seasonal;
  default:
    throw StateError("Invalid numeric value $handle for TimeRestrictionCategory enum.");
  }
}

void sdkTransportTimerestrictionCategoryReleaseFfiHandle(int handle) {}

final _sdkTransportTimerestrictionCategoryCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_transport_TimeRestriction_Category_create_handle_nullable'));
final _sdkTransportTimerestrictionCategoryReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_transport_TimeRestriction_Category_release_handle_nullable'));
final _sdkTransportTimerestrictionCategoryGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_transport_TimeRestriction_Category_get_value_nullable'));

Pointer<Void> sdkTransportTimerestrictionCategoryToFfiNullable(TimeRestrictionCategory? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkTransportTimerestrictionCategoryToFfi(value);
  final result = _sdkTransportTimerestrictionCategoryCreateHandleNullable(_handle);
  sdkTransportTimerestrictionCategoryReleaseFfiHandle(_handle);
  return result;
}

TimeRestrictionCategory? sdkTransportTimerestrictionCategoryFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkTransportTimerestrictionCategoryGetValueNullable(handle);
  final result = sdkTransportTimerestrictionCategoryFromFfi(_handle);
  sdkTransportTimerestrictionCategoryReleaseFfiHandle(_handle);
  return result;
}

void sdkTransportTimerestrictionCategoryReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkTransportTimerestrictionCategoryReleaseHandleNullable(handle);

// End of TimeRestrictionCategory "private" section.

// TimeRestriction "private" section, not exported.

final _sdkTransportTimerestrictionCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_transport_TimeRestriction_create_handle'));
final _sdkTransportTimerestrictionReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_transport_TimeRestriction_release_handle'));
final _sdkTransportTimerestrictionGetFieldcategory = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_transport_TimeRestriction_get_field_category'));
final _sdkTransportTimerestrictionGetFieldapplicability = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_TimeRestriction_get_field_applicability'));
final _sdkTransportTimerestrictionGetFieldtimeRule = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_TimeRestriction_get_field_timeRule'));



Pointer<Void> sdkTransportTimerestrictionToFfi(TimeRestriction value) {
  final _categoryHandle = sdkTransportTimerestrictionCategoryToFfi(value.category);
  final _applicabilityHandle = heresdkCoreBindingslistofSdkTransportTransporttypeToFfi(value.applicability);
  final _timeRuleHandle = sdkCoreTimeruleToFfiNullable(value.timeRule);
  final _result = _sdkTransportTimerestrictionCreateHandle(_categoryHandle, _applicabilityHandle, _timeRuleHandle);
  sdkTransportTimerestrictionCategoryReleaseFfiHandle(_categoryHandle);
  heresdkCoreBindingslistofSdkTransportTransporttypeReleaseFfiHandle(_applicabilityHandle);
  sdkCoreTimeruleReleaseFfiHandleNullable(_timeRuleHandle);
  return _result;
}

TimeRestriction sdkTransportTimerestrictionFromFfi(Pointer<Void> handle) {
  final _categoryHandle = _sdkTransportTimerestrictionGetFieldcategory(handle);
  final _applicabilityHandle = _sdkTransportTimerestrictionGetFieldapplicability(handle);
  final _timeRuleHandle = _sdkTransportTimerestrictionGetFieldtimeRule(handle);
  try {
    return TimeRestriction._(
      sdkTransportTimerestrictionCategoryFromFfi(_categoryHandle), 
      heresdkCoreBindingslistofSdkTransportTransporttypeFromFfi(_applicabilityHandle), 
      sdkCoreTimeruleFromFfiNullable(_timeRuleHandle)
    );
  } finally {
    sdkTransportTimerestrictionCategoryReleaseFfiHandle(_categoryHandle);
    heresdkCoreBindingslistofSdkTransportTransporttypeReleaseFfiHandle(_applicabilityHandle);
    sdkCoreTimeruleReleaseFfiHandleNullable(_timeRuleHandle);
  }
}

void sdkTransportTimerestrictionReleaseFfiHandle(Pointer<Void> handle) => _sdkTransportTimerestrictionReleaseHandle(handle);

// Nullable TimeRestriction

final _sdkTransportTimerestrictionCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_TimeRestriction_create_handle_nullable'));
final _sdkTransportTimerestrictionReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_transport_TimeRestriction_release_handle_nullable'));
final _sdkTransportTimerestrictionGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_TimeRestriction_get_value_nullable'));

Pointer<Void> sdkTransportTimerestrictionToFfiNullable(TimeRestriction? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkTransportTimerestrictionToFfi(value);
  final result = _sdkTransportTimerestrictionCreateHandleNullable(_handle);
  sdkTransportTimerestrictionReleaseFfiHandle(_handle);
  return result;
}

TimeRestriction? sdkTransportTimerestrictionFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkTransportTimerestrictionGetValueNullable(handle);
  final result = sdkTransportTimerestrictionFromFfi(_handle);
  sdkTransportTimerestrictionReleaseFfiHandle(_handle);
  return result;
}

void sdkTransportTimerestrictionReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkTransportTimerestrictionReleaseHandleNullable(handle);

// End of TimeRestriction "private" section.


