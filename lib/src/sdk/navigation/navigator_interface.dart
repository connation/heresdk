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
import 'package:here_sdk/src/_type_repository.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';
import 'package:here_sdk/src/sdk/core/location.dart';
import 'package:here_sdk/src/sdk/core/location_impl.dart' as location_impl;
import 'package:here_sdk/src/sdk/core/location_listener.dart';
import 'package:here_sdk/src/sdk/core/transport_profile.dart';
import 'package:here_sdk/src/sdk/navigation/border_crossing_warning_listener.dart';
import 'package:here_sdk/src/sdk/navigation/border_crossing_warning_options.dart';
import 'package:here_sdk/src/sdk/navigation/current_situation_lane_assistance_view_listener.dart';
import 'package:here_sdk/src/sdk/navigation/danger_zone_warning_listener.dart';
import 'package:here_sdk/src/sdk/navigation/danger_zone_warning_options.dart';
import 'package:here_sdk/src/sdk/navigation/destination_reached_listener.dart';
import 'package:here_sdk/src/sdk/navigation/environmental_zone_warning_listener.dart';
import 'package:here_sdk/src/sdk/navigation/environmental_zone_warning_options.dart';
import 'package:here_sdk/src/sdk/navigation/event_text_listener.dart';
import 'package:here_sdk/src/sdk/navigation/event_text_options.dart';
import 'package:here_sdk/src/sdk/navigation/junction_view_lane_assistance_listener.dart';
import 'package:here_sdk/src/sdk/navigation/low_speed_zone_warning_listener.dart';
import 'package:here_sdk/src/sdk/navigation/low_speed_zone_warning_options.dart';
import 'package:here_sdk/src/sdk/navigation/maneuver_notification_listener.dart';
import 'package:here_sdk/src/sdk/navigation/maneuver_notification_options.dart';
import 'package:here_sdk/src/sdk/navigation/maneuver_notification_timing_options.dart';
import 'package:here_sdk/src/sdk/navigation/maneuver_view_lane_assistance_listener.dart';
import 'package:here_sdk/src/sdk/navigation/milestone_status_listener.dart';
import 'package:here_sdk/src/sdk/navigation/navigable_location_listener.dart';
import 'package:here_sdk/src/sdk/navigation/off_road_destination_reached_listener.dart';
import 'package:here_sdk/src/sdk/navigation/off_road_progress_listener.dart';
import 'package:here_sdk/src/sdk/navigation/post_action_listener.dart';
import 'package:here_sdk/src/sdk/navigation/railway_crossing_warning_listener.dart';
import 'package:here_sdk/src/sdk/navigation/railway_crossing_warning_options.dart';
import 'package:here_sdk/src/sdk/navigation/realistic_view_warning_listener.dart';
import 'package:here_sdk/src/sdk/navigation/realistic_view_warning_options.dart';
import 'package:here_sdk/src/sdk/navigation/road_attributes_listener.dart';
import 'package:here_sdk/src/sdk/navigation/road_sign_warning_listener.dart';
import 'package:here_sdk/src/sdk/navigation/road_sign_warning_options.dart';
import 'package:here_sdk/src/sdk/navigation/road_texts_listener.dart';
import 'package:here_sdk/src/sdk/navigation/route_deviation_listener.dart';
import 'package:here_sdk/src/sdk/navigation/route_progress_listener.dart';
import 'package:here_sdk/src/sdk/navigation/safety_camera_warning_listener.dart';
import 'package:here_sdk/src/sdk/navigation/safety_camera_warning_options.dart';
import 'package:here_sdk/src/sdk/navigation/school_zone_warning_listener.dart';
import 'package:here_sdk/src/sdk/navigation/school_zone_warning_options.dart';
import 'package:here_sdk/src/sdk/navigation/spatial_maneuver_azimuth_listener.dart';
import 'package:here_sdk/src/sdk/navigation/spatial_maneuver_notification_listener.dart';
import 'package:here_sdk/src/sdk/navigation/speed_limit_listener.dart';
import 'package:here_sdk/src/sdk/navigation/speed_warning_listener.dart';
import 'package:here_sdk/src/sdk/navigation/speed_warning_options.dart';
import 'package:here_sdk/src/sdk/navigation/timing_profile.dart';
import 'package:here_sdk/src/sdk/navigation/toll_stop_warning_listener.dart';
import 'package:here_sdk/src/sdk/navigation/toll_stop_warning_options.dart';
import 'package:here_sdk/src/sdk/navigation/truck_restrictions_warning_listener.dart';
import 'package:here_sdk/src/sdk/navigation/truck_restrictions_warning_options.dart';
import 'package:here_sdk/src/sdk/routing/maneuver.dart';
import 'package:here_sdk/src/sdk/routing/road_type.dart';
import 'package:here_sdk/src/sdk/routing/route.dart';
import 'package:here_sdk/src/sdk/transport/transport_mode.dart';

/// This abstract class provides the basic functionality needed to run a navigation session.
abstract class NavigatorInterface implements LocationListener {
  /// This abstract class provides the basic functionality needed to run a navigation session.

  factory NavigatorInterface(
    void Function(location_impl.Location) onLocationUpdatedLambda,
    Maneuver? Function(int) getManeuverLambda,
    ManeuverNotificationTimingOptions Function(TransportMode, RoadType) getManeuverNotificationTimingOptionsLambda,
    bool Function(TransportMode, RoadType, ManeuverNotificationTimingOptions) setManeuverNotificationTimingOptionsLambda,
    ManeuverNotificationTimingOptions Function(TransportMode, TimingProfile) getManeuverNotificationTimingOptionsWithTimingProfileLambda,
    bool Function(TransportMode, TimingProfile, ManeuverNotificationTimingOptions) setManeuverNotificationTimingOptionsWithTimingProfileLambda,
    void Function() repeatLastManeuverNotificationLambda,
    int? Function(GeoCoordinates) calculateRemainingDistanceInMetersLambda,
    void Function(String, String) setCustomOptionLambda,
    Route? Function() routeGetLambda,
    void Function(Route?) routeSetLambda,
    TransportProfile? Function() trackingTransportProfileGetLambda,
    void Function(TransportProfile?) trackingTransportProfileSetLambda,
    NavigableLocationListener? Function() navigableLocationListenerGetLambda,
    void Function(NavigableLocationListener?) navigableLocationListenerSetLambda,
    RouteProgressListener? Function() routeProgressListenerGetLambda,
    void Function(RouteProgressListener?) routeProgressListenerSetLambda,
    RouteDeviationListener? Function() routeDeviationListenerGetLambda,
    void Function(RouteDeviationListener?) routeDeviationListenerSetLambda,
    ManeuverNotificationListener? Function() maneuverNotificationListenerGetLambda,
    void Function(ManeuverNotificationListener?) maneuverNotificationListenerSetLambda,
    EventTextListener? Function() eventTextListenerGetLambda,
    void Function(EventTextListener?) eventTextListenerSetLambda,
    MilestoneStatusListener? Function() milestoneStatusListenerGetLambda,
    void Function(MilestoneStatusListener?) milestoneStatusListenerSetLambda,
    DestinationReachedListener? Function() destinationReachedListenerGetLambda,
    void Function(DestinationReachedListener?) destinationReachedListenerSetLambda,
    SpeedWarningListener? Function() speedWarningListenerGetLambda,
    void Function(SpeedWarningListener?) speedWarningListenerSetLambda,
    ManeuverViewLaneAssistanceListener? Function() maneuverViewLaneAssistanceListenerGetLambda,
    void Function(ManeuverViewLaneAssistanceListener?) maneuverViewLaneAssistanceListenerSetLambda,
    CurrentSituationLaneAssistanceViewListener? Function() currentSituationLaneAssistanceViewListenerGetLambda,
    void Function(CurrentSituationLaneAssistanceViewListener?) currentSituationLaneAssistanceViewListenerSetLambda,
    EnvironmentalZoneWarningListener? Function() environmentalZoneWarningListenerGetLambda,
    void Function(EnvironmentalZoneWarningListener?) environmentalZoneWarningListenerSetLambda,
    EnvironmentalZoneWarningOptions Function() environmentalZoneWarningOptionsGetLambda,
    void Function(EnvironmentalZoneWarningOptions) environmentalZoneWarningOptionsSetLambda,
    JunctionViewLaneAssistanceListener? Function() junctionViewLaneAssistanceListenerGetLambda,
    void Function(JunctionViewLaneAssistanceListener?) junctionViewLaneAssistanceListenerSetLambda,
    SafetyCameraWarningListener? Function() safetyCameraWarningListenerGetLambda,
    void Function(SafetyCameraWarningListener?) safetyCameraWarningListenerSetLambda,
    SafetyCameraWarningOptions Function() safetyCameraWarningOptionsGetLambda,
    void Function(SafetyCameraWarningOptions) safetyCameraWarningOptionsSetLambda,
    DangerZoneWarningListener? Function() dangerZoneWarningListenerGetLambda,
    void Function(DangerZoneWarningListener?) dangerZoneWarningListenerSetLambda,
    DangerZoneWarningOptions Function() dangerZoneWarningOptionsGetLambda,
    void Function(DangerZoneWarningOptions) dangerZoneWarningOptionsSetLambda,
    TruckRestrictionsWarningListener? Function() truckRestrictionsWarningListenerGetLambda,
    void Function(TruckRestrictionsWarningListener?) truckRestrictionsWarningListenerSetLambda,
    TruckRestrictionsWarningOptions Function() truckRestrictionsWarningOptionsGetLambda,
    void Function(TruckRestrictionsWarningOptions) truckRestrictionsWarningOptionsSetLambda,
    PostActionListener? Function() postActionListenerGetLambda,
    void Function(PostActionListener?) postActionListenerSetLambda,
    SpeedLimitListener? Function() speedLimitListenerGetLambda,
    void Function(SpeedLimitListener?) speedLimitListenerSetLambda,
    RoadTextsListener? Function() roadTextsListenerGetLambda,
    void Function(RoadTextsListener?) roadTextsListenerSetLambda,
    RoadAttributesListener? Function() roadAttributesListenerGetLambda,
    void Function(RoadAttributesListener?) roadAttributesListenerSetLambda,
    SpatialManeuverNotificationListener? Function() spatialManeuverNotificationListenerGetLambda,
    void Function(SpatialManeuverNotificationListener?) spatialManeuverNotificationListenerSetLambda,
    SpatialManeuverAzimuthListener? Function() spatialManeuverAzimuthListenerGetLambda,
    void Function(SpatialManeuverAzimuthListener?) spatialManeuverAzimuthListenerSetLambda,
    RoadSignWarningListener? Function() roadSignWarningListenerGetLambda,
    void Function(RoadSignWarningListener?) roadSignWarningListenerSetLambda,
    RoadSignWarningOptions Function() roadSignWarningOptionsGetLambda,
    void Function(RoadSignWarningOptions) roadSignWarningOptionsSetLambda,
    SchoolZoneWarningListener? Function() schoolZoneWarningListenerGetLambda,
    void Function(SchoolZoneWarningListener?) schoolZoneWarningListenerSetLambda,
    SchoolZoneWarningOptions Function() schoolZoneWarningOptionsGetLambda,
    void Function(SchoolZoneWarningOptions) schoolZoneWarningOptionsSetLambda,
    RealisticViewWarningListener? Function() realisticViewWarningListenerGetLambda,
    void Function(RealisticViewWarningListener?) realisticViewWarningListenerSetLambda,
    RealisticViewWarningOptions Function() realisticViewWarningOptionsGetLambda,
    void Function(RealisticViewWarningOptions) realisticViewWarningOptionsSetLambda,
    BorderCrossingWarningListener? Function() borderCrossingWarningListenerGetLambda,
    void Function(BorderCrossingWarningListener?) borderCrossingWarningListenerSetLambda,
    BorderCrossingWarningOptions Function() borderCrossingWarningOptionsGetLambda,
    void Function(BorderCrossingWarningOptions) borderCrossingWarningOptionsSetLambda,
    TollStopWarningListener? Function() tollStopWarningListenerGetLambda,
    void Function(TollStopWarningListener?) tollStopWarningListenerSetLambda,
    TollStopWarningOptions Function() tollStopWarningOptionsGetLambda,
    void Function(TollStopWarningOptions) tollStopWarningOptionsSetLambda,
    RailwayCrossingWarningListener? Function() railwayCrossingWarningListenerGetLambda,
    void Function(RailwayCrossingWarningListener?) railwayCrossingWarningListenerSetLambda,
    RailwayCrossingWarningOptions Function() railwayCrossingWarningOptionsGetLambda,
    void Function(RailwayCrossingWarningOptions) railwayCrossingWarningOptionsSetLambda,
    LowSpeedZoneWarningListener? Function() lowSpeedZoneWarningListenerGetLambda,
    void Function(LowSpeedZoneWarningListener?) lowSpeedZoneWarningListenerSetLambda,
    LowSpeedZoneWarningOptions Function() lowSpeedZoneWarningOptionsGetLambda,
    void Function(LowSpeedZoneWarningOptions) lowSpeedZoneWarningOptionsSetLambda,
    OffRoadDestinationReachedListener? Function() offRoadDestinationReachedListenerGetLambda,
    void Function(OffRoadDestinationReachedListener?) offRoadDestinationReachedListenerSetLambda,
    OffRoadProgressListener? Function() offRoadProgressListenerGetLambda,
    void Function(OffRoadProgressListener?) offRoadProgressListenerSetLambda,
    ManeuverNotificationOptions Function() maneuverNotificationOptionsGetLambda,
    void Function(ManeuverNotificationOptions) maneuverNotificationOptionsSetLambda,
    EventTextOptions Function() eventTextOptionsGetLambda,
    void Function(EventTextOptions) eventTextOptionsSetLambda,
    SpeedWarningOptions Function() speedWarningOptionsGetLambda,
    void Function(SpeedWarningOptions) speedWarningOptionsSetLambda,
    bool Function() isEnableTunnelExtrapolationGetLambda,
    void Function(bool) isEnableTunnelExtrapolationSetLambda,
    bool Function() isPassthroughWaypointsHandlingEnabledGetLambda,
    void Function(bool) isPassthroughWaypointsHandlingEnabledSetLambda
  ) => NavigatorInterface$Lambdas(
    onLocationUpdatedLambda,
    getManeuverLambda,
    getManeuverNotificationTimingOptionsLambda,
    setManeuverNotificationTimingOptionsLambda,
    getManeuverNotificationTimingOptionsWithTimingProfileLambda,
    setManeuverNotificationTimingOptionsWithTimingProfileLambda,
    repeatLastManeuverNotificationLambda,
    calculateRemainingDistanceInMetersLambda,
    setCustomOptionLambda,
    routeGetLambda,
    routeSetLambda,
    trackingTransportProfileGetLambda,
    trackingTransportProfileSetLambda,
    navigableLocationListenerGetLambda,
    navigableLocationListenerSetLambda,
    routeProgressListenerGetLambda,
    routeProgressListenerSetLambda,
    routeDeviationListenerGetLambda,
    routeDeviationListenerSetLambda,
    maneuverNotificationListenerGetLambda,
    maneuverNotificationListenerSetLambda,
    eventTextListenerGetLambda,
    eventTextListenerSetLambda,
    milestoneStatusListenerGetLambda,
    milestoneStatusListenerSetLambda,
    destinationReachedListenerGetLambda,
    destinationReachedListenerSetLambda,
    speedWarningListenerGetLambda,
    speedWarningListenerSetLambda,
    maneuverViewLaneAssistanceListenerGetLambda,
    maneuverViewLaneAssistanceListenerSetLambda,
    currentSituationLaneAssistanceViewListenerGetLambda,
    currentSituationLaneAssistanceViewListenerSetLambda,
    environmentalZoneWarningListenerGetLambda,
    environmentalZoneWarningListenerSetLambda,
    environmentalZoneWarningOptionsGetLambda,
    environmentalZoneWarningOptionsSetLambda,
    junctionViewLaneAssistanceListenerGetLambda,
    junctionViewLaneAssistanceListenerSetLambda,
    safetyCameraWarningListenerGetLambda,
    safetyCameraWarningListenerSetLambda,
    safetyCameraWarningOptionsGetLambda,
    safetyCameraWarningOptionsSetLambda,
    dangerZoneWarningListenerGetLambda,
    dangerZoneWarningListenerSetLambda,
    dangerZoneWarningOptionsGetLambda,
    dangerZoneWarningOptionsSetLambda,
    truckRestrictionsWarningListenerGetLambda,
    truckRestrictionsWarningListenerSetLambda,
    truckRestrictionsWarningOptionsGetLambda,
    truckRestrictionsWarningOptionsSetLambda,
    postActionListenerGetLambda,
    postActionListenerSetLambda,
    speedLimitListenerGetLambda,
    speedLimitListenerSetLambda,
    roadTextsListenerGetLambda,
    roadTextsListenerSetLambda,
    roadAttributesListenerGetLambda,
    roadAttributesListenerSetLambda,
    spatialManeuverNotificationListenerGetLambda,
    spatialManeuverNotificationListenerSetLambda,
    spatialManeuverAzimuthListenerGetLambda,
    spatialManeuverAzimuthListenerSetLambda,
    roadSignWarningListenerGetLambda,
    roadSignWarningListenerSetLambda,
    roadSignWarningOptionsGetLambda,
    roadSignWarningOptionsSetLambda,
    schoolZoneWarningListenerGetLambda,
    schoolZoneWarningListenerSetLambda,
    schoolZoneWarningOptionsGetLambda,
    schoolZoneWarningOptionsSetLambda,
    realisticViewWarningListenerGetLambda,
    realisticViewWarningListenerSetLambda,
    realisticViewWarningOptionsGetLambda,
    realisticViewWarningOptionsSetLambda,
    borderCrossingWarningListenerGetLambda,
    borderCrossingWarningListenerSetLambda,
    borderCrossingWarningOptionsGetLambda,
    borderCrossingWarningOptionsSetLambda,
    tollStopWarningListenerGetLambda,
    tollStopWarningListenerSetLambda,
    tollStopWarningOptionsGetLambda,
    tollStopWarningOptionsSetLambda,
    railwayCrossingWarningListenerGetLambda,
    railwayCrossingWarningListenerSetLambda,
    railwayCrossingWarningOptionsGetLambda,
    railwayCrossingWarningOptionsSetLambda,
    lowSpeedZoneWarningListenerGetLambda,
    lowSpeedZoneWarningListenerSetLambda,
    lowSpeedZoneWarningOptionsGetLambda,
    lowSpeedZoneWarningOptionsSetLambda,
    offRoadDestinationReachedListenerGetLambda,
    offRoadDestinationReachedListenerSetLambda,
    offRoadProgressListenerGetLambda,
    offRoadProgressListenerSetLambda,
    maneuverNotificationOptionsGetLambda,
    maneuverNotificationOptionsSetLambda,
    eventTextOptionsGetLambda,
    eventTextOptionsSetLambda,
    speedWarningOptionsGetLambda,
    speedWarningOptionsSetLambda,
    isEnableTunnelExtrapolationGetLambda,
    isEnableTunnelExtrapolationSetLambda,
    isPassthroughWaypointsHandlingEnabledGetLambda,
    isPassthroughWaypointsHandlingEnabledSetLambda
  );

