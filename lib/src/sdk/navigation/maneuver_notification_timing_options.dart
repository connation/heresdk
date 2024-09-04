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

/// A class defining timing and distance thresholds for maneuver notifications.
///
/// Setting custom values will impact the time when the notification for each supported [ManeuverNotificationType] is sent - dependent on the [TimingProfile].
///
/// Note: By default, notification thresholds are speed limit dependent. When custom values are set, then these rules will still apply.
/// The values can be applied for three road types, highway, urban and rural roads. The following rules apply for all transport modes:
///
/// * For [TimingProfile.fastSpeed] timing profile, if the current speed limit is less than 62 m/h (100 km/h), then the notification thresholds for [TimingProfile.regularSpeed] timing profile will be used instead.
/// * For [TimingProfile.regularSpeed] timing profile, if the current speed limit is less than 37 m/h (60 km/h), then the notification thresholds for [TimingProfile.slowSpeed] timing profile will be used instead.
/// * For [TimingProfile.slowSpeed] timing profile the thresholds will be always used as specified.
///
/// The timings follow a strict order:
///
/// 1. [ManeuverNotificationType.range]: The first notification, it may be very far away (use 0 for farthest or earliest possible notification).
/// 2. [ManeuverNotificationType.reminder]: The second notification.
/// 3. [ManeuverNotificationType.distance]: A second reminder notification to take action.
/// 4. [ManeuverNotificationType.action]: Final notification, specifying the required action to be taken.
///
/// Therefore, it is crucial that the set values do not violate the order: range > reminder > distance > action.
/// For example, the following values are valid: range = 4000, reminder = 2500, distance = 1000, action = 400.
/// If [ManeuverNotificationTimingOptions.rangeNotificationDistanceInMeters] is smaller than [ManeuverNotificationTimingOptions.reminderNotificationDistanceInMeters] the new options will be
/// silently ignored and the previous values are kept.
///
/// You always have the choice to specify the thresholds for time or distance. For each [ManeuverNotificationType] a
/// notification is only sent once, so the value that is reached first, wins. However, it is recommended to always update both, time
/// and distance values.
/// A configuration value of 0 is only allowed for [ManeuverNotificationTimingOptions.rangeNotificationDistanceInMeters] and [ManeuverNotificationTimingOptions.rangeNotificationTimeInSeconds].
/// It means that the maneuver notifications of type [ManeuverNotificationType.range] should be generated as soon
/// as the maneuver location is known - no matter how far away it may be.
/// It's impossible for the other types to have 0 as value due to the descending ordering rule mentioned above.
///
/// You can also specify the [ManeuverNotificationTimingOptions.doubleNotificationDistanceInMeters] threshold that determines the distance between two maneuvers that
/// should be merged into a single maneuver notification, for example, when they are very close to each other. Maneuvers below this
/// threshold will be merged like in this example: "After 300 meters turn right and then turn left.".
///
/// Tip: To set the timings to the HERE SDK, you can first call `getManeuverNotificationTimingOptions()` to get the default values
/// for the desired combination of transport mode and timing profile. Then configure the timings, then set it back by calling the
/// `setManeuverNotificationTimingOptions()`.
///
/// Note: In the comment of each attribute, the term `Others` refers to non-pedestrian transport modes such as
/// [TransportMode.car], [TransportMode.bicycle], [TransportMode.truck].
///
/// Attention: The default values for [TransportMode.pedestrian] on [TimingProfile.fastSpeed] are theoretical, as such
/// routes cannot be calculated with the HERE SDK as highways are forbidden for pedestrians.
///
/// Usage example:
///
/// ```
/// // Get current values or default values, if no values have been set before.
/// ManeuverNotificationTimingOptions car_highway_timings = Navigator.getManeuverNotificationTimingOptions(TransportMode.car, TimingProfile.FAST_SPEED);
/// // Set a new value for a specific option and keep the previous or default values for the others.
/// car_highway_timings.distanceNotificationDistanceInMeters = 1500;
/// // Apply the changes to Navigator (or VisualNavigator).
/// Navigator.setManeuverNotificationTimingOptions(TransportMode.CAR, TimingProfile.FAST_SPEED, car_fast_speed_timings);
/// ```

