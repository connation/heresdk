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
/// [RealisticView.junctionViewSvgImageContent] which contains an SVG image of the junction view
/// represented as a string and the [RealisticView.signpostSvgImageContent] which contains an SVG
/// image of the signpost corresponding to the junction, also represented as a string.
/// A valid realistic view contains a non-empty [RealisticView.junctionViewSvgImageContent] and a
/// non-empty [RealisticView.signpostSvgImageContent].
/// Use [NavigatorInterface.realisticViewWarningListener] to get notifications with the realistic
/// views of the upcoming junctions.
///
/// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected
/// behaviors. Related APIs may change for new releases without a deprecation process.
@Deprecated("Will be removed in v4.21.0. Please use [RealisticViewVectorImage] instead.")

class RealisticView {
  /// The full content of the junction view image file as a string.
  String junctionViewSvgImageContent;

  /// The full content of the signpost image file as a string.
  String signpostSvgImageContent;

  /// Creates a new instance.

  /// [junctionViewSvgImageContent] The full content of the junction view image file as a string.

  /// [signpostSvgImageContent] The full content of the signpost image file as a string.

  RealisticView(this.junctionViewSvgImageContent, this.signpostSvgImageContent);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! RealisticView) return false;
    RealisticView _other = other;
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


// RealisticView "private" section, not exported.

final _sdkNavigationRealisticviewCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_navigation_RealisticView_create_handle'));
final _sdkNavigationRealisticviewReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RealisticView_release_handle'));
final _sdkNavigationRealisticviewGetFieldjunctionViewSvgImageContent = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RealisticView_get_field_junctionViewSvgImageContent'));
final _sdkNavigationRealisticviewGetFieldsignpostSvgImageContent = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RealisticView_get_field_signpostSvgImageContent'));



Pointer<Void> sdkNavigationRealisticviewToFfi(RealisticView value) {
  final _junctionViewSvgImageContentHandle = stringToFfi(value.junctionViewSvgImageContent);
  final _signpostSvgImageContentHandle = stringToFfi(value.signpostSvgImageContent);
  final _result = _sdkNavigationRealisticviewCreateHandle(_junctionViewSvgImageContentHandle, _signpostSvgImageContentHandle);
  stringReleaseFfiHandle(_junctionViewSvgImageContentHandle);
  stringReleaseFfiHandle(_signpostSvgImageContentHandle);
  return _result;
}

RealisticView sdkNavigationRealisticviewFromFfi(Pointer<Void> handle) {
  final _junctionViewSvgImageContentHandle = _sdkNavigationRealisticviewGetFieldjunctionViewSvgImageContent(handle);
  final _signpostSvgImageContentHandle = _sdkNavigationRealisticviewGetFieldsignpostSvgImageContent(handle);
  try {
    return RealisticView(
      stringFromFfi(_junctionViewSvgImageContentHandle), 
      stringFromFfi(_signpostSvgImageContentHandle)
    );
  } finally {
    stringReleaseFfiHandle(_junctionViewSvgImageContentHandle);
    stringReleaseFfiHandle(_signpostSvgImageContentHandle);
  }
}

void sdkNavigationRealisticviewReleaseFfiHandle(Pointer<Void> handle) => _sdkNavigationRealisticviewReleaseHandle(handle);

// Nullable RealisticView

final _sdkNavigationRealisticviewCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RealisticView_create_handle_nullable'));
final _sdkNavigationRealisticviewReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RealisticView_release_handle_nullable'));
final _sdkNavigationRealisticviewGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RealisticView_get_value_nullable'));

Pointer<Void> sdkNavigationRealisticviewToFfiNullable(RealisticView? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationRealisticviewToFfi(value);
  final result = _sdkNavigationRealisticviewCreateHandleNullable(_handle);
  sdkNavigationRealisticviewReleaseFfiHandle(_handle);
  return result;
}

RealisticView? sdkNavigationRealisticviewFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationRealisticviewGetValueNullable(handle);
  final result = sdkNavigationRealisticviewFromFfi(_handle);
  sdkNavigationRealisticviewReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationRealisticviewReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationRealisticviewReleaseHandleNullable(handle);

// End of RealisticView "private" section.


