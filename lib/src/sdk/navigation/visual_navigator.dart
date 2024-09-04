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
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/engine/s_d_k_native_engine.dart';
import 'package:here_sdk/src/sdk/core/errors/instantiation_error_code.dart';
import 'package:here_sdk/src/sdk/core/errors/instantiation_exception.dart';
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';
import 'package:here_sdk/src/sdk/core/language_code.dart';
import 'package:here_sdk/src/sdk/core/location.dart';
import 'package:here_sdk/src/sdk/core/location_impl.dart' as location_impl;
import 'package:here_sdk/src/sdk/core/transport_profile.dart';
import 'package:here_sdk/src/sdk/mapview/location_indicator.dart';
import 'package:here_sdk/src/sdk/mapview/map_measure.dart';
import 'package:here_sdk/src/sdk/mapview/map_view_base.dart';
import 'package:here_sdk/src/sdk/navigation/border_crossing_warning_listener.dart';
import 'package:here_sdk/src/sdk/navigation/border_crossing_warning_options.dart';
import 'package:here_sdk/src/sdk/navigation/camera_behavior.dart';
import 'package:here_sdk/src/sdk/navigation/current_situation_lane_assistance_view_listener.dart';
import 'package:here_sdk/src/sdk/navigation/danger_zone_warning_listener.dart';
import 'package:here_sdk/src/sdk/navigation/danger_zone_warning_options.dart';
import 'package:here_sdk/src/sdk/navigation/destination_reached_listener.dart';
import 'package:here_sdk/src/sdk/navigation/environmental_zone_warning_listener.dart';
import 'package:here_sdk/src/sdk/navigation/environmental_zone_warning_options.dart';
import 'package:here_sdk/src/sdk/navigation/event_text_listener.dart';
import 'package:here_sdk/src/sdk/navigation/event_text_options.dart';
import 'package:here_sdk/src/sdk/navigation/interpolated_location_listener.dart';
import 'package:here_sdk/src/sdk/navigation/junction_view_lane_assistance_listener.dart';
import 'package:here_sdk/src/sdk/navigation/low_speed_zone_warning_listener.dart';
import 'package:here_sdk/src/sdk/navigation/low_speed_zone_warning_options.dart';
import 'package:here_sdk/src/sdk/navigation/maneuver_notification_listener.dart';
import 'package:here_sdk/src/sdk/navigation/maneuver_notification_options.dart';
import 'package:here_sdk/src/sdk/navigation/maneuver_notification_timing_options.dart';
import 'package:here_sdk/src/sdk/navigation/maneuver_view_lane_assistance_listener.dart';
import 'package:here_sdk/src/sdk/navigation/milestone_status_listener.dart';
import 'package:here_sdk/src/sdk/navigation/navigable_location_listener.dart';
import 'package:here_sdk/src/sdk/navigation/navigator_interface.dart';
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
import 'package:here_sdk/src/sdk/navigation/visual_navigator_colors.dart';
import 'package:here_sdk/src/sdk/routing/maneuver.dart';
import 'package:here_sdk/src/sdk/routing/road_type.dart';
import 'package:here_sdk/src/sdk/routing/route.dart';
import 'package:here_sdk/src/sdk/transport/transport_mode.dart';
import 'package:meta/meta.dart';

/// This class provides all functionality of [NavigatorInterface].
///
/// In addition,
/// it provides advanced rendering capabilities for a smooth navigation experience.
/// This includes interpolation of location updates along a route during turn-by-turn navigation
/// and during tracking mode. By default, suitable map view settings are automatically applied.
/// For example, a predefined current location marker is rendered.
/// Similar to [Navigator], this class continuously reacts to new locations
/// provided from a location source and acts as a [LocationListener].
abstract class VisualNavigator implements NavigatorInterface {
  /// Creates a new instance of this class.
  ///
  /// Throws [InstantiationException]. [InstantiationException] when operation fails.
  ///
  factory VisualNavigator() => $prototype.$init();
  /// Creates a new instance of this class.
  ///
  /// [sdkEngine] An SDKEngine instance.
  ///
  /// Throws [InstantiationException]. [InstantiationException] when operation fails.
  ///
  factory VisualNavigator.withSdkEngine(SDKNativeEngine sdkEngine) => $prototype.withSdkEngine(sdkEngine);

  /// Returns the list of languages for maneuver notification currently available in the SDK.
  ///
  /// Returns [List<LanguageCode>]. the list of languages for maneuver notification currently available in the SDK.
  ///
  static List<LanguageCode> getAvailableLanguagesForManeuverNotifications() => $prototype.getAvailableLanguagesForManeuverNotifications();
  /// Starts visual navigation rendering.
  ///
  /// A preconfigured current location marker is shown as soon as a location is received.
  /// The marker is chosen according to the transport mode specified in the route. If no route is
  /// present, the marker is chosen based on the [NavigatorInterface.trackingTransportProfile] property.
  /// Calling startRendering() changes the [MapCamera.principalPoint] property so that the current
  /// position indicator is equal to the value from [CameraBehavior.normalizedPrincipalPoint],
  /// in which by default places the principal point slightly at the bottom of the mapview. It is
  /// restored to its original value when stopRendering() is called.
  /// **Note:** When rendering is started again for a new map view instance, rendering
  /// is automatically stopped on the previous map view instance. Also note that
  /// the [MapViewBase.frameRate] can be lowered to reduce CPU usage, to adjust for tradeoffs
  /// between rendering smoothness versus battery consumption.
  ///
  /// [mapView] The map view on which visual navigation will take place.
  ///
  void startRendering(MapViewBase mapView);
  /// Stops visual navigation rendering.
  ///
  /// This removes the current location marker. Other
  /// settings, like map orientation or camera distance, which may have been altered during rendering
  /// are no longer updated.
  ///
  void stopRendering();
  /// Retrieves a dictionary of default route and maneuver arrow widths as a function of [MapMeasure]s.
  ///
  /// Returns [Map<MapMeasure, double>]. A dictionary of default route and maneuver arrow widths as a function of [MapMeasure]s.
  ///
  static Map<MapMeasure, double> defaultRouteManeuverArrowMeasureDependentWidths() => $prototype.defaultRouteManeuverArrowMeasureDependentWidths();
  /// Gets the currently set camera behavior.
  CameraBehavior? get cameraBehavior;
  /// Sets how the VisualNavigator handles the camera.
  /// Setting `null` disables any camera behavior with the result that the camera does not follow
  /// the current location and keeps the last active camera state, i.e., current zoom and tilt.
  /// Furthermore, when `null` is set map gestures can be used again to freely pan and zoom
  /// the map. In opposition, when a camera behavior is defined, then the map cannot be panned and
  /// zoomed by the user. Defaults to an instance of [FixedCameraBehavior].
  set cameraBehavior(CameraBehavior? value);

