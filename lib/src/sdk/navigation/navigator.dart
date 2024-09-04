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
import 'package:here_sdk/src/sdk/routing/maneuver.dart';
import 'package:here_sdk/src/sdk/routing/road_type.dart';
import 'package:here_sdk/src/sdk/routing/route.dart';
import 'package:here_sdk/src/sdk/transport/transport_mode.dart';
import 'package:meta/meta.dart';

/// This class provides the basic navigation functionality.
///
/// It provides
/// notifications about current map-matched location updates (see [NavigableLocation]).
/// And, if a route has been set, about the route progress (see [RouteProgress]),
/// route deviations (see [RouteDeviation]) and maneuver notifications (see
/// [ManeuverNotificationListener]).
///
/// All transport modes are supported for turn-by-turn navigation, except for public transit.
/// Public transit routes may lead to unsafe and unexpected results.
///
/// Navigation support for bus routes can be sometimes a bit limited and bus lane assistance and
/// turn-by-turn bus instructions may not be as appropriate as expected.
///
/// The [TransportMode] is determined from the provided [Route] instance,
/// but the actual [SectionTransportMode] can vary along a route, for example, when a
/// ferry must be taken. When no route is set, the [NavigableLocation] assumes a drive
/// scenario.
///
/// This class continuously reacts to new locations provided from a location source and acts as a
/// [LocationListener].
/// The accuracy of the positioning increases with the update frequency. At least one update per second
/// should be provided. More information can be found at `LocationAccuracy.NAVIGATION`.
///
/// **Note:**
/// Even without provided locations, for example, while driving through a tunnel, this class
/// can interpolate missing location events and still send [NavigableLocation],
/// [RouteProgress] and maneuver notifications.
abstract class Navigator implements NavigatorInterface {
  /// Creates a new instance of this class.
  ///
  /// Throws [InstantiationException]. Indicates what went wrong when the instantiation was attempted.
  ///
  factory Navigator() => $prototype.$init();
  /// Creates a new instance of this class.
  ///
  /// [sdkEngine] A SDKEngine instance.
  ///
  /// Throws [InstantiationException]. Indicates what went wrong when the instantiation was attempted.
  ///
  factory Navigator.withEngine(SDKNativeEngine sdkEngine) => $prototype.withEngine(sdkEngine);

  /// Returns the list of languages for maneuver notification currently available in the SDK.
  ///
  /// Returns [List<LanguageCode>]. the list of languages for maneuver notification currently available in the SDK.
  ///
  static List<LanguageCode> getAvailableLanguagesForManeuverNotifications() => $prototype.getAvailableLanguagesForManeuverNotifications();

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = Navigator$Impl(Pointer<Void>.fromAddress(0));
}


// Navigator "private" section, not exported.

final _sdkNavigationNavigatorRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_navigation_Navigator_register_finalizer'));
final _sdkNavigationNavigatorCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_Navigator_copy_handle'));
final _sdkNavigationNavigatorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_Navigator_release_handle'));
final _sdkNavigationNavigatorGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_Navigator_get_type_id'));


final _$initsdkNavigationNavigatorMakeReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_Navigator_make_return_release_handle'));
final _$initsdkNavigationNavigatorMakeReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_Navigator_make_return_get_result'));
final _$initsdkNavigationNavigatorMakeReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_Navigator_make_return_get_error'));
final _$initsdkNavigationNavigatorMakeReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_Navigator_make_return_has_error'));


final _withEnginesdkNavigationNavigatorMakeSdknativeengineReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_Navigator_make__SDKNativeEngine_return_release_handle'));
final _withEnginesdkNavigationNavigatorMakeSdknativeengineReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_Navigator_make__SDKNativeEngine_return_get_result'));
final _withEnginesdkNavigationNavigatorMakeSdknativeengineReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_Navigator_make__SDKNativeEngine_return_get_error'));
final _withEnginesdkNavigationNavigatorMakeSdknativeengineReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_Navigator_make__SDKNativeEngine_return_has_error'));



/// @nodoc
@visibleForTesting
class Navigator$Impl extends __lib.NativeBase implements Navigator {

  Navigator$Impl(Pointer<Void> handle) : super(handle);


