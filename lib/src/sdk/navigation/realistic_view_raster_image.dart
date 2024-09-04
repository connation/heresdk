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
import 'dart:typed_data';
import 'package:here_sdk/src/_library_context.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/navigation/realistic_view_type.dart';

/// A realistic view.
///
/// The fields describing the realistic view are
/// [RealisticViewRasterImage.realisticViewPngImageContent] contains a PNG image of the realistic view
/// and is represented as binary data.
/// [RealisticViewRasterImage.realisticViewType] indicates the type of the realistic view.
/// A valid realistic view contains a non-empty [RealisticViewRasterImage.realisticViewPngImageContent].
/// Use [NavigatorInterface.realisticViewWarningListener] to get notifications with the realistic
/// views of the upcoming realistic view.
///
/// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected
/// behaviors. Related APIs may change for new releases without a deprecation process.

class RealisticViewRasterImage {
  /// The full content of the realistic view raster image as binary data.
  Uint8List realisticViewPngImageContent;

  /// The type of realistic view.
  /// @nodoc
  RealisticViewType _realisticViewType;

  /// Creates a new instance.

  /// [realisticViewPngImageContent] The full content of the realistic view raster image as binary data.

  /// [realisticViewType] The type of realistic view.

  RealisticViewRasterImage._(this.realisticViewPngImageContent, this._realisticViewType);
  RealisticViewRasterImage(Uint8List realisticViewPngImageContent)
    : realisticViewPngImageContent = realisticViewPngImageContent, _realisticViewType = RealisticViewType.unknown;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! RealisticViewRasterImage) return false;
    RealisticViewRasterImage _other = other;
    return realisticViewPngImageContent == _other.realisticViewPngImageContent &&
        _realisticViewType == _other._realisticViewType;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + realisticViewPngImageContent.hashCode;
    result = 31 * result + _realisticViewType.hashCode;
    return result;
  }
}


// RealisticViewRasterImage "private" section, not exported.

final _sdkNavigationRealisticviewrasterimageCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Uint32),
    Pointer<Void> Function(Pointer<Void>, int)
  >('here_sdk_sdk_navigation_RealisticViewRasterImage_create_handle'));
final _sdkNavigationRealisticviewrasterimageReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RealisticViewRasterImage_release_handle'));
final _sdkNavigationRealisticviewrasterimageGetFieldrealisticViewPngImageContent = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RealisticViewRasterImage_get_field_realisticViewPngImageContent'));
final _sdkNavigationRealisticviewrasterimageGetFieldrealisticViewType = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RealisticViewRasterImage_get_field_realisticViewType'));



Pointer<Void> sdkNavigationRealisticviewrasterimageToFfi(RealisticViewRasterImage value) {
  final _realisticViewPngImageContentHandle = blobToFfi(value.realisticViewPngImageContent);
  final _realisticViewTypeHandle = sdkNavigationRealisticviewtypeToFfi(value._realisticViewType);
  final _result = _sdkNavigationRealisticviewrasterimageCreateHandle(_realisticViewPngImageContentHandle, _realisticViewTypeHandle);
  blobReleaseFfiHandle(_realisticViewPngImageContentHandle);
  sdkNavigationRealisticviewtypeReleaseFfiHandle(_realisticViewTypeHandle);
  return _result;
}

RealisticViewRasterImage sdkNavigationRealisticviewrasterimageFromFfi(Pointer<Void> handle) {
  final _realisticViewPngImageContentHandle = _sdkNavigationRealisticviewrasterimageGetFieldrealisticViewPngImageContent(handle);
  final _realisticViewTypeHandle = _sdkNavigationRealisticviewrasterimageGetFieldrealisticViewType(handle);
  try {
    return RealisticViewRasterImage._(
      blobFromFfi(_realisticViewPngImageContentHandle), 
      sdkNavigationRealisticviewtypeFromFfi(_realisticViewTypeHandle)
    );
  } finally {
    blobReleaseFfiHandle(_realisticViewPngImageContentHandle);
    sdkNavigationRealisticviewtypeReleaseFfiHandle(_realisticViewTypeHandle);
  }
}

void sdkNavigationRealisticviewrasterimageReleaseFfiHandle(Pointer<Void> handle) => _sdkNavigationRealisticviewrasterimageReleaseHandle(handle);

// Nullable RealisticViewRasterImage

final _sdkNavigationRealisticviewrasterimageCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RealisticViewRasterImage_create_handle_nullable'));
final _sdkNavigationRealisticviewrasterimageReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RealisticViewRasterImage_release_handle_nullable'));
final _sdkNavigationRealisticviewrasterimageGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RealisticViewRasterImage_get_value_nullable'));

Pointer<Void> sdkNavigationRealisticviewrasterimageToFfiNullable(RealisticViewRasterImage? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationRealisticviewrasterimageToFfi(value);
  final result = _sdkNavigationRealisticviewrasterimageCreateHandleNullable(_handle);
  sdkNavigationRealisticviewrasterimageReleaseFfiHandle(_handle);
  return result;
}

RealisticViewRasterImage? sdkNavigationRealisticviewrasterimageFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationRealisticviewrasterimageGetValueNullable(handle);
  final result = sdkNavigationRealisticviewrasterimageFromFfi(_handle);
  sdkNavigationRealisticviewrasterimageReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationRealisticviewrasterimageReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationRealisticviewrasterimageReleaseHandleNullable(handle);

// End of RealisticViewRasterImage "private" section.


