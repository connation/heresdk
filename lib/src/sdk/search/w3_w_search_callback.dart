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
import 'package:here_sdk/src/sdk/search/w3_w_search_error.dart';
import 'package:here_sdk/src/sdk/search/w3_w_square.dart';

/// The method that will be called on the main thread when a search operation in `W3WSearchEngine`
/// has been completed.
///
/// [p0] The w3w search error
///
/// [p1] The w3w square
typedef W3WSearchCallback = void Function(W3WSearchError?, W3WSquare?);

// W3WSearchCallback "private" section, not exported.

final _sdkSearchW3wsearchcallbackRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_search_W3WSearchCallback_register_finalizer'));
final _sdkSearchW3wsearchcallbackCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_W3WSearchCallback_copy_handle'));
final _sdkSearchW3wsearchcallbackReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_W3WSearchCallback_release_handle'));
final _sdkSearchW3wsearchcallbackCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_search_W3WSearchCallback_create_proxy'));

class W3WSearchCallback$Impl {
  final Pointer<Void> handle;
  W3WSearchCallback$Impl(this.handle);

  void call(W3WSearchError? p0, W3WSquare? p1) {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_W3WSearchCallback_call__W3WSearchError__W3WSquare_'));
    final _p0Handle = sdkSearchW3wsearcherrorToFfiNullable(p0);
    final _p1Handle = sdkSearchW3wsquareToFfiNullable(p1);
    final _handle = this.handle;
    _callFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle, _p1Handle);
    sdkSearchW3wsearcherrorReleaseFfiHandleNullable(_p0Handle);
    sdkSearchW3wsquareReleaseFfiHandleNullable(_p1Handle);

  }

}

int _sdkSearchW3wsearchcallbackcallStatic(Object _obj, Pointer<Void> p0, Pointer<Void> p1) {
  
  try {
    (_obj as W3WSearchCallback)(sdkSearchW3wsearcherrorFromFfiNullable(p0), sdkSearchW3wsquareFromFfiNullable(p1));
  } finally {
    sdkSearchW3wsearcherrorReleaseFfiHandleNullable(p0);
    sdkSearchW3wsquareReleaseFfiHandleNullable(p1);
  }
  return 0;
}

Pointer<Void> sdkSearchW3wsearchcallbackToFfi(W3WSearchCallback value) =>
  _sdkSearchW3wsearchcallbackCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle, Pointer<Void>, Pointer<Void>)>(_sdkSearchW3wsearchcallbackcallStatic, __lib.unknownError)
  );

W3WSearchCallback sdkSearchW3wsearchcallbackFromFfi(Pointer<Void> handle) {
  final _copiedHandle = _sdkSearchW3wsearchcallbackCopyHandle(handle);
  final _impl = W3WSearchCallback$Impl(_copiedHandle);
  final result = (W3WSearchError? p0, W3WSquare? p1) => _impl.call(p0, p1);
  _sdkSearchW3wsearchcallbackRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkSearchW3wsearchcallbackReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkSearchW3wsearchcallbackReleaseHandle(handle);

// Nullable W3WSearchCallback

final _sdkSearchW3wsearchcallbackCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_W3WSearchCallback_create_handle_nullable'));
final _sdkSearchW3wsearchcallbackReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_W3WSearchCallback_release_handle_nullable'));
final _sdkSearchW3wsearchcallbackGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_W3WSearchCallback_get_value_nullable'));

Pointer<Void> sdkSearchW3wsearchcallbackToFfiNullable(W3WSearchCallback? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchW3wsearchcallbackToFfi(value);
  final result = _sdkSearchW3wsearchcallbackCreateHandleNullable(_handle);
  sdkSearchW3wsearchcallbackReleaseFfiHandle(_handle);
  return result;
}

W3WSearchCallback? sdkSearchW3wsearchcallbackFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchW3wsearchcallbackGetValueNullable(handle);
  final result = sdkSearchW3wsearchcallbackFromFfi(_handle);
  sdkSearchW3wsearchcallbackReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchW3wsearchcallbackReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchW3wsearchcallbackReleaseHandleNullable(handle);

// End of W3WSearchCallback "private" section.


