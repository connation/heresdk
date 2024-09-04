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

/// School zone warning options.
///
/// Set the options to [NavigatorInterface.schoolZoneWarningOptions]
/// for configuring of school zone notifications.

class SchoolZoneWarningOptions {
  /// If set to true, all the school zone notifications which have a time restrictions
  /// that does not apply for the current time will not be given.
  /// If the value is false, all school zone notifications will be given regardless
  /// of the time restrictions that they might have.
  bool filterOutInactiveTimeDependentWarnings;

  /// Distance setting applicable for school warning regardless of the road type, in meters.
  /// Defaults to 100 meters.
  int warningDistanceInMeters;

  /// Creates a new instance.

  /// [filterOutInactiveTimeDependentWarnings] If set to true, all the school zone notifications which have a time restrictions
  /// that does not apply for the current time will not be given.
  /// If the value is false, all school zone notifications will be given regardless
  /// of the time restrictions that they might have.

  /// [warningDistanceInMeters] Distance setting applicable for school warning regardless of the road type, in meters.
  /// Defaults to 100 meters.

  SchoolZoneWarningOptions._(this.filterOutInactiveTimeDependentWarnings, this.warningDistanceInMeters);
  SchoolZoneWarningOptions()
    : filterOutInactiveTimeDependentWarnings = false, warningDistanceInMeters = 100;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SchoolZoneWarningOptions) return false;
    SchoolZoneWarningOptions _other = other;
    return filterOutInactiveTimeDependentWarnings == _other.filterOutInactiveTimeDependentWarnings &&
        warningDistanceInMeters == _other.warningDistanceInMeters;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + filterOutInactiveTimeDependentWarnings.hashCode;
    result = 31 * result + warningDistanceInMeters.hashCode;
    return result;
  }
}


// SchoolZoneWarningOptions "private" section, not exported.

final _sdkNavigationSchoolzonewarningoptionsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint8, Int32),
    Pointer<Void> Function(int, int)
  >('here_sdk_sdk_navigation_SchoolZoneWarningOptions_create_handle'));
final _sdkNavigationSchoolzonewarningoptionsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SchoolZoneWarningOptions_release_handle'));
final _sdkNavigationSchoolzonewarningoptionsGetFieldfilterOutInactiveTimeDependentWarnings = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SchoolZoneWarningOptions_get_field_filterOutInactiveTimeDependentWarnings'));
final _sdkNavigationSchoolzonewarningoptionsGetFieldwarningDistanceInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SchoolZoneWarningOptions_get_field_warningDistanceInMeters'));



Pointer<Void> sdkNavigationSchoolzonewarningoptionsToFfi(SchoolZoneWarningOptions value) {
  final _filterOutInactiveTimeDependentWarningsHandle = booleanToFfi(value.filterOutInactiveTimeDependentWarnings);
  final _warningDistanceInMetersHandle = (value.warningDistanceInMeters);
  final _result = _sdkNavigationSchoolzonewarningoptionsCreateHandle(_filterOutInactiveTimeDependentWarningsHandle, _warningDistanceInMetersHandle);
  booleanReleaseFfiHandle(_filterOutInactiveTimeDependentWarningsHandle);
  
  return _result;
}

SchoolZoneWarningOptions sdkNavigationSchoolzonewarningoptionsFromFfi(Pointer<Void> handle) {
  final _filterOutInactiveTimeDependentWarningsHandle = _sdkNavigationSchoolzonewarningoptionsGetFieldfilterOutInactiveTimeDependentWarnings(handle);
  final _warningDistanceInMetersHandle = _sdkNavigationSchoolzonewarningoptionsGetFieldwarningDistanceInMeters(handle);
  try {
    return SchoolZoneWarningOptions._(
      booleanFromFfi(_filterOutInactiveTimeDependentWarningsHandle), 
      (_warningDistanceInMetersHandle)
    );
  } finally {
    booleanReleaseFfiHandle(_filterOutInactiveTimeDependentWarningsHandle);
    
  }
}

void sdkNavigationSchoolzonewarningoptionsReleaseFfiHandle(Pointer<Void> handle) => _sdkNavigationSchoolzonewarningoptionsReleaseHandle(handle);

// Nullable SchoolZoneWarningOptions

final _sdkNavigationSchoolzonewarningoptionsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SchoolZoneWarningOptions_create_handle_nullable'));
final _sdkNavigationSchoolzonewarningoptionsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SchoolZoneWarningOptions_release_handle_nullable'));
final _sdkNavigationSchoolzonewarningoptionsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SchoolZoneWarningOptions_get_value_nullable'));

Pointer<Void> sdkNavigationSchoolzonewarningoptionsToFfiNullable(SchoolZoneWarningOptions? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationSchoolzonewarningoptionsToFfi(value);
  final result = _sdkNavigationSchoolzonewarningoptionsCreateHandleNullable(_handle);
  sdkNavigationSchoolzonewarningoptionsReleaseFfiHandle(_handle);
  return result;
}

SchoolZoneWarningOptions? sdkNavigationSchoolzonewarningoptionsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationSchoolzonewarningoptionsGetValueNullable(handle);
  final result = sdkNavigationSchoolzonewarningoptionsFromFfi(_handle);
  sdkNavigationSchoolzonewarningoptionsReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationSchoolzonewarningoptionsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationSchoolzonewarningoptionsReleaseHandleNullable(handle);

// End of SchoolZoneWarningOptions "private" section.