  /// Gets the current state of route rendering during visual navigation.
  bool get isRouteVisible;
  /// Sets whether to perform route rendering during visual navigation.
  /// When enabled, the set `Route` will be rendered as a `MapPolyline` together with `MapArrow` items that
  /// indicate the next turns. By default, it is enabled.
  /// When disabled, `MapArrow` items are still rendered. To hide arrows, use `VisualNavigatorColors` with
  /// transparent color.
  set isRouteVisible(bool value);

  /// Gets the current state of route progress during visual navigation.
  bool get isRouteProgressVisible;
  /// Sets whether to perform route progress coloring ("eat-up") during visual navigation.
  /// By default, it is enabled.
  set isRouteProgressVisible(bool value);

  /// Gets the current state of maneuver arrow rendering during visual navigation.
  bool get isManeuverArrowsVisible;
  /// Sets whether to perform maneuver arrow rendering during visual navigation.
  /// By default, it is enabled.
  set isManeuverArrowsVisible(bool value);

  /// Gets the current state of off-road destination visualization during visual navigation.
  bool get isOffRoadDestinationVisible;
  /// Sets whether to show a dashed line between the map-matched and the original destination
  /// which is off-road. By default enabled.
  set isOffRoadDestinationVisible(bool value);

  /// Gets the currently set `LocationIndicator`.
  LocationIndicator? get customLocationIndicator;
  /// Sets a custom [LocationIndicator], so that [VisualNavigator] uses the provided one instead
  /// of the default. If set, the user is responsible for adding and removing the object to/from the mapview.
  /// It is important to stop sending location updates to the provided [LocationIndicator], since
  /// [VisualNavigator] will control its position when rendering is active, i.e., between startRendering() and
  /// stopRendering() calls. Defaults to `null`,
  /// which means the default indicator is used, and [VisualNavigator] automatically adds and removes it to/from
  /// the mapview upon startRendering() and stopRendering() calls.
  set customLocationIndicator(LocationIndicator? value);

  /// Gets the listener that receives interpolated locations.
  /// For example, to pan a second instance of a
  /// [MapViewBase] or move additional markers smoothly. The map-matched locations are
  /// used if available, otherwise the non-map-matched ones are used instead.
  InterpolatedLocationListener? get interpolatedLocationListener;
  /// Sets the listener that receives interpolated locations.
  /// Defaults to `null`.
  set interpolatedLocationListener(InterpolatedLocationListener? value);

  /// Returns a value indicating whether visual navigation rendering is enabled.
  bool get isRendering;

  /// Gets an object containing colors used to render route progress and maneuver arrow visualization.
  VisualNavigatorColors get colors;
  /// Sets an object containing colors used to render route progress and maneuver arrow visualization.
  /// Setting a new instance overwrites the default color settings as specified in `VisualNavigatorColors`.
  set colors(VisualNavigatorColors value);

  /// Gets the [MapMeasure] dependent polyline and maneuver arrow width in pixels.
  /// This route and maneuver arrows width is multiplied by a pixel_scale [sdk.mapview.MapViewBase.pixel_scale]
  /// before being rendered. The maneuver arrow width is additionally multiplied by a factor configurable with
  /// [VisualNavigator.maneuverArrowWidthFactor]; which by default equals one.
  /// The function defined by a dictionary is linearly interpolated between each successive
  /// pair of data points. For keys below the lowest [MapMeasure], its corresponding value width is used.
  /// For keys above the highest [MapMeasure], its corresponding value width is used
  /// If route and maneuver arrows were not configured with this property,
  /// then `measureDependentWidth` contains predefined values chosen to be optimal for different route classes.
  /// Note: This is a beta release of this feature, so there could be a few bugs and unexpected
  /// behavior. Related APIs may change for new releases without a deprecation process.
  Map<MapMeasure, double> get measureDependentWidth;
  /// Sets the [MapMeasure] dependent route and maneuver arrows width in pixels.
  /// This route and maneuver arrows width is multiplied by a pixel_scale [sdk.mapview.MapViewBase.pixel_scale]
  /// before being rendered. The maneuver arrow width is additionally multiplied by a factor configurable with
  /// [VisualNavigator.maneuverArrowWidthFactor]; which by default equals one.
  /// Only [MapMeasure] of [sdk.mapview.MapMeasure.Kind.ZOOM_LEVEL] type
  /// are supported. [MapMeasure] of other unsupported types will be ignored.
  /// `measureDependentWidth` with a single entry is equivalent to use of the constant width
  /// value of this single entry for all [MapMeasure]s.
  /// Empty `measureDependentWidth` is ignored and existing dictionary of width is maintained.
  /// The width values should be positive. Dictionary entries with width values less than or equal to 0 are ignored.
  /// Note: This is a beta release of this feature, so there could be a few bugs and unexpected
  /// behavior. Related APIs may change for new releases without a deprecation process.
  set measureDependentWidth(Map<MapMeasure, double> value);