  Navigator $init() {
    final _result_handle = _$init();
    final _result = Navigator$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkNavigationNavigatorRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }


  Navigator withEngine(SDKNativeEngine sdkEngine) {
    final _result_handle = _withEngine(sdkEngine);
    final _result = Navigator$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkNavigationNavigatorRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _$init() {
    final _$initFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('here_sdk_sdk_navigation_Navigator_make'));
    final __callResultHandle = _$initFfi(__lib.LibraryContext.isolateId);
    if (_$initsdkNavigationNavigatorMakeReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _$initsdkNavigationNavigatorMakeReturnGetError(__callResultHandle);
        _$initsdkNavigationNavigatorMakeReturnReleaseHandle(__callResultHandle);
        try {
          throw InstantiationException(sdkCoreErrorsInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkCoreErrorsInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _$initsdkNavigationNavigatorMakeReturnGetResult(__callResultHandle);
    _$initsdkNavigationNavigatorMakeReturnReleaseHandle(__callResultHandle);
    return __resultHandle;
  }

  static Pointer<Void> _withEngine(SDKNativeEngine sdkEngine) {
    final _withEngineFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_navigation_Navigator_make__SDKNativeEngine'));
    final _sdkEngineHandle = sdkCoreEngineSdknativeengineToFfi(sdkEngine);
    final __callResultHandle = _withEngineFfi(__lib.LibraryContext.isolateId, _sdkEngineHandle);
    sdkCoreEngineSdknativeengineReleaseFfiHandle(_sdkEngineHandle);
    if (_withEnginesdkNavigationNavigatorMakeSdknativeengineReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _withEnginesdkNavigationNavigatorMakeSdknativeengineReturnGetError(__callResultHandle);
        _withEnginesdkNavigationNavigatorMakeSdknativeengineReturnReleaseHandle(__callResultHandle);
        try {
          throw InstantiationException(sdkCoreErrorsInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkCoreErrorsInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _withEnginesdkNavigationNavigatorMakeSdknativeengineReturnGetResult(__callResultHandle);
    _withEnginesdkNavigationNavigatorMakeSdknativeengineReturnReleaseHandle(__callResultHandle);
    return __resultHandle;
  }

  List<LanguageCode> getAvailableLanguagesForManeuverNotifications() {
    final _getAvailableLanguagesForManeuverNotificationsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('here_sdk_sdk_navigation_Navigator_getAvailableLanguagesForManeuverNotifications'));
    final __resultHandle = _getAvailableLanguagesForManeuverNotificationsFfi(__lib.LibraryContext.isolateId);
    try {
      return heresdkNavigationBindingslistofSdkCoreLanguagecodeFromFfi(__resultHandle);
    } finally {
      heresdkNavigationBindingslistofSdkCoreLanguagecodeReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  Maneuver? getManeuver(int index) {
    final _getManeuverFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Int32), Pointer<Void> Function(Pointer<Void>, int, int)>('here_sdk_sdk_navigation_Navigator_getManeuver__Int'));
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
    final _getManeuverNotificationTimingOptionsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Uint32, Uint32), Pointer<Void> Function(Pointer<Void>, int, int, int)>('here_sdk_sdk_navigation_Navigator_getManeuverNotificationTimingOptions__TransportMode_RoadType'));
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
    final _setManeuverNotificationTimingOptionsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Uint32, Uint32, Pointer<Void>), int Function(Pointer<Void>, int, int, int, Pointer<Void>)>('here_sdk_sdk_navigation_Navigator_setManeuverNotificationTimingOptions__TransportMode_RoadType_ManeuverNotificationTimingOptions'));
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
    final _getManeuverNotificationTimingOptionsWithTimingProfileFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Uint32, Uint32), Pointer<Void> Function(Pointer<Void>, int, int, int)>('here_sdk_sdk_navigation_Navigator_getManeuverNotificationTimingOptions__TransportMode_TimingProfile'));
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
    final _setManeuverNotificationTimingOptionsWithTimingProfileFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Uint32, Uint32, Pointer<Void>), int Function(Pointer<Void>, int, int, int, Pointer<Void>)>('here_sdk_sdk_navigation_Navigator_setManeuverNotificationTimingOptions__TransportMode_TimingProfile_ManeuverNotificationTimingOptions'));
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
    final _repeatLastManeuverNotificationFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_Navigator_repeatLastManeuverNotification'));
    final _handle = this.handle;
    _repeatLastManeuverNotificationFfi(_handle, __lib.LibraryContext.isolateId);

  }

  @override
  int? calculateRemainingDistanceInMeters(GeoCoordinates coordinates) {
    final _calculateRemainingDistanceInMetersFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_Navigator_calculateRemainingDistanceInMeters__GeoCoordinates'));
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
    final _setCustomOptionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_navigation_Navigator_setCustomOption__String_String'));
    final _keyHandle = stringToFfi(key);
    final _valueHandle = stringToFfi(value);
    final _handle = this.handle;
    _setCustomOptionFfi(_handle, __lib.LibraryContext.isolateId, _keyHandle, _valueHandle);
    stringReleaseFfiHandle(_keyHandle);
    stringReleaseFfiHandle(_valueHandle);

  }

  @override
  void onLocationUpdated(location_impl.Location location) {
    final _onLocationUpdatedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_Navigator_onLocationUpdated__Location'));
    final _locationHandle = sdkCoreLocationToFfi(location);
    final _handle = this.handle;
    _onLocationUpdatedFfi(_handle, __lib.LibraryContext.isolateId, _locationHandle);
    sdkCoreLocationReleaseFfiHandle(_locationHandle);

  }

  @override
  Route? get route {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_Navigator_route_get'));
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
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_Navigator_route_set'));
    final _valueHandle = sdkRoutingRouteToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkRoutingRouteReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  TransportProfile? get trackingTransportProfile {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_Navigator_trackingTransportProfile_get'));
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
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_Navigator_trackingTransportProfile_set'));
    final _valueHandle = sdkCoreTransportprofileToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkCoreTransportprofileReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  NavigableLocationListener? get navigableLocationListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_Navigator_navigableLocationListener_get'));
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
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_Navigator_navigableLocationListener_set'));
    final _valueHandle = sdkNavigationNavigablelocationlistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationNavigablelocationlistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  RouteProgressListener? get routeProgressListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_Navigator_routeProgressListener_get'));
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
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_Navigator_routeProgressListener_set'));
    final _valueHandle = sdkNavigationRouteprogresslistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationRouteprogresslistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  RouteDeviationListener? get routeDeviationListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_Navigator_routeDeviationListener_get'));
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
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_Navigator_routeDeviationListener_set'));
    final _valueHandle = sdkNavigationRoutedeviationlistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationRoutedeviationlistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  ManeuverNotificationListener? get maneuverNotificationListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_Navigator_maneuverNotificationListener_get'));
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
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_Navigator_maneuverNotificationListener_set'));
    final _valueHandle = sdkNavigationManeuvernotificationlistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationManeuvernotificationlistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  EventTextListener? get eventTextListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_Navigator_eventTextListener_get'));
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
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_Navigator_eventTextListener_set'));
    final _valueHandle = sdkNavigationEventtextlistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationEventtextlistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  MilestoneStatusListener? get milestoneStatusListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_Navigator_milestoneStatusListener_get'));
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
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_Navigator_milestoneStatusListener_set'));
    final _valueHandle = sdkNavigationMilestonestatuslistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationMilestonestatuslistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  DestinationReachedListener? get destinationReachedListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_Navigator_destinationReachedListener_get'));
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
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_Navigator_destinationReachedListener_set'));
    final _valueHandle = sdkNavigationDestinationreachedlistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationDestinationreachedlistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  SpeedWarningListener? get speedWarningListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_Navigator_speedWarningListener_get'));
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
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_Navigator_speedWarningListener_set'));
    final _valueHandle = sdkNavigationSpeedwarninglistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationSpeedwarninglistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  ManeuverViewLaneAssistanceListener? get maneuverViewLaneAssistanceListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_Navigator_maneuverViewLaneAssistanceListener_get'));
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
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_Navigator_maneuverViewLaneAssistanceListener_set'));
    final _valueHandle = sdkNavigationManeuverviewlaneassistancelistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationManeuverviewlaneassistancelistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  CurrentSituationLaneAssistanceViewListener? get currentSituationLaneAssistanceViewListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_Navigator_currentSituationLaneAssistanceViewListener_get'));
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
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_Navigator_currentSituationLaneAssistanceViewListener_set'));
    final _valueHandle = sdkNavigationCurrentsituationlaneassistanceviewlistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationCurrentsituationlaneassistanceviewlistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  EnvironmentalZoneWarningListener? get environmentalZoneWarningListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_Navigator_environmentalZoneWarningListener_get'));
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
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_Navigator_environmentalZoneWarningListener_set'));
    final _valueHandle = sdkNavigationEnvironmentalzonewarninglistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationEnvironmentalzonewarninglistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  EnvironmentalZoneWarningOptions get environmentalZoneWarningOptions {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_Navigator_environmentalZoneWarningOptions_get'));
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
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_Navigator_environmentalZoneWarningOptions_set'));
    final _valueHandle = sdkNavigationEnvironmentalzonewarningoptionsToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationEnvironmentalzonewarningoptionsReleaseFfiHandle(_valueHandle);

  }


  @override
  JunctionViewLaneAssistanceListener? get junctionViewLaneAssistanceListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_Navigator_junctionViewLaneAssistanceListener_get'));
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
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_Navigator_junctionViewLaneAssistanceListener_set'));
    final _valueHandle = sdkNavigationJunctionviewlaneassistancelistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationJunctionviewlaneassistancelistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  SafetyCameraWarningListener? get safetyCameraWarningListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_Navigator_safetyCameraWarningListener_get'));
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
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_Navigator_safetyCameraWarningListener_set'));
    final _valueHandle = sdkNavigationSafetycamerawarninglistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationSafetycamerawarninglistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  SafetyCameraWarningOptions get safetyCameraWarningOptions {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_Navigator_safetyCameraWarningOptions_get'));
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
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_Navigator_safetyCameraWarningOptions_set'));
    final _valueHandle = sdkNavigationSafetycamerawarningoptionsToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationSafetycamerawarningoptionsReleaseFfiHandle(_valueHandle);

  }


  @override
  DangerZoneWarningListener? get dangerZoneWarningListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_Navigator_dangerZoneWarningListener_get'));
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
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_Navigator_dangerZoneWarningListener_set'));
    final _valueHandle = sdkNavigationDangerzonewarninglistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationDangerzonewarninglistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  DangerZoneWarningOptions get dangerZoneWarningOptions {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_Navigator_dangerZoneWarningOptions_get'));
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
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_Navigator_dangerZoneWarningOptions_set'));
    final _valueHandle = sdkNavigationDangerzonewarningoptionsToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationDangerzonewarningoptionsReleaseFfiHandle(_valueHandle);

  }


  @override
  TruckRestrictionsWarningListener? get truckRestrictionsWarningListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_Navigator_truckRestrictionsWarningListener_get'));
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
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_Navigator_truckRestrictionsWarningListener_set'));
    final _valueHandle = sdkNavigationTruckrestrictionswarninglistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationTruckrestrictionswarninglistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  TruckRestrictionsWarningOptions get truckRestrictionsWarningOptions {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_Navigator_truckRestrictionsWarningOptions_get'));
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
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_Navigator_truckRestrictionsWarningOptions_set'));
    final _valueHandle = sdkNavigationTruckrestrictionswarningoptionsToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationTruckrestrictionswarningoptionsReleaseFfiHandle(_valueHandle);

  }


  @override
  PostActionListener? get postActionListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_Navigator_postActionListener_get'));
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
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_Navigator_postActionListener_set'));
    final _valueHandle = sdkNavigationPostactionlistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationPostactionlistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  SpeedLimitListener? get speedLimitListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_Navigator_speedLimitListener_get'));
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
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_Navigator_speedLimitListener_set'));
    final _valueHandle = sdkNavigationSpeedlimitlistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationSpeedlimitlistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  RoadTextsListener? get roadTextsListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_Navigator_roadTextsListener_get'));
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
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_Navigator_roadTextsListener_set'));
    final _valueHandle = sdkNavigationRoadtextslistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationRoadtextslistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  RoadAttributesListener? get roadAttributesListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_Navigator_roadAttributesListener_get'));
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
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_Navigator_roadAttributesListener_set'));
    final _valueHandle = sdkNavigationRoadattributeslistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationRoadattributeslistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  SpatialManeuverNotificationListener? get spatialManeuverNotificationListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_Navigator_spatialManeuverNotificationListener_get'));
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
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_Navigator_spatialManeuverNotificationListener_set'));
    final _valueHandle = sdkNavigationSpatialmaneuvernotificationlistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationSpatialmaneuvernotificationlistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  SpatialManeuverAzimuthListener? get spatialManeuverAzimuthListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_Navigator_spatialManeuverAzimuthListener_get'));
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
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_Navigator_spatialManeuverAzimuthListener_set'));
    final _valueHandle = sdkNavigationSpatialmaneuverazimuthlistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationSpatialmaneuverazimuthlistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  RoadSignWarningListener? get roadSignWarningListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_Navigator_roadSignWarningListener_get'));
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
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_Navigator_roadSignWarningListener_set'));
    final _valueHandle = sdkNavigationRoadsignwarninglistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationRoadsignwarninglistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  RoadSignWarningOptions get roadSignWarningOptions {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_Navigator_roadSignWarningOptions_get'));
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
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_Navigator_roadSignWarningOptions_set'));
    final _valueHandle = sdkNavigationRoadsignwarningoptionsToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationRoadsignwarningoptionsReleaseFfiHandle(_valueHandle);

  }


  @override
  SchoolZoneWarningListener? get schoolZoneWarningListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_Navigator_schoolZoneWarningListener_get'));
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
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_Navigator_schoolZoneWarningListener_set'));
    final _valueHandle = sdkNavigationSchoolzonewarninglistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationSchoolzonewarninglistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  SchoolZoneWarningOptions get schoolZoneWarningOptions {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_Navigator_schoolZoneWarningOptions_get'));
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
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_Navigator_schoolZoneWarningOptions_set'));
    final _valueHandle = sdkNavigationSchoolzonewarningoptionsToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationSchoolzonewarningoptionsReleaseFfiHandle(_valueHandle);

  }


  @override
  RealisticViewWarningListener? get realisticViewWarningListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_Navigator_realisticViewWarningListener_get'));
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
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_Navigator_realisticViewWarningListener_set'));
    final _valueHandle = sdkNavigationRealisticviewwarninglistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationRealisticviewwarninglistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  RealisticViewWarningOptions get realisticViewWarningOptions {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_Navigator_realisticViewWarningOptions_get'));
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
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_Navigator_realisticViewWarningOptions_set'));
    final _valueHandle = sdkNavigationRealisticviewwarningoptionsToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationRealisticviewwarningoptionsReleaseFfiHandle(_valueHandle);

  }


  @override
  BorderCrossingWarningListener? get borderCrossingWarningListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_Navigator_borderCrossingWarningListener_get'));
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
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_Navigator_borderCrossingWarningListener_set'));
    final _valueHandle = sdkNavigationBordercrossingwarninglistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationBordercrossingwarninglistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  BorderCrossingWarningOptions get borderCrossingWarningOptions {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_Navigator_borderCrossingWarningOptions_get'));
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
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_Navigator_borderCrossingWarningOptions_set'));
    final _valueHandle = sdkNavigationBordercrossingwarningoptionsToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationBordercrossingwarningoptionsReleaseFfiHandle(_valueHandle);

  }


  @override
  TollStopWarningListener? get tollStopWarningListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_Navigator_tollStopWarningListener_get'));
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
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_Navigator_tollStopWarningListener_set'));
    final _valueHandle = sdkNavigationTollstopwarninglistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationTollstopwarninglistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  TollStopWarningOptions get tollStopWarningOptions {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_Navigator_tollStopWarningOptions_get'));
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
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_Navigator_tollStopWarningOptions_set'));
    final _valueHandle = sdkNavigationTollstopwarningoptionsToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationTollstopwarningoptionsReleaseFfiHandle(_valueHandle);

  }


  @override
  RailwayCrossingWarningListener? get railwayCrossingWarningListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_Navigator_railwayCrossingWarningListener_get'));
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
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_Navigator_railwayCrossingWarningListener_set'));
    final _valueHandle = sdkNavigationRailwaycrossingwarninglistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationRailwaycrossingwarninglistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  RailwayCrossingWarningOptions get railwayCrossingWarningOptions {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_Navigator_railwayCrossingWarningOptions_get'));
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
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_Navigator_railwayCrossingWarningOptions_set'));
    final _valueHandle = sdkNavigationRailwaycrossingwarningoptionsToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationRailwaycrossingwarningoptionsReleaseFfiHandle(_valueHandle);

  }


  @override
  LowSpeedZoneWarningListener? get lowSpeedZoneWarningListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_Navigator_lowSpeedZoneWarningListener_get'));
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
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_Navigator_lowSpeedZoneWarningListener_set'));
    final _valueHandle = sdkNavigationLowspeedzonewarninglistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationLowspeedzonewarninglistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  LowSpeedZoneWarningOptions get lowSpeedZoneWarningOptions {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_Navigator_lowSpeedZoneWarningOptions_get'));
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
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_Navigator_lowSpeedZoneWarningOptions_set'));
    final _valueHandle = sdkNavigationLowspeedzonewarningoptionsToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationLowspeedzonewarningoptionsReleaseFfiHandle(_valueHandle);

  }


  @override
  OffRoadDestinationReachedListener? get offRoadDestinationReachedListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_Navigator_offRoadDestinationReachedListener_get'));
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
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_Navigator_offRoadDestinationReachedListener_set'));
    final _valueHandle = sdkNavigationOffroaddestinationreachedlistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationOffroaddestinationreachedlistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  OffRoadProgressListener? get offRoadProgressListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_Navigator_offRoadProgressListener_get'));
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
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_Navigator_offRoadProgressListener_set'));
    final _valueHandle = sdkNavigationOffroadprogresslistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationOffroadprogresslistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  ManeuverNotificationOptions get maneuverNotificationOptions {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_Navigator_maneuverNotificationOptions_get'));
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
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_Navigator_maneuverNotificationOptions_set'));
    final _valueHandle = sdkNavigationManeuvernotificationoptionsToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationManeuvernotificationoptionsReleaseFfiHandle(_valueHandle);

  }


  @override
  EventTextOptions get eventTextOptions {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_Navigator_eventTextOptions_get'));
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
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_Navigator_eventTextOptions_set'));
    final _valueHandle = sdkNavigationEventtextoptionsToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationEventtextoptionsReleaseFfiHandle(_valueHandle);

  }


  @override
  SpeedWarningOptions get speedWarningOptions {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_Navigator_speedWarningOptions_get'));
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
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_Navigator_speedWarningOptions_set'));
    final _valueHandle = sdkNavigationSpeedwarningoptionsToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationSpeedwarningoptionsReleaseFfiHandle(_valueHandle);

  }


  @override
  bool get isEnableTunnelExtrapolation {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_Navigator_isEnableTunnelExtrapolation_get'));
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
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint8), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_navigation_Navigator_isEnableTunnelExtrapolation_set'));
    final _valueHandle = booleanToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    booleanReleaseFfiHandle(_valueHandle);

  }


  @override
  bool get isPassthroughWaypointsHandlingEnabled {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_Navigator_isPassthroughWaypointsHandlingEnabled_get'));
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
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint8), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_navigation_Navigator_isPassthroughWaypointsHandlingEnabled_set'));
    final _valueHandle = booleanToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    booleanReleaseFfiHandle(_valueHandle);

  }



}

Pointer<Void> sdkNavigationNavigatorToFfi(Navigator value) =>
  _sdkNavigationNavigatorCopyHandle((value as __lib.NativeBase).handle);

Navigator sdkNavigationNavigatorFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is Navigator) return instance;

  final _typeIdHandle = _sdkNavigationNavigatorGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkNavigationNavigatorCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : Navigator$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkNavigationNavigatorRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkNavigationNavigatorReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkNavigationNavigatorReleaseHandle(handle);

Pointer<Void> sdkNavigationNavigatorToFfiNullable(Navigator? value) =>
  value != null ? sdkNavigationNavigatorToFfi(value) : Pointer<Void>.fromAddress(0);

Navigator? sdkNavigationNavigatorFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkNavigationNavigatorFromFfi(handle) : null;

void sdkNavigationNavigatorReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationNavigatorReleaseHandle(handle);

// End of Navigator "private" section.