class ManeuverNotificationTimingOptions {
  /// The default distance setting for [ManeuverNotificationType.range] notification. A configuration value of 0 is only allowed for
  /// [ManeuverNotificationTimingOptions.rangeNotificationDistanceInMeters] and [ManeuverNotificationTimingOptions.rangeNotificationTimeInSeconds]. It means that the maneuver notifications of type
  /// [ManeuverNotificationType.range] should be generated as soon as the maneuver location is known - no matter how far away it may be.
  ///
  /// | Transport Mode                           | Timing Profile                | Default value                            |
  /// | ---------------------------------------- | ------------------------------| ---------------------------------------- |
  /// | [TransportMode.pedestrian] | [TimingProfile.fastSpeed]    | 0                                        |
  /// | [TransportMode.pedestrian] | [TimingProfile.regularSpeed] | 0                                        |
  /// | [TransportMode.pedestrian] | [TimingProfile.slowSpeed]    | 0                                        |
  /// | Others                                   | [TimingProfile.fastSpeed]    | 0                                        |
  /// | Others                                   | [TimingProfile.regularSpeed] | 0                                        |
  /// | Others                                   | [TimingProfile.slowSpeed]    | 0                                        |
  int rangeNotificationDistanceInMeters;

  /// The default time setting for [ManeuverNotificationType.range] notification. A configuration value of 0 is only allowed for
  /// [ManeuverNotificationTimingOptions.rangeNotificationDistanceInMeters] and [ManeuverNotificationTimingOptions.rangeNotificationTimeInSeconds]. It means that the maneuver notifications of type
  /// [ManeuverNotificationType.range] should be generated as soon as the maneuver location is known - no matter how far away it may be.
  ///
  /// | Transport Mode                           | Timing Profile                | Default value                            |
  /// | ---------------------------------------- | ------------------------------| ---------------------------------------- |
  /// | [TransportMode.pedestrian] | [TimingProfile.fastSpeed]    | 0                                        |
  /// | [TransportMode.pedestrian] | [TimingProfile.regularSpeed] | 0                                        |
  /// | [TransportMode.pedestrian] | [TimingProfile.slowSpeed]    | 0                                        |
  /// | Others                                   | [TimingProfile.fastSpeed]    | 0                                        |
  /// | Others                                   | [TimingProfile.regularSpeed] | 0                                        |
  /// | Others                                   | [TimingProfile.slowSpeed]    | 0                                        |
  int rangeNotificationTimeInSeconds;

  /// The default distance setting for [ManeuverNotificationType.reminder] notification.
  ///
  /// | Transport Mode                           | Timing Profile                | Default value                            |
  /// | ---------------------------------------- | ------------------------------| ---------------------------------------- |
  /// | [TransportMode.pedestrian] | [TimingProfile.fastSpeed]    | 500                                      |
  /// | [TransportMode.pedestrian] | [TimingProfile.regularSpeed] | 500                                      |
  /// | [TransportMode.pedestrian] | [TimingProfile.slowSpeed]    | 500                                      |
  /// | Others                                   | [TimingProfile.fastSpeed]    | 2300                                     |
  /// | Others                                   | [TimingProfile.regularSpeed] | 800                                      |
  /// | Others                                   | [TimingProfile.slowSpeed]    | 600                                      |
  int reminderNotificationDistanceInMeters;

