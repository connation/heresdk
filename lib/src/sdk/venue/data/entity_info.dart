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
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/venue/data/property.dart';

/// Specifies the entity's information.
/// @nodoc
abstract class EntityInfo {

  /// Gets the id.
  String get identifier;

  /// Gets the properties.
  Map<String, Property> get properties;

  /// Gets the linked space id.
  List<String> get spaces;

}


// EntityInfo "private" section, not exported.

final _sdkVenueDataEntityinfoRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_venue_data_EntityInfo_register_finalizer'));
final _sdkVenueDataEntityinfoCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_data_EntityInfo_copy_handle'));
final _sdkVenueDataEntityinfoReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_data_EntityInfo_release_handle'));


class EntityInfo$Impl extends __lib.NativeBase implements EntityInfo {

  EntityInfo$Impl(Pointer<Void> handle) : super(handle);

  @override
  String get identifier {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_EntityInfo_identifier_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  Map<String, Property> get properties {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_EntityInfo_properties_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return venuecoreBindingsmapofStringToSdkVenueDataPropertyFromFfi(__resultHandle);
    } finally {
      venuecoreBindingsmapofStringToSdkVenueDataPropertyReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  List<String> get spaces {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_EntityInfo_spaces_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return venuecoreBindingslistofStringFromFfi(__resultHandle);
    } finally {
      venuecoreBindingslistofStringReleaseFfiHandle(__resultHandle);

    }

  }



}

Pointer<Void> sdkVenueDataEntityinfoToFfi(EntityInfo value) =>
  _sdkVenueDataEntityinfoCopyHandle((value as __lib.NativeBase).handle);

EntityInfo sdkVenueDataEntityinfoFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is EntityInfo) return instance;

  final _copiedHandle = _sdkVenueDataEntityinfoCopyHandle(handle);
  final result = EntityInfo$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkVenueDataEntityinfoRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkVenueDataEntityinfoReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkVenueDataEntityinfoReleaseHandle(handle);

Pointer<Void> sdkVenueDataEntityinfoToFfiNullable(EntityInfo? value) =>
  value != null ? sdkVenueDataEntityinfoToFfi(value) : Pointer<Void>.fromAddress(0);

EntityInfo? sdkVenueDataEntityinfoFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkVenueDataEntityinfoFromFfi(handle) : null;

void sdkVenueDataEntityinfoReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkVenueDataEntityinfoReleaseHandle(handle);

// End of EntityInfo "private" section.


