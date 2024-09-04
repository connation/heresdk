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
import 'package:here_sdk/src/sdk/maploader/catalog_update_state.dart';
import 'package:here_sdk/src/sdk/maploader/installed_catalog.dart';

/// Holds information for the catalog update intent.
///
/// Provides information regarding installed catalog
/// and its latest available version.
/// Note: This is a beta release of this feature, so there could be a few bugs and unexpected
/// behaviors. Related APIs may change for new releases without a deprecation process.

class CatalogUpdateInfo {
  /// Installed catalog.
  InstalledCatalog installedCatalog;

  /// Latest version available for a catalog.
  int latestVersion;

  /// State of current catalog update.
  CatalogUpdateState state;

  /// @nodoc
  int? _catalogHandle;

  /// Total size in bytes that needs to be downloaded over the network to update the installed catalog.
  int networkSizeInBytes;

  /// Amount of free disk space required to perform update on the installed catalog.
  int diskSizeInBytes;

  /// Creates a new instance.

  /// [installedCatalog] Installed catalog.

  /// [latestVersion] Latest version available for a catalog.

  /// [state] State of current catalog update.

  /// [catalogHandle] 

  /// [networkSizeInBytes] Total size in bytes that needs to be downloaded over the network to update the installed catalog.

  /// [diskSizeInBytes] Amount of free disk space required to perform update on the installed catalog.

  CatalogUpdateInfo._(this.installedCatalog, this.latestVersion, this.state, this._catalogHandle, this.networkSizeInBytes, this.diskSizeInBytes);
  CatalogUpdateInfo(InstalledCatalog installedCatalog, int latestVersion)
    : installedCatalog = installedCatalog, latestVersion = latestVersion, state = CatalogUpdateState.unknownState, _catalogHandle = null, networkSizeInBytes = 0, diskSizeInBytes = 0;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CatalogUpdateInfo) return false;
    CatalogUpdateInfo _other = other;
    return installedCatalog == _other.installedCatalog &&
        latestVersion == _other.latestVersion &&
        state == _other.state &&
        _catalogHandle == _other._catalogHandle &&
        networkSizeInBytes == _other.networkSizeInBytes &&
        diskSizeInBytes == _other.diskSizeInBytes;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + installedCatalog.hashCode;
    result = 31 * result + latestVersion.hashCode;
    result = 31 * result + state.hashCode;
    result = 31 * result + _catalogHandle.hashCode;
    result = 31 * result + networkSizeInBytes.hashCode;
    result = 31 * result + diskSizeInBytes.hashCode;
    return result;
  }
}


// CatalogUpdateInfo "private" section, not exported.

final _sdkMaploaderCatalogupdateinfoCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Int64, Uint32, Pointer<Void>, Int64, Int64),
    Pointer<Void> Function(Pointer<Void>, int, int, Pointer<Void>, int, int)
  >('here_sdk_sdk_maploader_CatalogUpdateInfo_create_handle'));
final _sdkMaploaderCatalogupdateinfoReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_CatalogUpdateInfo_release_handle'));
final _sdkMaploaderCatalogupdateinfoGetFieldinstalledCatalog = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_CatalogUpdateInfo_get_field_installedCatalog'));
final _sdkMaploaderCatalogupdateinfoGetFieldlatestVersion = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_CatalogUpdateInfo_get_field_latestVersion'));
final _sdkMaploaderCatalogupdateinfoGetFieldstate = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_CatalogUpdateInfo_get_field_state'));
final _sdkMaploaderCatalogupdateinfoGetFieldcatalogHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_CatalogUpdateInfo_get_field_catalogHandle'));
final _sdkMaploaderCatalogupdateinfoGetFieldnetworkSizeInBytes = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_CatalogUpdateInfo_get_field_networkSizeInBytes'));
final _sdkMaploaderCatalogupdateinfoGetFielddiskSizeInBytes = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_CatalogUpdateInfo_get_field_diskSizeInBytes'));