  /// The default time setting for [ManeuverNotificationType.reminder] notification.
  ///
  /// | Transport Mode                           | Timing Profile                | Default value                            |
  /// | ---------------------------------------- | ----------------------------- | ---------------------------------------- |
  /// | [TransportMode.pedestrian] | [TimingProfile.fastSpeed]    | 40                                       |
  /// | [TransportMode.pedestrian] | [TimingProfile.regularSpeed] | 40                                       |
  /// | [TransportMode.pedestrian] | [TimingProfile.slowSpeed]    | 40                                       |
  /// | Others                                   | [TimingProfile.fastSpeed]    | 40                                       |
  /// | Others                                   | [TimingProfile.regularSpeed] | 40                                       |
  /// | Others                                   | [TimingProfile.slowSpeed]    | 40                                       |
  int reminderNotificationTimeInSeconds;

  /// The default distance setting for [ManeuverNotificationType.distance] notification.
  ///
  /// | Transport Mode                           | Timing Profile                | Default value                            |
  /// | ---------------------------------------- | ----------------------------- | ---------------------------------------- |
  /// | [TransportMode.pedestrian] | [TimingProfile.fastSpeed]    | 100                                      |
  /// | [TransportMode.pedestrian] | [TimingProfile.regularSpeed] | 100                                      |
  /// | [TransportMode.pedestrian] | [TimingProfile.slowSpeed]    | 100                                      |
  /// | Others                                   | [TimingProfile.fastSpeed]    | 1300                                     |
  /// | Others                                   | [TimingProfile.regularSpeed] | 300                                      |
  /// | Others                                   | [TimingProfile.slowSpeed]    | 300                                      |
  int distanceNotificationDistanceInMeters;

  /// The default time setting for [ManeuverNotificationType.distance] notification.
  ///
  /// | Transport Mode                           | Timing Profile                | Default value                            |
  /// | ---------------------------------------- | ----------------------------- | ---------------------------------------- |
  /// | [TransportMode.pedestrian] | [TimingProfile.fastSpeed]    | 18                                       |
  /// | [TransportMode.pedestrian] | [TimingProfile.regularSpeed] | 18                                       |
  /// | [TransportMode.pedestrian] | [TimingProfile.slowSpeed]    | 18                                       |
  /// | Others                                   | [TimingProfile.fastSpeed]    | 18                                       |
  /// | Others                                   | [TimingProfile.regularSpeed] | 18                                       |
  /// | Others                                   | [TimingProfile.slowSpeed]    | 18                                       |
  int distanceNotificationTimeInSeconds;

  /// The default distance setting for [ManeuverNotificationType.action] notification.
  ///
  /// | Transport Mode                           | Timing Profile                | Default value                            |
  /// | ---------------------------------------- | ------------------------------| ---------------------------------------- |
  /// | [TransportMode.pedestrian] | [TimingProfile.fastSpeed]    | 10                                       |
  /// | [TransportMode.pedestrian] | [TimingProfile.regularSpeed] | 10                                       |
  /// | [TransportMode.pedestrian] | [TimingProfile.slowSpeed]    | 10                                       |
  /// | Others                                   | [TimingProfile.fastSpeed]    | 400                                      |
  /// | Others                                   | [TimingProfile.regularSpeed] | 100                                      |
  /// | Others                                   | [TimingProfile.slowSpeed]    | 50                                       |
  int actionNotificationDistanceInMeters;

  /// The default time setting for [ManeuverNotificationType.action] notification.
  ///
  /// | Transport Mode                           | Timing Profile                | Default value                            |
  /// | ---------------------------------------- | ----------------------------- | ---------------------------------------- |
  /// | [TransportMode.pedestrian] | [TimingProfile.fastSpeed]    | 5                                        |
  /// | [TransportMode.pedestrian] | [TimingProfile.regularSpeed] | 5                                        |
  /// | [TransportMode.pedestrian] | [TimingProfile.slowSpeed]    | 5                                        |
  /// | Others                                   | [TimingProfile.fastSpeed]    | 5                                        |
  /// | Others                                   | [TimingProfile.regularSpeed] | 5                                        |
  /// | Others                                   | [TimingProfile.slowSpeed]    | 5                                        |
  int actionNotificationTimeInSeconds;