  /// Gets the factor that multiplies width of the maneuver arrow defined by
  /// [VisualNavigator.measureDependentWidth]. By default it is set to one.
  double get maneuverArrowWidthFactor;
  /// Sets the factor that multiplies the width of the maneuver arrow defined by the
  /// [VisualNavigator.measureDependentWidth]. The value should be positive. The value less than or equal to 0 is ignored. By default it is set to one.
  set maneuverArrowWidthFactor(double value);

  /// Gets the current state of the position extrapolation logic.
  bool get isExtrapolationEnabled;
  /// Sets whether to enable or disable the position extrapolation logic. By default enabled.
  /// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected
  /// behaviors. Related APIs may change for new releases without a deprecation process.
  set isExtrapolationEnabled(bool value);

  /// Gets the path of the GPX file, is any available, currently being displayed on the map.
  String? get debugGpxFilePath;
  /// Sets the path of a GPX file to be displayed on the map. Setting `null` removes it from
  /// the map.
  set debugGpxFilePath(String? value);

  /// Gets the current debug mode state.
  bool get isDebugModeEnabled;
  /// Sets whether to enable debug mode or not.
  set isDebugModeEnabled(bool value);


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = VisualNavigator$Impl(Pointer<Void>.fromAddress(0));
}


// VisualNavigator "private" section, not exported.

final _sdkNavigationVisualnavigatorRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_navigation_VisualNavigator_register_finalizer'));
final _sdkNavigationVisualnavigatorCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_VisualNavigator_copy_handle'));
final _sdkNavigationVisualnavigatorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_VisualNavigator_release_handle'));
final _sdkNavigationVisualnavigatorGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_VisualNavigator_get_type_id'));


final _$initsdkNavigationVisualnavigatorMakeReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_VisualNavigator_make_return_release_handle'));
final _$initsdkNavigationVisualnavigatorMakeReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_VisualNavigator_make_return_get_result'));
final _$initsdkNavigationVisualnavigatorMakeReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_VisualNavigator_make_return_get_error'));
final _$initsdkNavigationVisualnavigatorMakeReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_VisualNavigator_make_return_has_error'));


final _withSdkEnginesdkNavigationVisualnavigatorMakeSdknativeengineReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_VisualNavigator_make__SDKNativeEngine_return_release_handle'));
final _withSdkEnginesdkNavigationVisualnavigatorMakeSdknativeengineReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_VisualNavigator_make__SDKNativeEngine_return_get_result'));
final _withSdkEnginesdkNavigationVisualnavigatorMakeSdknativeengineReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_VisualNavigator_make__SDKNativeEngine_return_get_error'));
final _withSdkEnginesdkNavigationVisualnavigatorMakeSdknativeengineReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_VisualNavigator_make__SDKNativeEngine_return_has_error'));






/// @nodoc
@visibleForTesting
class VisualNavigator$Impl extends __lib.NativeBase implements VisualNavigator {

  VisualNavigator$Impl(Pointer<Void> handle) : super(handle);


  VisualNavigator $init() {
    final _result_handle = _$init();
    final _result = VisualNavigator$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkNavigationVisualnavigatorRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }


  VisualNavigator withSdkEngine(SDKNativeEngine sdkEngine) {
    final _result_handle = _withSdkEngine(sdkEngine);
    final _result = VisualNavigator$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkNavigationVisualnavigatorRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _$init() {
    final _$initFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('here_sdk_sdk_navigation_VisualNavigator_make'));
    final __callResultHandle = _$initFfi(__lib.LibraryContext.isolateId);
    if (_$initsdkNavigationVisualnavigatorMakeReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _$initsdkNavigationVisualnavigatorMakeReturnGetError(__callResultHandle);
        _$initsdkNavigationVisualnavigatorMakeReturnReleaseHandle(__callResultHandle);
        try {
          throw InstantiationException(sdkCoreErrorsInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkCoreErrorsInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _$initsdkNavigationVisualnavigatorMakeReturnGetResult(__callResultHandle);
    _$initsdkNavigationVisualnavigatorMakeReturnReleaseHandle(__callResultHandle);
    return __resultHandle;
  }

  static Pointer<Void> _withSdkEngine(SDKNativeEngine sdkEngine) {
    final _withSdkEngineFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_make__SDKNativeEngine'));
    final _sdkEngineHandle = sdkCoreEngineSdknativeengineToFfi(sdkEngine);
    final __callResultHandle = _withSdkEngineFfi(__lib.LibraryContext.isolateId, _sdkEngineHandle);
    sdkCoreEngineSdknativeengineReleaseFfiHandle(_sdkEngineHandle);
    if (_withSdkEnginesdkNavigationVisualnavigatorMakeSdknativeengineReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _withSdkEnginesdkNavigationVisualnavigatorMakeSdknativeengineReturnGetError(__callResultHandle);
        _withSdkEnginesdkNavigationVisualnavigatorMakeSdknativeengineReturnReleaseHandle(__callResultHandle);
        try {
          throw InstantiationException(sdkCoreErrorsInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkCoreErrorsInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _withSdkEnginesdkNavigationVisualnavigatorMakeSdknativeengineReturnGetResult(__callResultHandle);
    _withSdkEnginesdkNavigationVisualnavigatorMakeSdknativeengineReturnReleaseHandle(__callResultHandle);
    return __resultHandle;
  }

  List<LanguageCode> getAvailableLanguagesForManeuverNotifications() {
    final _getAvailableLanguagesForManeuverNotificationsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('here_sdk_sdk_navigation_VisualNavigator_getAvailableLanguagesForManeuverNotifications'));
    final __resultHandle = _getAvailableLanguagesForManeuverNotificationsFfi(__lib.LibraryContext.isolateId);
    try {
      return heresdkVisualNavigationBindingslistofSdkCoreLanguagecodeFromFfi(__resultHandle);
    } finally {
      heresdkVisualNavigationBindingslistofSdkCoreLanguagecodeReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  void startRendering(MapViewBase mapView) {
    final _startRenderingFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_startRendering__MapViewBase'));
    final _mapViewHandle = sdkMapviewMapviewbaseToFfi(mapView);
    final _handle = this.handle;
    _startRenderingFfi(_handle, __lib.LibraryContext.isolateId, _mapViewHandle);
    sdkMapviewMapviewbaseReleaseFfiHandle(_mapViewHandle);

  }

  @override
  void stopRendering() {
    final _stopRenderingFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_stopRendering'));
    final _handle = this.handle;
    _stopRenderingFfi(_handle, __lib.LibraryContext.isolateId);

  }

  Map<MapMeasure, double> defaultRouteManeuverArrowMeasureDependentWidths() {
    final _defaultRouteManeuverArrowMeasureDependentWidthsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('here_sdk_sdk_navigation_VisualNavigator_defaultRouteManeuverArrowMeasureDependentWidths'));
    final __resultHandle = _defaultRouteManeuverArrowMeasureDependentWidthsFfi(__lib.LibraryContext.isolateId);
    try {
      return heresdkVisualNavigationBindingsmapofSdkMapviewMapmeasureToDoubleFromFfi(__resultHandle);
    } finally {
      heresdkVisualNavigationBindingsmapofSdkMapviewMapmeasureToDoubleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  Maneuver? getManeuver(int index) {
    final _getManeuverFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Int32), Pointer<Void> Function(Pointer<Void>, int, int)>('here_sdk_sdk_navigation_VisualNavigator_getManeuver__Int'));
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
    final _getManeuverNotificationTimingOptionsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Uint32, Uint32), Pointer<Void> Function(Pointer<Void>, int, int, int)>('here_sdk_sdk_navigation_VisualNavigator_getManeuverNotificationTimingOptions__TransportMode_RoadType'));
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
    final _setManeuverNotificationTimingOptionsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Uint32, Uint32, Pointer<Void>), int Function(Pointer<Void>, int, int, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_setManeuverNotificationTimingOptions__TransportMode_RoadType_ManeuverNotificationTimingOptions'));
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
    final _getManeuverNotificationTimingOptionsWithTimingProfileFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Uint32, Uint32), Pointer<Void> Function(Pointer<Void>, int, int, int)>('here_sdk_sdk_navigation_VisualNavigator_getManeuverNotificationTimingOptions__TransportMode_TimingProfile'));
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
    final _setManeuverNotificationTimingOptionsWithTimingProfileFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Uint32, Uint32, Pointer<Void>), int Function(Pointer<Void>, int, int, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_setManeuverNotificationTimingOptions__TransportMode_TimingProfile_ManeuverNotificationTimingOptions'));
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
    final _repeatLastManeuverNotificationFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_repeatLastManeuverNotification'));
    final _handle = this.handle;
    _repeatLastManeuverNotificationFfi(_handle, __lib.LibraryContext.isolateId);

  }

  @override
  int? calculateRemainingDistanceInMeters(GeoCoordinates coordinates) {
    final _calculateRemainingDistanceInMetersFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_calculateRemainingDistanceInMeters__GeoCoordinates'));
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
    final _setCustomOptionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_setCustomOption__String_String'));
    final _keyHandle = stringToFfi(key);
    final _valueHandle = stringToFfi(value);
    final _handle = this.handle;
    _setCustomOptionFfi(_handle, __lib.LibraryContext.isolateId, _keyHandle, _valueHandle);
    stringReleaseFfiHandle(_keyHandle);
    stringReleaseFfiHandle(_valueHandle);

  }

  @override
  void onLocationUpdated(location_impl.Location location) {
    final _onLocationUpdatedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_onLocationUpdated__Location'));
    final _locationHandle = sdkCoreLocationToFfi(location);
    final _handle = this.handle;
    _onLocationUpdatedFfi(_handle, __lib.LibraryContext.isolateId, _locationHandle);
    sdkCoreLocationReleaseFfiHandle(_locationHandle);

  }

  @override
  CameraBehavior? get cameraBehavior {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_cameraBehavior_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationCamerabehaviorFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationCamerabehaviorReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set cameraBehavior(CameraBehavior? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_cameraBehavior_set__CameraBehavior_'));
    final _valueHandle = sdkNavigationCamerabehaviorToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationCamerabehaviorReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  bool get isRouteVisible {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_isRouteVisible_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set isRouteVisible(bool value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint8), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_navigation_VisualNavigator_isRouteVisible_set__Boolean'));
    final _valueHandle = booleanToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    booleanReleaseFfiHandle(_valueHandle);

  }


  @override
  bool get isRouteProgressVisible {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_isRouteProgressVisible_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set isRouteProgressVisible(bool value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint8), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_navigation_VisualNavigator_isRouteProgressVisible_set__Boolean'));
    final _valueHandle = booleanToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    booleanReleaseFfiHandle(_valueHandle);

  }


  @override
  bool get isManeuverArrowsVisible {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_isManeuverArrowsVisible_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set isManeuverArrowsVisible(bool value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint8), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_navigation_VisualNavigator_isManeuverArrowsVisible_set__Boolean'));
    final _valueHandle = booleanToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    booleanReleaseFfiHandle(_valueHandle);

  }


  @override
  bool get isOffRoadDestinationVisible {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_isOffRoadDestinationVisible_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set isOffRoadDestinationVisible(bool value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint8), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_navigation_VisualNavigator_isOffRoadDestinationVisible_set__Boolean'));
    final _valueHandle = booleanToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    booleanReleaseFfiHandle(_valueHandle);

  }


  @override
  LocationIndicator? get customLocationIndicator {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_customLocationIndicator_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkMapviewLocationindicatorFromFfiNullable(__resultHandle);
    } finally {
      sdkMapviewLocationindicatorReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set customLocationIndicator(LocationIndicator? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_customLocationIndicator_set__LocationIndicator_'));
    final _valueHandle = sdkMapviewLocationindicatorToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkMapviewLocationindicatorReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  InterpolatedLocationListener? get interpolatedLocationListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_interpolatedLocationListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationInterpolatedlocationlistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationInterpolatedlocationlistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set interpolatedLocationListener(InterpolatedLocationListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_interpolatedLocationListener_set__InterpolatedLocationListener_'));
    final _valueHandle = sdkNavigationInterpolatedlocationlistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationInterpolatedlocationlistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  bool get isRendering {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_isRendering_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  VisualNavigatorColors get colors {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_colors_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationVisualnavigatorcolorsFromFfi(__resultHandle);
    } finally {
      sdkNavigationVisualnavigatorcolorsReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set colors(VisualNavigatorColors value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_colors_set__VisualNavigatorColors'));
    final _valueHandle = sdkNavigationVisualnavigatorcolorsToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationVisualnavigatorcolorsReleaseFfiHandle(_valueHandle);

  }


  @override
  Map<MapMeasure, double> get measureDependentWidth {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_measureDependentWidth_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return heresdkVisualNavigationBindingsmapofSdkMapviewMapmeasureToDoubleFromFfi(__resultHandle);
    } finally {
      heresdkVisualNavigationBindingsmapofSdkMapviewMapmeasureToDoubleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set measureDependentWidth(Map<MapMeasure, double> value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_measureDependentWidth_set__MapOf_sdk_mapview_MapMeasure_to_Double'));
    final _valueHandle = heresdkVisualNavigationBindingsmapofSdkMapviewMapmeasureToDoubleToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    heresdkVisualNavigationBindingsmapofSdkMapviewMapmeasureToDoubleReleaseFfiHandle(_valueHandle);

  }


  @override
  double get maneuverArrowWidthFactor {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Int32), double Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_maneuverArrowWidthFactor_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }

  @override
  set maneuverArrowWidthFactor(double value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Double), void Function(Pointer<Void>, int, double)>('here_sdk_sdk_navigation_VisualNavigator_maneuverArrowWidthFactor_set__Double'));
    final _valueHandle = (value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);


  }


  @override
  bool get isExtrapolationEnabled {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_isExtrapolationEnabled_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set isExtrapolationEnabled(bool value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint8), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_navigation_VisualNavigator_isExtrapolationEnabled_set__Boolean'));
    final _valueHandle = booleanToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    booleanReleaseFfiHandle(_valueHandle);

  }


  @override
  String? get debugGpxFilePath {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_debugGpxFilePath_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfiNullable(__resultHandle);
    } finally {
      stringReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set debugGpxFilePath(String? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_debugGpxFilePath_set__String_'));
    final _valueHandle = stringToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    stringReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  bool get isDebugModeEnabled {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_isDebugModeEnabled_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set isDebugModeEnabled(bool value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint8), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_navigation_VisualNavigator_isDebugModeEnabled_set__Boolean'));
    final _valueHandle = booleanToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    booleanReleaseFfiHandle(_valueHandle);

  }


  @override
  Route? get route {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_route_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkRoutingRouteFromFfiNullable(__resultHandle);
    } finally {
      sdkRoutingRouteReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set route(Route? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_route_set'));
    final _valueHandle = sdkRoutingRouteToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkRoutingRouteReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  TransportProfile? get trackingTransportProfile {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_trackingTransportProfile_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreTransportprofileFromFfiNullable(__resultHandle);
    } finally {
      sdkCoreTransportprofileReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set trackingTransportProfile(TransportProfile? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_trackingTransportProfile_set'));
    final _valueHandle = sdkCoreTransportprofileToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkCoreTransportprofileReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  NavigableLocationListener? get navigableLocationListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_navigableLocationListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationNavigablelocationlistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationNavigablelocationlistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set navigableLocationListener(NavigableLocationListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_navigableLocationListener_set'));
    final _valueHandle = sdkNavigationNavigablelocationlistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationNavigablelocationlistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  RouteProgressListener? get routeProgressListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_routeProgressListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationRouteprogresslistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationRouteprogresslistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set routeProgressListener(RouteProgressListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_routeProgressListener_set'));
    final _valueHandle = sdkNavigationRouteprogresslistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationRouteprogresslistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  RouteDeviationListener? get routeDeviationListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_routeDeviationListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationRoutedeviationlistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationRoutedeviationlistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set routeDeviationListener(RouteDeviationListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_routeDeviationListener_set'));
    final _valueHandle = sdkNavigationRoutedeviationlistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationRoutedeviationlistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  ManeuverNotificationListener? get maneuverNotificationListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_maneuverNotificationListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationManeuvernotificationlistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationManeuvernotificationlistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set maneuverNotificationListener(ManeuverNotificationListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_maneuverNotificationListener_set'));
    final _valueHandle = sdkNavigationManeuvernotificationlistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationManeuvernotificationlistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  EventTextListener? get eventTextListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_eventTextListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationEventtextlistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationEventtextlistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set eventTextListener(EventTextListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_eventTextListener_set'));
    final _valueHandle = sdkNavigationEventtextlistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationEventtextlistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  MilestoneStatusListener? get milestoneStatusListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_milestoneStatusListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationMilestonestatuslistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationMilestonestatuslistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set milestoneStatusListener(MilestoneStatusListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_milestoneStatusListener_set'));
    final _valueHandle = sdkNavigationMilestonestatuslistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationMilestonestatuslistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  DestinationReachedListener? get destinationReachedListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_destinationReachedListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationDestinationreachedlistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationDestinationreachedlistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set destinationReachedListener(DestinationReachedListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_destinationReachedListener_set'));
    final _valueHandle = sdkNavigationDestinationreachedlistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationDestinationreachedlistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  SpeedWarningListener? get speedWarningListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_speedWarningListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationSpeedwarninglistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationSpeedwarninglistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set speedWarningListener(SpeedWarningListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_speedWarningListener_set'));
    final _valueHandle = sdkNavigationSpeedwarninglistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationSpeedwarninglistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  ManeuverViewLaneAssistanceListener? get maneuverViewLaneAssistanceListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_maneuverViewLaneAssistanceListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationManeuverviewlaneassistancelistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationManeuverviewlaneassistancelistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set maneuverViewLaneAssistanceListener(ManeuverViewLaneAssistanceListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_maneuverViewLaneAssistanceListener_set'));
    final _valueHandle = sdkNavigationManeuverviewlaneassistancelistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationManeuverviewlaneassistancelistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  CurrentSituationLaneAssistanceViewListener? get currentSituationLaneAssistanceViewListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_currentSituationLaneAssistanceViewListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationCurrentsituationlaneassistanceviewlistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationCurrentsituationlaneassistanceviewlistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set currentSituationLaneAssistanceViewListener(CurrentSituationLaneAssistanceViewListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_currentSituationLaneAssistanceViewListener_set'));
    final _valueHandle = sdkNavigationCurrentsituationlaneassistanceviewlistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationCurrentsituationlaneassistanceviewlistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  EnvironmentalZoneWarningListener? get environmentalZoneWarningListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_environmentalZoneWarningListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationEnvironmentalzonewarninglistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationEnvironmentalzonewarninglistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set environmentalZoneWarningListener(EnvironmentalZoneWarningListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_environmentalZoneWarningListener_set'));
    final _valueHandle = sdkNavigationEnvironmentalzonewarninglistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationEnvironmentalzonewarninglistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  EnvironmentalZoneWarningOptions get environmentalZoneWarningOptions {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_environmentalZoneWarningOptions_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationEnvironmentalzonewarningoptionsFromFfi(__resultHandle);
    } finally {
      sdkNavigationEnvironmentalzonewarningoptionsReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set environmentalZoneWarningOptions(EnvironmentalZoneWarningOptions value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_environmentalZoneWarningOptions_set'));
    final _valueHandle = sdkNavigationEnvironmentalzonewarningoptionsToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationEnvironmentalzonewarningoptionsReleaseFfiHandle(_valueHandle);

  }


  @override
  JunctionViewLaneAssistanceListener? get junctionViewLaneAssistanceListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_junctionViewLaneAssistanceListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationJunctionviewlaneassistancelistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationJunctionviewlaneassistancelistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set junctionViewLaneAssistanceListener(JunctionViewLaneAssistanceListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_junctionViewLaneAssistanceListener_set'));
    final _valueHandle = sdkNavigationJunctionviewlaneassistancelistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationJunctionviewlaneassistancelistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  SafetyCameraWarningListener? get safetyCameraWarningListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_safetyCameraWarningListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationSafetycamerawarninglistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationSafetycamerawarninglistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set safetyCameraWarningListener(SafetyCameraWarningListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_safetyCameraWarningListener_set'));
    final _valueHandle = sdkNavigationSafetycamerawarninglistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationSafetycamerawarninglistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  SafetyCameraWarningOptions get safetyCameraWarningOptions {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_safetyCameraWarningOptions_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationSafetycamerawarningoptionsFromFfi(__resultHandle);
    } finally {
      sdkNavigationSafetycamerawarningoptionsReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set safetyCameraWarningOptions(SafetyCameraWarningOptions value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_safetyCameraWarningOptions_set'));
    final _valueHandle = sdkNavigationSafetycamerawarningoptionsToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationSafetycamerawarningoptionsReleaseFfiHandle(_valueHandle);

  }


  @override
  DangerZoneWarningListener? get dangerZoneWarningListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_dangerZoneWarningListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationDangerzonewarninglistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationDangerzonewarninglistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set dangerZoneWarningListener(DangerZoneWarningListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_dangerZoneWarningListener_set'));
    final _valueHandle = sdkNavigationDangerzonewarninglistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationDangerzonewarninglistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  DangerZoneWarningOptions get dangerZoneWarningOptions {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_dangerZoneWarningOptions_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationDangerzonewarningoptionsFromFfi(__resultHandle);
    } finally {
      sdkNavigationDangerzonewarningoptionsReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set dangerZoneWarningOptions(DangerZoneWarningOptions value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_dangerZoneWarningOptions_set'));
    final _valueHandle = sdkNavigationDangerzonewarningoptionsToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationDangerzonewarningoptionsReleaseFfiHandle(_valueHandle);

  }


  @override
  TruckRestrictionsWarningListener? get truckRestrictionsWarningListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_truckRestrictionsWarningListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationTruckrestrictionswarninglistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationTruckrestrictionswarninglistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set truckRestrictionsWarningListener(TruckRestrictionsWarningListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_truckRestrictionsWarningListener_set'));
    final _valueHandle = sdkNavigationTruckrestrictionswarninglistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationTruckrestrictionswarninglistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  TruckRestrictionsWarningOptions get truckRestrictionsWarningOptions {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_truckRestrictionsWarningOptions_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationTruckrestrictionswarningoptionsFromFfi(__resultHandle);
    } finally {
      sdkNavigationTruckrestrictionswarningoptionsReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set truckRestrictionsWarningOptions(TruckRestrictionsWarningOptions value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_truckRestrictionsWarningOptions_set'));
    final _valueHandle = sdkNavigationTruckrestrictionswarningoptionsToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationTruckrestrictionswarningoptionsReleaseFfiHandle(_valueHandle);

  }


  @override
  PostActionListener? get postActionListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_postActionListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationPostactionlistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationPostactionlistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set postActionListener(PostActionListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_postActionListener_set'));
    final _valueHandle = sdkNavigationPostactionlistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationPostactionlistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  SpeedLimitListener? get speedLimitListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_speedLimitListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationSpeedlimitlistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationSpeedlimitlistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set speedLimitListener(SpeedLimitListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_speedLimitListener_set'));
    final _valueHandle = sdkNavigationSpeedlimitlistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationSpeedlimitlistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  RoadTextsListener? get roadTextsListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_roadTextsListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationRoadtextslistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationRoadtextslistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set roadTextsListener(RoadTextsListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_roadTextsListener_set'));
    final _valueHandle = sdkNavigationRoadtextslistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationRoadtextslistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  RoadAttributesListener? get roadAttributesListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_roadAttributesListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationRoadattributeslistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationRoadattributeslistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set roadAttributesListener(RoadAttributesListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_roadAttributesListener_set'));
    final _valueHandle = sdkNavigationRoadattributeslistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationRoadattributeslistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  SpatialManeuverNotificationListener? get spatialManeuverNotificationListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_spatialManeuverNotificationListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationSpatialmaneuvernotificationlistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationSpatialmaneuvernotificationlistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set spatialManeuverNotificationListener(SpatialManeuverNotificationListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_spatialManeuverNotificationListener_set'));
    final _valueHandle = sdkNavigationSpatialmaneuvernotificationlistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationSpatialmaneuvernotificationlistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  SpatialManeuverAzimuthListener? get spatialManeuverAzimuthListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_spatialManeuverAzimuthListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationSpatialmaneuverazimuthlistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationSpatialmaneuverazimuthlistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set spatialManeuverAzimuthListener(SpatialManeuverAzimuthListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_spatialManeuverAzimuthListener_set'));
    final _valueHandle = sdkNavigationSpatialmaneuverazimuthlistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationSpatialmaneuverazimuthlistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  RoadSignWarningListener? get roadSignWarningListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_roadSignWarningListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationRoadsignwarninglistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationRoadsignwarninglistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set roadSignWarningListener(RoadSignWarningListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_roadSignWarningListener_set'));
    final _valueHandle = sdkNavigationRoadsignwarninglistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationRoadsignwarninglistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  RoadSignWarningOptions get roadSignWarningOptions {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_roadSignWarningOptions_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationRoadsignwarningoptionsFromFfi(__resultHandle);
    } finally {
      sdkNavigationRoadsignwarningoptionsReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set roadSignWarningOptions(RoadSignWarningOptions value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_roadSignWarningOptions_set'));
    final _valueHandle = sdkNavigationRoadsignwarningoptionsToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationRoadsignwarningoptionsReleaseFfiHandle(_valueHandle);

  }


  @override
  SchoolZoneWarningListener? get schoolZoneWarningListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_schoolZoneWarningListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationSchoolzonewarninglistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationSchoolzonewarninglistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set schoolZoneWarningListener(SchoolZoneWarningListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_schoolZoneWarningListener_set'));
    final _valueHandle = sdkNavigationSchoolzonewarninglistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationSchoolzonewarninglistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  SchoolZoneWarningOptions get schoolZoneWarningOptions {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_schoolZoneWarningOptions_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationSchoolzonewarningoptionsFromFfi(__resultHandle);
    } finally {
      sdkNavigationSchoolzonewarningoptionsReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set schoolZoneWarningOptions(SchoolZoneWarningOptions value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_schoolZoneWarningOptions_set'));
    final _valueHandle = sdkNavigationSchoolzonewarningoptionsToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationSchoolzonewarningoptionsReleaseFfiHandle(_valueHandle);

  }


  @override
  RealisticViewWarningListener? get realisticViewWarningListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_realisticViewWarningListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationRealisticviewwarninglistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationRealisticviewwarninglistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set realisticViewWarningListener(RealisticViewWarningListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_realisticViewWarningListener_set'));
    final _valueHandle = sdkNavigationRealisticviewwarninglistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationRealisticviewwarninglistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  RealisticViewWarningOptions get realisticViewWarningOptions {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_realisticViewWarningOptions_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationRealisticviewwarningoptionsFromFfi(__resultHandle);
    } finally {
      sdkNavigationRealisticviewwarningoptionsReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set realisticViewWarningOptions(RealisticViewWarningOptions value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_realisticViewWarningOptions_set'));
    final _valueHandle = sdkNavigationRealisticviewwarningoptionsToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationRealisticviewwarningoptionsReleaseFfiHandle(_valueHandle);

  }


  @override
  BorderCrossingWarningListener? get borderCrossingWarningListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_borderCrossingWarningListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationBordercrossingwarninglistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationBordercrossingwarninglistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set borderCrossingWarningListener(BorderCrossingWarningListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_borderCrossingWarningListener_set'));
    final _valueHandle = sdkNavigationBordercrossingwarninglistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationBordercrossingwarninglistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  BorderCrossingWarningOptions get borderCrossingWarningOptions {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_borderCrossingWarningOptions_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationBordercrossingwarningoptionsFromFfi(__resultHandle);
    } finally {
      sdkNavigationBordercrossingwarningoptionsReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set borderCrossingWarningOptions(BorderCrossingWarningOptions value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_borderCrossingWarningOptions_set'));
    final _valueHandle = sdkNavigationBordercrossingwarningoptionsToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationBordercrossingwarningoptionsReleaseFfiHandle(_valueHandle);

  }


  @override
  TollStopWarningListener? get tollStopWarningListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_tollStopWarningListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationTollstopwarninglistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationTollstopwarninglistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set tollStopWarningListener(TollStopWarningListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_tollStopWarningListener_set'));
    final _valueHandle = sdkNavigationTollstopwarninglistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationTollstopwarninglistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  TollStopWarningOptions get tollStopWarningOptions {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_tollStopWarningOptions_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationTollstopwarningoptionsFromFfi(__resultHandle);
    } finally {
      sdkNavigationTollstopwarningoptionsReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set tollStopWarningOptions(TollStopWarningOptions value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_tollStopWarningOptions_set'));
    final _valueHandle = sdkNavigationTollstopwarningoptionsToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationTollstopwarningoptionsReleaseFfiHandle(_valueHandle);

  }


  @override
  RailwayCrossingWarningListener? get railwayCrossingWarningListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_railwayCrossingWarningListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationRailwaycrossingwarninglistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationRailwaycrossingwarninglistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set railwayCrossingWarningListener(RailwayCrossingWarningListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_railwayCrossingWarningListener_set'));
    final _valueHandle = sdkNavigationRailwaycrossingwarninglistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationRailwaycrossingwarninglistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  RailwayCrossingWarningOptions get railwayCrossingWarningOptions {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_railwayCrossingWarningOptions_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationRailwaycrossingwarningoptionsFromFfi(__resultHandle);
    } finally {
      sdkNavigationRailwaycrossingwarningoptionsReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set railwayCrossingWarningOptions(RailwayCrossingWarningOptions value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_railwayCrossingWarningOptions_set'));
    final _valueHandle = sdkNavigationRailwaycrossingwarningoptionsToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationRailwaycrossingwarningoptionsReleaseFfiHandle(_valueHandle);

  }


  @override
  LowSpeedZoneWarningListener? get lowSpeedZoneWarningListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_lowSpeedZoneWarningListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationLowspeedzonewarninglistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationLowspeedzonewarninglistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set lowSpeedZoneWarningListener(LowSpeedZoneWarningListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_lowSpeedZoneWarningListener_set'));
    final _valueHandle = sdkNavigationLowspeedzonewarninglistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationLowspeedzonewarninglistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  LowSpeedZoneWarningOptions get lowSpeedZoneWarningOptions {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_lowSpeedZoneWarningOptions_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationLowspeedzonewarningoptionsFromFfi(__resultHandle);
    } finally {
      sdkNavigationLowspeedzonewarningoptionsReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set lowSpeedZoneWarningOptions(LowSpeedZoneWarningOptions value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_lowSpeedZoneWarningOptions_set'));
    final _valueHandle = sdkNavigationLowspeedzonewarningoptionsToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationLowspeedzonewarningoptionsReleaseFfiHandle(_valueHandle);

  }


  @override
  OffRoadDestinationReachedListener? get offRoadDestinationReachedListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_offRoadDestinationReachedListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationOffroaddestinationreachedlistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationOffroaddestinationreachedlistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set offRoadDestinationReachedListener(OffRoadDestinationReachedListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_offRoadDestinationReachedListener_set'));
    final _valueHandle = sdkNavigationOffroaddestinationreachedlistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationOffroaddestinationreachedlistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  OffRoadProgressListener? get offRoadProgressListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_offRoadProgressListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationOffroadprogresslistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationOffroadprogresslistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set offRoadProgressListener(OffRoadProgressListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_offRoadProgressListener_set'));
    final _valueHandle = sdkNavigationOffroadprogresslistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationOffroadprogresslistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  ManeuverNotificationOptions get maneuverNotificationOptions {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_maneuverNotificationOptions_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationManeuvernotificationoptionsFromFfi(__resultHandle);
    } finally {
      sdkNavigationManeuvernotificationoptionsReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set maneuverNotificationOptions(ManeuverNotificationOptions value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_maneuverNotificationOptions_set'));
    final _valueHandle = sdkNavigationManeuvernotificationoptionsToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationManeuvernotificationoptionsReleaseFfiHandle(_valueHandle);

  }


  @override
  EventTextOptions get eventTextOptions {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_eventTextOptions_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationEventtextoptionsFromFfi(__resultHandle);
    } finally {
      sdkNavigationEventtextoptionsReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set eventTextOptions(EventTextOptions value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_eventTextOptions_set'));
    final _valueHandle = sdkNavigationEventtextoptionsToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationEventtextoptionsReleaseFfiHandle(_valueHandle);

  }


  @override
  SpeedWarningOptions get speedWarningOptions {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_speedWarningOptions_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationSpeedwarningoptionsFromFfi(__resultHandle);
    } finally {
      sdkNavigationSpeedwarningoptionsReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set speedWarningOptions(SpeedWarningOptions value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_speedWarningOptions_set'));
    final _valueHandle = sdkNavigationSpeedwarningoptionsToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationSpeedwarningoptionsReleaseFfiHandle(_valueHandle);

  }


  @override
  bool get isEnableTunnelExtrapolation {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_isEnableTunnelExtrapolation_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set isEnableTunnelExtrapolation(bool value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint8), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_navigation_VisualNavigator_isEnableTunnelExtrapolation_set'));
    final _valueHandle = booleanToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    booleanReleaseFfiHandle(_valueHandle);

  }


  @override
  bool get isPassthroughWaypointsHandlingEnabled {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_isPassthroughWaypointsHandlingEnabled_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set isPassthroughWaypointsHandlingEnabled(bool value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint8), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_navigation_VisualNavigator_isPassthroughWaypointsHandlingEnabled_set'));
    final _valueHandle = booleanToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    booleanReleaseFfiHandle(_valueHandle);

  }



}

Pointer<Void> sdkNavigationVisualnavigatorToFfi(VisualNavigator value) =>
  _sdkNavigationVisualnavigatorCopyHandle((value as __lib.NativeBase).handle);

VisualNavigator sdkNavigationVisualnavigatorFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is VisualNavigator) return instance;

  final _typeIdHandle = _sdkNavigationVisualnavigatorGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkNavigationVisualnavigatorCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : VisualNavigator$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkNavigationVisualnavigatorRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkNavigationVisualnavigatorReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkNavigationVisualnavigatorReleaseHandle(handle);

Pointer<Void> sdkNavigationVisualnavigatorToFfiNullable(VisualNavigator? value) =>
  value != null ? sdkNavigationVisualnavigatorToFfi(value) : Pointer<Void>.fromAddress(0);

VisualNavigator? sdkNavigationVisualnavigatorFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkNavigationVisualnavigatorFromFfi(handle) : null;

void sdkNavigationVisualnavigatorReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationVisualnavigatorReleaseHandle(handle);

// End of VisualNavigator "private" section.


