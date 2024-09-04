// Copyright (c) 2023 HERE Global B.V. and its affiliate(s).
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

import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:here_sdk/src/sdk/mapview/icon_provider_internal.dart';
import 'package:here_sdk/src/sdk/mapview/vehicle_restriction_icon_attributes_factory.dart';
import 'package:here_sdk/core.dart';
import 'package:here_sdk/mapview.dart';

/// A callback of this type is invoked when an icon is received from the [IconProvider] in
/// the [ImageInfo] format. The callback provides information about the loaded icon, or an
/// [IconProviderError] if one occurred.
///
/// [imageInfo] The created [ImageInfo] containing the icon, or `null` if an error occurred.
///
/// [iconDescription] An English description of the icon. For example, "Federal Highway" for the road
///                   shield icon with the [RouteType.level1Road] in Brazil. It will be `null` if an
///                   error occurred.
///
/// [error] The error that occurred, or `null` if the icon is loaded successfully.
typedef IconProviderCallback = void Function(
    ImageInfo? imageInfo, String? iconDescription, IconProviderError? error);

/// This provider creates icons from a given set of parameters for map content and constraints
/// for icon dimensions for a particular map scheme. The icon creation currently does not rely
/// on map data. Therefore, it works without online connection.
///
/// Note: This feature is in BETA state and thus there can be bugs and unexpected behavior.
/// Related APIs may change for new releases without a deprecation process.
class IconProvider {
  IconProviderInternal? _iconProviderInternal;

  /// Constructor.
  /// [mapContext] The map context instance which is obtained using [HereMapController.mapContext].
  IconProvider(MapContext mapContext) {
    _iconProviderInternal = IconProviderInternal(mapContext);
  }

  /// Creates an image displaying a road shield according to the given parameters.
  ///
  /// [properties] The properties which determine the kind of road shield to be created.
  ///
  /// [mapScheme] The map scheme for which the road shield should be created.
  ///
  /// [widthConstraintInPixels] The maximum width of the road shield in pixels. The image will
  ///   be created so that it will be as large as possible within the width and height constraints while keeping the aspect
  ///   ratio. If set to 0 the resulting width will be the maximum width resulting from keeping the aspect ratio and the
  ///   heightConstraintInPixels parameter.
  ///
  /// [heightConstraintInPixels] The maximum height of the road shield in pixels. The image
  ///   will be created so that it will be as large as possible within the width and height constraints while keeping the
  ///   aspect ratio.
  ///
  /// [callback] The callback which is used to return the created image along with a description of the icon based on the
  ///   type of road and/or place it is used, or an error code.
  ///
  /// Note: This feature is in BETA state and thus there can be bugs and unexpected behavior.
  /// Related APIs may change for new releases without a deprecation process.
  void createRoadShieldIcon(
      RoadShieldIconProperties properties,
      MapScheme mapScheme,
      int widthConstraintInPixels,
      int heightConstraintInPixels,
      IconProviderCallback callback) {
    _createRoadShieldIcon(properties, mapScheme, widthConstraintInPixels,
        heightConstraintInPixels, callback);
  }

  /// Creates an image representing a vehicle restriction as shown on the map, based on map content picking result.
  ///
  /// [pickingResult] The result of picking vehicle restrictions.
  ///
  /// [mapScheme] The map scheme for which the vehicle restriction icon should be created.
  ///
  /// [sizeConstraintsInPixels] The maximum width and height of the icon in pixels. The image will
  ///   be created so that it will be as large as possible within the width and height constraints while keeping the original aspect
  ///   ratio. If either width or height is set to 0, it will be calculated automatically based on icon's aspect ration.
  ///
  /// [callback] The callback which is used to return the created image along with a description of the icon based on the
  ///   type of road and/or place it is used, or an error code.
  void createVehicleRestrictionIcon(
      PickVehicleRestrictionsResult pickingResult,
      MapScheme mapScheme,
      Size2D sizeConstraintsInPixels,
      IconProviderCallback callback) {
    _createVehicleRestrictionIconWithPickResult(
        pickingResult, mapScheme, sizeConstraintsInPixels, callback);
  }

