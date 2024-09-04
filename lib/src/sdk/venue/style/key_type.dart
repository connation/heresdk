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

/// The key type.
/// @nodoc
enum KeyType {
    /// custom name
    customName,
    /// entity or occupant property
    occupantNames,
    /// geometry or spacename property
    spaceName,
    /// address
    internalAddressShort,
    /// address
    internalAddress,
    /// address
    internalAddressLong,
    /// space type name
    spaceTypeName,
    /// category name
    spaceCategoryName,
    /// none
    none
}

// KeyType "private" section, not exported.

int sdkVenueStyleKeytypeToFfi(KeyType value) {
  switch (value) {
  case KeyType.customName:
    return 0;
  case KeyType.occupantNames:
    return 1;
  case KeyType.spaceName:
    return 2;
  case KeyType.internalAddressShort:
    return 3;
  case KeyType.internalAddress:
    return 4;
  case KeyType.internalAddressLong:
    return 5;
  case KeyType.spaceTypeName:
    return 6;
  case KeyType.spaceCategoryName:
    return 7;
  case KeyType.none:
    return 8;
  default:
    throw StateError("Invalid enum value $value for KeyType enum.");
  }
}

KeyType sdkVenueStyleKeytypeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return KeyType.customName;
  case 1:
    return KeyType.occupantNames;
  case 2:
    return KeyType.spaceName;
  case 3:
    return KeyType.internalAddressShort;
  case 4:
    return KeyType.internalAddress;
  case 5:
    return KeyType.internalAddressLong;
  case 6:
    return KeyType.spaceTypeName;
  case 7:
    return KeyType.spaceCategoryName;
  case 8:
    return KeyType.none;
  default:
    throw StateError("Invalid numeric value $handle for KeyType enum.");
  }
}

void sdkVenueStyleKeytypeReleaseFfiHandle(int handle) {}

final _sdkVenueStyleKeytypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_venue_style_KeyType_create_handle_nullable'));
final _sdkVenueStyleKeytypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_style_KeyType_release_handle_nullable'));
final _sdkVenueStyleKeytypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_venue_style_KeyType_get_value_nullable'));

Pointer<Void> sdkVenueStyleKeytypeToFfiNullable(KeyType? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkVenueStyleKeytypeToFfi(value);
  final result = _sdkVenueStyleKeytypeCreateHandleNullable(_handle);
  sdkVenueStyleKeytypeReleaseFfiHandle(_handle);
  return result;
}

KeyType? sdkVenueStyleKeytypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkVenueStyleKeytypeGetValueNullable(handle);
  final result = sdkVenueStyleKeytypeFromFfi(_handle);
  sdkVenueStyleKeytypeReleaseFfiHandle(_handle);
  return result;
}

void sdkVenueStyleKeytypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkVenueStyleKeytypeReleaseHandleNullable(handle);

// End of KeyType "private" section.


