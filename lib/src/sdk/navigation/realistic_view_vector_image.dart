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

/// A realistic view of a junction.
///
/// The fields describing the realistic view are
/// [RealisticViewVectorImage.junctionViewSvgImageContent] contains a SVG image of the junction view
/// represented as a string.
/// [RealisticViewVectorImage.signpostSvgImageContent] contains an SVG image of the signpost corresponding
/// to the junction, also represented as a string.
/// A valid realistic view contains a non-empty [RealisticViewVectorImage.junctionViewSvgImageContent] and a
/// non-empty [RealisticViewVectorImage.signpostSvgImageContent].
/// Use [NavigatorInterface.realisticViewWarningListener] to get notifications with the realistic
/// views of the upcoming junctions.
///
/// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected
/// behaviors. Related APIs may change for new releases without a deprecation process.

class RealisticViewVectorImage {
  /// The full content of the junction view vector image as a string.
  String junctionViewSvgImageContent;

  /// The full content of the signpost vector image as a string.
  String signpostSvgImageContent;

  /// Creates a new instance.

  /// [junctionViewSvgImageContent] The full content of the junction view vector image as a string.

  /// [signpostSvgImageContent] The full content of the signpost vector image as a string.

  RealisticViewVectorImage(this.junctionViewSvgImageContent, this.signpostSvgImageContent);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! RealisticViewVectorImage) return false;
    RealisticViewVectorImage _other = other;
    return junctionViewSvgImageContent == _other.junctionViewSvgImageContent &&
        signpostSvgImageContent == _other.signpostSvgImageContent;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + junctionViewSvgImageContent.hashCode;
    result = 31 * result + signpostSvgImageContent.hashCode;
    return result;
  }
}


// RealisticViewVectorImage "private" section, not exported.

final _sdkNavigationRealisticviewvectorimageCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_navigation_RealisticViewVectorImage_create_handle'));
final _sdkNavigationRealisticviewvectorimageReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RealisticViewVectorImage_release_handle'));
final _sdkNavigationRealisticviewvectorimageGetFieldjunctionViewSvgImageContent = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RealisticViewVectorImage_get_field_junctionViewSvgImageContent'));
final _sdkNavigationRealisticviewvectorimageGetFieldsignpostSvgImageContent = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RealisticViewVectorImage_get_field_signpostSvgImageContent'));



Pointer<Void> sdkNavigationRealisticviewvectorimageToFfi(RealisticViewVectorImage value) {
  final _junctionViewSvgImageContentHandle = stringToFfi(value.junctionViewSvgImageContent);
  final _signpostSvgImageContentHandle = stringToFfi(value.signpostSvgImageContent);
  final _result = _sdkNavigationRealisticviewvectorimageCreateHandle(_junctionViewSvgImageContentHandle, _signpostSvgImageContentHandle);
  stringReleaseFfiHandle(_junctionViewSvgImageContentHandle);
  stringReleaseFfiHandle(_signpostSvgImageContentHandle);
  return _result;
}

RealisticViewVectorImage sdkNavigationRealisticviewvectorimageFromFfi(Pointer<Void> handle) {
  final _junctionViewSvgImageContentHandle = _sdkNavigationRealisticviewvectorimageGetFieldjunctionViewSvgImageContent(handle);
  final _signpostSvgImageContentHandle = _sdkNavigationRealisticviewvectorimageGetFieldsignpostSvgImageContent(handle);
  try {
    return RealisticViewVectorImage(
      stringFromFfi(_junctionViewSvgImageContentHandle), 
      stringFromFfi(_signpostSvgImageContentHandle)
    );
  } finally {
    stringReleaseFfiHandle(_junctionViewSvgImageContentHandle);
    stringReleaseFfiHandle(_signpostSvgImageContentHandle);
  }
}

void sdkNavigationRealisticviewvectorimageReleaseFfiHandle(Pointer<Void> handle) => _sdkNavigationRealisticviewvectorimageReleaseHandle(handle);

// Nullable RealisticViewVectorImage

final _sdkNavigationRealisticviewvectorimageCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RealisticViewVectorImage_create_handle_nullable'));
final _sdkNavigationRealisticviewvectorimageReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RealisticViewVectorImage_release_handle_nullable'));
final _sdkNavigationRealisticviewvectorimageGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RealisticViewVectorImage_get_value_nullable'));

Pointer<Void> sdkNavigationRealisticviewvectorimageToFfiNullable(RealisticViewVectorImage? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationRealisticviewvectorimageToFfi(value);
  final result = _sdkNavigationRealisticviewvectorimageCreateHandleNullable(_handle);
  sdkNavigationRealisticviewvectorimageReleaseFfiHandle(_handle);
  return result;
}

RealisticViewVectorImage? sdkNavigationRealisticviewvectorimageFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationRealisticviewvectorimageGetValueNullable(handle);
  final result = sdkNavigationRealisticviewvectorimageFromFfi(_handle);
  sdkNavigationRealisticviewvectorimageReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationRealisticviewvectorimageReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationRealisticviewvectorimageReleaseHandleNullable(handle);

// End of RealisticViewVectorImage "private" section.


