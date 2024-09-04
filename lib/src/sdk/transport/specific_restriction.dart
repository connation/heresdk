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
import 'package:here_sdk/src/sdk/core/integer_range.dart';
import 'package:here_sdk/src/sdk/transport/restriction_type.dart';

/// Represents a specific vehicle restriction.
///
/// **Note:** This is a beta release of this feature.
/// Related APIs may change for new releases without a deprecation process.

class SpecificRestriction {
  /// Type of restriction.
  RestrictionType type;

  /// Values for which the restriction applies.
  IntegerRange value;

  /// Creates a new instance.

  /// [type] Type of restriction.

  /// [value] Values for which the restriction applies.

  SpecificRestriction(this.type, this.value);
}


// SpecificRestriction "private" section, not exported.

final _sdkTransportSpecificrestrictionCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32, Pointer<Void>),
    Pointer<Void> Function(int, Pointer<Void>)
  >('here_sdk_sdk_transport_SpecificRestriction_create_handle'));
final _sdkTransportSpecificrestrictionReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_transport_SpecificRestriction_release_handle'));
final _sdkTransportSpecificrestrictionGetFieldtype = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_transport_SpecificRestriction_get_field_type'));
final _sdkTransportSpecificrestrictionGetFieldvalue = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_SpecificRestriction_get_field_value'));



Pointer<Void> sdkTransportSpecificrestrictionToFfi(SpecificRestriction value) {
  final _typeHandle = sdkTransportRestrictiontypeToFfi(value.type);
  final _valueHandle = sdkCoreIntegerrangeToFfi(value.value);
  final _result = _sdkTransportSpecificrestrictionCreateHandle(_typeHandle, _valueHandle);
  sdkTransportRestrictiontypeReleaseFfiHandle(_typeHandle);
  sdkCoreIntegerrangeReleaseFfiHandle(_valueHandle);
  return _result;
}

SpecificRestriction sdkTransportSpecificrestrictionFromFfi(Pointer<Void> handle) {
  final _typeHandle = _sdkTransportSpecificrestrictionGetFieldtype(handle);
  final _valueHandle = _sdkTransportSpecificrestrictionGetFieldvalue(handle);
  try {
    return SpecificRestriction(
      sdkTransportRestrictiontypeFromFfi(_typeHandle), 
      sdkCoreIntegerrangeFromFfi(_valueHandle)
    );
  } finally {
    sdkTransportRestrictiontypeReleaseFfiHandle(_typeHandle);
    sdkCoreIntegerrangeReleaseFfiHandle(_valueHandle);
  }
}

void sdkTransportSpecificrestrictionReleaseFfiHandle(Pointer<Void> handle) => _sdkTransportSpecificrestrictionReleaseHandle(handle);

// Nullable SpecificRestriction

final _sdkTransportSpecificrestrictionCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_SpecificRestriction_create_handle_nullable'));
final _sdkTransportSpecificrestrictionReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_transport_SpecificRestriction_release_handle_nullable'));
final _sdkTransportSpecificrestrictionGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_SpecificRestriction_get_value_nullable'));

Pointer<Void> sdkTransportSpecificrestrictionToFfiNullable(SpecificRestriction? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkTransportSpecificrestrictionToFfi(value);
  final result = _sdkTransportSpecificrestrictionCreateHandleNullable(_handle);
  sdkTransportSpecificrestrictionReleaseFfiHandle(_handle);
  return result;
}

SpecificRestriction? sdkTransportSpecificrestrictionFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkTransportSpecificrestrictionGetValueNullable(handle);
  final result = sdkTransportSpecificrestrictionFromFfi(_handle);
  sdkTransportSpecificrestrictionReleaseFfiHandle(_handle);
  return result;
}

void sdkTransportSpecificrestrictionReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkTransportSpecificrestrictionReleaseHandleNullable(handle);

// End of SpecificRestriction "private" section.