Pointer<Void> sdkMaploaderCatalogupdateinfoToFfi(CatalogUpdateInfo value) {
  final _installedCatalogHandle = sdkMaploaderInstalledcatalogToFfi(value.installedCatalog);
  final _latestVersionHandle = (value.latestVersion);
  final _stateHandle = sdkMaploaderCatalogupdatestateToFfi(value.state);
  final _catalogHandleHandle = uLongToFfiNullable(value._catalogHandle);
  final _networkSizeInBytesHandle = (value.networkSizeInBytes);
  final _diskSizeInBytesHandle = (value.diskSizeInBytes);
  final _result = _sdkMaploaderCatalogupdateinfoCreateHandle(_installedCatalogHandle, _latestVersionHandle, _stateHandle, _catalogHandleHandle, _networkSizeInBytesHandle, _diskSizeInBytesHandle);
  sdkMaploaderInstalledcatalogReleaseFfiHandle(_installedCatalogHandle);
  
  sdkMaploaderCatalogupdatestateReleaseFfiHandle(_stateHandle);
  uLongReleaseFfiHandleNullable(_catalogHandleHandle);
  
  
  return _result;
}

CatalogUpdateInfo sdkMaploaderCatalogupdateinfoFromFfi(Pointer<Void> handle) {
  final _installedCatalogHandle = _sdkMaploaderCatalogupdateinfoGetFieldinstalledCatalog(handle);
  final _latestVersionHandle = _sdkMaploaderCatalogupdateinfoGetFieldlatestVersion(handle);
  final _stateHandle = _sdkMaploaderCatalogupdateinfoGetFieldstate(handle);
  final _catalogHandleHandle = _sdkMaploaderCatalogupdateinfoGetFieldcatalogHandle(handle);
  final _networkSizeInBytesHandle = _sdkMaploaderCatalogupdateinfoGetFieldnetworkSizeInBytes(handle);
  final _diskSizeInBytesHandle = _sdkMaploaderCatalogupdateinfoGetFielddiskSizeInBytes(handle);
  try {
    return CatalogUpdateInfo._(
      sdkMaploaderInstalledcatalogFromFfi(_installedCatalogHandle), 
      (_latestVersionHandle), 
      sdkMaploaderCatalogupdatestateFromFfi(_stateHandle), 
      uLongFromFfiNullable(_catalogHandleHandle), 
      (_networkSizeInBytesHandle), 
      (_diskSizeInBytesHandle)
    );
  } finally {
    sdkMaploaderInstalledcatalogReleaseFfiHandle(_installedCatalogHandle);
    
    sdkMaploaderCatalogupdatestateReleaseFfiHandle(_stateHandle);
    uLongReleaseFfiHandleNullable(_catalogHandleHandle);
    
    
  }
}

void sdkMaploaderCatalogupdateinfoReleaseFfiHandle(Pointer<Void> handle) => _sdkMaploaderCatalogupdateinfoReleaseHandle(handle);

// Nullable CatalogUpdateInfo

final _sdkMaploaderCatalogupdateinfoCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_CatalogUpdateInfo_create_handle_nullable'));
final _sdkMaploaderCatalogupdateinfoReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_CatalogUpdateInfo_release_handle_nullable'));
final _sdkMaploaderCatalogupdateinfoGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_CatalogUpdateInfo_get_value_nullable'));

Pointer<Void> sdkMaploaderCatalogupdateinfoToFfiNullable(CatalogUpdateInfo? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMaploaderCatalogupdateinfoToFfi(value);
  final result = _sdkMaploaderCatalogupdateinfoCreateHandleNullable(_handle);
  sdkMaploaderCatalogupdateinfoReleaseFfiHandle(_handle);
  return result;
}

CatalogUpdateInfo? sdkMaploaderCatalogupdateinfoFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMaploaderCatalogupdateinfoGetValueNullable(handle);
  final result = sdkMaploaderCatalogupdateinfoFromFfi(_handle);
  sdkMaploaderCatalogupdateinfoReleaseFfiHandle(_handle);
  return result;
}

void sdkMaploaderCatalogupdateinfoReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMaploaderCatalogupdateinfoReleaseHandleNullable(handle);

// End of CatalogUpdateInfo "private" section.


