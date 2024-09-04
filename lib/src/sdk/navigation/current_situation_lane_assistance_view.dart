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
import 'package:collection/collection.dart';
import 'package:here_sdk/src/_library_context.dart' as __lib;
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/navigation/current_situation_lane_view.dart';

/// A class that provides current situation lane assistance view
/// information for the street at the current location.

class CurrentSituationLaneAssistanceView {
  /// A list of lanes on the current road.
  /// The lanes are sorted from left to right: The lane at index 0 represents the leftmost lane and
  /// the last index represents the rightmost lane. This is valid for right-hand and left-hand driving
  /// countries. Empty list means unavailability of data for a current location.
  ///
  /// The left to right order is in the travel direction.
  /// Only the lanes for the current driving direction are included.
  ///
  /// **Note:** Lanes going in opposite direction are not included in the list.
  List<CurrentSituationLaneView> lanes;

  /// Creates a new instance.

  /// [lanes] A list of lanes on the current road.
  /// The lanes are sorted from left to right: The lane at index 0 represents the leftmost lane and
  /// the last index represents the rightmost lane. This is valid for right-hand and left-hand driving
  /// countries. Empty list means unavailability of data for a current location.
  ///
  /// The left to right order is in the travel direction.
  /// Only the lanes for the current driving direction are included.
  ///
  /// **Note:** Lanes going in opposite direction are not included in the list.

  CurrentSituationLaneAssistanceView._(this.lanes);
  CurrentSituationLaneAssistanceView()
    : lanes = [];
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CurrentSituationLaneAssistanceView) return false;
    CurrentSituationLaneAssistanceView _other = other;
    return DeepCollectionEquality().equals(lanes, _other.lanes);
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + DeepCollectionEquality().hash(lanes);
    return result;
  }
}


// CurrentSituationLaneAssistanceView "private" section, not exported.

final _sdkNavigationCurrentsituationlaneassistanceviewCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_CurrentSituationLaneAssistanceView_create_handle'));
final _sdkNavigationCurrentsituationlaneassistanceviewReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_CurrentSituationLaneAssistanceView_release_handle'));
final _sdkNavigationCurrentsituationlaneassistanceviewGetFieldlanes = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_CurrentSituationLaneAssistanceView_get_field_lanes'));



Pointer<Void> sdkNavigationCurrentsituationlaneassistanceviewToFfi(CurrentSituationLaneAssistanceView value) {
  final _lanesHandle = heresdkNavigationBindingslistofSdkNavigationCurrentsituationlaneviewToFfi(value.lanes);
  final _result = _sdkNavigationCurrentsituationlaneassistanceviewCreateHandle(_lanesHandle);
  heresdkNavigationBindingslistofSdkNavigationCurrentsituationlaneviewReleaseFfiHandle(_lanesHandle);
  return _result;
}

CurrentSituationLaneAssistanceView sdkNavigationCurrentsituationlaneassistanceviewFromFfi(Pointer<Void> handle) {
  final _lanesHandle = _sdkNavigationCurrentsituationlaneassistanceviewGetFieldlanes(handle);
  try {
    return CurrentSituationLaneAssistanceView._(
      heresdkNavigationBindingslistofSdkNavigationCurrentsituationlaneviewFromFfi(_lanesHandle)
    );
  } finally {
    heresdkNavigationBindingslistofSdkNavigationCurrentsituationlaneviewReleaseFfiHandle(_lanesHandle);
  }
}

void sdkNavigationCurrentsituationlaneassistanceviewReleaseFfiHandle(Pointer<Void> handle) => _sdkNavigationCurrentsituationlaneassistanceviewReleaseHandle(handle);

// Nullable CurrentSituationLaneAssistanceView

final _sdkNavigationCurrentsituationlaneassistanceviewCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_CurrentSituationLaneAssistanceView_create_handle_nullable'));
final _sdkNavigationCurrentsituationlaneassistanceviewReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_CurrentSituationLaneAssistanceView_release_handle_nullable'));
final _sdkNavigationCurrentsituationlaneassistanceviewGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_CurrentSituationLaneAssistanceView_get_value_nullable'));

Pointer<Void> sdkNavigationCurrentsituationlaneassistanceviewToFfiNullable(CurrentSituationLaneAssistanceView? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationCurrentsituationlaneassistanceviewToFfi(value);
  final result = _sdkNavigationCurrentsituationlaneassistanceviewCreateHandleNullable(_handle);
  sdkNavigationCurrentsituationlaneassistanceviewReleaseFfiHandle(_handle);
  return result;
}

CurrentSituationLaneAssistanceView? sdkNavigationCurrentsituationlaneassistanceviewFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationCurrentsituationlaneassistanceviewGetValueNullable(handle);
  final result = sdkNavigationCurrentsituationlaneassistanceviewFromFfi(_handle);
  sdkNavigationCurrentsituationlaneassistanceviewReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationCurrentsituationlaneassistanceviewReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationCurrentsituationlaneassistanceviewReleaseHandleNullable(handle);

// End of CurrentSituationLaneAssistanceView "private" section.