  /// The default distance setting for double notification.
  ///
  /// | Transport Mode                           | Timing Profile                | Default value                            |
  /// | ---------------------------------------- | ----------------------------- | ---------------------------------------- |
  /// | [TransportMode.pedestrian] | [TimingProfile.fastSpeed]    | 20                                       |
  /// | [TransportMode.pedestrian] | [TimingProfile.regularSpeed] | 20                                       |
  /// | [TransportMode.pedestrian] | [TimingProfile.slowSpeed]    | 20                                       |
  /// | Others                                   | [TimingProfile.fastSpeed]    | 750                                      |
  /// | Others                                   | [TimingProfile.regularSpeed] | 250                                      |
  /// | Others                                   | [TimingProfile.slowSpeed]    | 150                                      |
  int doubleNotificationDistanceInMeters;

  /// Creates a new instance.

  /// [rangeNotificationDistanceInMeters] The default distance setting for [ManeuverNotificationType.range] notification. A configuration value of 0 is only allowed for
  /// [ManeuverNotificationTimingOptions.rangeNotificationDistanceInMeters] and [ManeuverNotificationTimingOptions.rangeNotificationTimeInSeconds]. It means that the maneuver notifications of type
  /// [ManeuverNotificationType.range] should be generated as soon as the maneuver location is known - no matter how far away it may be.
  ///
  /// | Transport Mode                           | Timing Profile                | Default value                            |
  /// | ---------------------------------------- | ------------------------------| ---------------------------------------- |
  /// | [TransportMode.pedestrian] | [TimingProfile.fastSpeed]    | 0                                        |
  /// | [TransportMode.pedestrian] | [TimingProfile.regularSpeed] | 0                                        |
  /// | [TransportMode.pedestrian] | [TimingProfile.slowSpeed]    | 0                                        |
  /// | Others                                   | [TimingProfile.fastSpeed]    | 0                                        |
  /// | Others                                   | [TimingProfile.regularSpeed] | 0                                        |
  /// | Others                                   | [TimingProfile.slowSpeed]    | 0                                        |

  /// [rangeNotificationTimeInSeconds] The default time setting for [ManeuverNotificationType.range] notification. A configuration value of 0 is only allowed for
  /// [ManeuverNotificationTimingOptions.rangeNotificationDistanceInMeters] and [ManeuverNotificationTimingOptions.rangeNotificationTimeInSeconds]. It means that the maneuver notifications of type
  /// [ManeuverNotificationType.range] should be generated as soon as the maneuver location is known - no matter how far away it may be.
  ///
  /// | Transport Mode                           | Timing Profile                | Default value                            |
  /// | ---------------------------------------- | ------------------------------| ---------------------------------------- |
  /// | [TransportMode.pedestrian] | [TimingProfile.fastSpeed]    | 0                                        |
  /// | [TransportMode.pedestrian] | [TimingProfile.regularSpeed] | 0                                        |
  /// | [TransportMode.pedestrian] | [TimingProfile.slowSpeed]    | 0                                        |
  /// | Others                                   | [TimingProfile.fastSpeed]    | 0                                        |
  /// | Others                                   | [TimingProfile.regularSpeed] | 0                                        |
  /// | Others                                   | [TimingProfile.slowSpeed]    | 0                                        |

  /// [reminderNotificationDistanceInMeters] The default distance setting for [ManeuverNotificationType.reminder] notification.
  ///
  /// | Transport Mode                           | Timing Profile                | Default value                            |
  /// | ---------------------------------------- | ------------------------------| ---------------------------------------- |
  /// | [TransportMode.pedestrian] | [TimingProfile.fastSpeed]    | 500                                      |
  /// | [TransportMode.pedestrian] | [TimingProfile.regularSpeed] | 500                                      |
  /// | [TransportMode.pedestrian] | [TimingProfile.slowSpeed]    | 500                                      |
  /// | Others                                   | [TimingProfile.fastSpeed]    | 2300                                     |
  /// | Others                                   | [TimingProfile.regularSpeed] | 800                                      |
  /// | Others                                   | [TimingProfile.slowSpeed]    | 600                                      |