  /// Returns maneuver at the given index.
  ///
  /// [index] The index of maneuver requested.
  ///
  /// Returns [Maneuver?]. The maneuver if it exists or otherwise `null`.
  ///
  Maneuver? getManeuver(int index);
  /// Returns maneuver notification timing options with default values given the combination of transport mode and road type.
  ///
  /// The return value can be used as the base for configuring maneuver notification timings. Configure the relevant attributes
  /// of this object according to your preferences, and then set it by calling `setManeuverNotificationTimingOptions()` function
  /// for the same combination of transport mode and road type.
  ///
  /// [transportMode] The transport mode of the timing options.
  ///
  /// [roadType] The road type of the timing options.
  ///
  /// Returns [ManeuverNotificationTimingOptions]. The timing options with default values.
  ///
  @Deprecated("Will be removed in v4.22.0. Use the `getManeuverNotificationTimingOptions()` function with [TimingProfile] parameter instead.")

  ManeuverNotificationTimingOptions getManeuverNotificationTimingOptions(TransportMode transportMode, RoadType roadType);
  /// Set timing option values for the combination of transport mode and road type.
  ///
  /// [transportMode] The transport mode of the timing options.
  ///
  /// [roadType] The road type of the timing options.
  ///
  /// [options] The timing options.
  ///
  /// Returns [bool]. True if set successfully, false when options has invalid value, see [ManeuverNotificationTimingOptions] for more details about options.
  ///
  @Deprecated("Will be removed in v4.22.0. Use the `setManeuverNotificationTimingOptions()` function with [TimingProfile] parameter instead.")

  bool setManeuverNotificationTimingOptions(TransportMode transportMode, RoadType roadType, ManeuverNotificationTimingOptions options);
  /// Returns maneuver notification timing options with default values given the combination of transport mode and timing profile.
  ///
  /// The return value can be used as the base for configuring maneuver notification timings. Configure the relevant attributes
  /// of this object according to your preferences, and then set it by calling setManeuverNotificationTimingOptions function
  /// for the same combination of transport mode and timing profile.
  ///
  /// [transportMode] The transport mode of the timing options.
  ///
  /// [timingProfile] The timing profile of the timing options.
  ///
  /// Returns [ManeuverNotificationTimingOptions]. The timing options with default values.
  ///
  ManeuverNotificationTimingOptions getManeuverNotificationTimingOptionsWithTimingProfile(TransportMode transportMode, TimingProfile timingProfile);
  /// Set timing option values for the combination of transport mode and timing profile.
  ///
  /// [transportMode] The transport mode of the timing options.
  ///
  /// [timingProfile] The timing profile of the timing options.
  ///
  /// [options] The timing options.
  ///
  /// Returns [bool]. True if set successfully, false when options has invalid value, see [ManeuverNotificationTimingOptions] for
  /// more details about options.
  ///
  bool setManeuverNotificationTimingOptionsWithTimingProfile(TransportMode transportMode, TimingProfile timingProfile, ManeuverNotificationTimingOptions options);
  /// Call of this function is used to trigger the navigator to repeat the last maneuver notification based on the current position.
  ///
  void repeatLastManeuverNotification();
  /// This method calculates the distance between the current position and given coordinates.
  ///
  /// The coordinates must be on the polyline.
  ///
  /// [coordinates] The geographic coordinates of the location.
  ///
  /// Returns [int?]. distance in meters or null if given coordinates are not on route or given
  /// coordinates were already traversed.
  ///
  int? calculateRemainingDistanceInMeters(GeoCoordinates coordinates);
  /// This method sets custom options that controls navigator behavior.
  ///
  /// Unsupported options are silently ignored.
  /// Undocumented options can change their meaning without going through deprecation process.
  ///
  /// [key] Option name
  ///
  /// [value] New option value
  ///
  void setCustomOption(String key, String value);
  /// Gets the route that is being navigated.
  Route? get route;
  /// Sets the route to navigate. If not set, only the current location information will be
  /// provided through [NavigableLocationListener].
  /// If set, both route progress ([RouteProgressListener]) and route deviation
  /// ([RouteDeviationListener]) will receive notifications on updates.
  set route(Route? value);

  /// Gets the transport profile for the [Navigator], when no route is present.
  TransportProfile? get trackingTransportProfile;
  /// Sets the transport profile for the [Navigator], when no route is present.
  /// Properly setting the transport profile optimizes the navigation experience, and improves resource consumption.
  /// For example, a [TransportProfile] can be defined with a [VehicleProfile].
  /// A vehicle profile can have several parameters such as [VehicleType] to set the
  /// source of information describing the vehicle.
  ///
  /// **Note:**
  /// Currently used members of [TransportProfile]
  /// - [VehicleType]: Sets the transport mode.
  /// - From `vehicleProfile`:
  ///   - `grossWeightInKilograms`: Required for truck related speed information.
  ///   - `heightInCentimeters`: Required for truck related speed information.
  ///   - `widthInCentimeters`: Additional truck definition for more specific truck speed information.
  ///   - `lengthInCentimeters`: Additional truck definition for more specific truck speed information.
  set trackingTransportProfile(TransportProfile? value);

  /// Gets the listener that notifies current location updates.
  /// It returns `null` when no listener is set by an user.
  NavigableLocationListener? get navigableLocationListener;
  /// Sets the listener that notifies current location updates.
  set navigableLocationListener(NavigableLocationListener? value);

  /// Gets the listener that notifies when a route progress change occurs.
  /// It returns `null` when no listener is set by an user.
  RouteProgressListener? get routeProgressListener;
  /// Sets the listener that notifies when a route progress change occurs.
  set routeProgressListener(RouteProgressListener? value);

  /// Gets the listener that notifies when deviation from the route is observed.
  /// It returns `null` when no listener is set by an user.
  RouteDeviationListener? get routeDeviationListener;
  /// Sets the listener that notifies when deviation from the route is observed.
  set routeDeviationListener(RouteDeviationListener? value);

  /// Gets the listener that notifies when a maneuver notification is available.
  /// It returns `null` when no listener is set by an user.
  @Deprecated("Will be removed in v4.20.0. Use [NavigatorInterface.eventTextListener] property instead.")
  ManeuverNotificationListener? get maneuverNotificationListener;
  /// Sets the listener that notifies when a maneuver notification is available.
  @Deprecated("Will be removed in v4.20.0. Use [NavigatorInterface.eventTextListener] property instead.")
  set maneuverNotificationListener(ManeuverNotificationListener? value);

  /// Gets the listener that notifies when a text notification is available.
  /// It returns `null` when no listener is set by an user.
  EventTextListener? get eventTextListener;
  /// Sets the listener that notifies when a text notification is available.
  set eventTextListener(EventTextListener? value);

  /// Gets the listener that notifies when a [Milestone] has been reached or missed.
  /// It returns `null` when no listener is set by an user.
  MilestoneStatusListener? get milestoneStatusListener;
  /// Sets the listener that notifies when a [Milestone] has been reached or missed.
  set milestoneStatusListener(MilestoneStatusListener? value);

  /// Gets the listener that notify when the destination has been reached.
  /// It returns `null` when no listener is set by an user.
  DestinationReachedListener? get destinationReachedListener;
  /// Sets the listener that notify when the destination has been reached.
  set destinationReachedListener(DestinationReachedListener? value);

  /// Gets the listener to receive notifications
  /// when a speed limit on a road is exceeded or driving speed is restored back to normal.
  /// It returns `null` when no listener is set by an user.
  SpeedWarningListener? get speedWarningListener;
  /// Sets the listener to receive notifications
  /// when a speed limit on a road is exceeded or driving speed is restored back to normal.
  set speedWarningListener(SpeedWarningListener? value);

  /// Gets the listener  to receive maneuver view lane assistance notifications.
  /// It returns `null` when no listener is set by an user.
  ManeuverViewLaneAssistanceListener? get maneuverViewLaneAssistanceListener;
  /// Sets the listener  to receive maneuver view lane assistance notifications.
  set maneuverViewLaneAssistanceListener(ManeuverViewLaneAssistanceListener? value);

  /// Gets the listener  to receive current situation lane assistance view notifications.
  /// It returns `null` when no listener is set by an user.
  CurrentSituationLaneAssistanceViewListener? get currentSituationLaneAssistanceViewListener;
  /// Sets the listener  to receive current situation lane assistance view notifications.
  set currentSituationLaneAssistanceViewListener(CurrentSituationLaneAssistanceViewListener? value);

  /// Gets the listener to receive current environmental zones notifications.
  /// It returns `null` when no listener is set by an user.
  EnvironmentalZoneWarningListener? get environmentalZoneWarningListener;
  /// Sets the listener to receive current environmental zones notifications.
  set environmentalZoneWarningListener(EnvironmentalZoneWarningListener? value);

  /// Gets environmental zone warning options that allow to filter environmental zone to be
  /// passed to [EnvironmentalZoneWarningListener].
  EnvironmentalZoneWarningOptions get environmentalZoneWarningOptions;
  /// Sets environmental zone warning options that allow to filter environmental zone to be
  /// passed to [EnvironmentalZoneWarningListener].
  set environmentalZoneWarningOptions(EnvironmentalZoneWarningOptions value);

  /// Gets the listener  to receive junction view lane assistance notifications.
  /// It returns `null` when no listener is set by an user.
  JunctionViewLaneAssistanceListener? get junctionViewLaneAssistanceListener;
  /// Sets the listener  to receive junction view lane assistance notifications.
  set junctionViewLaneAssistanceListener(JunctionViewLaneAssistanceListener? value);

  /// Gets the listener  to receive safety camera warning notifications.
  /// It returns `null` when no listener is set by an user.
  SafetyCameraWarningListener? get safetyCameraWarningListener;
  /// Sets the listener  to receive safety camera warning notifications.
  set safetyCameraWarningListener(SafetyCameraWarningListener? value);

  /// Gets safety camera warning options to be passed to [SafetyCameraWarningListener].
  SafetyCameraWarningOptions get safetyCameraWarningOptions;
  /// Sets safety camera warning options to be passed to [SafetyCameraWarningListener].
  set safetyCameraWarningOptions(SafetyCameraWarningOptions value);

  /// Gets the listener to receive current danger zones notifications.
  /// It returns `null` when no listener is set by an user.
  DangerZoneWarningListener? get dangerZoneWarningListener;
  /// Sets the listener to receive current danger zones notifications.
  set dangerZoneWarningListener(DangerZoneWarningListener? value);

  /// Gets danger zone warning options that allow to filter danger zone to be
  /// passed to [DangerZoneWarningListener].
  DangerZoneWarningOptions get dangerZoneWarningOptions;
  /// Sets danger zone warning options that allow to filter danger zone to be
  /// passed to [DangerZoneWarningListener].
  set dangerZoneWarningOptions(DangerZoneWarningOptions value);

  /// Gets the listener  to receive notifications about
  /// truck restrictions on the current road.
  /// It returns `null` when no listener is set by an user.
  TruckRestrictionsWarningListener? get truckRestrictionsWarningListener;
  /// Sets the listener  to receive notifications about
  /// truck restrictions on the current road.
  set truckRestrictionsWarningListener(TruckRestrictionsWarningListener? value);

  /// Gets truck restrictions warning options that allow to filter truck restrictions to be
  /// passed to [TruckRestrictionsWarningListener].
  TruckRestrictionsWarningOptions get truckRestrictionsWarningOptions;
  /// Sets truck restrictions warning options that allow to filter truck restrictions to be
  /// passed to [TruckRestrictionsWarningListener].
  set truckRestrictionsWarningOptions(TruckRestrictionsWarningOptions value);

  /// Gets the listener  to receive post action
  /// notifications, such as a charge action at a charging station.
  /// It returns `null` when no listener is set by an user.
  PostActionListener? get postActionListener;
  /// Sets the listener  to receive post action
  /// notifications, such as a charge action at a charging station.
  set postActionListener(PostActionListener? value);

  /// Gets the listener  to receive notifications about
  /// the speed limit of the current road.
  /// It returns `null` when no listener is set by an user.
  SpeedLimitListener? get speedLimitListener;
  /// Sets the listener  to receive notifications about
  /// the speed limit of the current road.
  set speedLimitListener(SpeedLimitListener? value);

  /// Gets the listener  to receive notifications about
  /// the textual attributes of the current road.
  /// It returns `null` when no listener is set by an user.
  RoadTextsListener? get roadTextsListener;
  /// Sets the listener  to receive notifications about
  /// the textual attributes of the current road.
  set roadTextsListener(RoadTextsListener? value);

  /// Gets the listener  to receive notifications about
  /// attributes of the current road.
  /// It returns `null` when no listener is set by an user.
  RoadAttributesListener? get roadAttributesListener;
  /// Sets the listener  to receive notifications about
  /// attributes of the current road.
  set roadAttributesListener(RoadAttributesListener? value);

  /// Gets the listener that notifies when a spatial maneuver notification is available.
  SpatialManeuverNotificationListener? get spatialManeuverNotificationListener;
  /// Sets the listener that notifies when a spatial maneuver notification is available.
  set spatialManeuverNotificationListener(SpatialManeuverNotificationListener? value);

  /// Gets the listener to receive notifications about
  /// the following spatial audio trajectory.
  SpatialManeuverAzimuthListener? get spatialManeuverAzimuthListener;
  /// Sets the listener to receive notifications about
  /// the following spatial audio trajectory.
  set spatialManeuverAzimuthListener(SpatialManeuverAzimuthListener? value);

  /// Gets the listener to receive notifications about
  /// road signs on the current road.
  /// It returns `null` when no listener is set by an user.
  RoadSignWarningListener? get roadSignWarningListener;
  /// Sets the listener to receive notifications about
  /// road signs on the current road.
  set roadSignWarningListener(RoadSignWarningListener? value);

  /// Gets road sign warning options that allow to filter road signs to be passed to [RoadSignWarningListener].
  RoadSignWarningOptions get roadSignWarningOptions;
  /// Sets road sign warning options that allow to filter road signs to be passed to [RoadSignWarningListener].
  set roadSignWarningOptions(RoadSignWarningOptions value);

  /// Gets the listener to receive notifications about
  /// school zones on the current road.
  /// It returns `null` when no listener is set by an user.
  SchoolZoneWarningListener? get schoolZoneWarningListener;
  /// Sets the listener to receive notifications about
  /// school zones on the current road.
  set schoolZoneWarningListener(SchoolZoneWarningListener? value);

  /// Gets school zone warning options that allow to configure school zone notifications to be
  /// passed to [SchoolZoneWarningListener].
  SchoolZoneWarningOptions get schoolZoneWarningOptions;
  /// Sets school zone warning options that allow to configure school zone notifications to be
  /// passed to [SchoolZoneWarningListener].
  ///
  /// **Note:** This is a alpha release of this feature, so there could be a few bugs and unexpected
  /// behaviors. Related APIs may change for new releases without a deprecation process.
  set schoolZoneWarningOptions(SchoolZoneWarningOptions value);

  /// Gets the listener to receive notifications about
  /// junction views on the current road.
  /// It returns `null` when no listener is set by an user.
  RealisticViewWarningListener? get realisticViewWarningListener;
  /// Sets the listener to receive notifications about
  /// junction views on the current road.
  ///
  /// **Note:**
  /// - This feature requires a map version greater or equal to 67 in order to function properly.
  /// - This is a beta release of this feature, so there could be a few bugs and unexpected
  ///   behaviors. Related APIs may change for new releases without a deprecation process.
  set realisticViewWarningListener(RealisticViewWarningListener? value);

  /// Gets realistic view warning options that allow to filter realistic views to be passed to
  /// [RealisticViewWarningListener].
  RealisticViewWarningOptions get realisticViewWarningOptions;
  /// Sets realistic view warning options that allow to filter realistic views to be passed to
  /// [RealisticViewWarningListener].
  ///
  /// **Note:**
  /// - This feature requires a map version greater or equal to 67 in order to function properly.
  /// - This is a beta release of this feature, so there could be a few bugs and unexpected
  ///   behaviors. Related APIs may change for new releases without a deprecation process.
  set realisticViewWarningOptions(RealisticViewWarningOptions value);

  /// Gets the listener to receive notifications about
  /// border crossings on the current road.
  /// It returns `null` when no listener is set by an user.
  BorderCrossingWarningListener? get borderCrossingWarningListener;
  /// Sets the listener to receive notifications about
  /// border crossings on the current road.
  set borderCrossingWarningListener(BorderCrossingWarningListener? value);

  /// Gets border crossing warning options to be passed to [BorderCrossingWarningListener].
  BorderCrossingWarningOptions get borderCrossingWarningOptions;
  /// Sets border crossing warning options to be passed to [BorderCrossingWarningListener].
  set borderCrossingWarningOptions(BorderCrossingWarningOptions value);

  /// Gets the listener to receive notifications about
  /// the the upcoming toll stop.
  TollStopWarningListener? get tollStopWarningListener;
  /// Sets the listener to receive notifications about
  /// the upcoming toll stop.
  ///
  /// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected
  /// behaviors. Related APIs may change for new releases without a deprecation process.
  set tollStopWarningListener(TollStopWarningListener? value);

  /// Gets toll stop warning options to be passed to [TollStopWarningListener].
  TollStopWarningOptions get tollStopWarningOptions;
  /// Sets toll stop warning options to be passed to [TollStopWarningListener].
  set tollStopWarningOptions(TollStopWarningOptions value);

  /// Gets the listener to receive notifications about
  /// railway crossings on the current road.
  /// It returns `null` when no listener is set by an user.
  RailwayCrossingWarningListener? get railwayCrossingWarningListener;
  /// Sets the listener to receive notifications about
  /// railway crossings on the current road.
  set railwayCrossingWarningListener(RailwayCrossingWarningListener? value);

  /// Gets railway crossing warning options to be passed to [RailwayCrossingWarningListener].
  RailwayCrossingWarningOptions get railwayCrossingWarningOptions;
  /// Sets railway crossing warning options to be passed to [RailwayCrossingWarningListener].
  set railwayCrossingWarningOptions(RailwayCrossingWarningOptions value);

  /// Gets the listener to receive notifications about
  /// low speed zones on the current road.
  /// It returns `null` when no listener is set by an user.
  LowSpeedZoneWarningListener? get lowSpeedZoneWarningListener;
  /// Sets the listener to receive notifications about
  /// low speed zones on the current road.
  set lowSpeedZoneWarningListener(LowSpeedZoneWarningListener? value);

  /// Gets low speed zone warning options to be passed to [LowSpeedZoneWarningListener].
  LowSpeedZoneWarningOptions get lowSpeedZoneWarningOptions;
  /// Sets low speed zone warning options to be passed to [LowSpeedZoneWarningListener].
  set lowSpeedZoneWarningOptions(LowSpeedZoneWarningOptions value);

