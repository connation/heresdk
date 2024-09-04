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
import 'package:collection/collection.dart';
import 'package:here_sdk/src/_library_context.dart' as __lib;
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/navigation/toll_collection_method.dart';
import 'package:here_sdk/src/sdk/routing/payment_method.dart';

/// A class that provides information of a toll stop.
///
/// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
/// Related APIs may change for new releases without a deprecation process.

class TollBooth {
  /// Indicates the type.
  List<TollCollectionMethod> tollCollectionMethods;

  /// Indicates the supported payment methods.
  List<PaymentMethod> paymentMethods;

  /// Creates a new instance.

  /// [tollCollectionMethods] Indicates the type.

  /// [paymentMethods] Indicates the supported payment methods.

  TollBooth(this.tollCollectionMethods, this.paymentMethods);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TollBooth) return false;
    TollBooth _other = other;
    return DeepCollectionEquality().equals(tollCollectionMethods, _other.tollCollectionMethods) &&
        DeepCollectionEquality().equals(paymentMethods, _other.paymentMethods);
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + DeepCollectionEquality().hash(tollCollectionMethods);
    result = 31 * result + DeepCollectionEquality().hash(paymentMethods);
    return result;
  }
}


// TollBooth "private" section, not exported.

final _sdkNavigationTollboothCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_navigation_TollBooth_create_handle'));
final _sdkNavigationTollboothReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TollBooth_release_handle'));
final _sdkNavigationTollboothGetFieldtollCollectionMethods = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TollBooth_get_field_tollCollectionMethods'));
final _sdkNavigationTollboothGetFieldpaymentMethods = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TollBooth_get_field_paymentMethods'));



Pointer<Void> sdkNavigationTollboothToFfi(TollBooth value) {
  final _tollCollectionMethodsHandle = heresdkNavigationBindingslistofSdkNavigationTollcollectionmethodToFfi(value.tollCollectionMethods);
  final _paymentMethodsHandle = heresdkNavigationBindingslistofSdkRoutingPaymentmethodToFfi(value.paymentMethods);
  final _result = _sdkNavigationTollboothCreateHandle(_tollCollectionMethodsHandle, _paymentMethodsHandle);
  heresdkNavigationBindingslistofSdkNavigationTollcollectionmethodReleaseFfiHandle(_tollCollectionMethodsHandle);
  heresdkNavigationBindingslistofSdkRoutingPaymentmethodReleaseFfiHandle(_paymentMethodsHandle);
  return _result;
}

TollBooth sdkNavigationTollboothFromFfi(Pointer<Void> handle) {
  final _tollCollectionMethodsHandle = _sdkNavigationTollboothGetFieldtollCollectionMethods(handle);
  final _paymentMethodsHandle = _sdkNavigationTollboothGetFieldpaymentMethods(handle);
  try {
    return TollBooth(
      heresdkNavigationBindingslistofSdkNavigationTollcollectionmethodFromFfi(_tollCollectionMethodsHandle), 
      heresdkNavigationBindingslistofSdkRoutingPaymentmethodFromFfi(_paymentMethodsHandle)
    );
  } finally {
    heresdkNavigationBindingslistofSdkNavigationTollcollectionmethodReleaseFfiHandle(_tollCollectionMethodsHandle);
    heresdkNavigationBindingslistofSdkRoutingPaymentmethodReleaseFfiHandle(_paymentMethodsHandle);
  }
}

void sdkNavigationTollboothReleaseFfiHandle(Pointer<Void> handle) => _sdkNavigationTollboothReleaseHandle(handle);

// Nullable TollBooth

final _sdkNavigationTollboothCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TollBooth_create_handle_nullable'));
final _sdkNavigationTollboothReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TollBooth_release_handle_nullable'));
final _sdkNavigationTollboothGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TollBooth_get_value_nullable'));

Pointer<Void> sdkNavigationTollboothToFfiNullable(TollBooth? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationTollboothToFfi(value);
  final result = _sdkNavigationTollboothCreateHandleNullable(_handle);
  sdkNavigationTollboothReleaseFfiHandle(_handle);
  return result;
}

TollBooth? sdkNavigationTollboothFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationTollboothGetValueNullable(handle);
  final result = sdkNavigationTollboothFromFfi(_handle);
  sdkNavigationTollboothReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationTollboothReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationTollboothReleaseHandleNullable(handle);

// End of TollBooth "private" section.


