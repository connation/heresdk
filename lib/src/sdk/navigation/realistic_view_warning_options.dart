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
import 'package:here_sdk/src/sdk/navigation/aspect_ratio.dart';

/// Realistic view warning options.
///
/// Set the options to
/// [NavigatorInterface.realisticViewWarningOptions] for filtering the realistic view notifications and
/// setting the realistic view notification distances based on the road type.
///
/// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected
/// behaviors. Related APIs may change for new releases without a deprecation process.

class RealisticViewWarningOptions {
  /// The aspect ratio of the images which will be given in the realistic view warning. This option is applicable only
  /// to the [RealisticViewWarning.realisticViewVectorImage]. For [RealisticViewWarning.realisticViewRasterImage]
  /// the aspect ratio is always portrait.
  AspectRatio aspectRatio;

  /// Specifies whether the images included in the realistic view warning will be optimized for the light or dark color
  /// scheme. This option is applicable only to the [RealisticViewWarning.realisticViewVectorImage]. For
  /// [RealisticViewWarning.realisticViewRasterImage] the dark theme is always `false`.
  bool darkTheme;

  /// Warning distance setting for highways, in meters. Defaults to 1500 meters.
  /// **Note:** The road type (highway, rural or urban) is given by the speed limit on that particular road at the specified
  /// position and not by the actual road classification. Details about which speed limits are associated to which road type
  /// can be found in [DistanceType].
  int highwayWarningDistanceInMeters;

  /// Warning distance setting for rural roads, in meters. Defaults to 750 meters.
  /// **Note:** The road type (highway, rural or urban) is given by the speed limit on that particular road at the specified
  /// position and not by the actual road classification. Details about which speed limits are associated to which road type
  /// can be found in [DistanceType].
  int ruralWarningDistanceInMeters;

  /// Warning distance setting for urban roads, in meters. Defaults to 500 meters.
  /// **Note:** The road type (highway, rural or urban) is given by the speed limit on that particular road at the specified
  /// position and not by the actual road classification. Details about which speed limits are associated to which road type
  /// can be found in [DistanceType].
  int urbanWarningDistanceInMeters;

  /// Creates a new instance.

  /// [aspectRatio] The aspect ratio of the images which will be given in the realistic view warning. This option is applicable only
  /// to the [RealisticViewWarning.realisticViewVectorImage]. For [RealisticViewWarning.realisticViewRasterImage]
  /// the aspect ratio is always portrait.

  /// [darkTheme] Specifies whether the images included in the realistic view warning will be optimized for the light or dark color
  /// scheme. This option is applicable only to the [RealisticViewWarning.realisticViewVectorImage]. For
  /// [RealisticViewWarning.realisticViewRasterImage] the dark theme is always `false`.

  /// [highwayWarningDistanceInMeters] Warning distance setting for highways, in meters. Defaults to 1500 meters.
  /// **Note:** The road type (highway, rural or urban) is given by the speed limit on that particular road at the specified
  /// position and not by the actual road classification. Details about which speed limits are associated to which road type
  /// can be found in [DistanceType].

  /// [ruralWarningDistanceInMeters] Warning distance setting for rural roads, in meters. Defaults to 750 meters.
  /// **Note:** The road type (highway, rural or urban) is given by the speed limit on that particular road at the specified
  /// position and not by the actual road classification. Details about which speed limits are associated to which road type
  /// can be found in [DistanceType].

  /// [urbanWarningDistanceInMeters] Warning distance setting for urban roads, in meters. Defaults to 500 meters.
  /// **Note:** The road type (highway, rural or urban) is given by the speed limit on that particular road at the specified
  /// position and not by the actual road classification. Details about which speed limits are associated to which road type
  /// can be found in [DistanceType].

  RealisticViewWarningOptions._(this.aspectRatio, this.darkTheme, this.highwayWarningDistanceInMeters, this.ruralWarningDistanceInMeters, this.urbanWarningDistanceInMeters);
  RealisticViewWarningOptions()
    : aspectRatio = AspectRatio.aspectRatio3X4, darkTheme = false, highwayWarningDistanceInMeters = 1500, ruralWarningDistanceInMeters = 750, urbanWarningDistanceInMeters = 500;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! RealisticViewWarningOptions) return false;
    RealisticViewWarningOptions _other = other;
    return aspectRatio == _other.aspectRatio &&
        darkTheme == _other.darkTheme &&
        highwayWarningDistanceInMeters == _other.highwayWarningDistanceInMeters &&
        ruralWarningDistanceInMeters == _other.ruralWarningDistanceInMeters &&
        urbanWarningDistanceInMeters == _other.urbanWarningDistanceInMeters;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + aspectRatio.hashCode;
    result = 31 * result + darkTheme.hashCode;
    result = 31 * result + highwayWarningDistanceInMeters.hashCode;
    result = 31 * result + ruralWarningDistanceInMeters.hashCode;
    result = 31 * result + urbanWarningDistanceInMeters.hashCode;
    return result;
  }
}


// RealisticViewWarningOptions "private" section, not exported.