  /// Gets the listener that notifies when the off-road destination has
  /// been reached.
  /// It returns `null` when no listener is set by an user.
  OffRoadDestinationReachedListener? get offRoadDestinationReachedListener;
  /// Sets the listener that notifies when the off-road destination has
  /// been reached.
  set offRoadDestinationReachedListener(OffRoadDestinationReachedListener? value);

  /// Gets the listener that notifies about off-road progress.
  /// It returns `null` when no listener is set by an user.
  OffRoadProgressListener? get offRoadProgressListener;
  /// Sets the listener that notifies about off-road progress.
  set offRoadProgressListener(OffRoadProgressListener? value);

  /// Gets the maneuver notification options.
  ManeuverNotificationOptions get maneuverNotificationOptions;
  /// Sets the maneuver notification options.
  set maneuverNotificationOptions(ManeuverNotificationOptions value);

  /// Gets the text notification options.
  EventTextOptions get eventTextOptions;
  /// Sets the text notification options.
  set eventTextOptions(EventTextOptions value);

  /// Gets the speed warning options.
  SpeedWarningOptions get speedWarningOptions;
  /// Sets the speed warning options.
  set speedWarningOptions(SpeedWarningOptions value);

  /// Return true if tunnel extrapolation is enabled otherwise false.
  bool get isEnableTunnelExtrapolation;
  /// Set to true to enable tunnel extrapolation, set to false to disable tunnel extrapolation.
  /// By default the tunnel extrapolation is enabled.
  set isEnableTunnelExtrapolation(bool value);

  /// Return true if handling of passthrough waypoints is enabled, otherwise - false.
  bool get isPassthroughWaypointsHandlingEnabled;
  /// Set to true enables handling of passthrough waypoints, set to false disables handling of passthrough waypoints.
  set isPassthroughWaypointsHandlingEnabled(bool value);

}


// NavigatorInterface "private" section, not exported.

final _sdkNavigationNavigatorinterfaceRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_navigation_NavigatorInterface_register_finalizer'));
final _sdkNavigationNavigatorinterfaceCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_NavigatorInterface_copy_handle'));
final _sdkNavigationNavigatorinterfaceReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_NavigatorInterface_release_handle'));
final _sdkNavigationNavigatorinterfaceCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer)
  >('here_sdk_sdk_navigation_NavigatorInterface_create_proxy'));
final _sdkNavigationNavigatorinterfaceGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_NavigatorInterface_get_type_id'));









class NavigatorInterface$Lambdas implements NavigatorInterface {
  void Function(location_impl.Location) onLocationUpdatedLambda;
  Maneuver? Function(int) getManeuverLambda;
  ManeuverNotificationTimingOptions Function(TransportMode, RoadType) getManeuverNotificationTimingOptionsLambda;
  bool Function(TransportMode, RoadType, ManeuverNotificationTimingOptions) setManeuverNotificationTimingOptionsLambda;
  ManeuverNotificationTimingOptions Function(TransportMode, TimingProfile) getManeuverNotificationTimingOptionsWithTimingProfileLambda;
  bool Function(TransportMode, TimingProfile, ManeuverNotificationTimingOptions) setManeuverNotificationTimingOptionsWithTimingProfileLambda;
  void Function() repeatLastManeuverNotificationLambda;
  int? Function(GeoCoordinates) calculateRemainingDistanceInMetersLambda;
  void Function(String, String) setCustomOptionLambda;
  Route? Function() routeGetLambda;
  void Function(Route?) routeSetLambda;
  TransportProfile? Function() trackingTransportProfileGetLambda;
  void Function(TransportProfile?) trackingTransportProfileSetLambda;
  NavigableLocationListener? Function() navigableLocationListenerGetLambda;
  void Function(NavigableLocationListener?) navigableLocationListenerSetLambda;
  RouteProgressListener? Function() routeProgressListenerGetLambda;
  void Function(RouteProgressListener?) routeProgressListenerSetLambda;
  RouteDeviationListener? Function() routeDeviationListenerGetLambda;
  void Function(RouteDeviationListener?) routeDeviationListenerSetLambda;
  ManeuverNotificationListener? Function() maneuverNotificationListenerGetLambda;
  void Function(ManeuverNotificationListener?) maneuverNotificationListenerSetLambda;
  EventTextListener? Function() eventTextListenerGetLambda;
  void Function(EventTextListener?) eventTextListenerSetLambda;
  MilestoneStatusListener? Function() milestoneStatusListenerGetLambda;
  void Function(MilestoneStatusListener?) milestoneStatusListenerSetLambda;
  DestinationReachedListener? Function() destinationReachedListenerGetLambda;
  void Function(DestinationReachedListener?) destinationReachedListenerSetLambda;
  SpeedWarningListener? Function() speedWarningListenerGetLambda;
  void Function(SpeedWarningListener?) speedWarningListenerSetLambda;
  ManeuverViewLaneAssistanceListener? Function() maneuverViewLaneAssistanceListenerGetLambda;
  void Function(ManeuverViewLaneAssistanceListener?) maneuverViewLaneAssistanceListenerSetLambda;
  CurrentSituationLaneAssistanceViewListener? Function() currentSituationLaneAssistanceViewListenerGetLambda;
  void Function(CurrentSituationLaneAssistanceViewListener?) currentSituationLaneAssistanceViewListenerSetLambda;
  EnvironmentalZoneWarningListener? Function() environmentalZoneWarningListenerGetLambda;
  void Function(EnvironmentalZoneWarningListener?) environmentalZoneWarningListenerSetLambda;
  EnvironmentalZoneWarningOptions Function() environmentalZoneWarningOptionsGetLambda;
  void Function(EnvironmentalZoneWarningOptions) environmentalZoneWarningOptionsSetLambda;
  JunctionViewLaneAssistanceListener? Function() junctionViewLaneAssistanceListenerGetLambda;
  void Function(JunctionViewLaneAssistanceListener?) junctionViewLaneAssistanceListenerSetLambda;
  SafetyCameraWarningListener? Function() safetyCameraWarningListenerGetLambda;
  void Function(SafetyCameraWarningListener?) safetyCameraWarningListenerSetLambda;
  SafetyCameraWarningOptions Function() safetyCameraWarningOptionsGetLambda;
  void Function(SafetyCameraWarningOptions) safetyCameraWarningOptionsSetLambda;
  DangerZoneWarningListener? Function() dangerZoneWarningListenerGetLambda;
  void Function(DangerZoneWarningListener?) dangerZoneWarningListenerSetLambda;
  DangerZoneWarningOptions Function() dangerZoneWarningOptionsGetLambda;
  void Function(DangerZoneWarningOptions) dangerZoneWarningOptionsSetLambda;
  TruckRestrictionsWarningListener? Function() truckRestrictionsWarningListenerGetLambda;
  void Function(TruckRestrictionsWarningListener?) truckRestrictionsWarningListenerSetLambda;
  TruckRestrictionsWarningOptions Function() truckRestrictionsWarningOptionsGetLambda;
  void Function(TruckRestrictionsWarningOptions) truckRestrictionsWarningOptionsSetLambda;
  PostActionListener? Function() postActionListenerGetLambda;
  void Function(PostActionListener?) postActionListenerSetLambda;
  SpeedLimitListener? Function() speedLimitListenerGetLambda;
  void Function(SpeedLimitListener?) speedLimitListenerSetLambda;
  RoadTextsListener? Function() roadTextsListenerGetLambda;
  void Function(RoadTextsListener?) roadTextsListenerSetLambda;
  RoadAttributesListener? Function() roadAttributesListenerGetLambda;
  void Function(RoadAttributesListener?) roadAttributesListenerSetLambda;
  SpatialManeuverNotificationListener? Function() spatialManeuverNotificationListenerGetLambda;
  void Function(SpatialManeuverNotificationListener?) spatialManeuverNotificationListenerSetLambda;
  SpatialManeuverAzimuthListener? Function() spatialManeuverAzimuthListenerGetLambda;
  void Function(SpatialManeuverAzimuthListener?) spatialManeuverAzimuthListenerSetLambda;
  RoadSignWarningListener? Function() roadSignWarningListenerGetLambda;
  void Function(RoadSignWarningListener?) roadSignWarningListenerSetLambda;
  RoadSignWarningOptions Function() roadSignWarningOptionsGetLambda;
  void Function(RoadSignWarningOptions) roadSignWarningOptionsSetLambda;
  SchoolZoneWarningListener? Function() schoolZoneWarningListenerGetLambda;
  void Function(SchoolZoneWarningListener?) schoolZoneWarningListenerSetLambda;
  SchoolZoneWarningOptions Function() schoolZoneWarningOptionsGetLambda;
  void Function(SchoolZoneWarningOptions) schoolZoneWarningOptionsSetLambda;
  RealisticViewWarningListener? Function() realisticViewWarningListenerGetLambda;
  void Function(RealisticViewWarningListener?) realisticViewWarningListenerSetLambda;
  RealisticViewWarningOptions Function() realisticViewWarningOptionsGetLambda;
  void Function(RealisticViewWarningOptions) realisticViewWarningOptionsSetLambda;
  BorderCrossingWarningListener? Function() borderCrossingWarningListenerGetLambda;
  void Function(BorderCrossingWarningListener?) borderCrossingWarningListenerSetLambda;
  BorderCrossingWarningOptions Function() borderCrossingWarningOptionsGetLambda;
  void Function(BorderCrossingWarningOptions) borderCrossingWarningOptionsSetLambda;
  TollStopWarningListener? Function() tollStopWarningListenerGetLambda;
  void Function(TollStopWarningListener?) tollStopWarningListenerSetLambda;
  TollStopWarningOptions Function() tollStopWarningOptionsGetLambda;
  void Function(TollStopWarningOptions) tollStopWarningOptionsSetLambda;
  RailwayCrossingWarningListener? Function() railwayCrossingWarningListenerGetLambda;
  void Function(RailwayCrossingWarningListener?) railwayCrossingWarningListenerSetLambda;
  RailwayCrossingWarningOptions Function() railwayCrossingWarningOptionsGetLambda;
  void Function(RailwayCrossingWarningOptions) railwayCrossingWarningOptionsSetLambda;
  LowSpeedZoneWarningListener? Function() lowSpeedZoneWarningListenerGetLambda;
  void Function(LowSpeedZoneWarningListener?) lowSpeedZoneWarningListenerSetLambda;
  LowSpeedZoneWarningOptions Function() lowSpeedZoneWarningOptionsGetLambda;
  void Function(LowSpeedZoneWarningOptions) lowSpeedZoneWarningOptionsSetLambda;
  OffRoadDestinationReachedListener? Function() offRoadDestinationReachedListenerGetLambda;
  void Function(OffRoadDestinationReachedListener?) offRoadDestinationReachedListenerSetLambda;
  OffRoadProgressListener? Function() offRoadProgressListenerGetLambda;
  void Function(OffRoadProgressListener?) offRoadProgressListenerSetLambda;
  ManeuverNotificationOptions Function() maneuverNotificationOptionsGetLambda;
  void Function(ManeuverNotificationOptions) maneuverNotificationOptionsSetLambda;
  EventTextOptions Function() eventTextOptionsGetLambda;
  void Function(EventTextOptions) eventTextOptionsSetLambda;
  SpeedWarningOptions Function() speedWarningOptionsGetLambda;
  void Function(SpeedWarningOptions) speedWarningOptionsSetLambda;
  bool Function() isEnableTunnelExtrapolationGetLambda;
  void Function(bool) isEnableTunnelExtrapolationSetLambda;
  bool Function() isPassthroughWaypointsHandlingEnabledGetLambda;
  void Function(bool) isPassthroughWaypointsHandlingEnabledSetLambda;

  NavigatorInterface$Lambdas(
    this.onLocationUpdatedLambda,
    this.getManeuverLambda,
    this.getManeuverNotificationTimingOptionsLambda,
    this.setManeuverNotificationTimingOptionsLambda,
    this.getManeuverNotificationTimingOptionsWithTimingProfileLambda,
    this.setManeuverNotificationTimingOptionsWithTimingProfileLambda,
    this.repeatLastManeuverNotificationLambda,
    this.calculateRemainingDistanceInMetersLambda,
    this.setCustomOptionLambda,
    this.routeGetLambda,
    this.routeSetLambda,
    this.trackingTransportProfileGetLambda,
    this.trackingTransportProfileSetLambda,
    this.navigableLocationListenerGetLambda,
    this.navigableLocationListenerSetLambda,
    this.routeProgressListenerGetLambda,
    this.routeProgressListenerSetLambda,
    this.routeDeviationListenerGetLambda,
    this.routeDeviationListenerSetLambda,
    this.maneuverNotificationListenerGetLambda,
    this.maneuverNotificationListenerSetLambda,
    this.eventTextListenerGetLambda,
    this.eventTextListenerSetLambda,
    this.milestoneStatusListenerGetLambda,
    this.milestoneStatusListenerSetLambda,
    this.destinationReachedListenerGetLambda,
    this.destinationReachedListenerSetLambda,
    this.speedWarningListenerGetLambda,
    this.speedWarningListenerSetLambda,
    this.maneuverViewLaneAssistanceListenerGetLambda,
    this.maneuverViewLaneAssistanceListenerSetLambda,
    this.currentSituationLaneAssistanceViewListenerGetLambda,
    this.currentSituationLaneAssistanceViewListenerSetLambda,
    this.environmentalZoneWarningListenerGetLambda,
    this.environmentalZoneWarningListenerSetLambda,
    this.environmentalZoneWarningOptionsGetLambda,
    this.environmentalZoneWarningOptionsSetLambda,
    this.junctionViewLaneAssistanceListenerGetLambda,
    this.junctionViewLaneAssistanceListenerSetLambda,
    this.safetyCameraWarningListenerGetLambda,
    this.safetyCameraWarningListenerSetLambda,
    this.safetyCameraWarningOptionsGetLambda,
    this.safetyCameraWarningOptionsSetLambda,
    this.dangerZoneWarningListenerGetLambda,
    this.dangerZoneWarningListenerSetLambda,
    this.dangerZoneWarningOptionsGetLambda,
    this.dangerZoneWarningOptionsSetLambda,
    this.truckRestrictionsWarningListenerGetLambda,
    this.truckRestrictionsWarningListenerSetLambda,
    this.truckRestrictionsWarningOptionsGetLambda,
    this.truckRestrictionsWarningOptionsSetLambda,
    this.postActionListenerGetLambda,
    this.postActionListenerSetLambda,
    this.speedLimitListenerGetLambda,
    this.speedLimitListenerSetLambda,
    this.roadTextsListenerGetLambda,
    this.roadTextsListenerSetLambda,
    this.roadAttributesListenerGetLambda,
    this.roadAttributesListenerSetLambda,
    this.spatialManeuverNotificationListenerGetLambda,
    this.spatialManeuverNotificationListenerSetLambda,
    this.spatialManeuverAzimuthListenerGetLambda,
    this.spatialManeuverAzimuthListenerSetLambda,
    this.roadSignWarningListenerGetLambda,
    this.roadSignWarningListenerSetLambda,
    this.roadSignWarningOptionsGetLambda,
    this.roadSignWarningOptionsSetLambda,
    this.schoolZoneWarningListenerGetLambda,
    this.schoolZoneWarningListenerSetLambda,
    this.schoolZoneWarningOptionsGetLambda,
    this.schoolZoneWarningOptionsSetLambda,
    this.realisticViewWarningListenerGetLambda,
    this.realisticViewWarningListenerSetLambda,
    this.realisticViewWarningOptionsGetLambda,
    this.realisticViewWarningOptionsSetLambda,
    this.borderCrossingWarningListenerGetLambda,
    this.borderCrossingWarningListenerSetLambda,
    this.borderCrossingWarningOptionsGetLambda,
    this.borderCrossingWarningOptionsSetLambda,
    this.tollStopWarningListenerGetLambda,
    this.tollStopWarningListenerSetLambda,
    this.tollStopWarningOptionsGetLambda,
    this.tollStopWarningOptionsSetLambda,
    this.railwayCrossingWarningListenerGetLambda,
    this.railwayCrossingWarningListenerSetLambda,
    this.railwayCrossingWarningOptionsGetLambda,
    this.railwayCrossingWarningOptionsSetLambda,
    this.lowSpeedZoneWarningListenerGetLambda,
    this.lowSpeedZoneWarningListenerSetLambda,
    this.lowSpeedZoneWarningOptionsGetLambda,
    this.lowSpeedZoneWarningOptionsSetLambda,
    this.offRoadDestinationReachedListenerGetLambda,
    this.offRoadDestinationReachedListenerSetLambda,
    this.offRoadProgressListenerGetLambda,
    this.offRoadProgressListenerSetLambda,
    this.maneuverNotificationOptionsGetLambda,
    this.maneuverNotificationOptionsSetLambda,
    this.eventTextOptionsGetLambda,
    this.eventTextOptionsSetLambda,
    this.speedWarningOptionsGetLambda,
    this.speedWarningOptionsSetLambda,
    this.isEnableTunnelExtrapolationGetLambda,
    this.isEnableTunnelExtrapolationSetLambda,
    this.isPassthroughWaypointsHandlingEnabledGetLambda,
    this.isPassthroughWaypointsHandlingEnabledSetLambda
  );

