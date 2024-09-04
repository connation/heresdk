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
import 'package:here_sdk/src/sdk/core/engine/catalog_identifier.dart';
import 'package:meta/meta.dart';


/// Represents installed catalog.
///
/// Note: This is a beta release of this feature, so there could be a few bugs and unexpected
/// behaviors. Related APIs may change for new releases without a deprecation process.

class InstalledCatalog {
  /// Provides information regarding catalog hrn and current version.
  CatalogIdentifier catalogIdentifier;

  InstalledCatalog._(this.catalogIdentifier);
  /// Creates a new instance.
  ///
  /// [hrn] A HERE Resource Name (HRN) for this catalog. See [CatalogIdentifier] for more info.
  ///
  /// [version] A version number for a catalog. See [CatalogIdentifier] for more info.
  ///
  factory InstalledCatalog(String hrn, int version) => $prototype.make(hrn, version);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! InstalledCatalog) return false;
    InstalledCatalog _other = other;
    return catalogIdentifier == _other.catalogIdentifier;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + catalogIdentifier.hashCode;
    return result;
  }

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = InstalledCatalog$Impl();
}


// InstalledCatalog "private" section, not exported.

final _sdkMaploaderInstalledcatalogCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_InstalledCatalog_create_handle'));
final _sdkMaploaderInstalledcatalogReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_InstalledCatalog_release_handle'));
final _sdkMaploaderInstalledcatalogGetFieldcatalogIdentifier = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_InstalledCatalog_get_field_catalogIdentifier'));



/// @nodoc
@visibleForTesting
class InstalledCatalog$Impl {
  InstalledCatalog make(String hrn, int version) {
    final _makeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Int64), Pointer<Void> Function(int, Pointer<Void>, int)>('here_sdk_sdk_maploader_InstalledCatalog_make__String_Long'));
    final _hrnHandle = stringToFfi(hrn);
    final _versionHandle = (version);
    final __resultHandle = _makeFfi(__lib.LibraryContext.isolateId, _hrnHandle, _versionHandle);
    stringReleaseFfiHandle(_hrnHandle);

    try {
      return sdkMaploaderInstalledcatalogFromFfi(__resultHandle);
    } finally {
      sdkMaploaderInstalledcatalogReleaseFfiHandle(__resultHandle);

    }

  }

}

Pointer<Void> sdkMaploaderInstalledcatalogToFfi(InstalledCatalog value) {
  final _catalogIdentifierHandle = sdkCoreEngineCatalogidentifierToFfi(value.catalogIdentifier);
  final _result = _sdkMaploaderInstalledcatalogCreateHandle(_catalogIdentifierHandle);
  sdkCoreEngineCatalogidentifierReleaseFfiHandle(_catalogIdentifierHandle);
  return _result;
}

InstalledCatalog sdkMaploaderInstalledcatalogFromFfi(Pointer<Void> handle) {
  final _catalogIdentifierHandle = _sdkMaploaderInstalledcatalogGetFieldcatalogIdentifier(handle);
  try {
    return InstalledCatalog._(
      sdkCoreEngineCatalogidentifierFromFfi(_catalogIdentifierHandle)
    );
  } finally {
    sdkCoreEngineCatalogidentifierReleaseFfiHandle(_catalogIdentifierHandle);
  }
}

void sdkMaploaderInstalledcatalogReleaseFfiHandle(Pointer<Void> handle) => _sdkMaploaderInstalledcatalogReleaseHandle(handle);

// Nullable InstalledCatalog

final _sdkMaploaderInstalledcatalogCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_InstalledCatalog_create_handle_nullable'));
final _sdkMaploaderInstalledcatalogReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_InstalledCatalog_release_handle_nullable'));
final _sdkMaploaderInstalledcatalogGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_InstalledCatalog_get_value_nullable'));

Pointer<Void> sdkMaploaderInstalledcatalogToFfiNullable(InstalledCatalog? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMaploaderInstalledcatalogToFfi(value);
  final result = _sdkMaploaderInstalledcatalogCreateHandleNullable(_handle);
  sdkMaploaderInstalledcatalogReleaseFfiHandle(_handle);
  return result;
}

InstalledCatalog? sdkMaploaderInstalledcatalogFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMaploaderInstalledcatalogGetValueNullable(handle);
  final result = sdkMaploaderInstalledcatalogFromFfi(_handle);
  sdkMaploaderInstalledcatalogReleaseFfiHandle(_handle);
  return result;
}

void sdkMaploaderInstalledcatalogReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMaploaderInstalledcatalogReleaseHandleNullable(handle);

// End of InstalledCatalog "private" section.


