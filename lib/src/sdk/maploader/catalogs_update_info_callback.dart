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
import 'package:here_sdk/src/_token_cache.dart' as __lib;
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/maploader/catalog_update_info.dart';
import 'package:here_sdk/src/sdk/maploader/map_loader_error.dart';

/// This method will be called on the main thread when [MapUpdater.retrieveCatalogsUpdateInfo] has been completed.
///
/// The first parameter indicates an error in case of a failure. The second parameter contains the results.
/// Both parameters cannot be `null` at the same time - or not `null` at the same time.
/// An empty `CatalogUpdateInfo` list  represent no map updates.
/// Note: This is a beta release of this feature, so there could be a few bugs and unexpected
/// behaviors. Related APIs may change for new releases without a deprecation process.
///
/// [p0] Represents an error in case of a failure. It is `null` for an operation that succeeds.
///
/// [p1] Represents a list of all catalogs that can be updated. It is `null` in case of an error.
typedef CatalogsUpdateInfoCallback = void Function(MapLoaderError?, List<CatalogUpdateInfo>?);

// CatalogsUpdateInfoCallback "private" section, not exported.

final _sdkMaploaderCatalogsupdateinfocallbackRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_maploader_CatalogsUpdateInfoCallback_register_finalizer'));
final _sdkMaploaderCatalogsupdateinfocallbackCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_CatalogsUpdateInfoCallback_copy_handle'));
final _sdkMaploaderCatalogsupdateinfocallbackReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_CatalogsUpdateInfoCallback_release_handle'));
final _sdkMaploaderCatalogsupdateinfocallbackCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_maploader_CatalogsUpdateInfoCallback_create_proxy'));

class CatalogsUpdateInfoCallback$Impl {
  final Pointer<Void> handle;
  CatalogsUpdateInfoCallback$Impl(this.handle);

  void call(MapLoaderError? p0, List<CatalogUpdateInfo>? p1) {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_maploader_CatalogsUpdateInfoCallback_call__MapLoaderError__ListOf_sdk_maploader_CatalogUpdateInfo_'));
    final _p0Handle = sdkMaploaderMaploadererrorToFfiNullable(p0);
    final _p1Handle = heresdkMaploaderBindingslistofSdkMaploaderCatalogupdateinfoToFfiNullable(p1);
    final _handle = this.handle;
    _callFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle, _p1Handle);
    sdkMaploaderMaploadererrorReleaseFfiHandleNullable(_p0Handle);
    heresdkMaploaderBindingslistofSdkMaploaderCatalogupdateinfoReleaseFfiHandleNullable(_p1Handle);

  }

}

int _sdkMaploaderCatalogsupdateinfocallbackcallStatic(Object _obj, Pointer<Void> p0, Pointer<Void> p1) {
  
  try {
    (_obj as CatalogsUpdateInfoCallback)(sdkMaploaderMaploadererrorFromFfiNullable(p0), heresdkMaploaderBindingslistofSdkMaploaderCatalogupdateinfoFromFfiNullable(p1));
  } finally {
    sdkMaploaderMaploadererrorReleaseFfiHandleNullable(p0);
    heresdkMaploaderBindingslistofSdkMaploaderCatalogupdateinfoReleaseFfiHandleNullable(p1);
  }
  return 0;
}

Pointer<Void> sdkMaploaderCatalogsupdateinfocallbackToFfi(CatalogsUpdateInfoCallback value) =>
  _sdkMaploaderCatalogsupdateinfocallbackCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle, Pointer<Void>, Pointer<Void>)>(_sdkMaploaderCatalogsupdateinfocallbackcallStatic, __lib.unknownError)
  );

CatalogsUpdateInfoCallback sdkMaploaderCatalogsupdateinfocallbackFromFfi(Pointer<Void> handle) {
  final _copiedHandle = _sdkMaploaderCatalogsupdateinfocallbackCopyHandle(handle);
  final _impl = CatalogsUpdateInfoCallback$Impl(_copiedHandle);
  final result = (MapLoaderError? p0, List<CatalogUpdateInfo>? p1) => _impl.call(p0, p1);
  _sdkMaploaderCatalogsupdateinfocallbackRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMaploaderCatalogsupdateinfocallbackReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMaploaderCatalogsupdateinfocallbackReleaseHandle(handle);

// Nullable CatalogsUpdateInfoCallback

final _sdkMaploaderCatalogsupdateinfocallbackCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_CatalogsUpdateInfoCallback_create_handle_nullable'));
final _sdkMaploaderCatalogsupdateinfocallbackReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_CatalogsUpdateInfoCallback_release_handle_nullable'));
final _sdkMaploaderCatalogsupdateinfocallbackGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_CatalogsUpdateInfoCallback_get_value_nullable'));

Pointer<Void> sdkMaploaderCatalogsupdateinfocallbackToFfiNullable(CatalogsUpdateInfoCallback? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMaploaderCatalogsupdateinfocallbackToFfi(value);
  final result = _sdkMaploaderCatalogsupdateinfocallbackCreateHandleNullable(_handle);
  sdkMaploaderCatalogsupdateinfocallbackReleaseFfiHandle(_handle);
  return result;
}

CatalogsUpdateInfoCallback? sdkMaploaderCatalogsupdateinfocallbackFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMaploaderCatalogsupdateinfocallbackGetValueNullable(handle);
  final result = sdkMaploaderCatalogsupdateinfocallbackFromFfi(_handle);
  sdkMaploaderCatalogsupdateinfocallbackReleaseFfiHandle(_handle);
  return result;
}

void sdkMaploaderCatalogsupdateinfocallbackReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMaploaderCatalogsupdateinfocallbackReleaseHandleNullable(handle);

// End of CatalogsUpdateInfoCallback "private" section.