  @override
  void onLocationUpdated(location_impl.Location location) =>
    onLocationUpdatedLambda(location);
  @override
  Maneuver? getManeuver(int index) =>
    getManeuverLambda(index);
  @override
  ManeuverNotificationTimingOptions getManeuverNotificationTimingOptions(TransportMode transportMode, RoadType roadType) =>
    getManeuverNotificationTimingOptionsLambda(transportMode, roadType);
  @override
  bool setManeuverNotificationTimingOptions(TransportMode transportMode, RoadType roadType, ManeuverNotificationTimingOptions options) =>
    setManeuverNotificationTimingOptionsLambda(transportMode, roadType, options);
  @override
  ManeuverNotificationTimingOptions getManeuverNotificationTimingOptionsWithTimingProfile(TransportMode transportMode, TimingProfile timingProfile) =>
    getManeuverNotificationTimingOptionsWithTimingProfileLambda(transportMode, timingProfile);
  @override
  bool setManeuverNotificationTimingOptionsWithTimingProfile(TransportMode transportMode, TimingProfile timingProfile, ManeuverNotificationTimingOptions options) =>
    setManeuverNotificationTimingOptionsWithTimingProfileLambda(transportMode, timingProfile, options);
  @override
  void repeatLastManeuverNotification() =>
    repeatLastManeuverNotificationLambda();
  @override
  int? calculateRemainingDistanceInMeters(GeoCoordinates coordinates) =>
    calculateRemainingDistanceInMetersLambda(coordinates);
  @override
  void setCustomOption(String key, String value) =>
    setCustomOptionLambda(key, value);
  @override
  Route? get route => routeGetLambda();
  @override
  set route(Route? value) => routeSetLambda(value);
  @override
  TransportProfile? get trackingTransportProfile => trackingTransportProfileGetLambda();
  @override
  set trackingTransportProfile(TransportProfile? value) => trackingTransportProfileSetLambda(value);
  @override
  NavigableLocationListener? get navigableLocationListener => navigableLocationListenerGetLambda();
  @override
  set navigableLocationListener(NavigableLocationListener? value) => navigableLocationListenerSetLambda(value);
  @override
  RouteProgressListener? get routeProgressListener => routeProgressListenerGetLambda();
  @override
  set routeProgressListener(RouteProgressListener? value) => routeProgressListenerSetLambda(value);
  @override
  RouteDeviationListener? get routeDeviationListener => routeDeviationListenerGetLambda();
  @override
  set routeDeviationListener(RouteDeviationListener? value) => routeDeviationListenerSetLambda(value);
  @override
  ManeuverNotificationListener? get maneuverNotificationListener => maneuverNotificationListenerGetLambda();
  @override
  set maneuverNotificationListener(ManeuverNotificationListener? value) => maneuverNotificationListenerSetLambda(value);
  @override
  EventTextListener? get eventTextListener => eventTextListenerGetLambda();
  @override
  set eventTextListener(EventTextListener? value) => eventTextListenerSetLambda(value);
  @override
  MilestoneStatusListener? get milestoneStatusListener => milestoneStatusListenerGetLambda();
  @override
  set milestoneStatusListener(MilestoneStatusListener? value) => milestoneStatusListenerSetLambda(value);
  @override
  DestinationReachedListener? get destinationReachedListener => destinationReachedListenerGetLambda();
  @override
  set destinationReachedListener(DestinationReachedListener? value) => destinationReachedListenerSetLambda(value);
  @override
  SpeedWarningListener? get speedWarningListener => speedWarningListenerGetLambda();
  @override
  set speedWarningListener(SpeedWarningListener? value) => speedWarningListenerSetLambda(value);
  @override
  ManeuverViewLaneAssistanceListener? get maneuverViewLaneAssistanceListener => maneuverViewLaneAssistanceListenerGetLambda();
  @override
  set maneuverViewLaneAssistanceListener(ManeuverViewLaneAssistanceListener? value) => maneuverViewLaneAssistanceListenerSetLambda(value);
  @override
  CurrentSituationLaneAssistanceViewListener? get currentSituationLaneAssistanceViewListener => currentSituationLaneAssistanceViewListenerGetLambda();
  @override
  set currentSituationLaneAssistanceViewListener(CurrentSituationLaneAssistanceViewListener? value) => currentSituationLaneAssistanceViewListenerSetLambda(value);
  @override
  EnvironmentalZoneWarningListener? get environmentalZoneWarningListener => environmentalZoneWarningListenerGetLambda();
  @override
  set environmentalZoneWarningListener(EnvironmentalZoneWarningListener? value) => environmentalZoneWarningListenerSetLambda(value);
  @override
  EnvironmentalZoneWarningOptions get environmentalZoneWarningOptions => environmentalZoneWarningOptionsGetLambda();
  @override
  set environmentalZoneWarningOptions(EnvironmentalZoneWarningOptions value) => environmentalZoneWarningOptionsSetLambda(value);
  @override
  JunctionViewLaneAssistanceListener? get junctionViewLaneAssistanceListener => junctionViewLaneAssistanceListenerGetLambda();
  @override
  set junctionViewLaneAssistanceListener(JunctionViewLaneAssistanceListener? value) => junctionViewLaneAssistanceListenerSetLambda(value);
  @override
  SafetyCameraWarningListener? get safetyCameraWarningListener => safetyCameraWarningListenerGetLambda();
  @override
  set safetyCameraWarningListener(SafetyCameraWarningListener? value) => safetyCameraWarningListenerSetLambda(value);
  @override
  SafetyCameraWarningOptions get safetyCameraWarningOptions => safetyCameraWarningOptionsGetLambda();
  @override
  set safetyCameraWarningOptions(SafetyCameraWarningOptions value) => safetyCameraWarningOptionsSetLambda(value);
  @override
  DangerZoneWarningListener? get dangerZoneWarningListener => dangerZoneWarningListenerGetLambda();
  @override
  set dangerZoneWarningListener(DangerZoneWarningListener? value) => dangerZoneWarningListenerSetLambda(value);
  @override
  DangerZoneWarningOptions get dangerZoneWarningOptions => dangerZoneWarningOptionsGetLambda();
  @override
  set dangerZoneWarningOptions(DangerZoneWarningOptions value) => dangerZoneWarningOptionsSetLambda(value);
  @override
  TruckRestrictionsWarningListener? get truckRestrictionsWarningListener => truckRestrictionsWarningListenerGetLambda();
  @override
  set truckRestrictionsWarningListener(TruckRestrictionsWarningListener? value) => truckRestrictionsWarningListenerSetLambda(value);
  @override
  TruckRestrictionsWarningOptions get truckRestrictionsWarningOptions => truckRestrictionsWarningOptionsGetLambda();
  @override
  set truckRestrictionsWarningOptions(TruckRestrictionsWarningOptions value) => truckRestrictionsWarningOptionsSetLambda(value);
  @override
  PostActionListener? get postActionListener => postActionListenerGetLambda();
  @override
  set postActionListener(PostActionListener? value) => postActionListenerSetLambda(value);
  @override
  SpeedLimitListener? get speedLimitListener => speedLimitListenerGetLambda();
  @override
  set speedLimitListener(SpeedLimitListener? value) => speedLimitListenerSetLambda(value);
  @override
  RoadTextsListener? get roadTextsListener => roadTextsListenerGetLambda();
  @override
  set roadTextsListener(RoadTextsListener? value) => roadTextsListenerSetLambda(value);
  @override
  RoadAttributesListener? get roadAttributesListener => roadAttributesListenerGetLambda();
  @override
  set roadAttributesListener(RoadAttributesListener? value) => roadAttributesListenerSetLambda(value);
  @override
  SpatialManeuverNotificationListener? get spatialManeuverNotificationListener => spatialManeuverNotificationListenerGetLambda();
  @override
  set spatialManeuverNotificationListener(SpatialManeuverNotificationListener? value) => spatialManeuverNotificationListenerSetLambda(value);
  @override
  SpatialManeuverAzimuthListener? get spatialManeuverAzimuthListener => spatialManeuverAzimuthListenerGetLambda();
  @override
  set spatialManeuverAzimuthListener(SpatialManeuverAzimuthListener? value) => spatialManeuverAzimuthListenerSetLambda(value);
  @override
  RoadSignWarningListener? get roadSignWarningListener => roadSignWarningListenerGetLambda();
  @override
  set roadSignWarningListener(RoadSignWarningListener? value) => roadSignWarningListenerSetLambda(value);
  @override
  RoadSignWarningOptions get roadSignWarningOptions => roadSignWarningOptionsGetLambda();
  @override
  set roadSignWarningOptions(RoadSignWarningOptions value) => roadSignWarningOptionsSetLambda(value);
  @override
  SchoolZoneWarningListener? get schoolZoneWarningListener => schoolZoneWarningListenerGetLambda();
  @override
  set schoolZoneWarningListener(SchoolZoneWarningListener? value) => schoolZoneWarningListenerSetLambda(value);
  @override
  SchoolZoneWarningOptions get schoolZoneWarningOptions => schoolZoneWarningOptionsGetLambda();
  @override
  set schoolZoneWarningOptions(SchoolZoneWarningOptions value) => schoolZoneWarningOptionsSetLambda(value);
  @override
  RealisticViewWarningListener? get realisticViewWarningListener => realisticViewWarningListenerGetLambda();
  @override
  set realisticViewWarningListener(RealisticViewWarningListener? value) => realisticViewWarningListenerSetLambda(value);
  @override
  RealisticViewWarningOptions get realisticViewWarningOptions => realisticViewWarningOptionsGetLambda();
  @override
  set realisticViewWarningOptions(RealisticViewWarningOptions value) => realisticViewWarningOptionsSetLambda(value);
  @override
  BorderCrossingWarningListener? get borderCrossingWarningListener => borderCrossingWarningListenerGetLambda();
  @override
  set borderCrossingWarningListener(BorderCrossingWarningListener? value) => borderCrossingWarningListenerSetLambda(value);
  @override
  BorderCrossingWarningOptions get borderCrossingWarningOptions => borderCrossingWarningOptionsGetLambda();
  @override
  set borderCrossingWarningOptions(BorderCrossingWarningOptions value) => borderCrossingWarningOptionsSetLambda(value);
  @override
  TollStopWarningListener? get tollStopWarningListener => tollStopWarningListenerGetLambda();
  @override
  set tollStopWarningListener(TollStopWarningListener? value) => tollStopWarningListenerSetLambda(value);
  @override
  TollStopWarningOptions get tollStopWarningOptions => tollStopWarningOptionsGetLambda();
  @override
  set tollStopWarningOptions(TollStopWarningOptions value) => tollStopWarningOptionsSetLambda(value);
  @override
  RailwayCrossingWarningListener? get railwayCrossingWarningListener => railwayCrossingWarningListenerGetLambda();
  @override
  set railwayCrossingWarningListener(RailwayCrossingWarningListener? value) => railwayCrossingWarningListenerSetLambda(value);
  @override
  RailwayCrossingWarningOptions get railwayCrossingWarningOptions => railwayCrossingWarningOptionsGetLambda();
  @override
  set railwayCrossingWarningOptions(RailwayCrossingWarningOptions value) => railwayCrossingWarningOptionsSetLambda(value);
  @override
  LowSpeedZoneWarningListener? get lowSpeedZoneWarningListener => lowSpeedZoneWarningListenerGetLambda();
  @override
  set lowSpeedZoneWarningListener(LowSpeedZoneWarningListener? value) => lowSpeedZoneWarningListenerSetLambda(value);
  @override
  LowSpeedZoneWarningOptions get lowSpeedZoneWarningOptions => lowSpeedZoneWarningOptionsGetLambda();
  @override
  set lowSpeedZoneWarningOptions(LowSpeedZoneWarningOptions value) => lowSpeedZoneWarningOptionsSetLambda(value);
  @override
  OffRoadDestinationReachedListener? get offRoadDestinationReachedListener => offRoadDestinationReachedListenerGetLambda();
  @override
  set offRoadDestinationReachedListener(OffRoadDestinationReachedListener? value) => offRoadDestinationReachedListenerSetLambda(value);
  @override
  OffRoadProgressListener? get offRoadProgressListener => offRoadProgressListenerGetLambda();
  @override
  set offRoadProgressListener(OffRoadProgressListener? value) => offRoadProgressListenerSetLambda(value);
  @override
  ManeuverNotificationOptions get maneuverNotificationOptions => maneuverNotificationOptionsGetLambda();
  @override
  set maneuverNotificationOptions(ManeuverNotificationOptions value) => maneuverNotificationOptionsSetLambda(value);
  @override
  EventTextOptions get eventTextOptions => eventTextOptionsGetLambda();
  @override
  set eventTextOptions(EventTextOptions value) => eventTextOptionsSetLambda(value);
  @override
  SpeedWarningOptions get speedWarningOptions => speedWarningOptionsGetLambda();
  @override
  set speedWarningOptions(SpeedWarningOptions value) => speedWarningOptionsSetLambda(value);
  @override
  bool get isEnableTunnelExtrapolation => isEnableTunnelExtrapolationGetLambda();
  @override
  set isEnableTunnelExtrapolation(bool value) => isEnableTunnelExtrapolationSetLambda(value);
  @override
  bool get isPassthroughWaypointsHandlingEnabled => isPassthroughWaypointsHandlingEnabledGetLambda();
  @override
  set isPassthroughWaypointsHandlingEnabled(bool value) => isPassthroughWaypointsHandlingEnabledSetLambda(value);
}

class NavigatorInterface$Impl extends __lib.NativeBase implements NavigatorInterface {

  NavigatorInterface$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onLocationUpdated(location_impl.Location location) {
    final _onLocationUpdatedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_core_LocationListener_onLocationUpdated__Location'));
    final _locationHandle = sdkCoreLocationToFfi(location);
    final _handle = this.handle;
    _onLocationUpdatedFfi(_handle, __lib.LibraryContext.isolateId, _locationHandle);
    sdkCoreLocationReleaseFfiHandle(_locationHandle);

  }

