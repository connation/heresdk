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
import 'package:here_sdk/src/sdk/navigation/maneuver_notification_type.dart';
import 'package:here_sdk/src/sdk/routing/maneuver.dart';

/// This class provides the information regarding the next maneuver to be triggered

class ManeuverNotificationDetails {
  /// Current maneuver data. In case of a double maneuver e.g. "Now turn right and then turn left",
  /// this attribute will contain the maneuver data of the first maneuver of the combined maneuver "Now turn right".
  Maneuver maneuver;

  /// Indicates the type of the current maneuver notification.
  ManeuverNotificationType maneuverNotificationType;

  /// Indicates whether the current text notification combines information regarding current and next maneuver,
  /// such as, "Now turn right and then turn left onto Invalidenstrasse", or not.
  bool isCombinedManeuverText;

  /// Creates a new instance.

  /// [maneuver] Current maneuver data. In case of a double maneuver e.g. "Now turn right and then turn left",
  /// this attribute will contain the maneuver data of the first maneuver of the combined maneuver "Now turn right".

  /// [maneuverNotificationType] Indicates the type of the current maneuver notification.

  /// [isCombinedManeuverText] Indicates whether the current text notification combines information regarding current and next maneuver,
  /// such as, "Now turn right and then turn left onto Invalidenstrasse", or not.

  ManeuverNotificationDetails._(this.maneuver, this.maneuverNotificationType, this.isCombinedManeuverText);
  ManeuverNotificationDetails(Maneuver maneuver, ManeuverNotificationType maneuverNotificationType)
    : maneuver = maneuver, maneuverNotificationType = maneuverNotificationType, isCombinedManeuverText = false;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ManeuverNotificationDetails) return false;
    ManeuverNotificationDetails _other = other;
    return maneuver == _other.maneuver &&
        maneuverNotificationType == _other.maneuverNotificationType &&
        isCombinedManeuverText == _other.isCombinedManeuverText;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + maneuver.hashCode;
    result = 31 * result + maneuverNotificationType.hashCode;
    result = 31 * result + isCombinedManeuverText.hashCode;
    return result;
  }
}


// ManeuverNotificationDetails "private" section, not exported.

final _sdkNavigationManeuvernotificationdetailsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Uint32, Uint8),
    Pointer<Void> Function(Pointer<Void>, int, int)
  >('here_sdk_sdk_navigation_ManeuverNotificationDetails_create_handle'));
final _sdkNavigationManeuvernotificationdetailsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_ManeuverNotificationDetails_release_handle'));
final _sdkNavigationManeuvernotificationdetailsGetFieldmaneuver = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_ManeuverNotificationDetails_get_field_maneuver'));
final _sdkNavigationManeuvernotificationdetailsGetFieldmaneuverNotificationType = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_ManeuverNotificationDetails_get_field_maneuverNotificationType'));
final _sdkNavigationManeuvernotificationdetailsGetFieldisCombinedManeuverText = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_ManeuverNotificationDetails_get_field_isCombinedManeuverText'));



Pointer<Void> sdkNavigationManeuvernotificationdetailsToFfi(ManeuverNotificationDetails value) {
  final _maneuverHandle = sdkRoutingManeuverToFfi(value.maneuver);
  final _maneuverNotificationTypeHandle = sdkNavigationManeuvernotificationtypeToFfi(value.maneuverNotificationType);
  final _isCombinedManeuverTextHandle = booleanToFfi(value.isCombinedManeuverText);
  final _result = _sdkNavigationManeuvernotificationdetailsCreateHandle(_maneuverHandle, _maneuverNotificationTypeHandle, _isCombinedManeuverTextHandle);
  sdkRoutingManeuverReleaseFfiHandle(_maneuverHandle);
  sdkNavigationManeuvernotificationtypeReleaseFfiHandle(_maneuverNotificationTypeHandle);
  booleanReleaseFfiHandle(_isCombinedManeuverTextHandle);
  return _result;
}

ManeuverNotificationDetails sdkNavigationManeuvernotificationdetailsFromFfi(Pointer<Void> handle) {
  final _maneuverHandle = _sdkNavigationManeuvernotificationdetailsGetFieldmaneuver(handle);
  final _maneuverNotificationTypeHandle = _sdkNavigationManeuvernotificationdetailsGetFieldmaneuverNotificationType(handle);
  final _isCombinedManeuverTextHandle = _sdkNavigationManeuvernotificationdetailsGetFieldisCombinedManeuverText(handle);
  try {
    return ManeuverNotificationDetails._(
      sdkRoutingManeuverFromFfi(_maneuverHandle), 
      sdkNavigationManeuvernotificationtypeFromFfi(_maneuverNotificationTypeHandle), 
      booleanFromFfi(_isCombinedManeuverTextHandle)
    );
  } finally {
    sdkRoutingManeuverReleaseFfiHandle(_maneuverHandle);
    sdkNavigationManeuvernotificationtypeReleaseFfiHandle(_maneuverNotificationTypeHandle);
    booleanReleaseFfiHandle(_isCombinedManeuverTextHandle);
  }
}

void sdkNavigationManeuvernotificationdetailsReleaseFfiHandle(Pointer<Void> handle) => _sdkNavigationManeuvernotificationdetailsReleaseHandle(handle);

// Nullable ManeuverNotificationDetails

final _sdkNavigationManeuvernotificationdetailsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_ManeuverNotificationDetails_create_handle_nullable'));
final _sdkNavigationManeuvernotificationdetailsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_ManeuverNotificationDetails_release_handle_nullable'));
final _sdkNavigationManeuvernotificationdetailsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_ManeuverNotificationDetails_get_value_nullable'));

Pointer<Void> sdkNavigationManeuvernotificationdetailsToFfiNullable(ManeuverNotificationDetails? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationManeuvernotificationdetailsToFfi(value);
  final result = _sdkNavigationManeuvernotificationdetailsCreateHandleNullable(_handle);
  sdkNavigationManeuvernotificationdetailsReleaseFfiHandle(_handle);
  return result;
}

ManeuverNotificationDetails? sdkNavigationManeuvernotificationdetailsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationManeuvernotificationdetailsGetValueNullable(handle);
  final result = sdkNavigationManeuvernotificationdetailsFromFfi(_handle);
  sdkNavigationManeuvernotificationdetailsReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationManeuvernotificationdetailsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationManeuvernotificationdetailsReleaseHandleNullable(handle);

// End of ManeuverNotificationDetails "private" section.