  /// Creates an image representing a vehicle restriction as shown on the map.
  ///
  ///
  /// In case when [VehicleRestriction] object specifies multiple types of restrictions, then the icon is generated
  /// for the first one according to the following priority: [VehicleRestriction.restriction], [VehicleRestriction.axleCount],
  /// [VehicleRestriction.axleCountInGroup], [VehicleRestriction.hazmatRestriction], [VehicleRestriction.trailerCount].
  ///
  /// [properties] The properties of a restriction icon to be created.
  ///
  /// [mapScheme] The map scheme for which the vehicle restriction icon should be created.
  ///
  /// [sizeConstraintsInPixels] The maximum width and height of the icon in pixels. The image will
  ///   be created so that it will be as large as possible within the width and height constraints while keeping the original aspect
  ///   ratio. If either width or height is set to 0, it will be calculated automatically based on icon's aspect ration.
  ///
  /// [callback] The callback which is used to return the created image along with a description of the icon based on the
  ///   type of road and/or place it is used, or an error code.
  void createVehicleRestrictionIconWithIconProperties(
      VehicleRestrictionIconProperties properties,
      MapScheme mapScheme,
      Size2D sizeConstraintsInPixels,
      IconProviderCallback callback) {
    _createVehicleRestrictionIconWithIconProperties(
        properties, mapScheme, sizeConstraintsInPixels, callback);
  }


  void _createRoadShieldIcon(
      RoadShieldIconProperties properties,
      MapScheme mapScheme,
      int widthConstraintInPixels,
      int heightConstraintInPixels,
      IconProviderCallback callback) {
    _iconProviderInternal?.createRoadShieldIcon(
        properties,
        mapScheme,
        widthConstraintInPixels,
        heightConstraintInPixels, (icon, iconDescription, error) async {
      if (icon != null && !icon.isEmpty) {
        ImageInfo? imageInfo;
        try {
          final ui.ImmutableBuffer buffer =
              await ui.ImmutableBuffer.fromUint8List(icon);
          final ui.ImageDescriptor descriptor =
              await ui.ImageDescriptor.encoded(buffer);
          final ui.Codec codec = await descriptor.instantiateCodec();
          final ui.FrameInfo frameInfo = await codec.getNextFrame();

          // Use a scale of 1.0 since the image-size is decided by the caller.
          imageInfo = ImageInfo(image: frameInfo.image, scale: 1.0);
        } catch (e) {
          print('Error when creating image from road-shield icon-data $e');
        }
        callback(imageInfo, iconDescription, error);
      } else {
        callback(null, null, error);
      }
    });
  }

  void _createVehicleRestrictionIconWithIconProperties(
      VehicleRestrictionIconProperties properties,
      MapScheme mapScheme,
      Size2D sizeConstraintsInPixels,
      IconProviderCallback callback) {
    IconProviderInternalVehicleRestrictionIconAttributes attributes = 
        VehicleRestrictionIconAttributesFactory.createVehicleRestrictionIconAttributes(
                properties.restriction, properties.countryCode);

    _createVehicleRestrictionIconWithAttributes(attributes, mapScheme, sizeConstraintsInPixels, callback);
  }

  void _createVehicleRestrictionIconWithPickResult(
      PickVehicleRestrictionsResult pickingResult,
      MapScheme mapScheme,
      Size2D sizeConstraintsInPixels,
      IconProviderCallback callback) {
    IconProviderInternalVehicleRestrictionIconAttributes attributes =
        IconProviderInternalVehicleRestrictionIconAttributes(
            pickingResult.restrictionCategory,
            pickingResult.restrictionType,
            pickingResult.countryCode,
            pickingResult.text,
            pickingResult.timeIntervals.isEmpty ? false : true,
            true);

    _createVehicleRestrictionIconWithAttributes(attributes, mapScheme, sizeConstraintsInPixels, callback);
  }

  void _createVehicleRestrictionIconWithAttributes(
      IconProviderInternalVehicleRestrictionIconAttributes attributes,
      MapScheme mapScheme,
      Size2D sizeConstraintsInPixels,
      IconProviderCallback callback) {
    _iconProviderInternal?.createVehicleRestrictionIcon(
        attributes,
        mapScheme,
        sizeConstraintsInPixels.width.round(),
        sizeConstraintsInPixels.height.round(),
        (icon, iconDescription, error) async {
      if (icon != null && !icon.isEmpty) {
        ImageInfo? imageInfo;
        try {
          final ui.ImmutableBuffer buffer =
              await ui.ImmutableBuffer.fromUint8List(icon);
          final ui.ImageDescriptor descriptor =
              await ui.ImageDescriptor.encoded(buffer);
          final ui.Codec codec = await descriptor.instantiateCodec();
          final ui.FrameInfo frameInfo = await codec.getNextFrame();

          // Use a scale of 1.0 since the image-size is decided by the caller.
          imageInfo = ImageInfo(image: frameInfo.image, scale: 1.0);
        } catch (e) {
          print(
              'Error when creating image from vehcile-restriction icon-data $e');
        }
        callback(imageInfo, iconDescription, error);
      } else {
        callback(null, null, error);
      }
    });
  }
}