  @override
  Maneuver? getManeuver(int index) {
    final _getManeuverFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Int32), Pointer<Void> Function(Pointer<Void>, int, int)>('here_sdk_sdk_navigation_NavigatorInterface_getManeuver__Int'));
    final _indexHandle = (index);
    final _handle = this.handle;
    final __resultHandle = _getManeuverFfi(_handle, __lib.LibraryContext.isolateId, _indexHandle);

    try {
      return sdkRoutingManeuverFromFfiNullable(__resultHandle);
    } finally {
      sdkRoutingManeuverReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  ManeuverNotificationTimingOptions getManeuverNotificationTimingOptions(TransportMode transportMode, RoadType roadType) {
    final _getManeuverNotificationTimingOptionsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Uint32, Uint32), Pointer<Void> Function(Pointer<Void>, int, int, int)>('here_sdk_sdk_navigation_NavigatorInterface_getManeuverNotificationTimingOptions__TransportMode_RoadType'));
    final _transportModeHandle = sdkTransportTransportmodeToFfi(transportMode);
    final _roadTypeHandle = sdkRoutingRoadtypeToFfi(roadType);
    final _handle = this.handle;
    final __resultHandle = _getManeuverNotificationTimingOptionsFfi(_handle, __lib.LibraryContext.isolateId, _transportModeHandle, _roadTypeHandle);
    sdkTransportTransportmodeReleaseFfiHandle(_transportModeHandle);
    sdkRoutingRoadtypeReleaseFfiHandle(_roadTypeHandle);
    try {
      return sdkNavigationManeuvernotificationtimingoptionsFromFfi(__resultHandle);
    } finally {
      sdkNavigationManeuvernotificationtimingoptionsReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  bool setManeuverNotificationTimingOptions(TransportMode transportMode, RoadType roadType, ManeuverNotificationTimingOptions options) {
    final _setManeuverNotificationTimingOptionsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Uint32, Uint32, Pointer<Void>), int Function(Pointer<Void>, int, int, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_setManeuverNotificationTimingOptions__TransportMode_RoadType_ManeuverNotificationTimingOptions'));
    final _transportModeHandle = sdkTransportTransportmodeToFfi(transportMode);
    final _roadTypeHandle = sdkRoutingRoadtypeToFfi(roadType);
    final _optionsHandle = sdkNavigationManeuvernotificationtimingoptionsToFfi(options);
    final _handle = this.handle;
    final __resultHandle = _setManeuverNotificationTimingOptionsFfi(_handle, __lib.LibraryContext.isolateId, _transportModeHandle, _roadTypeHandle, _optionsHandle);
    sdkTransportTransportmodeReleaseFfiHandle(_transportModeHandle);
    sdkRoutingRoadtypeReleaseFfiHandle(_roadTypeHandle);
    sdkNavigationManeuvernotificationtimingoptionsReleaseFfiHandle(_optionsHandle);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  ManeuverNotificationTimingOptions getManeuverNotificationTimingOptionsWithTimingProfile(TransportMode transportMode, TimingProfile timingProfile) {
    final _getManeuverNotificationTimingOptionsWithTimingProfileFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Uint32, Uint32), Pointer<Void> Function(Pointer<Void>, int, int, int)>('here_sdk_sdk_navigation_NavigatorInterface_getManeuverNotificationTimingOptions__TransportMode_TimingProfile'));
    final _transportModeHandle = sdkTransportTransportmodeToFfi(transportMode);
    final _timingProfileHandle = sdkNavigationTimingprofileToFfi(timingProfile);
    final _handle = this.handle;
    final __resultHandle = _getManeuverNotificationTimingOptionsWithTimingProfileFfi(_handle, __lib.LibraryContext.isolateId, _transportModeHandle, _timingProfileHandle);
    sdkTransportTransportmodeReleaseFfiHandle(_transportModeHandle);
    sdkNavigationTimingprofileReleaseFfiHandle(_timingProfileHandle);
    try {
      return sdkNavigationManeuvernotificationtimingoptionsFromFfi(__resultHandle);
    } finally {
      sdkNavigationManeuvernotificationtimingoptionsReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  bool setManeuverNotificationTimingOptionsWithTimingProfile(TransportMode transportMode, TimingProfile timingProfile, ManeuverNotificationTimingOptions options) {
    final _setManeuverNotificationTimingOptionsWithTimingProfileFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Uint32, Uint32, Pointer<Void>), int Function(Pointer<Void>, int, int, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_setManeuverNotificationTimingOptions__TransportMode_TimingProfile_ManeuverNotificationTimingOptions'));
    final _transportModeHandle = sdkTransportTransportmodeToFfi(transportMode);
    final _timingProfileHandle = sdkNavigationTimingprofileToFfi(timingProfile);
    final _optionsHandle = sdkNavigationManeuvernotificationtimingoptionsToFfi(options);
    final _handle = this.handle;
    final __resultHandle = _setManeuverNotificationTimingOptionsWithTimingProfileFfi(_handle, __lib.LibraryContext.isolateId, _transportModeHandle, _timingProfileHandle, _optionsHandle);
    sdkTransportTransportmodeReleaseFfiHandle(_transportModeHandle);
    sdkNavigationTimingprofileReleaseFfiHandle(_timingProfileHandle);
    sdkNavigationManeuvernotificationtimingoptionsReleaseFfiHandle(_optionsHandle);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  void repeatLastManeuverNotification() {
    final _repeatLastManeuverNotificationFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_repeatLastManeuverNotification'));
    final _handle = this.handle;
    _repeatLastManeuverNotificationFfi(_handle, __lib.LibraryContext.isolateId);

  }

  @override
  int? calculateRemainingDistanceInMeters(GeoCoordinates coordinates) {
    final _calculateRemainingDistanceInMetersFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_calculateRemainingDistanceInMeters__GeoCoordinates'));
    final _coordinatesHandle = sdkCoreGeocoordinatesToFfi(coordinates);
    final _handle = this.handle;
    final __resultHandle = _calculateRemainingDistanceInMetersFfi(_handle, __lib.LibraryContext.isolateId, _coordinatesHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_coordinatesHandle);
    try {
      return intFromFfiNullable(__resultHandle);
    } finally {
      intReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  void setCustomOption(String key, String value) {
    final _setCustomOptionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_setCustomOption__String_String'));
    final _keyHandle = stringToFfi(key);
    final _valueHandle = stringToFfi(value);
    final _handle = this.handle;
    _setCustomOptionFfi(_handle, __lib.LibraryContext.isolateId, _keyHandle, _valueHandle);
    stringReleaseFfiHandle(_keyHandle);
    stringReleaseFfiHandle(_valueHandle);

  }

  /// Gets the route that is being navigated.
  Route? get route {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_route_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkRoutingRouteFromFfiNullable(__resultHandle);
    } finally {
      sdkRoutingRouteReleaseFfiHandleNullable(__resultHandle);

    }

  }

  /// Sets the route to navigate. If not set, only the current location information will be
  /// provided through [NavigableLocationListener].
  /// If set, both route progress ([RouteProgressListener]) and route deviation
  /// ([RouteDeviationListener]) will receive notifications on updates.
  ///
  /// [value] The route to navigate. If not set, only the current location information will be
  /// provided through [NavigableLocationListener].
  /// If set, both route progress ([RouteProgressListener]) and route deviation
  /// ([RouteDeviationListener]) will receive notifications on updates.
  /// A route may fail to be set if it is generated by an incompatible engine, in which case the operation has no effect.
  ///
  set route(Route? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_route_set__Route_'));
    final _valueHandle = sdkRoutingRouteToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkRoutingRouteReleaseFfiHandleNullable(_valueHandle);

  }


  /// Gets the transport profile for the [Navigator], when no route is present.
  TransportProfile? get trackingTransportProfile {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_trackingTransportProfile_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreTransportprofileFromFfiNullable(__resultHandle);
    } finally {
      sdkCoreTransportprofileReleaseFfiHandleNullable(__resultHandle);

    }

  }

  /// Sets the transport profile for the [Navigator], when no route is present.
  /// Properly setting the transport profile optimizes the navigation experience, and improves resource consumption.
  /// For example, a [TransportProfile] can be defined with a [VehicleProfile].
  /// A vehicle profile can have several parameters such as [VehicleType] to set the
  /// source of information describing the vehicle.
  ///
  /// **Note:**
  /// Currently used members of [TransportProfile]
  /// - [VehicleType]: Sets the transport mode.
  /// - From `vehicleProfile`:
  ///   - `grossWeightInKilograms`: Required for truck related speed information.
  ///   - `heightInCentimeters`: Required for truck related speed information.
  ///   - `widthInCentimeters`: Additional truck definition for more specific truck speed information.
  ///   - `lengthInCentimeters`: Additional truck definition for more specific truck speed information.
  ///
  /// [value] Defines the transport profile for the [Navigator], when no route is present.
  /// Properly setting the transport profile optimizes the navigation experience, and improves resource consumption.
  /// For example, a [TransportProfile] can be defined with a [VehicleProfile].
  /// A vehicle profile can have several parameters such as [VehicleType] to set the
  /// source of information describing the vehicle.
  /// The default is a [VehicleType.car] profile.
  ///
  /// **Note:**
  /// Currently used members of [TransportProfile]
  /// - [VehicleType]: Sets the transport mode.
  /// - From `vehicleProfile`:
  ///   - `grossWeightInKilograms`: Required for truck related speed information.
  ///   - `heightInCentimeters`: Required for truck related speed information.
  ///   - `widthInCentimeters`: Additional truck definition for more specific truck speed information.
  ///   - `lengthInCentimeters`: Additional truck definition for more specific truck speed information.
  ///
  set trackingTransportProfile(TransportProfile? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_trackingTransportProfile_set__TransportProfile_'));
    final _valueHandle = sdkCoreTransportprofileToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkCoreTransportprofileReleaseFfiHandleNullable(_valueHandle);

  }


  /// Gets the listener that notifies current location updates.
  /// It returns `null` when no listener is set by an user.
  NavigableLocationListener? get navigableLocationListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_navigableLocationListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationNavigablelocationlistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationNavigablelocationlistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  /// Sets the listener that notifies current location updates.
  ///
  /// [value] Object to receive notifications about the current location.
  ///
  set navigableLocationListener(NavigableLocationListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_navigableLocationListener_set__NavigableLocationListener_'));
    final _valueHandle = sdkNavigationNavigablelocationlistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationNavigablelocationlistenerReleaseFfiHandleNullable(_valueHandle);

  }


  /// Gets the listener that notifies when a route progress change occurs.
  /// It returns `null` when no listener is set by an user.
  RouteProgressListener? get routeProgressListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_routeProgressListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationRouteprogresslistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationRouteprogresslistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  /// Sets the listener that notifies when a route progress change occurs.
  ///
  /// [value] Object to receive notifications about navigation route progress.
  /// Route progress notifications only occurs if the route has been set.
  /// **Note:** Setting `null` value to the listener will unset the listener.
  ///
  set routeProgressListener(RouteProgressListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_routeProgressListener_set__RouteProgressListener_'));
    final _valueHandle = sdkNavigationRouteprogresslistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationRouteprogresslistenerReleaseFfiHandleNullable(_valueHandle);

  }


  /// Gets the listener that notifies when deviation from the route is observed.
  /// It returns `null` when no listener is set by an user.
  RouteDeviationListener? get routeDeviationListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_routeDeviationListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationRoutedeviationlistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationRoutedeviationlistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  /// Sets the listener that notifies when deviation from the route is observed.
  ///
  /// [value] Object to receive notifications about deviations from the route if any occurs.
  /// Route deviation notifications only occurs if a route has been set.
  /// **Note:** Setting `null` value to the listener will unset the listener.
  ///
  set routeDeviationListener(RouteDeviationListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_routeDeviationListener_set__RouteDeviationListener_'));
    final _valueHandle = sdkNavigationRoutedeviationlistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationRoutedeviationlistenerReleaseFfiHandleNullable(_valueHandle);

  }


  /// Gets the listener that notifies when a maneuver notification is available.
  /// It returns `null` when no listener is set by an user.
  @Deprecated("Will be removed in v4.20.0. Use [NavigatorInterface.eventTextListener] property instead.")
  ManeuverNotificationListener? get maneuverNotificationListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_maneuverNotificationListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationManeuvernotificationlistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationManeuvernotificationlistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  /// Sets the listener that notifies when a maneuver notification is available.
  ///
  /// [value] Object to receive notifications for maneuvers when they are available.
  /// **Note:** Setting `null` value to the listener will unset the listener.
  ///
  @Deprecated("Will be removed in v4.20.0. Use [NavigatorInterface.eventTextListener] property instead.")

  set maneuverNotificationListener(ManeuverNotificationListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_maneuverNotificationListener_set__ManeuverNotificationListener_'));
    final _valueHandle = sdkNavigationManeuvernotificationlistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationManeuvernotificationlistenerReleaseFfiHandleNullable(_valueHandle);

  }


  /// Gets the listener that notifies when a text notification is available.
  /// It returns `null` when no listener is set by an user.
  EventTextListener? get eventTextListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_eventTextListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationEventtextlistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationEventtextlistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  /// Sets the listener that notifies when a text notification is available.
  ///
  /// [value] Object to receive text notifications when they are available.
  /// **Note:** Setting `null` value to the listener will unset the listener.
  ///
  set eventTextListener(EventTextListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_eventTextListener_set__EventTextListener_'));
    final _valueHandle = sdkNavigationEventtextlistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationEventtextlistenerReleaseFfiHandleNullable(_valueHandle);

  }


  /// Gets the listener that notifies when a [Milestone] has been reached or missed.
  /// It returns `null` when no listener is set by an user.
  MilestoneStatusListener? get milestoneStatusListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_milestoneStatusListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationMilestonestatuslistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationMilestonestatuslistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  /// Sets the listener that notifies when a [Milestone] has been reached or missed.
  ///
  /// [value] Object to receive notifications about the arrival at each [Milestone] or missing it.
  /// Note: It informs on all waypoints (passed or missed) that are of type _stopover_ but excludes the
  /// starting waypoint and waypoints of type _passThrough_.
  /// Milestone status notifications only occurs if a route has been set.
  /// **Note:** Setting `null` value to the listener will unset the listener.
  ///
  set milestoneStatusListener(MilestoneStatusListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_milestoneStatusListener_set__MilestoneStatusListener_'));
    final _valueHandle = sdkNavigationMilestonestatuslistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationMilestonestatuslistenerReleaseFfiHandleNullable(_valueHandle);

  }


  /// Gets the listener that notify when the destination has been reached.
  /// It returns `null` when no listener is set by an user.
  DestinationReachedListener? get destinationReachedListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_destinationReachedListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationDestinationreachedlistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationDestinationreachedlistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  /// Sets the listener that notify when the destination has been reached.
  ///
  /// [value] Object to receive the notification about the arrival at the destination.
  /// Destination reached notifications only occurs if a route has been set.
  /// **Note:** Setting `null` value to the listener will unset the listener.
  ///
  set destinationReachedListener(DestinationReachedListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_destinationReachedListener_set__DestinationReachedListener_'));
    final _valueHandle = sdkNavigationDestinationreachedlistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationDestinationreachedlistenerReleaseFfiHandleNullable(_valueHandle);

  }


  /// Gets the listener to receive notifications
  /// when a speed limit on a road is exceeded or driving speed is restored back to normal.
  /// It returns `null` when no listener is set by an user.
  SpeedWarningListener? get speedWarningListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_speedWarningListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationSpeedwarninglistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationSpeedwarninglistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  /// Sets the listener to receive notifications
  /// when a speed limit on a road is exceeded or driving speed is restored back to normal.
  ///
  /// [value] Object to receive notifications when a speed limit on a road is exceeded or driving speed is restored back to normal.
  /// **Note:** Setting `null` value to the listener will unset the listener.
  ///
  set speedWarningListener(SpeedWarningListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_speedWarningListener_set__SpeedWarningListener_'));
    final _valueHandle = sdkNavigationSpeedwarninglistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationSpeedwarninglistenerReleaseFfiHandleNullable(_valueHandle);

  }


  /// Gets the listener  to receive maneuver view lane assistance notifications.
  /// It returns `null` when no listener is set by an user.
  ManeuverViewLaneAssistanceListener? get maneuverViewLaneAssistanceListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_maneuverViewLaneAssistanceListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationManeuverviewlaneassistancelistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationManeuverviewlaneassistancelistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  /// Sets the listener  to receive maneuver view lane assistance notifications.
  ///
  /// [value] Object to receive maneuver view lane assistance notifications.
  /// Maneuver view lane assistance notifications only occurs if a route has been set.
  /// **Note:** Setting `null` value to the listener will unset the listener.
  ///
  set maneuverViewLaneAssistanceListener(ManeuverViewLaneAssistanceListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_maneuverViewLaneAssistanceListener_set__ManeuverViewLaneAssistanceListener_'));
    final _valueHandle = sdkNavigationManeuverviewlaneassistancelistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationManeuverviewlaneassistancelistenerReleaseFfiHandleNullable(_valueHandle);

  }


  /// Gets the listener  to receive current situation lane assistance view notifications.
  /// It returns `null` when no listener is set by an user.
  CurrentSituationLaneAssistanceViewListener? get currentSituationLaneAssistanceViewListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_currentSituationLaneAssistanceViewListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationCurrentsituationlaneassistanceviewlistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationCurrentsituationlaneassistanceviewlistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  /// Sets the listener  to receive current situation lane assistance view notifications.
  ///
  /// [value] Object to receive current situation lane assistance view notifications.
  /// **Note:** Setting `null` value to the listener will unset the listener.
  ///
  set currentSituationLaneAssistanceViewListener(CurrentSituationLaneAssistanceViewListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_currentSituationLaneAssistanceViewListener_set__CurrentSituationLaneAssistanceViewListener_'));
    final _valueHandle = sdkNavigationCurrentsituationlaneassistanceviewlistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationCurrentsituationlaneassistanceviewlistenerReleaseFfiHandleNullable(_valueHandle);

  }


  /// Gets the listener to receive current environmental zones notifications.
  /// It returns `null` when no listener is set by an user.
  EnvironmentalZoneWarningListener? get environmentalZoneWarningListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_environmentalZoneWarningListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationEnvironmentalzonewarninglistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationEnvironmentalzonewarninglistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  /// Sets the listener to receive current environmental zones notifications.
  ///
  /// [value] Object to receive notification on approaching environmental zones.
  /// **Note:** Setting `null` value to the listener will unset the listener.
  ///
  set environmentalZoneWarningListener(EnvironmentalZoneWarningListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_environmentalZoneWarningListener_set__EnvironmentalZoneWarningListener_'));
    final _valueHandle = sdkNavigationEnvironmentalzonewarninglistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationEnvironmentalzonewarninglistenerReleaseFfiHandleNullable(_valueHandle);

  }


  /// Gets environmental zone warning options that allow to filter environmental zone to be
  /// passed to [EnvironmentalZoneWarningListener].
  EnvironmentalZoneWarningOptions get environmentalZoneWarningOptions {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_environmentalZoneWarningOptions_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationEnvironmentalzonewarningoptionsFromFfi(__resultHandle);
    } finally {
      sdkNavigationEnvironmentalzonewarningoptionsReleaseFfiHandle(__resultHandle);

    }

  }

  /// Sets environmental zone warning options that allow to filter environmental zone to be
  /// passed to [EnvironmentalZoneWarningListener].
  ///
  /// [value] Environmental zone warning options that allow to filter environmental zones to be passed to [EnvironmentalZoneWarningListener].
  ///
  set environmentalZoneWarningOptions(EnvironmentalZoneWarningOptions value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_environmentalZoneWarningOptions_set__EnvironmentalZoneWarningOptions'));
    final _valueHandle = sdkNavigationEnvironmentalzonewarningoptionsToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationEnvironmentalzonewarningoptionsReleaseFfiHandle(_valueHandle);

  }


  /// Gets the listener  to receive junction view lane assistance notifications.
  /// It returns `null` when no listener is set by an user.
  JunctionViewLaneAssistanceListener? get junctionViewLaneAssistanceListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_junctionViewLaneAssistanceListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationJunctionviewlaneassistancelistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationJunctionviewlaneassistancelistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  /// Sets the listener  to receive junction view lane assistance notifications.
  ///
  /// [value] Object to receive junction view lane assistance notifications.
  /// Junction view lane assistance notifications only occurs if a route has been set.
  /// **Note:** Setting `null` value to the listener will unset the listener.
  ///
  set junctionViewLaneAssistanceListener(JunctionViewLaneAssistanceListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_junctionViewLaneAssistanceListener_set__JunctionViewLaneAssistanceListener_'));
    final _valueHandle = sdkNavigationJunctionviewlaneassistancelistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationJunctionviewlaneassistancelistenerReleaseFfiHandleNullable(_valueHandle);

  }


  /// Gets the listener  to receive safety camera warning notifications.
  /// It returns `null` when no listener is set by an user.
  SafetyCameraWarningListener? get safetyCameraWarningListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_safetyCameraWarningListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationSafetycamerawarninglistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationSafetycamerawarninglistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  /// Sets the listener  to receive safety camera warning notifications.
  ///
  /// [value] Object to receive safety camera warner notifications.
  /// If a listener  is present, notifications about
  /// safety speed cameras will be also sent via [SafetyCameraWarningListener].
  /// **Note:** Setting `null` value to the listener will unset the listener.
  ///
  set safetyCameraWarningListener(SafetyCameraWarningListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_safetyCameraWarningListener_set__SafetyCameraWarningListener_'));
    final _valueHandle = sdkNavigationSafetycamerawarninglistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationSafetycamerawarninglistenerReleaseFfiHandleNullable(_valueHandle);

  }


  /// Gets safety camera warning options to be passed to [SafetyCameraWarningListener].
  SafetyCameraWarningOptions get safetyCameraWarningOptions {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_safetyCameraWarningOptions_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationSafetycamerawarningoptionsFromFfi(__resultHandle);
    } finally {
      sdkNavigationSafetycamerawarningoptionsReleaseFfiHandle(__resultHandle);

    }

  }

  /// Sets safety camera warning options to be passed to [SafetyCameraWarningListener].
  ///
  /// [value] Safety camera warning options to be passed to [SafetyCameraWarningListener]. These options
  /// allow the setting of notification distances.
  ///
  set safetyCameraWarningOptions(SafetyCameraWarningOptions value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_safetyCameraWarningOptions_set__SafetyCameraWarningOptions'));
    final _valueHandle = sdkNavigationSafetycamerawarningoptionsToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationSafetycamerawarningoptionsReleaseFfiHandle(_valueHandle);

  }


  /// Gets the listener to receive current danger zones notifications.
  /// It returns `null` when no listener is set by an user.
  DangerZoneWarningListener? get dangerZoneWarningListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_dangerZoneWarningListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationDangerzonewarninglistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationDangerzonewarninglistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  /// Sets the listener to receive current danger zones notifications.
  ///
  /// [value] Object to receive notification on approaching danger zones.
  /// **Note:** Setting `null` value to the listener will unset the listener.
  ///
  set dangerZoneWarningListener(DangerZoneWarningListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_dangerZoneWarningListener_set__DangerZoneWarningListener_'));
    final _valueHandle = sdkNavigationDangerzonewarninglistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationDangerzonewarninglistenerReleaseFfiHandleNullable(_valueHandle);

  }


  /// Gets danger zone warning options that allow to filter danger zone to be
  /// passed to [DangerZoneWarningListener].
  DangerZoneWarningOptions get dangerZoneWarningOptions {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_dangerZoneWarningOptions_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationDangerzonewarningoptionsFromFfi(__resultHandle);
    } finally {
      sdkNavigationDangerzonewarningoptionsReleaseFfiHandle(__resultHandle);

    }

  }

  /// Sets danger zone warning options that allow to filter danger zone to be
  /// passed to [DangerZoneWarningListener].
  ///
  /// [value] Danger zone warning options that allow to filter danger zones to be passed to [DangerZoneWarningListener].
  ///
  set dangerZoneWarningOptions(DangerZoneWarningOptions value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_dangerZoneWarningOptions_set__DangerZoneWarningOptions'));
    final _valueHandle = sdkNavigationDangerzonewarningoptionsToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationDangerzonewarningoptionsReleaseFfiHandle(_valueHandle);

  }


  /// Gets the listener  to receive notifications about
  /// truck restrictions on the current road.
  /// It returns `null` when no listener is set by an user.
  TruckRestrictionsWarningListener? get truckRestrictionsWarningListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_truckRestrictionsWarningListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationTruckrestrictionswarninglistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationTruckrestrictionswarninglistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  /// Sets the listener  to receive notifications about
  /// truck restrictions on the current road.
  ///
  /// [value] Object to receive notifications about truck restrictions on the current road.
  /// **Note:** Setting `null` value to the listener will unset the listener.
  ///
  set truckRestrictionsWarningListener(TruckRestrictionsWarningListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_truckRestrictionsWarningListener_set__TruckRestrictionsWarningListener_'));
    final _valueHandle = sdkNavigationTruckrestrictionswarninglistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationTruckrestrictionswarninglistenerReleaseFfiHandleNullable(_valueHandle);

  }


  /// Gets truck restrictions warning options that allow to filter truck restrictions to be
  /// passed to [TruckRestrictionsWarningListener].
  TruckRestrictionsWarningOptions get truckRestrictionsWarningOptions {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_truckRestrictionsWarningOptions_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationTruckrestrictionswarningoptionsFromFfi(__resultHandle);
    } finally {
      sdkNavigationTruckrestrictionswarningoptionsReleaseFfiHandle(__resultHandle);

    }

  }

  /// Sets truck restrictions warning options that allow to filter truck restrictions to be
  /// passed to [TruckRestrictionsWarningListener].
  ///
  /// [value] Truck restrictions warning options that allow to filter truck restrictions to be passed to [TruckRestrictionsWarningListener].
  ///
  set truckRestrictionsWarningOptions(TruckRestrictionsWarningOptions value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_truckRestrictionsWarningOptions_set__TruckRestrictionsWarningOptions'));
    final _valueHandle = sdkNavigationTruckrestrictionswarningoptionsToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationTruckrestrictionswarningoptionsReleaseFfiHandle(_valueHandle);

  }


  /// Gets the listener  to receive post action
  /// notifications, such as a charge action at a charging station.
  /// It returns `null` when no listener is set by an user.
  PostActionListener? get postActionListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_postActionListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationPostactionlistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationPostactionlistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  /// Sets the listener  to receive post action
  /// notifications, such as a charge action at a charging station.
  ///
  /// [value] Object to receive post action notifications, such as a charge action at a charging station.
  /// Post actions notifications only occurs if a route has been set.
  /// **Note:** Setting `null` value to the listener will unset the listener.
  ///
  set postActionListener(PostActionListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_postActionListener_set__PostActionListener_'));
    final _valueHandle = sdkNavigationPostactionlistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationPostactionlistenerReleaseFfiHandleNullable(_valueHandle);

  }


  /// Gets the listener  to receive notifications about
  /// the speed limit of the current road.
  /// It returns `null` when no listener is set by an user.
  SpeedLimitListener? get speedLimitListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_speedLimitListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationSpeedlimitlistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationSpeedlimitlistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  /// Sets the listener  to receive notifications about
  /// the speed limit of the current road.
  ///
  /// [value] Object to receive notifications about the speed limit of the current road.
  /// **Note:** Setting `null` value to the listener will unset the listener.
  ///
  set speedLimitListener(SpeedLimitListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_speedLimitListener_set__SpeedLimitListener_'));
    final _valueHandle = sdkNavigationSpeedlimitlistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationSpeedlimitlistenerReleaseFfiHandleNullable(_valueHandle);

  }


  /// Gets the listener  to receive notifications about
  /// the textual attributes of the current road.
  /// It returns `null` when no listener is set by an user.
  RoadTextsListener? get roadTextsListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_roadTextsListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationRoadtextslistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationRoadtextslistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  /// Sets the listener  to receive notifications about
  /// the textual attributes of the current road.
  ///
  /// [value] Object to receive notifications about the textual attributes of the current road.
  /// **Note:** Setting `null` value to the listener will unset the listener.
  ///
  set roadTextsListener(RoadTextsListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_roadTextsListener_set__RoadTextsListener_'));
    final _valueHandle = sdkNavigationRoadtextslistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationRoadtextslistenerReleaseFfiHandleNullable(_valueHandle);

  }


  /// Gets the listener  to receive notifications about
  /// attributes of the current road.
  /// It returns `null` when no listener is set by an user.
  RoadAttributesListener? get roadAttributesListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_roadAttributesListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationRoadattributeslistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationRoadattributeslistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  /// Sets the listener  to receive notifications about
  /// attributes of the current road.
  ///
  /// [value] Object to receive notifications about attributes of the current road.
  /// **Note:** Setting `null` value to the listener will unset the listener.
  ///
  set roadAttributesListener(RoadAttributesListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_roadAttributesListener_set__RoadAttributesListener_'));
    final _valueHandle = sdkNavigationRoadattributeslistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationRoadattributeslistenerReleaseFfiHandleNullable(_valueHandle);

  }


  /// Gets the listener that notifies when a spatial maneuver notification is available.
  SpatialManeuverNotificationListener? get spatialManeuverNotificationListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_spatialManeuverNotificationListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationSpatialmaneuvernotificationlistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationSpatialmaneuvernotificationlistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  /// Sets the listener that notifies when a spatial maneuver notification is available.
  ///
  /// [value] Object to receive notifications for spatial maneuvers when they are available. This object delivers the same information as the [ManeuverNotificationListener],
  /// but enhanced with spatial audio information to indicate the direction of a maneuver sonically.
  ///
  set spatialManeuverNotificationListener(SpatialManeuverNotificationListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_spatialManeuverNotificationListener_set__SpatialManeuverNotificationListener_'));
    final _valueHandle = sdkNavigationSpatialmaneuvernotificationlistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationSpatialmaneuvernotificationlistenerReleaseFfiHandleNullable(_valueHandle);

  }


  /// Gets the listener to receive notifications about
  /// the following spatial audio trajectory.
  SpatialManeuverAzimuthListener? get spatialManeuverAzimuthListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_spatialManeuverAzimuthListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationSpatialmaneuverazimuthlistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationSpatialmaneuverazimuthlistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  /// Sets the listener to receive notifications about
  /// the following spatial audio trajectory.
  ///
  /// [value] Object to receive the next azimuth required to complete a spatial audio trajectory. Azimuth angular values are retrieved
  /// individually until the full duration of the audio trajectory has been reached.
  ///
  set spatialManeuverAzimuthListener(SpatialManeuverAzimuthListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_spatialManeuverAzimuthListener_set__SpatialManeuverAzimuthListener_'));
    final _valueHandle = sdkNavigationSpatialmaneuverazimuthlistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationSpatialmaneuverazimuthlistenerReleaseFfiHandleNullable(_valueHandle);

  }


  /// Gets the listener to receive notifications about
  /// road signs on the current road.
  /// It returns `null` when no listener is set by an user.
  RoadSignWarningListener? get roadSignWarningListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_roadSignWarningListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationRoadsignwarninglistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationRoadsignwarninglistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  /// Sets the listener to receive notifications about
  /// road signs on the current road.
  ///
  /// [value] Object to receive notifications about road signs on the current road.
  /// **Note:** Setting `null` value to the listener will unset the listener.
  ///
  set roadSignWarningListener(RoadSignWarningListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_roadSignWarningListener_set__RoadSignWarningListener_'));
    final _valueHandle = sdkNavigationRoadsignwarninglistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationRoadsignwarninglistenerReleaseFfiHandleNullable(_valueHandle);

  }


  /// Gets road sign warning options that allow to filter road signs to be passed to [RoadSignWarningListener].
  RoadSignWarningOptions get roadSignWarningOptions {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_roadSignWarningOptions_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationRoadsignwarningoptionsFromFfi(__resultHandle);
    } finally {
      sdkNavigationRoadsignwarningoptionsReleaseFfiHandle(__resultHandle);

    }

  }

  /// Sets road sign warning options that allow to filter road signs to be passed to [RoadSignWarningListener].
  ///
  /// [value] Road sign warning options that allow to filter road sings to be passed to [RoadSignWarningListener].
  ///
  set roadSignWarningOptions(RoadSignWarningOptions value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_roadSignWarningOptions_set__RoadSignWarningOptions'));
    final _valueHandle = sdkNavigationRoadsignwarningoptionsToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationRoadsignwarningoptionsReleaseFfiHandle(_valueHandle);

  }


  /// Gets the listener to receive notifications about
  /// school zones on the current road.
  /// It returns `null` when no listener is set by an user.
  SchoolZoneWarningListener? get schoolZoneWarningListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_schoolZoneWarningListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationSchoolzonewarninglistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationSchoolzonewarninglistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  /// Sets the listener to receive notifications about
  /// school zones on the current road.
  ///
  /// [value] Object to receive notifications about school zones on the current road.
  /// **Note:** Setting `null` value to the listener will unset the listener.
  ///
  set schoolZoneWarningListener(SchoolZoneWarningListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_schoolZoneWarningListener_set__SchoolZoneWarningListener_'));
    final _valueHandle = sdkNavigationSchoolzonewarninglistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationSchoolzonewarninglistenerReleaseFfiHandleNullable(_valueHandle);

  }


  /// Gets school zone warning options that allow to configure school zone notifications to be
  /// passed to [SchoolZoneWarningListener].
  SchoolZoneWarningOptions get schoolZoneWarningOptions {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_schoolZoneWarningOptions_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationSchoolzonewarningoptionsFromFfi(__resultHandle);
    } finally {
      sdkNavigationSchoolzonewarningoptionsReleaseFfiHandle(__resultHandle);

    }

  }

  /// Sets school zone warning options that allow to configure school zone notifications to be
  /// passed to [SchoolZoneWarningListener].
  ///
  /// **Note:** This is a alpha release of this feature, so there could be a few bugs and unexpected
  /// behaviors. Related APIs may change for new releases without a deprecation process.
  ///
  /// [value] School zone warning options that allow to configure school zone notifications to be passed to
  /// [SchoolZoneWarningListener].
  ///
  set schoolZoneWarningOptions(SchoolZoneWarningOptions value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_schoolZoneWarningOptions_set__SchoolZoneWarningOptions'));
    final _valueHandle = sdkNavigationSchoolzonewarningoptionsToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationSchoolzonewarningoptionsReleaseFfiHandle(_valueHandle);

  }


  /// Gets the listener to receive notifications about
  /// junction views on the current road.
  /// It returns `null` when no listener is set by an user.
  RealisticViewWarningListener? get realisticViewWarningListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_realisticViewWarningListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationRealisticviewwarninglistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationRealisticviewwarninglistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  /// Sets the listener to receive notifications about
  /// junction views on the current road.
  ///
  /// **Note:**
  /// - This feature requires a map version greater or equal to 67 in order to function properly.
  /// - This is a beta release of this feature, so there could be a few bugs and unexpected
  ///   behaviors. Related APIs may change for new releases without a deprecation process.
  ///
  /// [value] Object to receive notifications about junction views on the current road.
  /// **Note:** Setting `null` value to the listener will unset
  /// the listener.
  ///
  set realisticViewWarningListener(RealisticViewWarningListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_realisticViewWarningListener_set__RealisticViewWarningListener_'));
    final _valueHandle = sdkNavigationRealisticviewwarninglistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationRealisticviewwarninglistenerReleaseFfiHandleNullable(_valueHandle);

  }


  /// Gets realistic view warning options that allow to filter realistic views to be passed to
  /// [RealisticViewWarningListener].
  RealisticViewWarningOptions get realisticViewWarningOptions {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_realisticViewWarningOptions_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationRealisticviewwarningoptionsFromFfi(__resultHandle);
    } finally {
      sdkNavigationRealisticviewwarningoptionsReleaseFfiHandle(__resultHandle);

    }

  }

  /// Sets realistic view warning options that allow to filter realistic views to be passed to
  /// [RealisticViewWarningListener].
  ///
  /// **Note:**
  /// - This feature requires a map version greater or equal to 67 in order to function properly.
  /// - This is a beta release of this feature, so there could be a few bugs and unexpected
  ///   behaviors. Related APIs may change for new releases without a deprecation process.
  ///
  /// [value] Realistic view warning options that allow to filter realistic views to be passed to
  /// [RealisticViewWarningListener].
  ///
  set realisticViewWarningOptions(RealisticViewWarningOptions value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_realisticViewWarningOptions_set__RealisticViewWarningOptions'));
    final _valueHandle = sdkNavigationRealisticviewwarningoptionsToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationRealisticviewwarningoptionsReleaseFfiHandle(_valueHandle);

  }


  /// Gets the listener to receive notifications about
  /// border crossings on the current road.
  /// It returns `null` when no listener is set by an user.
  BorderCrossingWarningListener? get borderCrossingWarningListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_borderCrossingWarningListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationBordercrossingwarninglistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationBordercrossingwarninglistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  /// Sets the listener to receive notifications about
  /// border crossings on the current road.
  ///
  /// [value] Object to receive notifications about border crossings on the current road. Border crossing
  /// notifications are given only if a route is present.
  /// **Note:** Setting `null` value to the listener will unset the listener.
  ///
  set borderCrossingWarningListener(BorderCrossingWarningListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_borderCrossingWarningListener_set__BorderCrossingWarningListener_'));
    final _valueHandle = sdkNavigationBordercrossingwarninglistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationBordercrossingwarninglistenerReleaseFfiHandleNullable(_valueHandle);

  }


  /// Gets border crossing warning options to be passed to [BorderCrossingWarningListener].
  BorderCrossingWarningOptions get borderCrossingWarningOptions {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_borderCrossingWarningOptions_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationBordercrossingwarningoptionsFromFfi(__resultHandle);
    } finally {
      sdkNavigationBordercrossingwarningoptionsReleaseFfiHandle(__resultHandle);

    }

  }

  /// Sets border crossing warning options to be passed to [BorderCrossingWarningListener].
  ///
  /// [value] Border crossing warning options to be passed to [BorderCrossingWarningListener]. These options
  /// allow the filtering of the border crossing warnings received and set the notification distances.
  ///
  set borderCrossingWarningOptions(BorderCrossingWarningOptions value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_borderCrossingWarningOptions_set__BorderCrossingWarningOptions'));
    final _valueHandle = sdkNavigationBordercrossingwarningoptionsToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationBordercrossingwarningoptionsReleaseFfiHandle(_valueHandle);

  }


  /// Gets the listener to receive notifications about
  /// the the upcoming toll stop.
  TollStopWarningListener? get tollStopWarningListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_tollStopWarningListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationTollstopwarninglistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationTollstopwarninglistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  /// Sets the listener to receive notifications about
  /// the upcoming toll stop.
  ///
  /// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected
  /// behaviors. Related APIs may change for new releases without a deprecation process.
  ///
  /// [value] Object to receive information on the upcoming toll stop.
  /// **Note:** Setting `null` value to the listener will unset
  /// the listener.
  ///
  set tollStopWarningListener(TollStopWarningListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_tollStopWarningListener_set__TollStopWarningListener_'));
    final _valueHandle = sdkNavigationTollstopwarninglistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationTollstopwarninglistenerReleaseFfiHandleNullable(_valueHandle);

  }


  /// Gets toll stop warning options to be passed to [TollStopWarningListener].
  TollStopWarningOptions get tollStopWarningOptions {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_tollStopWarningOptions_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationTollstopwarningoptionsFromFfi(__resultHandle);
    } finally {
      sdkNavigationTollstopwarningoptionsReleaseFfiHandle(__resultHandle);

    }

  }

  /// Sets toll stop warning options to be passed to [TollStopWarningListener].
  ///
  /// [value] Toll stop warning options to be passed to [TollStopWarningListener]. These options
  /// allow the setting of notification distances.
  ///
  set tollStopWarningOptions(TollStopWarningOptions value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_tollStopWarningOptions_set__TollStopWarningOptions'));
    final _valueHandle = sdkNavigationTollstopwarningoptionsToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationTollstopwarningoptionsReleaseFfiHandle(_valueHandle);

  }


  /// Gets the listener to receive notifications about
  /// railway crossings on the current road.
  /// It returns `null` when no listener is set by an user.
  RailwayCrossingWarningListener? get railwayCrossingWarningListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_railwayCrossingWarningListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationRailwaycrossingwarninglistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationRailwaycrossingwarninglistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  /// Sets the listener to receive notifications about
  /// railway crossings on the current road.
  ///
  /// [value] Object to receive notifications about railway crossings on the current road. Railway crossing
  /// notifications are given regardless if a route is set.
  /// **Note:** Setting `null` value to the listener will unset the listener.
  ///
  set railwayCrossingWarningListener(RailwayCrossingWarningListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_railwayCrossingWarningListener_set__RailwayCrossingWarningListener_'));
    final _valueHandle = sdkNavigationRailwaycrossingwarninglistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationRailwaycrossingwarninglistenerReleaseFfiHandleNullable(_valueHandle);

  }


  /// Gets railway crossing warning options to be passed to [RailwayCrossingWarningListener].
  RailwayCrossingWarningOptions get railwayCrossingWarningOptions {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_railwayCrossingWarningOptions_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationRailwaycrossingwarningoptionsFromFfi(__resultHandle);
    } finally {
      sdkNavigationRailwaycrossingwarningoptionsReleaseFfiHandle(__resultHandle);

    }

  }

  /// Sets railway crossing warning options to be passed to [RailwayCrossingWarningListener].
  ///
  /// [value] Railway crossing warning options to be passed to [RailwayCrossingWarningListener]. These options
  /// allow the setting of notification distances.
  ///
  set railwayCrossingWarningOptions(RailwayCrossingWarningOptions value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_railwayCrossingWarningOptions_set__RailwayCrossingWarningOptions'));
    final _valueHandle = sdkNavigationRailwaycrossingwarningoptionsToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationRailwaycrossingwarningoptionsReleaseFfiHandle(_valueHandle);

  }


  /// Gets the listener to receive notifications about
  /// low speed zones on the current road.
  /// It returns `null` when no listener is set by an user.
  LowSpeedZoneWarningListener? get lowSpeedZoneWarningListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_lowSpeedZoneWarningListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationLowspeedzonewarninglistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationLowspeedzonewarninglistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  /// Sets the listener to receive notifications about
  /// low speed zones on the current road.
  ///
  /// [value] Object to receive notifications about low speed zones on the current road. Low speed zone
  /// notifications are given regardless if a route is set. This listener is currently
  /// available _only_ for Japan.
  /// **Note:** Setting `null` value to the listener will unset the listener.
  ///
  set lowSpeedZoneWarningListener(LowSpeedZoneWarningListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_lowSpeedZoneWarningListener_set__LowSpeedZoneWarningListener_'));
    final _valueHandle = sdkNavigationLowspeedzonewarninglistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationLowspeedzonewarninglistenerReleaseFfiHandleNullable(_valueHandle);

  }


  /// Gets low speed zone warning options to be passed to [LowSpeedZoneWarningListener].
  LowSpeedZoneWarningOptions get lowSpeedZoneWarningOptions {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_lowSpeedZoneWarningOptions_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationLowspeedzonewarningoptionsFromFfi(__resultHandle);
    } finally {
      sdkNavigationLowspeedzonewarningoptionsReleaseFfiHandle(__resultHandle);

    }

  }

  /// Sets low speed zone warning options to be passed to [LowSpeedZoneWarningListener].
  ///
  /// [value] Low speed zone warning options to be passed to [LowSpeedZoneWarningListener]. These options
  /// allow the setting of notification distances.
  ///
  set lowSpeedZoneWarningOptions(LowSpeedZoneWarningOptions value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_lowSpeedZoneWarningOptions_set__LowSpeedZoneWarningOptions'));
    final _valueHandle = sdkNavigationLowspeedzonewarningoptionsToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationLowspeedzonewarningoptionsReleaseFfiHandle(_valueHandle);

  }


  /// Gets the listener that notifies when the off-road destination has
  /// been reached.
  /// It returns `null` when no listener is set by an user.
  OffRoadDestinationReachedListener? get offRoadDestinationReachedListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_offRoadDestinationReachedListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationOffroaddestinationreachedlistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationOffroaddestinationreachedlistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  /// Sets the listener that notifies when the off-road destination has
  /// been reached.
  ///
  /// [value] Object to receive the notification about the arrival at the off-road destination.
  /// Off-road destination reached notifications only occurs if a route has been set.
  /// **Note:** Setting `null` value to the listener will unset
  /// the listener.
  ///
  set offRoadDestinationReachedListener(OffRoadDestinationReachedListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_offRoadDestinationReachedListener_set__OffRoadDestinationReachedListener_'));
    final _valueHandle = sdkNavigationOffroaddestinationreachedlistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationOffroaddestinationreachedlistenerReleaseFfiHandleNullable(_valueHandle);

  }


  /// Gets the listener that notifies about off-road progress.
  /// It returns `null` when no listener is set by an user.
  OffRoadProgressListener? get offRoadProgressListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_offRoadProgressListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationOffroadprogresslistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationOffroadprogresslistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  /// Sets the listener that notifies about off-road progress.
  ///
  /// [value] Object to receive the notification about the off-road progress.
  /// Off-road progress notifications only occurs if a route has been set.
  /// **Note:** Setting `null` value to the listener will unset
  /// the listener.
  ///
  set offRoadProgressListener(OffRoadProgressListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_offRoadProgressListener_set__OffRoadProgressListener_'));
    final _valueHandle = sdkNavigationOffroadprogresslistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationOffroadprogresslistenerReleaseFfiHandleNullable(_valueHandle);

  }


  /// Gets the maneuver notification options.
  ManeuverNotificationOptions get maneuverNotificationOptions {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_maneuverNotificationOptions_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationManeuvernotificationoptionsFromFfi(__resultHandle);
    } finally {
      sdkNavigationManeuvernotificationoptionsReleaseFfiHandle(__resultHandle);

    }

  }

  /// Sets the maneuver notification options.
  ///
  /// [value] Options used for maneuver notifications. Notifications are only available
  /// if a route is present.
  ///
  set maneuverNotificationOptions(ManeuverNotificationOptions value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_maneuverNotificationOptions_set__ManeuverNotificationOptions'));
    final _valueHandle = sdkNavigationManeuvernotificationoptionsToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationManeuvernotificationoptionsReleaseFfiHandle(_valueHandle);

  }


  /// Gets the text notification options.
  EventTextOptions get eventTextOptions {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_eventTextOptions_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationEventtextoptionsFromFfi(__resultHandle);
    } finally {
      sdkNavigationEventtextoptionsReleaseFfiHandle(__resultHandle);

    }

  }

  /// Sets the text notification options.
  ///
  /// [value] Options used for text notifications. Notifications are only available
  /// if a route is present.
  ///
  set eventTextOptions(EventTextOptions value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_eventTextOptions_set__EventTextOptions'));
    final _valueHandle = sdkNavigationEventtextoptionsToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationEventtextoptionsReleaseFfiHandle(_valueHandle);

  }


  /// Gets the speed warning options.
  SpeedWarningOptions get speedWarningOptions {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_speedWarningOptions_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationSpeedwarningoptionsFromFfi(__resultHandle);
    } finally {
      sdkNavigationSpeedwarningoptionsReleaseFfiHandle(__resultHandle);

    }

  }

  /// Sets the speed warning options.
  ///
  /// [value] Options used for the speed warning feature.
  ///
  set speedWarningOptions(SpeedWarningOptions value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_speedWarningOptions_set__SpeedWarningOptions'));
    final _valueHandle = sdkNavigationSpeedwarningoptionsToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationSpeedwarningoptionsReleaseFfiHandle(_valueHandle);

  }


  /// Return true if tunnel extrapolation is enabled otherwise false.
  bool get isEnableTunnelExtrapolation {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_isEnableTunnelExtrapolation_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);

    }

  }

  /// Set to true to enable tunnel extrapolation, set to false to disable tunnel extrapolation.
  /// By default the tunnel extrapolation is enabled.
  ///
  /// [value] Defines whether to enable or disable tunnel extrapolation.
  ///
  set isEnableTunnelExtrapolation(bool value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint8), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_navigation_NavigatorInterface_isEnableTunnelExtrapolation_set__Boolean'));
    final _valueHandle = booleanToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    booleanReleaseFfiHandle(_valueHandle);

  }


  /// Return true if handling of passthrough waypoints is enabled, otherwise - false.
  bool get isPassthroughWaypointsHandlingEnabled {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_isPassthroughWaypointsHandlingEnabled_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);

    }

  }

  /// Set to true enables handling of passthrough waypoints, set to false disables handling of passthrough waypoints.
  ///
  /// [value] Defines whether to enable or disable handling of passthrough waypoints.
  /// By default the handling of passthrough waypoints is disabled.
  ///
  set isPassthroughWaypointsHandlingEnabled(bool value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint8), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_navigation_NavigatorInterface_isPassthroughWaypointsHandlingEnabled_set__Boolean'));
    final _valueHandle = booleanToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    booleanReleaseFfiHandle(_valueHandle);

  }



}

