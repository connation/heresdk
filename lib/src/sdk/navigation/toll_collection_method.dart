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

/// Available payment methods.
///
/// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
/// Related APIs may change for new releases without a deprecation process.
enum TollCollectionMethod {
    /// Fixed fee is required in order to pass through.
    fixedFee,
    /// Ticket must be obtained at the toll stop.
    obtainTicket,
    /// Payment is required based on the traveled distance between the toll stop where the ticket was obtained
    /// and the toll stop at which the toll road is exited.
    payPerTicket,
    /// Automatic controls exist that automatically record the beginning and
    /// end of the stretch of toll road that has been traveled.
    electronic
}

// TollCollectionMethod "private" section, not exported.

int sdkNavigationTollcollectionmethodToFfi(TollCollectionMethod value) {
  switch (value) {
  case TollCollectionMethod.fixedFee:
    return 0;
  case TollCollectionMethod.obtainTicket:
    return 1;
  case TollCollectionMethod.payPerTicket:
    return 2;
  case TollCollectionMethod.electronic:
    return 3;
  default:
    throw StateError("Invalid enum value $value for TollCollectionMethod enum.");
  }
}

TollCollectionMethod sdkNavigationTollcollectionmethodFromFfi(int handle) {
  switch (handle) {
  case 0:
    return TollCollectionMethod.fixedFee;
  case 1:
    return TollCollectionMethod.obtainTicket;
  case 2:
    return TollCollectionMethod.payPerTicket;
  case 3:
    return TollCollectionMethod.electronic;
  default:
    throw StateError("Invalid numeric value $handle for TollCollectionMethod enum.");
  }
}

void sdkNavigationTollcollectionmethodReleaseFfiHandle(int handle) {}

final _sdkNavigationTollcollectionmethodCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_navigation_TollCollectionMethod_create_handle_nullable'));
final _sdkNavigationTollcollectionmethodReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TollCollectionMethod_release_handle_nullable'));
final _sdkNavigationTollcollectionmethodGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TollCollectionMethod_get_value_nullable'));

Pointer<Void> sdkNavigationTollcollectionmethodToFfiNullable(TollCollectionMethod? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationTollcollectionmethodToFfi(value);
  final result = _sdkNavigationTollcollectionmethodCreateHandleNullable(_handle);
  sdkNavigationTollcollectionmethodReleaseFfiHandle(_handle);
  return result;
}

TollCollectionMethod? sdkNavigationTollcollectionmethodFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationTollcollectionmethodGetValueNullable(handle);
  final result = sdkNavigationTollcollectionmethodFromFfi(_handle);
  sdkNavigationTollcollectionmethodReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationTollcollectionmethodReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationTollcollectionmethodReleaseHandleNullable(handle);

// End of TollCollectionMethod "private" section.