  /// [reminderNotificationTimeInSeconds] The default time setting for [ManeuverNotificationType.reminder] notification.
  ///
  /// | Transport Mode                           | Timing Profile                | Default value                            |
  /// | ---------------------------------------- | ----------------------------- | ---------------------------------------- |
  /// | [TransportMode.pedestrian] | [TimingProfile.fastSpeed]    | 40                                       |
  /// | [TransportMode.pedestrian] | [TimingProfile.regularSpeed] | 40                                       |
  /// | [TransportMode.pedestrian] | [TimingProfile.slowSpeed]    | 40                                       |
  /// | Others                                   | [TimingProfile.fastSpeed]    | 40                                       |
  /// | Others                                   | [TimingProfile.regularSpeed] | 40                                       |
  /// | Others                                   | [TimingProfile.slowSpeed]    | 40                                       |

  /// [distanceNotificationDistanceInMeters] The default distance setting for [ManeuverNotificationType.distance] notification.
  ///
  /// | Transport Mode                           | Timing Profile                | Default value                            |
  /// | ---------------------------------------- | ----------------------------- | ---------------------------------------- |
  /// | [TransportMode.pedestrian] | [TimingProfile.fastSpeed]    | 100                                      |
  /// | [TransportMode.pedestrian] | [TimingProfile.regularSpeed] | 100                                      |
  /// | [TransportMode.pedestrian] | [TimingProfile.slowSpeed]    | 100                                      |
  /// | Others                                   | [TimingProfile.fastSpeed]    | 1300                                     |
  /// | Others                                   | [TimingProfile.regularSpeed] | 300                                      |
  /// | Others                                   | [TimingProfile.slowSpeed]    | 300                                      |

  /// [distanceNotificationTimeInSeconds] The default time setting for [ManeuverNotificationType.distance] notification.
  ///
  /// | Transport Mode                           | Timing Profile                | Default value                            |
  /// | ---------------------------------------- | ----------------------------- | ---------------------------------------- |
  /// | [TransportMode.pedestrian] | [TimingProfile.fastSpeed]    | 18                                       |
  /// | [TransportMode.pedestrian] | [TimingProfile.regularSpeed] | 18                                       |
  /// | [TransportMode.pedestrian] | [TimingProfile.slowSpeed]    | 18                                       |
  /// | Others                                   | [TimingProfile.fastSpeed]    | 18                                       |
  /// | Others                                   | [TimingProfile.regularSpeed] | 18                                       |
  /// | Others                                   | [TimingProfile.slowSpeed]    | 18                                       |

  /// [actionNotificationDistanceInMeters] The default distance setting for [ManeuverNotificationType.action] notification.
  ///
  /// | Transport Mode                           | Timing Profile                | Default value                            |
  /// | ---------------------------------------- | ------------------------------| ---------------------------------------- |
  /// | [TransportMode.pedestrian] | [TimingProfile.fastSpeed]    | 10                                       |
  /// | [TransportMode.pedestrian] | [TimingProfile.regularSpeed] | 10                                       |
  /// | [TransportMode.pedestrian] | [TimingProfile.slowSpeed]    | 10                                       |
  /// | Others                                   | [TimingProfile.fastSpeed]    | 400                                      |
  /// | Others                                   | [TimingProfile.regularSpeed] | 100                                      |
  /// | Others                                   | [TimingProfile.slowSpeed]    | 50                                       |

