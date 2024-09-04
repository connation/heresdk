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
import 'package:here_sdk/src/_native_base.dart' as __lib;
import 'package:here_sdk/src/_token_cache.dart' as __lib;
import 'package:here_sdk/src/_type_repository.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/venue/data/venue_info.dart';

/// The  for  for
/// the list of [VenueInfo] load event.
///
/// to add and remove the [VenueInfoListListener].
abstract class VenueInfoListListener {
  /// The  for  for
  /// the list of [VenueInfo] load event.
  ///
  /// to add and remove the [VenueInfoListListener].

  factory VenueInfoListListener(
    void Function(List<VenueInfo>) onVenueInfoListLoadLambda,

  ) => VenueInfoListListener$Lambdas(
    onVenueInfoListLoadLambda,

  );

  /// Indicates that [VenueInfo] list is loaded.
  ///
  /// [venueInfoList] The [VenueMap] where the loaded list of [VenueInfo].
  ///
  void onVenueInfoListLoad(List<VenueInfo> venueInfoList);
}


// VenueInfoListListener "private" section, not exported.

final _sdkVenueControlVenueinfolistlistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_venue_control_VenueInfoListListener_register_finalizer'));
final _sdkVenueControlVenueinfolistlistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_control_VenueInfoListListener_copy_handle'));
final _sdkVenueControlVenueinfolistlistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_control_VenueInfoListListener_release_handle'));
final _sdkVenueControlVenueinfolistlistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_venue_control_VenueInfoListListener_create_proxy'));
final _sdkVenueControlVenueinfolistlistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_control_VenueInfoListListener_get_type_id'));


class VenueInfoListListener$Lambdas implements VenueInfoListListener {
  void Function(List<VenueInfo>) onVenueInfoListLoadLambda;

  VenueInfoListListener$Lambdas(
    this.onVenueInfoListLoadLambda,

  );

  @override
  void onVenueInfoListLoad(List<VenueInfo> venueInfoList) =>
    onVenueInfoListLoadLambda(venueInfoList);
}

class VenueInfoListListener$Impl extends __lib.NativeBase implements VenueInfoListListener {

  VenueInfoListListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onVenueInfoListLoad(List<VenueInfo> venueInfoList) {
    final _onVenueInfoListLoadFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_control_VenueInfoListListener_onVenueInfoListLoad__ListOf_sdk_venue_data_VenueInfo'));
    final _venueInfoListHandle = venuecoreBindingslistofSdkVenueDataVenueinfoToFfi(venueInfoList);
    final _handle = this.handle;
    _onVenueInfoListLoadFfi(_handle, __lib.LibraryContext.isolateId, _venueInfoListHandle);
    venuecoreBindingslistofSdkVenueDataVenueinfoReleaseFfiHandle(_venueInfoListHandle);

  }


}

int _sdkVenueControlVenueinfolistlisteneronVenueInfoListLoadStatic(Object _obj, Pointer<Void> venueInfoList) {

  try {
    (_obj as VenueInfoListListener).onVenueInfoListLoad(venuecoreBindingslistofSdkVenueDataVenueinfoFromFfi(venueInfoList));
  } finally {
    venuecoreBindingslistofSdkVenueDataVenueinfoReleaseFfiHandle(venueInfoList);
  }
  return 0;
}


Pointer<Void> sdkVenueControlVenueinfolistlistenerToFfi(VenueInfoListListener value) {
  if (value is __lib.NativeBase) return _sdkVenueControlVenueinfolistlistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkVenueControlVenueinfolistlistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkVenueControlVenueinfolistlisteneronVenueInfoListLoadStatic, __lib.unknownError)
  );

  return result;
}

VenueInfoListListener sdkVenueControlVenueinfolistlistenerFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is VenueInfoListListener) return instance;

  final _typeIdHandle = _sdkVenueControlVenueinfolistlistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkVenueControlVenueinfolistlistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : VenueInfoListListener$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkVenueControlVenueinfolistlistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkVenueControlVenueinfolistlistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkVenueControlVenueinfolistlistenerReleaseHandle(handle);

Pointer<Void> sdkVenueControlVenueinfolistlistenerToFfiNullable(VenueInfoListListener? value) =>
  value != null ? sdkVenueControlVenueinfolistlistenerToFfi(value) : Pointer<Void>.fromAddress(0);

VenueInfoListListener? sdkVenueControlVenueinfolistlistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkVenueControlVenueinfolistlistenerFromFfi(handle) : null;

void sdkVenueControlVenueinfolistlistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkVenueControlVenueinfolistlistenerReleaseHandle(handle);

// End of VenueInfoListListener "private" section.


