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
import 'package:here_sdk/src/sdk/navigation/maneuver_notification_details.dart';
import 'package:here_sdk/src/sdk/navigation/spatial_notification_details.dart';
import 'package:here_sdk/src/sdk/navigation/text_notification_type.dart';

/// Contains all the information regarding the next text announcement.

class EventText {
  /// Indicates the type of text announcement
  TextNotificationType type;

  /// The text notification instruction. The text is formatted and localized as specified via
  /// [RouteTextOptions].
  ///
  /// **Note:** During navigation, the text will be always empty when the [Maneuver] is
  /// taken from the `Navigator` or `VisualNavigator` instance via the provided index.
  /// The text instruction that can be accessed from the [Route] instance is meant
  /// as preview and it is not necessarily matching the more comprehensive maneuver information you
  /// can access during navigation. This information can be enhanced with real-time `ManeuverNotifications`
  /// texts that can be used for spoken text notifications during a trip.
  String text;

  /// Information about the next maneuver.
  /// Is non-`null` only for [EventText.type] equals to [TextNotificationType.maneuver].
  ManeuverNotificationDetails? maneuverNotificationDetails;

  /// Information for a spatial text notifications.
  /// When [EventTextOptions.enableSpatialAudio] is false,
  /// then this attribute will be `null`.
  SpatialNotificationDetails? spatialNotificationDetails;

  /// Creates a new instance.

  /// [type] Indicates the type of text announcement

  /// [text] The text notification instruction. The text is formatted and localized as specified via
  /// [RouteTextOptions].
  ///
  /// **Note:** During navigation, the text will be always empty when the [Maneuver] is
  /// taken from the `Navigator` or `VisualNavigator` instance via the provided index.
  /// The text instruction that can be accessed from the [Route] instance is meant
  /// as preview and it is not necessarily matching the more comprehensive maneuver information you
  /// can access during navigation. This information can be enhanced with real-time `ManeuverNotifications`
  /// texts that can be used for spoken text notifications during a trip.

  /// [maneuverNotificationDetails] Information about the next maneuver.
  /// Is non-`null` only for [EventText.type] equals to [TextNotificationType.maneuver].

  /// [spatialNotificationDetails] Information for a spatial text notifications.
  /// When [EventTextOptions.enableSpatialAudio] is false,
  /// then this attribute will be `null`.

  EventText._(this.type, this.text, this.maneuverNotificationDetails, this.spatialNotificationDetails);
  EventText(TextNotificationType type, String text)
    : type = type, text = text, maneuverNotificationDetails = null, spatialNotificationDetails = null;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! EventText) return false;
    EventText _other = other;
    return type == _other.type &&
        text == _other.text &&
        maneuverNotificationDetails == _other.maneuverNotificationDetails &&
        spatialNotificationDetails == _other.spatialNotificationDetails;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + type.hashCode;
    result = 31 * result + text.hashCode;
    result = 31 * result + maneuverNotificationDetails.hashCode;
    result = 31 * result + spatialNotificationDetails.hashCode;
    return result;
  }
}


// EventText "private" section, not exported.

final _sdkNavigationEventtextCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_navigation_EventText_create_handle'));
final _sdkNavigationEventtextReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_EventText_release_handle'));
final _sdkNavigationEventtextGetFieldtype = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_EventText_get_field_type'));
final _sdkNavigationEventtextGetFieldtext = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_EventText_get_field_text'));
final _sdkNavigationEventtextGetFieldmaneuverNotificationDetails = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_EventText_get_field_maneuverNotificationDetails'));
final _sdkNavigationEventtextGetFieldspatialNotificationDetails = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_EventText_get_field_spatialNotificationDetails'));



Pointer<Void> sdkNavigationEventtextToFfi(EventText value) {
  final _typeHandle = sdkNavigationTextnotificationtypeToFfi(value.type);
  final _textHandle = stringToFfi(value.text);
  final _maneuverNotificationDetailsHandle = sdkNavigationManeuvernotificationdetailsToFfiNullable(value.maneuverNotificationDetails);
  final _spatialNotificationDetailsHandle = sdkNavigationSpatialnotificationdetailsToFfiNullable(value.spatialNotificationDetails);
  final _result = _sdkNavigationEventtextCreateHandle(_typeHandle, _textHandle, _maneuverNotificationDetailsHandle, _spatialNotificationDetailsHandle);
  sdkNavigationTextnotificationtypeReleaseFfiHandle(_typeHandle);
  stringReleaseFfiHandle(_textHandle);
  sdkNavigationManeuvernotificationdetailsReleaseFfiHandleNullable(_maneuverNotificationDetailsHandle);
  sdkNavigationSpatialnotificationdetailsReleaseFfiHandleNullable(_spatialNotificationDetailsHandle);
  return _result;
}

EventText sdkNavigationEventtextFromFfi(Pointer<Void> handle) {
  final _typeHandle = _sdkNavigationEventtextGetFieldtype(handle);
  final _textHandle = _sdkNavigationEventtextGetFieldtext(handle);
  final _maneuverNotificationDetailsHandle = _sdkNavigationEventtextGetFieldmaneuverNotificationDetails(handle);
  final _spatialNotificationDetailsHandle = _sdkNavigationEventtextGetFieldspatialNotificationDetails(handle);
  try {
    return EventText._(
      sdkNavigationTextnotificationtypeFromFfi(_typeHandle), 
      stringFromFfi(_textHandle), 
      sdkNavigationManeuvernotificationdetailsFromFfiNullable(_maneuverNotificationDetailsHandle), 
      sdkNavigationSpatialnotificationdetailsFromFfiNullable(_spatialNotificationDetailsHandle)
    );
  } finally {
    sdkNavigationTextnotificationtypeReleaseFfiHandle(_typeHandle);
    stringReleaseFfiHandle(_textHandle);
    sdkNavigationManeuvernotificationdetailsReleaseFfiHandleNullable(_maneuverNotificationDetailsHandle);
    sdkNavigationSpatialnotificationdetailsReleaseFfiHandleNullable(_spatialNotificationDetailsHandle);
  }
}

void sdkNavigationEventtextReleaseFfiHandle(Pointer<Void> handle) => _sdkNavigationEventtextReleaseHandle(handle);

// Nullable EventText

final _sdkNavigationEventtextCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_EventText_create_handle_nullable'));
final _sdkNavigationEventtextReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_EventText_release_handle_nullable'));
final _sdkNavigationEventtextGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_EventText_get_value_nullable'));

Pointer<Void> sdkNavigationEventtextToFfiNullable(EventText? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationEventtextToFfi(value);
  final result = _sdkNavigationEventtextCreateHandleNullable(_handle);
  sdkNavigationEventtextReleaseFfiHandle(_handle);
  return result;
}

EventText? sdkNavigationEventtextFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationEventtextGetValueNullable(handle);
  final result = sdkNavigationEventtextFromFfi(_handle);
  sdkNavigationEventtextReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationEventtextReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationEventtextReleaseHandleNullable(handle);

// End of EventText "private" section.


