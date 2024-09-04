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
import 'package:here_sdk/src/sdk/navigation/distance_type.dart';
import 'package:here_sdk/src/sdk/navigation/realistic_view.dart';
import 'package:here_sdk/src/sdk/navigation/realistic_view_raster_image.dart';
import 'package:here_sdk/src/sdk/navigation/realistic_view_vector_image.dart';

/// A realistic view notification.
///
/// This notification is given for complex junctions and it includes a visual
/// representation of that junction, in order to help the user to better navigate it. When
/// [RealisticViewWarning.distanceType] is [DistanceType.ahead], the [RealisticViewWarning.realisticView] object
/// will be provided with the junction view and the signpost representations. For [RealisticViewWarning.distanceType]
/// with value [DistanceType.passed], the [RealisticViewWarning.realisticView] object will be null.
/// Use [NavigatorInterface.realisticViewWarningListener] to get notifications about the realistic views
/// of the upcoming junctions.
///
/// Realistic view notifications require an online connection in order to function properly, or that the
/// junction or signpost map layer data is cached, installed or preloaded as part of a `Region`.
/// This can be enabled via feature configurations.
///
/// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected
/// behaviors. Related APIs may change for new releases without a deprecation process.

class RealisticViewWarning {
  /// Distance to the junction, for which the realistic view is given, expressed in meters.
  double distanceToRealisticViewInMeters;

  /// The realistic view object for which the warning is given.
  @Deprecated("Will be removed in v4.21.0. Please use [RealisticViewWarning.realisticViewVectorImage] instead.")
  RealisticView? realisticView;

  /// The realistic view object for which the warning is given.
  /// Image resources are stored as vector graphics.
  /// Within [RealisticViewWarning], only one type of image, either raster or vector, will be provided.
  /// If this property is not `null`, then [RealisticViewWarning.realisticViewRasterImage] will be `null`.
  ///
  /// **Note:** The realistic views for most of the countries are stored as vector images.
  RealisticViewVectorImage? realisticViewVectorImage;

  /// The realistic view object for which the warning is given.
  /// Image resources are stored as raster graphics.
  /// Within [RealisticViewWarning], only one type of image, either raster or vector, will be provided.
  /// If this property is not `null`, then [RealisticViewWarning.realisticViewVectorImage] will be `null`.
  /// **Note:** Certain countries support only raster images as realistic views. Currently, this is the case
  /// only for Japan, but in the future, more countries might support this type of realistic views.
  RealisticViewRasterImage? realisticViewRasterImage;

  /// The distance type for the warning, e.g. a warning for a new realistic view ahead or a warning
  /// for passing a realistic view. Since the realistic view warning is given relative to a single
  /// position on the route, [DistanceType.reached] will never be given for this warning.
  DistanceType distanceType;

  /// Creates a new instance.

  /// [distanceToRealisticViewInMeters] Distance to the junction, for which the realistic view is given, expressed in meters.

  /// [realisticView] The realistic view object for which the warning is given.

  /// [realisticViewVectorImage] The realistic view object for which the warning is given.
  /// Image resources are stored as vector graphics.
  /// Within [RealisticViewWarning], only one type of image, either raster or vector, will be provided.
  /// If this property is not `null`, then [RealisticViewWarning.realisticViewRasterImage] will be `null`.
  ///
  /// **Note:** The realistic views for most of the countries are stored as vector images.

  /// [realisticViewRasterImage] The realistic view object for which the warning is given.
  /// Image resources are stored as raster graphics.
  /// Within [RealisticViewWarning], only one type of image, either raster or vector, will be provided.
  /// If this property is not `null`, then [RealisticViewWarning.realisticViewVectorImage] will be `null`.
  /// **Note:** Certain countries support only raster images as realistic views. Currently, this is the case
  /// only for Japan, but in the future, more countries might support this type of realistic views.

  /// [distanceType] The distance type for the warning, e.g. a warning for a new realistic view ahead or a warning
  /// for passing a realistic view. Since the realistic view warning is given relative to a single
  /// position on the route, [DistanceType.reached] will never be given for this warning.

  RealisticViewWarning._(this.distanceToRealisticViewInMeters, this.realisticView, this.realisticViewVectorImage, this.realisticViewRasterImage, this.distanceType);
  RealisticViewWarning(double distanceToRealisticViewInMeters, DistanceType distanceType)
    : distanceToRealisticViewInMeters = distanceToRealisticViewInMeters, realisticView = null, realisticViewVectorImage = null, realisticViewRasterImage = null, distanceType = distanceType;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! RealisticViewWarning) return false;
    RealisticViewWarning _other = other;
    return distanceToRealisticViewInMeters == _other.distanceToRealisticViewInMeters &&
        realisticView == _other.realisticView &&
        realisticViewVectorImage == _other.realisticViewVectorImage &&
        realisticViewRasterImage == _other.realisticViewRasterImage &&
        distanceType == _other.distanceType;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + distanceToRealisticViewInMeters.hashCode;
    result = 31 * result + realisticView.hashCode;
    result = 31 * result + realisticViewVectorImage.hashCode;
    result = 31 * result + realisticViewRasterImage.hashCode;
    result = 31 * result + distanceType.hashCode;
    return result;
  }
}


// RealisticViewWarning "private" section, not exported.

final _sdkNavigationRealisticviewwarningCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double, Pointer<Void>, Pointer<Void>, Pointer<Void>, Uint32),
    Pointer<Void> Function(double, Pointer<Void>, Pointer<Void>, Pointer<Void>, int)
  >('here_sdk_sdk_navigation_RealisticViewWarning_create_handle'));
final _sdkNavigationRealisticviewwarningReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RealisticViewWarning_release_handle'));
final _sdkNavigationRealisticviewwarningGetFielddistanceToRealisticViewInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RealisticViewWarning_get_field_distanceToRealisticViewInMeters'));
final _sdkNavigationRealisticviewwarningGetFieldrealisticView = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RealisticViewWarning_get_field_realisticView'));
final _sdkNavigationRealisticviewwarningGetFieldrealisticViewVectorImage = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RealisticViewWarning_get_field_realisticViewVectorImage'));
final _sdkNavigationRealisticviewwarningGetFieldrealisticViewRasterImage = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RealisticViewWarning_get_field_realisticViewRasterImage'));
final _sdkNavigationRealisticviewwarningGetFielddistanceType = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RealisticViewWarning_get_field_distanceType'));



Pointer<Void> sdkNavigationRealisticviewwarningToFfi(RealisticViewWarning value) {
  final _distanceToRealisticViewInMetersHandle = (value.distanceToRealisticViewInMeters);
  final _realisticViewHandle = sdkNavigationRealisticviewToFfiNullable(value.realisticView);
  final _realisticViewVectorImageHandle = sdkNavigationRealisticviewvectorimageToFfiNullable(value.realisticViewVectorImage);
  final _realisticViewRasterImageHandle = sdkNavigationRealisticviewrasterimageToFfiNullable(value.realisticViewRasterImage);
  final _distanceTypeHandle = sdkNavigationDistancetypeToFfi(value.distanceType);
  final _result = _sdkNavigationRealisticviewwarningCreateHandle(_distanceToRealisticViewInMetersHandle, _realisticViewHandle, _realisticViewVectorImageHandle, _realisticViewRasterImageHandle, _distanceTypeHandle);
  
  sdkNavigationRealisticviewReleaseFfiHandleNullable(_realisticViewHandle);
  sdkNavigationRealisticviewvectorimageReleaseFfiHandleNullable(_realisticViewVectorImageHandle);
  sdkNavigationRealisticviewrasterimageReleaseFfiHandleNullable(_realisticViewRasterImageHandle);
  sdkNavigationDistancetypeReleaseFfiHandle(_distanceTypeHandle);
  return _result;
}

RealisticViewWarning sdkNavigationRealisticviewwarningFromFfi(Pointer<Void> handle) {
  final _distanceToRealisticViewInMetersHandle = _sdkNavigationRealisticviewwarningGetFielddistanceToRealisticViewInMeters(handle);
  final _realisticViewHandle = _sdkNavigationRealisticviewwarningGetFieldrealisticView(handle);
  final _realisticViewVectorImageHandle = _sdkNavigationRealisticviewwarningGetFieldrealisticViewVectorImage(handle);
  final _realisticViewRasterImageHandle = _sdkNavigationRealisticviewwarningGetFieldrealisticViewRasterImage(handle);
  final _distanceTypeHandle = _sdkNavigationRealisticviewwarningGetFielddistanceType(handle);
  try {
    return RealisticViewWarning._(
      (_distanceToRealisticViewInMetersHandle), 
      sdkNavigationRealisticviewFromFfiNullable(_realisticViewHandle), 
      sdkNavigationRealisticviewvectorimageFromFfiNullable(_realisticViewVectorImageHandle), 
      sdkNavigationRealisticviewrasterimageFromFfiNullable(_realisticViewRasterImageHandle), 
      sdkNavigationDistancetypeFromFfi(_distanceTypeHandle)
    );
  } finally {
    
    sdkNavigationRealisticviewReleaseFfiHandleNullable(_realisticViewHandle);
    sdkNavigationRealisticviewvectorimageReleaseFfiHandleNullable(_realisticViewVectorImageHandle);
    sdkNavigationRealisticviewrasterimageReleaseFfiHandleNullable(_realisticViewRasterImageHandle);
    sdkNavigationDistancetypeReleaseFfiHandle(_distanceTypeHandle);
  }
}

void sdkNavigationRealisticviewwarningReleaseFfiHandle(Pointer<Void> handle) => _sdkNavigationRealisticviewwarningReleaseHandle(handle);

// Nullable RealisticViewWarning

final _sdkNavigationRealisticviewwarningCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RealisticViewWarning_create_handle_nullable'));
final _sdkNavigationRealisticviewwarningReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RealisticViewWarning_release_handle_nullable'));
final _sdkNavigationRealisticviewwarningGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RealisticViewWarning_get_value_nullable'));

Pointer<Void> sdkNavigationRealisticviewwarningToFfiNullable(RealisticViewWarning? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationRealisticviewwarningToFfi(value);
  final result = _sdkNavigationRealisticviewwarningCreateHandleNullable(_handle);
  sdkNavigationRealisticviewwarningReleaseFfiHandle(_handle);
  return result;
}

RealisticViewWarning? sdkNavigationRealisticviewwarningFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationRealisticviewwarningGetValueNullable(handle);
  final result = sdkNavigationRealisticviewwarningFromFfi(_handle);
  sdkNavigationRealisticviewwarningReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationRealisticviewwarningReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationRealisticviewwarningReleaseHandleNullable(handle);

// End of RealisticViewWarning "private" section.