final _sdkNavigationRealisticviewwarningoptionsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32, Uint8, Int32, Int32, Int32),
    Pointer<Void> Function(int, int, int, int, int)
  >('here_sdk_sdk_navigation_RealisticViewWarningOptions_create_handle'));
final _sdkNavigationRealisticviewwarningoptionsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RealisticViewWarningOptions_release_handle'));
final _sdkNavigationRealisticviewwarningoptionsGetFieldaspectRatio = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RealisticViewWarningOptions_get_field_aspectRatio'));
final _sdkNavigationRealisticviewwarningoptionsGetFielddarkTheme = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RealisticViewWarningOptions_get_field_darkTheme'));
final _sdkNavigationRealisticviewwarningoptionsGetFieldhighwayWarningDistanceInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RealisticViewWarningOptions_get_field_highwayWarningDistanceInMeters'));
final _sdkNavigationRealisticviewwarningoptionsGetFieldruralWarningDistanceInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RealisticViewWarningOptions_get_field_ruralWarningDistanceInMeters'));
final _sdkNavigationRealisticviewwarningoptionsGetFieldurbanWarningDistanceInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RealisticViewWarningOptions_get_field_urbanWarningDistanceInMeters'));



Pointer<Void> sdkNavigationRealisticviewwarningoptionsToFfi(RealisticViewWarningOptions value) {
  final _aspectRatioHandle = sdkNavigationAspectratioToFfi(value.aspectRatio);
  final _darkThemeHandle = booleanToFfi(value.darkTheme);
  final _highwayWarningDistanceInMetersHandle = (value.highwayWarningDistanceInMeters);
  final _ruralWarningDistanceInMetersHandle = (value.ruralWarningDistanceInMeters);
  final _urbanWarningDistanceInMetersHandle = (value.urbanWarningDistanceInMeters);
  final _result = _sdkNavigationRealisticviewwarningoptionsCreateHandle(_aspectRatioHandle, _darkThemeHandle, _highwayWarningDistanceInMetersHandle, _ruralWarningDistanceInMetersHandle, _urbanWarningDistanceInMetersHandle);
  sdkNavigationAspectratioReleaseFfiHandle(_aspectRatioHandle);
  booleanReleaseFfiHandle(_darkThemeHandle);
  
  
  
  return _result;
}

RealisticViewWarningOptions sdkNavigationRealisticviewwarningoptionsFromFfi(Pointer<Void> handle) {
  final _aspectRatioHandle = _sdkNavigationRealisticviewwarningoptionsGetFieldaspectRatio(handle);
  final _darkThemeHandle = _sdkNavigationRealisticviewwarningoptionsGetFielddarkTheme(handle);
  final _highwayWarningDistanceInMetersHandle = _sdkNavigationRealisticviewwarningoptionsGetFieldhighwayWarningDistanceInMeters(handle);
  final _ruralWarningDistanceInMetersHandle = _sdkNavigationRealisticviewwarningoptionsGetFieldruralWarningDistanceInMeters(handle);
  final _urbanWarningDistanceInMetersHandle = _sdkNavigationRealisticviewwarningoptionsGetFieldurbanWarningDistanceInMeters(handle);
  try {
    return RealisticViewWarningOptions._(
      sdkNavigationAspectratioFromFfi(_aspectRatioHandle), 
      booleanFromFfi(_darkThemeHandle), 
      (_highwayWarningDistanceInMetersHandle), 
      (_ruralWarningDistanceInMetersHandle), 
      (_urbanWarningDistanceInMetersHandle)
    );
  } finally {
    sdkNavigationAspectratioReleaseFfiHandle(_aspectRatioHandle);
    booleanReleaseFfiHandle(_darkThemeHandle);
    
    
    
  }
}

void sdkNavigationRealisticviewwarningoptionsReleaseFfiHandle(Pointer<Void> handle) => _sdkNavigationRealisticviewwarningoptionsReleaseHandle(handle);

// Nullable RealisticViewWarningOptions

final _sdkNavigationRealisticviewwarningoptionsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RealisticViewWarningOptions_create_handle_nullable'));
final _sdkNavigationRealisticviewwarningoptionsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RealisticViewWarningOptions_release_handle_nullable'));
final _sdkNavigationRealisticviewwarningoptionsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RealisticViewWarningOptions_get_value_nullable'));

Pointer<Void> sdkNavigationRealisticviewwarningoptionsToFfiNullable(RealisticViewWarningOptions? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationRealisticviewwarningoptionsToFfi(value);
  final result = _sdkNavigationRealisticviewwarningoptionsCreateHandleNullable(_handle);
  sdkNavigationRealisticviewwarningoptionsReleaseFfiHandle(_handle);
  return result;
}

RealisticViewWarningOptions? sdkNavigationRealisticviewwarningoptionsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationRealisticviewwarningoptionsGetValueNullable(handle);
  final result = sdkNavigationRealisticviewwarningoptionsFromFfi(_handle);
  sdkNavigationRealisticviewwarningoptionsReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationRealisticviewwarningoptionsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationRealisticviewwarningoptionsReleaseHandleNullable(handle);

// End of RealisticViewWarningOptions "private" section.