  /// [actionNotificationTimeInSeconds] The default time setting for [ManeuverNotificationType.action] notification.
  ///
  /// | Transport Mode                           | Timing Profile                | Default value                            |
  /// | ---------------------------------------- | ----------------------------- | ---------------------------------------- |
  /// | [TransportMode.pedestrian] | [TimingProfile.fastSpeed]    | 5                                        |
  /// | [TransportMode.pedestrian] | [TimingProfile.regularSpeed] | 5                                        |
  /// | [TransportMode.pedestrian] | [TimingProfile.slowSpeed]    | 5                                        |
  /// | Others                                   | [TimingProfile.fastSpeed]    | 5                                        |
  /// | Others                                   | [TimingProfile.regularSpeed] | 5                                        |
  /// | Others                                   | [TimingProfile.slowSpeed]    | 5                                        |

  /// [doubleNotificationDistanceInMeters] The default distance setting for double notification.
  ///
  /// | Transport Mode                           | Timing Profile                | Default value                            |
  /// | ---------------------------------------- | ----------------------------- | ---------------------------------------- |
  /// | [TransportMode.pedestrian] | [TimingProfile.fastSpeed]    | 20                                       |
  /// | [TransportMode.pedestrian] | [TimingProfile.regularSpeed] | 20                                       |
  /// | [TransportMode.pedestrian] | [TimingProfile.slowSpeed]    | 20                                       |
  /// | Others                                   | [TimingProfile.fastSpeed]    | 750                                      |
  /// | Others                                   | [TimingProfile.regularSpeed] | 250                                      |
  /// | Others                                   | [TimingProfile.slowSpeed]    | 150                                      |

  ManeuverNotificationTimingOptions(this.rangeNotificationDistanceInMeters, this.rangeNotificationTimeInSeconds, this.reminderNotificationDistanceInMeters, this.reminderNotificationTimeInSeconds, this.distanceNotificationDistanceInMeters, this.distanceNotificationTimeInSeconds, this.actionNotificationDistanceInMeters, this.actionNotificationTimeInSeconds, this.doubleNotificationDistanceInMeters);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ManeuverNotificationTimingOptions) return false;
    ManeuverNotificationTimingOptions _other = other;
    return rangeNotificationDistanceInMeters == _other.rangeNotificationDistanceInMeters &&
        rangeNotificationTimeInSeconds == _other.rangeNotificationTimeInSeconds &&
        reminderNotificationDistanceInMeters == _other.reminderNotificationDistanceInMeters &&
        reminderNotificationTimeInSeconds == _other.reminderNotificationTimeInSeconds &&
        distanceNotificationDistanceInMeters == _other.distanceNotificationDistanceInMeters &&
        distanceNotificationTimeInSeconds == _other.distanceNotificationTimeInSeconds &&
        actionNotificationDistanceInMeters == _other.actionNotificationDistanceInMeters &&
        actionNotificationTimeInSeconds == _other.actionNotificationTimeInSeconds &&
        doubleNotificationDistanceInMeters == _other.doubleNotificationDistanceInMeters;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + rangeNotificationDistanceInMeters.hashCode;
    result = 31 * result + rangeNotificationTimeInSeconds.hashCode;
    result = 31 * result + reminderNotificationDistanceInMeters.hashCode;
    result = 31 * result + reminderNotificationTimeInSeconds.hashCode;
    result = 31 * result + distanceNotificationDistanceInMeters.hashCode;
    result = 31 * result + distanceNotificationTimeInSeconds.hashCode;
    result = 31 * result + actionNotificationDistanceInMeters.hashCode;
    result = 31 * result + actionNotificationTimeInSeconds.hashCode;
    result = 31 * result + doubleNotificationDistanceInMeters.hashCode;
    return result;
  }
}


// ManeuverNotificationTimingOptions "private" section, not exported.

final _sdkNavigationManeuvernotificationtimingoptionsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32),
    Pointer<Void> Function(int, int, int, int, int, int, int, int, int)
  >('here_sdk_sdk_navigation_ManeuverNotificationTimingOptions_create_handle'));
