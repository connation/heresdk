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
import 'package:here_sdk/src/sdk/venue/control/venue_error_code.dart';

/// A method which is called on the main thread when [VenueMap.selectVenueAsyncWithErrors] has been completed.
///
/// [p0] Represents an error in case of a failure. It is `null` for an operation that succeeds.
typedef VenueLoadErrorCallback = void Function(VenueErrorCode?);

// VenueLoadErrorCallback "private" section, not exported.

final _sdkVenueControlVenueloaderrorcallbackRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_venue_control_VenueLoadErrorCallback_register_finalizer'));
final _sdkVenueControlVenueloaderrorcallbackCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_control_VenueLoadErrorCallback_copy_handle'));
final _sdkVenueControlVenueloaderrorcallbackReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_control_VenueLoadErrorCallback_release_handle'));
final _sdkVenueControlVenueloaderrorcallbackCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_venue_control_VenueLoadErrorCallback_create_proxy'));

class VenueLoadErrorCallback$Impl {
  final Pointer<Void> handle;
  VenueLoadErrorCallback$Impl(this.handle);

  void call(VenueErrorCode? p0) {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_control_VenueLoadErrorCallback_call__VenueErrorCode_'));
    final _p0Handle = sdkVenueControlVenueerrorcodeToFfiNullable(p0);
    final _handle = this.handle;
    _callFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle);
    sdkVenueControlVenueerrorcodeReleaseFfiHandleNullable(_p0Handle);

  }

}

int _sdkVenueControlVenueloaderrorcallbackcallStatic(Object _obj, Pointer<Void> p0) {
  
  try {
    (_obj as VenueLoadErrorCallback)(sdkVenueControlVenueerrorcodeFromFfiNullable(p0));
  } finally {
    sdkVenueControlVenueerrorcodeReleaseFfiHandleNullable(p0);
  }
  return 0;
}

Pointer<Void> sdkVenueControlVenueloaderrorcallbackToFfi(VenueLoadErrorCallback value) =>
  _sdkVenueControlVenueloaderrorcallbackCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle, Pointer<Void>)>(_sdkVenueControlVenueloaderrorcallbackcallStatic, __lib.unknownError)
  );

VenueLoadErrorCallback sdkVenueControlVenueloaderrorcallbackFromFfi(Pointer<Void> handle) {
  final _copiedHandle = _sdkVenueControlVenueloaderrorcallbackCopyHandle(handle);
  final _impl = VenueLoadErrorCallback$Impl(_copiedHandle);
  final result = (VenueErrorCode? p0) => _impl.call(p0);
  _sdkVenueControlVenueloaderrorcallbackRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkVenueControlVenueloaderrorcallbackReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkVenueControlVenueloaderrorcallbackReleaseHandle(handle);

// Nullable VenueLoadErrorCallback

final _sdkVenueControlVenueloaderrorcallbackCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_control_VenueLoadErrorCallback_create_handle_nullable'));
final _sdkVenueControlVenueloaderrorcallbackReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_control_VenueLoadErrorCallback_release_handle_nullable'));
final _sdkVenueControlVenueloaderrorcallbackGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_control_VenueLoadErrorCallback_get_value_nullable'));

Pointer<Void> sdkVenueControlVenueloaderrorcallbackToFfiNullable(VenueLoadErrorCallback? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkVenueControlVenueloaderrorcallbackToFfi(value);
  final result = _sdkVenueControlVenueloaderrorcallbackCreateHandleNullable(_handle);
  sdkVenueControlVenueloaderrorcallbackReleaseFfiHandle(_handle);
  return result;
}

VenueLoadErrorCallback? sdkVenueControlVenueloaderrorcallbackFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkVenueControlVenueloaderrorcallbackGetValueNullable(handle);
  final result = sdkVenueControlVenueloaderrorcallbackFromFfi(_handle);
  sdkVenueControlVenueloaderrorcallbackReleaseFfiHandle(_handle);
  return result;
}

void sdkVenueControlVenueloaderrorcallbackReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkVenueControlVenueloaderrorcallbackReleaseHandleNullable(handle);

// End of VenueLoadErrorCallback "private" section.


