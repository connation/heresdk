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

/// Represents the venue info existing in a catalogs contains id and name.
abstract class VenueInfo {

  /// Gets the venue info id.
  String get venueIdentifier;

  /// Gets the venue info name.
  String get venueName;

  /// Gets the venue info id as number.
  int get venueId;

}


// VenueInfo "private" section, not exported.

final _sdkVenueDataVenueinfoRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_venue_data_VenueInfo_register_finalizer'));
final _sdkVenueDataVenueinfoCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_data_VenueInfo_copy_handle'));
final _sdkVenueDataVenueinfoReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_data_VenueInfo_release_handle'));


class VenueInfo$Impl extends __lib.NativeBase implements VenueInfo {

  VenueInfo$Impl(Pointer<Void> handle) : super(handle);

  @override
  String get venueIdentifier {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueInfo_venueIdentifier_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  String get venueName {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueInfo_venueName_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  int get venueId {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueInfo_venueId_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }



}

Pointer<Void> sdkVenueDataVenueinfoToFfi(VenueInfo value) =>
  _sdkVenueDataVenueinfoCopyHandle((value as __lib.NativeBase).handle);

VenueInfo sdkVenueDataVenueinfoFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is VenueInfo) return instance;

  final _copiedHandle = _sdkVenueDataVenueinfoCopyHandle(handle);
  final result = VenueInfo$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkVenueDataVenueinfoRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkVenueDataVenueinfoReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkVenueDataVenueinfoReleaseHandle(handle);

Pointer<Void> sdkVenueDataVenueinfoToFfiNullable(VenueInfo? value) =>
  value != null ? sdkVenueDataVenueinfoToFfi(value) : Pointer<Void>.fromAddress(0);

VenueInfo? sdkVenueDataVenueinfoFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkVenueDataVenueinfoFromFfi(handle) : null;

void sdkVenueDataVenueinfoReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkVenueDataVenueinfoReleaseHandle(handle);

// End of VenueInfo "private" section.