final _sdkNavigationManeuvernotificationtimingoptionsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_ManeuverNotificationTimingOptions_release_handle'));
final _sdkNavigationManeuvernotificationtimingoptionsGetFieldrangeNotificationDistanceInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_ManeuverNotificationTimingOptions_get_field_rangeNotificationDistanceInMeters'));
final _sdkNavigationManeuvernotificationtimingoptionsGetFieldrangeNotificationTimeInSeconds = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_ManeuverNotificationTimingOptions_get_field_rangeNotificationTimeInSeconds'));
final _sdkNavigationManeuvernotificationtimingoptionsGetFieldreminderNotificationDistanceInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_ManeuverNotificationTimingOptions_get_field_reminderNotificationDistanceInMeters'));
final _sdkNavigationManeuvernotificationtimingoptionsGetFieldreminderNotificationTimeInSeconds = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_ManeuverNotificationTimingOptions_get_field_reminderNotificationTimeInSeconds'));
final _sdkNavigationManeuvernotificationtimingoptionsGetFielddistanceNotificationDistanceInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_ManeuverNotificationTimingOptions_get_field_distanceNotificationDistanceInMeters'));
final _sdkNavigationManeuvernotificationtimingoptionsGetFielddistanceNotificationTimeInSeconds = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_ManeuverNotificationTimingOptions_get_field_distanceNotificationTimeInSeconds'));
final _sdkNavigationManeuvernotificationtimingoptionsGetFieldactionNotificationDistanceInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_ManeuverNotificationTimingOptions_get_field_actionNotificationDistanceInMeters'));
final _sdkNavigationManeuvernotificationtimingoptionsGetFieldactionNotificationTimeInSeconds = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_ManeuverNotificationTimingOptions_get_field_actionNotificationTimeInSeconds'));
final _sdkNavigationManeuvernotificationtimingoptionsGetFielddoubleNotificationDistanceInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_ManeuverNotificationTimingOptions_get_field_doubleNotificationDistanceInMeters'));



Pointer<Void> sdkNavigationManeuvernotificationtimingoptionsToFfi(ManeuverNotificationTimingOptions value) {
  final _rangeNotificationDistanceInMetersHandle = (value.rangeNotificationDistanceInMeters);
  final _rangeNotificationTimeInSecondsHandle = (value.rangeNotificationTimeInSeconds);
  final _reminderNotificationDistanceInMetersHandle = (value.reminderNotificationDistanceInMeters);
  final _reminderNotificationTimeInSecondsHandle = (value.reminderNotificationTimeInSeconds);
  final _distanceNotificationDistanceInMetersHandle = (value.distanceNotificationDistanceInMeters);
  final _distanceNotificationTimeInSecondsHandle = (value.distanceNotificationTimeInSeconds);
  final _actionNotificationDistanceInMetersHandle = (value.actionNotificationDistanceInMeters);
  final _actionNotificationTimeInSecondsHandle = (value.actionNotificationTimeInSeconds);
  final _doubleNotificationDistanceInMetersHandle = (value.doubleNotificationDistanceInMeters);
  final _result = _sdkNavigationManeuvernotificationtimingoptionsCreateHandle(_rangeNotificationDistanceInMetersHandle, _rangeNotificationTimeInSecondsHandle, _reminderNotificationDistanceInMetersHandle, _reminderNotificationTimeInSecondsHandle, _distanceNotificationDistanceInMetersHandle, _distanceNotificationTimeInSecondsHandle, _actionNotificationDistanceInMetersHandle, _actionNotificationTimeInSecondsHandle, _doubleNotificationDistanceInMetersHandle);
  
  
  
  
  
  
  
  
  
  return _result;
}