int _sdkNavigationNavigatorinterfaceonLocationUpdatedStatic(Object _obj, Pointer<Void> location) {

  try {
    (_obj as NavigatorInterface).onLocationUpdated(sdkCoreLocationFromFfi(location));
  } finally {
    sdkCoreLocationReleaseFfiHandle(location);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfacegetManeuverStatic(Object _obj, int index, Pointer<Pointer<Void>> _result) {
  Maneuver? _resultObject;
  try {
    _resultObject = (_obj as NavigatorInterface).getManeuver((index));
    _result.value = sdkRoutingManeuverToFfiNullable(_resultObject);
  } finally {
    
  }
  return 0;
}
int _sdkNavigationNavigatorinterfacegetManeuverNotificationTimingOptionsStatic(Object _obj, int transportMode, int roadType, Pointer<Pointer<Void>> _result) {
  ManeuverNotificationTimingOptions? _resultObject;
  try {
    _resultObject = (_obj as NavigatorInterface).getManeuverNotificationTimingOptions(sdkTransportTransportmodeFromFfi(transportMode), sdkRoutingRoadtypeFromFfi(roadType));
    _result.value = sdkNavigationManeuvernotificationtimingoptionsToFfi(_resultObject);
  } finally {
    sdkTransportTransportmodeReleaseFfiHandle(transportMode);
    sdkRoutingRoadtypeReleaseFfiHandle(roadType);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfacesetManeuverNotificationTimingOptionsStatic(Object _obj, int transportMode, int roadType, Pointer<Void> options, Pointer<Uint8> _result) {
  bool? _resultObject;
  try {
    _resultObject = (_obj as NavigatorInterface).setManeuverNotificationTimingOptions(sdkTransportTransportmodeFromFfi(transportMode), sdkRoutingRoadtypeFromFfi(roadType), sdkNavigationManeuvernotificationtimingoptionsFromFfi(options));
    _result.value = booleanToFfi(_resultObject);
  } finally {
    sdkTransportTransportmodeReleaseFfiHandle(transportMode);
    sdkRoutingRoadtypeReleaseFfiHandle(roadType);
    sdkNavigationManeuvernotificationtimingoptionsReleaseFfiHandle(options);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfacegetManeuverNotificationTimingOptionsWithTimingProfileStatic(Object _obj, int transportMode, int timingProfile, Pointer<Pointer<Void>> _result) {
  ManeuverNotificationTimingOptions? _resultObject;
  try {
    _resultObject = (_obj as NavigatorInterface).getManeuverNotificationTimingOptionsWithTimingProfile(sdkTransportTransportmodeFromFfi(transportMode), sdkNavigationTimingprofileFromFfi(timingProfile));
    _result.value = sdkNavigationManeuvernotificationtimingoptionsToFfi(_resultObject);
  } finally {
    sdkTransportTransportmodeReleaseFfiHandle(transportMode);
    sdkNavigationTimingprofileReleaseFfiHandle(timingProfile);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfacesetManeuverNotificationTimingOptionsWithTimingProfileStatic(Object _obj, int transportMode, int timingProfile, Pointer<Void> options, Pointer<Uint8> _result) {
  bool? _resultObject;
  try {
    _resultObject = (_obj as NavigatorInterface).setManeuverNotificationTimingOptionsWithTimingProfile(sdkTransportTransportmodeFromFfi(transportMode), sdkNavigationTimingprofileFromFfi(timingProfile), sdkNavigationManeuvernotificationtimingoptionsFromFfi(options));
    _result.value = booleanToFfi(_resultObject);
  } finally {
    sdkTransportTransportmodeReleaseFfiHandle(transportMode);
    sdkNavigationTimingprofileReleaseFfiHandle(timingProfile);
    sdkNavigationManeuvernotificationtimingoptionsReleaseFfiHandle(options);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfacerepeatLastManeuverNotificationStatic(Object _obj) {

  try {
    (_obj as NavigatorInterface).repeatLastManeuverNotification();
  } finally {
  }
  return 0;
}
int _sdkNavigationNavigatorinterfacecalculateRemainingDistanceInMetersStatic(Object _obj, Pointer<Void> coordinates, Pointer<Pointer<Void>> _result) {
  int? _resultObject;
  try {
    _resultObject = (_obj as NavigatorInterface).calculateRemainingDistanceInMeters(sdkCoreGeocoordinatesFromFfi(coordinates));
    _result.value = intToFfiNullable(_resultObject);
  } finally {
    sdkCoreGeocoordinatesReleaseFfiHandle(coordinates);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfacesetCustomOptionStatic(Object _obj, Pointer<Void> key, Pointer<Void> value) {

  try {
    (_obj as NavigatorInterface).setCustomOption(stringFromFfi(key), stringFromFfi(value));
  } finally {
    stringReleaseFfiHandle(key);
    stringReleaseFfiHandle(value);
  }
  return 0;
}

int _sdkNavigationNavigatorinterfacerouteGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkRoutingRouteToFfiNullable((_obj as NavigatorInterface).route);
  return 0;
}

int _sdkNavigationNavigatorinterfacerouteSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).route =
      sdkRoutingRouteFromFfiNullable(_value);
  } finally {
    sdkRoutingRouteReleaseFfiHandleNullable(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfacetrackingTransportProfileGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkCoreTransportprofileToFfiNullable((_obj as NavigatorInterface).trackingTransportProfile);
  return 0;
}

int _sdkNavigationNavigatorinterfacetrackingTransportProfileSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).trackingTransportProfile =
      sdkCoreTransportprofileFromFfiNullable(_value);
  } finally {
    sdkCoreTransportprofileReleaseFfiHandleNullable(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfacenavigableLocationListenerGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkNavigationNavigablelocationlistenerToFfiNullable((_obj as NavigatorInterface).navigableLocationListener);
  return 0;
}

int _sdkNavigationNavigatorinterfacenavigableLocationListenerSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).navigableLocationListener =
      sdkNavigationNavigablelocationlistenerFromFfiNullable(_value);
  } finally {
    sdkNavigationNavigablelocationlistenerReleaseFfiHandleNullable(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfacerouteProgressListenerGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkNavigationRouteprogresslistenerToFfiNullable((_obj as NavigatorInterface).routeProgressListener);
  return 0;
}

int _sdkNavigationNavigatorinterfacerouteProgressListenerSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).routeProgressListener =
      sdkNavigationRouteprogresslistenerFromFfiNullable(_value);
  } finally {
    sdkNavigationRouteprogresslistenerReleaseFfiHandleNullable(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfacerouteDeviationListenerGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkNavigationRoutedeviationlistenerToFfiNullable((_obj as NavigatorInterface).routeDeviationListener);
  return 0;
}

int _sdkNavigationNavigatorinterfacerouteDeviationListenerSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).routeDeviationListener =
      sdkNavigationRoutedeviationlistenerFromFfiNullable(_value);
  } finally {
    sdkNavigationRoutedeviationlistenerReleaseFfiHandleNullable(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfacemaneuverNotificationListenerGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkNavigationManeuvernotificationlistenerToFfiNullable((_obj as NavigatorInterface).maneuverNotificationListener);
  return 0;
}

int _sdkNavigationNavigatorinterfacemaneuverNotificationListenerSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).maneuverNotificationListener =
      sdkNavigationManeuvernotificationlistenerFromFfiNullable(_value);
  } finally {
    sdkNavigationManeuvernotificationlistenerReleaseFfiHandleNullable(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfaceeventTextListenerGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkNavigationEventtextlistenerToFfiNullable((_obj as NavigatorInterface).eventTextListener);
  return 0;
}

int _sdkNavigationNavigatorinterfaceeventTextListenerSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).eventTextListener =
      sdkNavigationEventtextlistenerFromFfiNullable(_value);
  } finally {
    sdkNavigationEventtextlistenerReleaseFfiHandleNullable(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfacemilestoneStatusListenerGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkNavigationMilestonestatuslistenerToFfiNullable((_obj as NavigatorInterface).milestoneStatusListener);
  return 0;
}

int _sdkNavigationNavigatorinterfacemilestoneStatusListenerSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).milestoneStatusListener =
      sdkNavigationMilestonestatuslistenerFromFfiNullable(_value);
  } finally {
    sdkNavigationMilestonestatuslistenerReleaseFfiHandleNullable(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfacedestinationReachedListenerGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkNavigationDestinationreachedlistenerToFfiNullable((_obj as NavigatorInterface).destinationReachedListener);
  return 0;
}

int _sdkNavigationNavigatorinterfacedestinationReachedListenerSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).destinationReachedListener =
      sdkNavigationDestinationreachedlistenerFromFfiNullable(_value);
  } finally {
    sdkNavigationDestinationreachedlistenerReleaseFfiHandleNullable(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfacespeedWarningListenerGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkNavigationSpeedwarninglistenerToFfiNullable((_obj as NavigatorInterface).speedWarningListener);
  return 0;
}

int _sdkNavigationNavigatorinterfacespeedWarningListenerSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).speedWarningListener =
      sdkNavigationSpeedwarninglistenerFromFfiNullable(_value);
  } finally {
    sdkNavigationSpeedwarninglistenerReleaseFfiHandleNullable(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfacemaneuverViewLaneAssistanceListenerGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkNavigationManeuverviewlaneassistancelistenerToFfiNullable((_obj as NavigatorInterface).maneuverViewLaneAssistanceListener);
  return 0;
}

int _sdkNavigationNavigatorinterfacemaneuverViewLaneAssistanceListenerSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).maneuverViewLaneAssistanceListener =
      sdkNavigationManeuverviewlaneassistancelistenerFromFfiNullable(_value);
  } finally {
    sdkNavigationManeuverviewlaneassistancelistenerReleaseFfiHandleNullable(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfacecurrentSituationLaneAssistanceViewListenerGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkNavigationCurrentsituationlaneassistanceviewlistenerToFfiNullable((_obj as NavigatorInterface).currentSituationLaneAssistanceViewListener);
  return 0;
}

int _sdkNavigationNavigatorinterfacecurrentSituationLaneAssistanceViewListenerSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).currentSituationLaneAssistanceViewListener =
      sdkNavigationCurrentsituationlaneassistanceviewlistenerFromFfiNullable(_value);
  } finally {
    sdkNavigationCurrentsituationlaneassistanceviewlistenerReleaseFfiHandleNullable(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfaceenvironmentalZoneWarningListenerGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkNavigationEnvironmentalzonewarninglistenerToFfiNullable((_obj as NavigatorInterface).environmentalZoneWarningListener);
  return 0;
}

int _sdkNavigationNavigatorinterfaceenvironmentalZoneWarningListenerSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).environmentalZoneWarningListener =
      sdkNavigationEnvironmentalzonewarninglistenerFromFfiNullable(_value);
  } finally {
    sdkNavigationEnvironmentalzonewarninglistenerReleaseFfiHandleNullable(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfaceenvironmentalZoneWarningOptionsGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkNavigationEnvironmentalzonewarningoptionsToFfi((_obj as NavigatorInterface).environmentalZoneWarningOptions);
  return 0;
}

int _sdkNavigationNavigatorinterfaceenvironmentalZoneWarningOptionsSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).environmentalZoneWarningOptions =
      sdkNavigationEnvironmentalzonewarningoptionsFromFfi(_value);
  } finally {
    sdkNavigationEnvironmentalzonewarningoptionsReleaseFfiHandle(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfacejunctionViewLaneAssistanceListenerGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkNavigationJunctionviewlaneassistancelistenerToFfiNullable((_obj as NavigatorInterface).junctionViewLaneAssistanceListener);
  return 0;
}

int _sdkNavigationNavigatorinterfacejunctionViewLaneAssistanceListenerSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).junctionViewLaneAssistanceListener =
      sdkNavigationJunctionviewlaneassistancelistenerFromFfiNullable(_value);
  } finally {
    sdkNavigationJunctionviewlaneassistancelistenerReleaseFfiHandleNullable(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfacesafetyCameraWarningListenerGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkNavigationSafetycamerawarninglistenerToFfiNullable((_obj as NavigatorInterface).safetyCameraWarningListener);
  return 0;
}

int _sdkNavigationNavigatorinterfacesafetyCameraWarningListenerSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).safetyCameraWarningListener =
      sdkNavigationSafetycamerawarninglistenerFromFfiNullable(_value);
  } finally {
    sdkNavigationSafetycamerawarninglistenerReleaseFfiHandleNullable(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfacesafetyCameraWarningOptionsGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkNavigationSafetycamerawarningoptionsToFfi((_obj as NavigatorInterface).safetyCameraWarningOptions);
  return 0;
}

int _sdkNavigationNavigatorinterfacesafetyCameraWarningOptionsSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).safetyCameraWarningOptions =
      sdkNavigationSafetycamerawarningoptionsFromFfi(_value);
  } finally {
    sdkNavigationSafetycamerawarningoptionsReleaseFfiHandle(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfacedangerZoneWarningListenerGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkNavigationDangerzonewarninglistenerToFfiNullable((_obj as NavigatorInterface).dangerZoneWarningListener);
  return 0;
}

int _sdkNavigationNavigatorinterfacedangerZoneWarningListenerSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).dangerZoneWarningListener =
      sdkNavigationDangerzonewarninglistenerFromFfiNullable(_value);
  } finally {
    sdkNavigationDangerzonewarninglistenerReleaseFfiHandleNullable(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfacedangerZoneWarningOptionsGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkNavigationDangerzonewarningoptionsToFfi((_obj as NavigatorInterface).dangerZoneWarningOptions);
  return 0;
}

int _sdkNavigationNavigatorinterfacedangerZoneWarningOptionsSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).dangerZoneWarningOptions =
      sdkNavigationDangerzonewarningoptionsFromFfi(_value);
  } finally {
    sdkNavigationDangerzonewarningoptionsReleaseFfiHandle(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfacetruckRestrictionsWarningListenerGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkNavigationTruckrestrictionswarninglistenerToFfiNullable((_obj as NavigatorInterface).truckRestrictionsWarningListener);
  return 0;
}

int _sdkNavigationNavigatorinterfacetruckRestrictionsWarningListenerSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).truckRestrictionsWarningListener =
      sdkNavigationTruckrestrictionswarninglistenerFromFfiNullable(_value);
  } finally {
    sdkNavigationTruckrestrictionswarninglistenerReleaseFfiHandleNullable(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfacetruckRestrictionsWarningOptionsGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkNavigationTruckrestrictionswarningoptionsToFfi((_obj as NavigatorInterface).truckRestrictionsWarningOptions);
  return 0;
}

int _sdkNavigationNavigatorinterfacetruckRestrictionsWarningOptionsSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).truckRestrictionsWarningOptions =
      sdkNavigationTruckrestrictionswarningoptionsFromFfi(_value);
  } finally {
    sdkNavigationTruckrestrictionswarningoptionsReleaseFfiHandle(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfacepostActionListenerGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkNavigationPostactionlistenerToFfiNullable((_obj as NavigatorInterface).postActionListener);
  return 0;
}

int _sdkNavigationNavigatorinterfacepostActionListenerSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).postActionListener =
      sdkNavigationPostactionlistenerFromFfiNullable(_value);
  } finally {
    sdkNavigationPostactionlistenerReleaseFfiHandleNullable(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfacespeedLimitListenerGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkNavigationSpeedlimitlistenerToFfiNullable((_obj as NavigatorInterface).speedLimitListener);
  return 0;
}

int _sdkNavigationNavigatorinterfacespeedLimitListenerSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).speedLimitListener =
      sdkNavigationSpeedlimitlistenerFromFfiNullable(_value);
  } finally {
    sdkNavigationSpeedlimitlistenerReleaseFfiHandleNullable(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfaceroadTextsListenerGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkNavigationRoadtextslistenerToFfiNullable((_obj as NavigatorInterface).roadTextsListener);
  return 0;
}

int _sdkNavigationNavigatorinterfaceroadTextsListenerSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).roadTextsListener =
      sdkNavigationRoadtextslistenerFromFfiNullable(_value);
  } finally {
    sdkNavigationRoadtextslistenerReleaseFfiHandleNullable(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfaceroadAttributesListenerGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkNavigationRoadattributeslistenerToFfiNullable((_obj as NavigatorInterface).roadAttributesListener);
  return 0;
}

int _sdkNavigationNavigatorinterfaceroadAttributesListenerSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).roadAttributesListener =
      sdkNavigationRoadattributeslistenerFromFfiNullable(_value);
  } finally {
    sdkNavigationRoadattributeslistenerReleaseFfiHandleNullable(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfacespatialManeuverNotificationListenerGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkNavigationSpatialmaneuvernotificationlistenerToFfiNullable((_obj as NavigatorInterface).spatialManeuverNotificationListener);
  return 0;
}

int _sdkNavigationNavigatorinterfacespatialManeuverNotificationListenerSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).spatialManeuverNotificationListener =
      sdkNavigationSpatialmaneuvernotificationlistenerFromFfiNullable(_value);
  } finally {
    sdkNavigationSpatialmaneuvernotificationlistenerReleaseFfiHandleNullable(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfacespatialManeuverAzimuthListenerGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkNavigationSpatialmaneuverazimuthlistenerToFfiNullable((_obj as NavigatorInterface).spatialManeuverAzimuthListener);
  return 0;
}

int _sdkNavigationNavigatorinterfacespatialManeuverAzimuthListenerSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).spatialManeuverAzimuthListener =
      sdkNavigationSpatialmaneuverazimuthlistenerFromFfiNullable(_value);
  } finally {
    sdkNavigationSpatialmaneuverazimuthlistenerReleaseFfiHandleNullable(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfaceroadSignWarningListenerGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkNavigationRoadsignwarninglistenerToFfiNullable((_obj as NavigatorInterface).roadSignWarningListener);
  return 0;
}

int _sdkNavigationNavigatorinterfaceroadSignWarningListenerSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).roadSignWarningListener =
      sdkNavigationRoadsignwarninglistenerFromFfiNullable(_value);
  } finally {
    sdkNavigationRoadsignwarninglistenerReleaseFfiHandleNullable(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfaceroadSignWarningOptionsGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkNavigationRoadsignwarningoptionsToFfi((_obj as NavigatorInterface).roadSignWarningOptions);
  return 0;
}

int _sdkNavigationNavigatorinterfaceroadSignWarningOptionsSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).roadSignWarningOptions =
      sdkNavigationRoadsignwarningoptionsFromFfi(_value);
  } finally {
    sdkNavigationRoadsignwarningoptionsReleaseFfiHandle(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfaceschoolZoneWarningListenerGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkNavigationSchoolzonewarninglistenerToFfiNullable((_obj as NavigatorInterface).schoolZoneWarningListener);
  return 0;
}

int _sdkNavigationNavigatorinterfaceschoolZoneWarningListenerSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).schoolZoneWarningListener =
      sdkNavigationSchoolzonewarninglistenerFromFfiNullable(_value);
  } finally {
    sdkNavigationSchoolzonewarninglistenerReleaseFfiHandleNullable(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfaceschoolZoneWarningOptionsGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkNavigationSchoolzonewarningoptionsToFfi((_obj as NavigatorInterface).schoolZoneWarningOptions);
  return 0;
}

int _sdkNavigationNavigatorinterfaceschoolZoneWarningOptionsSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).schoolZoneWarningOptions =
      sdkNavigationSchoolzonewarningoptionsFromFfi(_value);
  } finally {
    sdkNavigationSchoolzonewarningoptionsReleaseFfiHandle(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfacerealisticViewWarningListenerGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkNavigationRealisticviewwarninglistenerToFfiNullable((_obj as NavigatorInterface).realisticViewWarningListener);
  return 0;
}

int _sdkNavigationNavigatorinterfacerealisticViewWarningListenerSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).realisticViewWarningListener =
      sdkNavigationRealisticviewwarninglistenerFromFfiNullable(_value);
  } finally {
    sdkNavigationRealisticviewwarninglistenerReleaseFfiHandleNullable(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfacerealisticViewWarningOptionsGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkNavigationRealisticviewwarningoptionsToFfi((_obj as NavigatorInterface).realisticViewWarningOptions);
  return 0;
}

int _sdkNavigationNavigatorinterfacerealisticViewWarningOptionsSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).realisticViewWarningOptions =
      sdkNavigationRealisticviewwarningoptionsFromFfi(_value);
  } finally {
    sdkNavigationRealisticviewwarningoptionsReleaseFfiHandle(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfaceborderCrossingWarningListenerGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkNavigationBordercrossingwarninglistenerToFfiNullable((_obj as NavigatorInterface).borderCrossingWarningListener);
  return 0;
}

int _sdkNavigationNavigatorinterfaceborderCrossingWarningListenerSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).borderCrossingWarningListener =
      sdkNavigationBordercrossingwarninglistenerFromFfiNullable(_value);
  } finally {
    sdkNavigationBordercrossingwarninglistenerReleaseFfiHandleNullable(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfaceborderCrossingWarningOptionsGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkNavigationBordercrossingwarningoptionsToFfi((_obj as NavigatorInterface).borderCrossingWarningOptions);
  return 0;
}

int _sdkNavigationNavigatorinterfaceborderCrossingWarningOptionsSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).borderCrossingWarningOptions =
      sdkNavigationBordercrossingwarningoptionsFromFfi(_value);
  } finally {
    sdkNavigationBordercrossingwarningoptionsReleaseFfiHandle(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfacetollStopWarningListenerGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkNavigationTollstopwarninglistenerToFfiNullable((_obj as NavigatorInterface).tollStopWarningListener);
  return 0;
}

int _sdkNavigationNavigatorinterfacetollStopWarningListenerSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).tollStopWarningListener =
      sdkNavigationTollstopwarninglistenerFromFfiNullable(_value);
  } finally {
    sdkNavigationTollstopwarninglistenerReleaseFfiHandleNullable(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfacetollStopWarningOptionsGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkNavigationTollstopwarningoptionsToFfi((_obj as NavigatorInterface).tollStopWarningOptions);
  return 0;
}

int _sdkNavigationNavigatorinterfacetollStopWarningOptionsSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).tollStopWarningOptions =
      sdkNavigationTollstopwarningoptionsFromFfi(_value);
  } finally {
    sdkNavigationTollstopwarningoptionsReleaseFfiHandle(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfacerailwayCrossingWarningListenerGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkNavigationRailwaycrossingwarninglistenerToFfiNullable((_obj as NavigatorInterface).railwayCrossingWarningListener);
  return 0;
}

int _sdkNavigationNavigatorinterfacerailwayCrossingWarningListenerSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).railwayCrossingWarningListener =
      sdkNavigationRailwaycrossingwarninglistenerFromFfiNullable(_value);
  } finally {
    sdkNavigationRailwaycrossingwarninglistenerReleaseFfiHandleNullable(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfacerailwayCrossingWarningOptionsGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkNavigationRailwaycrossingwarningoptionsToFfi((_obj as NavigatorInterface).railwayCrossingWarningOptions);
  return 0;
}

int _sdkNavigationNavigatorinterfacerailwayCrossingWarningOptionsSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).railwayCrossingWarningOptions =
      sdkNavigationRailwaycrossingwarningoptionsFromFfi(_value);
  } finally {
    sdkNavigationRailwaycrossingwarningoptionsReleaseFfiHandle(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfacelowSpeedZoneWarningListenerGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkNavigationLowspeedzonewarninglistenerToFfiNullable((_obj as NavigatorInterface).lowSpeedZoneWarningListener);
  return 0;
}

int _sdkNavigationNavigatorinterfacelowSpeedZoneWarningListenerSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).lowSpeedZoneWarningListener =
      sdkNavigationLowspeedzonewarninglistenerFromFfiNullable(_value);
  } finally {
    sdkNavigationLowspeedzonewarninglistenerReleaseFfiHandleNullable(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfacelowSpeedZoneWarningOptionsGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkNavigationLowspeedzonewarningoptionsToFfi((_obj as NavigatorInterface).lowSpeedZoneWarningOptions);
  return 0;
}

int _sdkNavigationNavigatorinterfacelowSpeedZoneWarningOptionsSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).lowSpeedZoneWarningOptions =
      sdkNavigationLowspeedzonewarningoptionsFromFfi(_value);
  } finally {
    sdkNavigationLowspeedzonewarningoptionsReleaseFfiHandle(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfaceoffRoadDestinationReachedListenerGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkNavigationOffroaddestinationreachedlistenerToFfiNullable((_obj as NavigatorInterface).offRoadDestinationReachedListener);
  return 0;
}

int _sdkNavigationNavigatorinterfaceoffRoadDestinationReachedListenerSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).offRoadDestinationReachedListener =
      sdkNavigationOffroaddestinationreachedlistenerFromFfiNullable(_value);
  } finally {
    sdkNavigationOffroaddestinationreachedlistenerReleaseFfiHandleNullable(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfaceoffRoadProgressListenerGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkNavigationOffroadprogresslistenerToFfiNullable((_obj as NavigatorInterface).offRoadProgressListener);
  return 0;
}

int _sdkNavigationNavigatorinterfaceoffRoadProgressListenerSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).offRoadProgressListener =
      sdkNavigationOffroadprogresslistenerFromFfiNullable(_value);
  } finally {
    sdkNavigationOffroadprogresslistenerReleaseFfiHandleNullable(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfacemaneuverNotificationOptionsGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkNavigationManeuvernotificationoptionsToFfi((_obj as NavigatorInterface).maneuverNotificationOptions);
  return 0;
}

int _sdkNavigationNavigatorinterfacemaneuverNotificationOptionsSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).maneuverNotificationOptions =
      sdkNavigationManeuvernotificationoptionsFromFfi(_value);
  } finally {
    sdkNavigationManeuvernotificationoptionsReleaseFfiHandle(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfaceeventTextOptionsGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkNavigationEventtextoptionsToFfi((_obj as NavigatorInterface).eventTextOptions);
  return 0;
}

int _sdkNavigationNavigatorinterfaceeventTextOptionsSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).eventTextOptions =
      sdkNavigationEventtextoptionsFromFfi(_value);
  } finally {
    sdkNavigationEventtextoptionsReleaseFfiHandle(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfacespeedWarningOptionsGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkNavigationSpeedwarningoptionsToFfi((_obj as NavigatorInterface).speedWarningOptions);
  return 0;
}

int _sdkNavigationNavigatorinterfacespeedWarningOptionsSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).speedWarningOptions =
      sdkNavigationSpeedwarningoptionsFromFfi(_value);
  } finally {
    sdkNavigationSpeedwarningoptionsReleaseFfiHandle(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfaceisEnableTunnelExtrapolationGetStatic(Object _obj, Pointer<Uint8> _result) {
  _result.value = booleanToFfi((_obj as NavigatorInterface).isEnableTunnelExtrapolation);
  return 0;
}

int _sdkNavigationNavigatorinterfaceisEnableTunnelExtrapolationSetStatic(Object _obj, int _value) {
  try {
    (_obj as NavigatorInterface).isEnableTunnelExtrapolation =
      booleanFromFfi(_value);
  } finally {
    booleanReleaseFfiHandle(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfaceisPassthroughWaypointsHandlingEnabledGetStatic(Object _obj, Pointer<Uint8> _result) {
  _result.value = booleanToFfi((_obj as NavigatorInterface).isPassthroughWaypointsHandlingEnabled);
  return 0;
}

int _sdkNavigationNavigatorinterfaceisPassthroughWaypointsHandlingEnabledSetStatic(Object _obj, int _value) {
  try {
    (_obj as NavigatorInterface).isPassthroughWaypointsHandlingEnabled =
      booleanFromFfi(_value);
  } finally {
    booleanReleaseFfiHandle(_value);
  }
  return 0;
}

Pointer<Void> sdkNavigationNavigatorinterfaceToFfi(NavigatorInterface value) {
  if (value is __lib.NativeBase) return _sdkNavigationNavigatorinterfaceCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkNavigationNavigatorinterfaceCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfaceonLocationUpdatedStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Int32, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfacegetManeuverStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Uint32, Uint32, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfacegetManeuverNotificationTimingOptionsStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Uint32, Uint32, Pointer<Void>, Pointer<Uint8>)>(_sdkNavigationNavigatorinterfacesetManeuverNotificationTimingOptionsStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Uint32, Uint32, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfacegetManeuverNotificationTimingOptionsWithTimingProfileStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Uint32, Uint32, Pointer<Void>, Pointer<Uint8>)>(_sdkNavigationNavigatorinterfacesetManeuverNotificationTimingOptionsWithTimingProfileStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle)>(_sdkNavigationNavigatorinterfacerepeatLastManeuverNotificationStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfacecalculateRemainingDistanceInMetersStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>, Pointer<Void>)>(_sdkNavigationNavigatorinterfacesetCustomOptionStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfacerouteGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfacerouteSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfacetrackingTransportProfileGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfacetrackingTransportProfileSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfacenavigableLocationListenerGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfacenavigableLocationListenerSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfacerouteProgressListenerGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfacerouteProgressListenerSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfacerouteDeviationListenerGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfacerouteDeviationListenerSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfacemaneuverNotificationListenerGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfacemaneuverNotificationListenerSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfaceeventTextListenerGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfaceeventTextListenerSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfacemilestoneStatusListenerGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfacemilestoneStatusListenerSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfacedestinationReachedListenerGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfacedestinationReachedListenerSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfacespeedWarningListenerGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfacespeedWarningListenerSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfacemaneuverViewLaneAssistanceListenerGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfacemaneuverViewLaneAssistanceListenerSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfacecurrentSituationLaneAssistanceViewListenerGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfacecurrentSituationLaneAssistanceViewListenerSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfaceenvironmentalZoneWarningListenerGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfaceenvironmentalZoneWarningListenerSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfaceenvironmentalZoneWarningOptionsGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfaceenvironmentalZoneWarningOptionsSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfacejunctionViewLaneAssistanceListenerGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfacejunctionViewLaneAssistanceListenerSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfacesafetyCameraWarningListenerGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfacesafetyCameraWarningListenerSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfacesafetyCameraWarningOptionsGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfacesafetyCameraWarningOptionsSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfacedangerZoneWarningListenerGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfacedangerZoneWarningListenerSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfacedangerZoneWarningOptionsGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfacedangerZoneWarningOptionsSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfacetruckRestrictionsWarningListenerGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfacetruckRestrictionsWarningListenerSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfacetruckRestrictionsWarningOptionsGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfacetruckRestrictionsWarningOptionsSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfacepostActionListenerGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfacepostActionListenerSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfacespeedLimitListenerGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfacespeedLimitListenerSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfaceroadTextsListenerGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfaceroadTextsListenerSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfaceroadAttributesListenerGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfaceroadAttributesListenerSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfacespatialManeuverNotificationListenerGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfacespatialManeuverNotificationListenerSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfacespatialManeuverAzimuthListenerGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfacespatialManeuverAzimuthListenerSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfaceroadSignWarningListenerGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfaceroadSignWarningListenerSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfaceroadSignWarningOptionsGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfaceroadSignWarningOptionsSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfaceschoolZoneWarningListenerGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfaceschoolZoneWarningListenerSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfaceschoolZoneWarningOptionsGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfaceschoolZoneWarningOptionsSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfacerealisticViewWarningListenerGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfacerealisticViewWarningListenerSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfacerealisticViewWarningOptionsGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfacerealisticViewWarningOptionsSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfaceborderCrossingWarningListenerGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfaceborderCrossingWarningListenerSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfaceborderCrossingWarningOptionsGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfaceborderCrossingWarningOptionsSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfacetollStopWarningListenerGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfacetollStopWarningListenerSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfacetollStopWarningOptionsGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfacetollStopWarningOptionsSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfacerailwayCrossingWarningListenerGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfacerailwayCrossingWarningListenerSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfacerailwayCrossingWarningOptionsGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfacerailwayCrossingWarningOptionsSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfacelowSpeedZoneWarningListenerGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfacelowSpeedZoneWarningListenerSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfacelowSpeedZoneWarningOptionsGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfacelowSpeedZoneWarningOptionsSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfaceoffRoadDestinationReachedListenerGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfaceoffRoadDestinationReachedListenerSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfaceoffRoadProgressListenerGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfaceoffRoadProgressListenerSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfacemaneuverNotificationOptionsGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfacemaneuverNotificationOptionsSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfaceeventTextOptionsGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfaceeventTextOptionsSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfacespeedWarningOptionsGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfacespeedWarningOptionsSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Uint8>)>(_sdkNavigationNavigatorinterfaceisEnableTunnelExtrapolationGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Uint8)>(_sdkNavigationNavigatorinterfaceisEnableTunnelExtrapolationSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Uint8>)>(_sdkNavigationNavigatorinterfaceisPassthroughWaypointsHandlingEnabledGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Uint8)>(_sdkNavigationNavigatorinterfaceisPassthroughWaypointsHandlingEnabledSetStatic, __lib.unknownError)
  );

  return result;
}

NavigatorInterface sdkNavigationNavigatorinterfaceFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is NavigatorInterface) return instance;

  final _typeIdHandle = _sdkNavigationNavigatorinterfaceGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkNavigationNavigatorinterfaceCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : NavigatorInterface$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkNavigationNavigatorinterfaceRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkNavigationNavigatorinterfaceReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkNavigationNavigatorinterfaceReleaseHandle(handle);

Pointer<Void> sdkNavigationNavigatorinterfaceToFfiNullable(NavigatorInterface? value) =>
  value != null ? sdkNavigationNavigatorinterfaceToFfi(value) : Pointer<Void>.fromAddress(0);

NavigatorInterface? sdkNavigationNavigatorinterfaceFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkNavigationNavigatorinterfaceFromFfi(handle) : null;

void sdkNavigationNavigatorinterfaceReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationNavigatorinterfaceReleaseHandle(handle);

// End of NavigatorInterface "private" section.


