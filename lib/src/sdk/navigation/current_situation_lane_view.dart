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
import 'package:here_sdk/src/sdk/navigation/lane_access.dart';
import 'package:here_sdk/src/sdk/navigation/lane_direction_category.dart';
import 'package:here_sdk/src/sdk/navigation/lane_type.dart';

/// A class that provides current situation lane assistance view
/// information for the street at the current position of a single lane.
///
/// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected
/// behaviors. Related APIs may change for new releases without a deprecation process.

class CurrentSituationLaneView {
  /// Indicates which vehicle types can access this lane.
  LaneAccess access;

  /// Indicates towards which directions this lane leads.
  LaneDirectionCategory directionCategory;

  /// Indicates this lane's properties.
  LaneType type;

  /// Creates a new instance.

  /// [access] Indicates which vehicle types can access this lane.

  /// [directionCategory] Indicates towards which directions this lane leads.

  /// [type] Indicates this lane's properties.

  CurrentSituationLaneView(this.access, this.directionCategory, this.type);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CurrentSituationLaneView) return false;
    CurrentSituationLaneView _other = other;
    return access == _other.access &&
        directionCategory == _other.directionCategory &&
        type == _other.type;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + access.hashCode;
    result = 31 * result + directionCategory.hashCode;
    result = 31 * result + type.hashCode;
    return result;
  }
}


// CurrentSituationLaneView "private" section, not exported.

final _sdkNavigationCurrentsituationlaneviewCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_navigation_CurrentSituationLaneView_create_handle'));
final _sdkNavigationCurrentsituationlaneviewReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_CurrentSituationLaneView_release_handle'));
final _sdkNavigationCurrentsituationlaneviewGetFieldaccess = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_CurrentSituationLaneView_get_field_access'));
final _sdkNavigationCurrentsituationlaneviewGetFielddirectionCategory = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_CurrentSituationLaneView_get_field_directionCategory'));
final _sdkNavigationCurrentsituationlaneviewGetFieldtype = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_CurrentSituationLaneView_get_field_type'));



Pointer<Void> sdkNavigationCurrentsituationlaneviewToFfi(CurrentSituationLaneView value) {
  final _accessHandle = sdkNavigationLaneaccessToFfi(value.access);
  final _directionCategoryHandle = sdkNavigationLanedirectioncategoryToFfi(value.directionCategory);
  final _typeHandle = sdkNavigationLanetypeToFfi(value.type);
  final _result = _sdkNavigationCurrentsituationlaneviewCreateHandle(_accessHandle, _directionCategoryHandle, _typeHandle);
  sdkNavigationLaneaccessReleaseFfiHandle(_accessHandle);
  sdkNavigationLanedirectioncategoryReleaseFfiHandle(_directionCategoryHandle);
  sdkNavigationLanetypeReleaseFfiHandle(_typeHandle);
  return _result;
}

CurrentSituationLaneView sdkNavigationCurrentsituationlaneviewFromFfi(Pointer<Void> handle) {
  final _accessHandle = _sdkNavigationCurrentsituationlaneviewGetFieldaccess(handle);
  final _directionCategoryHandle = _sdkNavigationCurrentsituationlaneviewGetFielddirectionCategory(handle);
  final _typeHandle = _sdkNavigationCurrentsituationlaneviewGetFieldtype(handle);
  try {
    return CurrentSituationLaneView(
      sdkNavigationLaneaccessFromFfi(_accessHandle), 
      sdkNavigationLanedirectioncategoryFromFfi(_directionCategoryHandle), 
      sdkNavigationLanetypeFromFfi(_typeHandle)
    );
  } finally {
    sdkNavigationLaneaccessReleaseFfiHandle(_accessHandle);
    sdkNavigationLanedirectioncategoryReleaseFfiHandle(_directionCategoryHandle);
    sdkNavigationLanetypeReleaseFfiHandle(_typeHandle);
  }
}

void sdkNavigationCurrentsituationlaneviewReleaseFfiHandle(Pointer<Void> handle) => _sdkNavigationCurrentsituationlaneviewReleaseHandle(handle);

// Nullable CurrentSituationLaneView

final _sdkNavigationCurrentsituationlaneviewCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_CurrentSituationLaneView_create_handle_nullable'));
final _sdkNavigationCurrentsituationlaneviewReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_CurrentSituationLaneView_release_handle_nullable'));
final _sdkNavigationCurrentsituationlaneviewGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_CurrentSituationLaneView_get_value_nullable'));

Pointer<Void> sdkNavigationCurrentsituationlaneviewToFfiNullable(CurrentSituationLaneView? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationCurrentsituationlaneviewToFfi(value);
  final result = _sdkNavigationCurrentsituationlaneviewCreateHandleNullable(_handle);
  sdkNavigationCurrentsituationlaneviewReleaseFfiHandle(_handle);
  return result;
}

CurrentSituationLaneView? sdkNavigationCurrentsituationlaneviewFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationCurrentsituationlaneviewGetValueNullable(handle);
  final result = sdkNavigationCurrentsituationlaneviewFromFfi(_handle);
  sdkNavigationCurrentsituationlaneviewReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationCurrentsituationlaneviewReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationCurrentsituationlaneviewReleaseHandleNullable(handle);

// End of CurrentSituationLaneView "private" section.