ManeuverNotificationTimingOptions sdkNavigationManeuvernotificationtimingoptionsFromFfi(Pointer<Void> handle) {
  final _rangeNotificationDistanceInMetersHandle = _sdkNavigationManeuvernotificationtimingoptionsGetFieldrangeNotificationDistanceInMeters(handle);
  final _rangeNotificationTimeInSecondsHandle = _sdkNavigationManeuvernotificationtimingoptionsGetFieldrangeNotificationTimeInSeconds(handle);
  final _reminderNotificationDistanceInMetersHandle = _sdkNavigationManeuvernotificationtimingoptionsGetFieldreminderNotificationDistanceInMeters(handle);
  final _reminderNotificationTimeInSecondsHandle = _sdkNavigationManeuvernotificationtimingoptionsGetFieldreminderNotificationTimeInSeconds(handle);
  final _distanceNotificationDistanceInMetersHandle = _sdkNavigationManeuvernotificationtimingoptionsGetFielddistanceNotificationDistanceInMeters(handle);
  final _distanceNotificationTimeInSecondsHandle = _sdkNavigationManeuvernotificationtimingoptionsGetFielddistanceNotificationTimeInSeconds(handle);
  final _actionNotificationDistanceInMetersHandle = _sdkNavigationManeuvernotificationtimingoptionsGetFieldactionNotificationDistanceInMeters(handle);
  final _actionNotificationTimeInSecondsHandle = _sdkNavigationManeuvernotificationtimingoptionsGetFieldactionNotificationTimeInSeconds(handle);
  final _doubleNotificationDistanceInMetersHandle = _sdkNavigationManeuvernotificationtimingoptionsGetFielddoubleNotificationDistanceInMeters(handle);
  try {
    return ManeuverNotificationTimingOptions(
      (_rangeNotificationDistanceInMetersHandle), 
      (_rangeNotificationTimeInSecondsHandle), 
      (_reminderNotificationDistanceInMetersHandle), 
      (_reminderNotificationTimeInSecondsHandle), 
      (_distanceNotificationDistanceInMetersHandle), 
      (_distanceNotificationTimeInSecondsHandle), 
      (_actionNotificationDistanceInMetersHandle), 
      (_actionNotificationTimeInSecondsHandle), 
      (_doubleNotificationDistanceInMetersHandle)
    );
  } finally {
    
    
    
    
    
    
    
    
    
  }
}

void sdkNavigationManeuvernotificationtimingoptionsReleaseFfiHandle(Pointer<Void> handle) => _sdkNavigationManeuvernotificationtimingoptionsReleaseHandle(handle);

// Nullable ManeuverNotificationTimingOptions

final _sdkNavigationManeuvernotificationtimingoptionsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_ManeuverNotificationTimingOptions_create_handle_nullable'));
final _sdkNavigationManeuvernotificationtimingoptionsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_ManeuverNotificationTimingOptions_release_handle_nullable'));
final _sdkNavigationManeuvernotificationtimingoptionsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_ManeuverNotificationTimingOptions_get_value_nullable'));

Pointer<Void> sdkNavigationManeuvernotificationtimingoptionsToFfiNullable(ManeuverNotificationTimingOptions? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationManeuvernotificationtimingoptionsToFfi(value);
  final result = _sdkNavigationManeuvernotificationtimingoptionsCreateHandleNullable(_handle);
  sdkNavigationManeuvernotificationtimingoptionsReleaseFfiHandle(_handle);
  return result;
}

ManeuverNotificationTimingOptions? sdkNavigationManeuvernotificationtimingoptionsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationManeuvernotificationtimingoptionsGetValueNullable(handle);
  final result = sdkNavigationManeuvernotificationtimingoptionsFromFfi(_handle);
  sdkNavigationManeuvernotificationtimingoptionsReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationManeuvernotificationtimingoptionsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationManeuvernotificationtimingoptionsReleaseHandleNullable(handle);

// End of ManeuverNotificationTimingOptions "private" section.


