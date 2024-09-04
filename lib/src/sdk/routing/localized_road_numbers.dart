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
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/routing/localized_road_number.dart';
import 'package:intl/locale.dart';
import 'package:meta/meta.dart';



/// The list of multiple names or titles for the same entity, possibly in different languages.

class LocalizedRoadNumbers {
  /// The list of road number information items.
  /// Recommended to use helper methods instead of directly accessing the items.
  List<LocalizedRoadNumber> items;

  /// Creates a new instance.

  /// [items] The list of road number information items.
  /// Recommended to use helper methods instead of directly accessing the items.

  LocalizedRoadNumbers._(this.items);
  /// Creates a new instance.
  LocalizedRoadNumbers()
      : items = [];
  /// Returns best name or title to be presented to the user according to specified
  /// locales.
  ///
  /// The locales are expected to be ordered by priority.
  /// If no matching locale found - the default is returned.
  /// In case of empty list returns `null`.
  ///
  /// [locales] Locales
  ///
  /// Returns [String?]. The best name or title to be presented to the user according to specified locales,
  /// default or `null` if list is empty.
  ///
  String? getPreferredValueForLocales(List<Locale> locales) => $prototype.getPreferredValueForLocales(this, locales);
  /// Returns the default value.
  ///
  /// Returns [String?]. The default value or null` if list is empty.
  ///
  String? getDefaultValue() => $prototype.getDefaultValue(this);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! LocalizedRoadNumbers) return false;
    LocalizedRoadNumbers _other = other;
    return DeepCollectionEquality().equals(items, _other.items);
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + DeepCollectionEquality().hash(items);
    return result;
  }

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = LocalizedRoadNumbers$Impl();
}


// LocalizedRoadNumbers "private" section, not exported.

final _sdkRoutingLocalizedroadnumbersCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_LocalizedRoadNumbers_create_handle'));
final _sdkRoutingLocalizedroadnumbersReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_LocalizedRoadNumbers_release_handle'));
final _sdkRoutingLocalizedroadnumbersGetFielditems = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_LocalizedRoadNumbers_get_field_items'));



/// @nodoc
@visibleForTesting
class LocalizedRoadNumbers$Impl {
  String? getPreferredValueForLocales(LocalizedRoadNumbers $that, List<Locale> locales) {
    final _getPreferredValueForLocalesFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_routing_LocalizedRoadNumbers_getPreferredValueForLocales__ListOf_Locale'));
    final _localesHandle = heresdkCoreBindingslistofLocaleToFfi(locales);
    final _handle = sdkRoutingLocalizedroadnumbersToFfi($that);
    final __resultHandle = _getPreferredValueForLocalesFfi(_handle, __lib.LibraryContext.isolateId, _localesHandle);
    sdkRoutingLocalizedroadnumbersReleaseFfiHandle(_handle);
    heresdkCoreBindingslistofLocaleReleaseFfiHandle(_localesHandle);
    try {
      return stringFromFfiNullable(__resultHandle);
    } finally {
      stringReleaseFfiHandleNullable(__resultHandle);

    }

  }

  String? getDefaultValue(LocalizedRoadNumbers $that) {
    final _getDefaultValueFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_LocalizedRoadNumbers_getDefaultValue'));
    final _handle = sdkRoutingLocalizedroadnumbersToFfi($that);
    final __resultHandle = _getDefaultValueFfi(_handle, __lib.LibraryContext.isolateId);
    sdkRoutingLocalizedroadnumbersReleaseFfiHandle(_handle);
    try {
      return stringFromFfiNullable(__resultHandle);
    } finally {
      stringReleaseFfiHandleNullable(__resultHandle);

    }

  }

}

Pointer<Void> sdkRoutingLocalizedroadnumbersToFfi(LocalizedRoadNumbers value) {
  final _itemsHandle = heresdkCoreBindingslistofSdkRoutingLocalizedroadnumberToFfi(value.items);
  final _result = _sdkRoutingLocalizedroadnumbersCreateHandle(_itemsHandle);
  heresdkCoreBindingslistofSdkRoutingLocalizedroadnumberReleaseFfiHandle(_itemsHandle);
  return _result;
}

LocalizedRoadNumbers sdkRoutingLocalizedroadnumbersFromFfi(Pointer<Void> handle) {
  final _itemsHandle = _sdkRoutingLocalizedroadnumbersGetFielditems(handle);
  try {
    return LocalizedRoadNumbers._(
      heresdkCoreBindingslistofSdkRoutingLocalizedroadnumberFromFfi(_itemsHandle)
    );
  } finally {
    heresdkCoreBindingslistofSdkRoutingLocalizedroadnumberReleaseFfiHandle(_itemsHandle);
  }
}

void sdkRoutingLocalizedroadnumbersReleaseFfiHandle(Pointer<Void> handle) => _sdkRoutingLocalizedroadnumbersReleaseHandle(handle);

// Nullable LocalizedRoadNumbers

final _sdkRoutingLocalizedroadnumbersCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_LocalizedRoadNumbers_create_handle_nullable'));
final _sdkRoutingLocalizedroadnumbersReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_LocalizedRoadNumbers_release_handle_nullable'));
final _sdkRoutingLocalizedroadnumbersGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_LocalizedRoadNumbers_get_value_nullable'));

Pointer<Void> sdkRoutingLocalizedroadnumbersToFfiNullable(LocalizedRoadNumbers? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingLocalizedroadnumbersToFfi(value);
  final result = _sdkRoutingLocalizedroadnumbersCreateHandleNullable(_handle);
  sdkRoutingLocalizedroadnumbersReleaseFfiHandle(_handle);
  return result;
}

LocalizedRoadNumbers? sdkRoutingLocalizedroadnumbersFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingLocalizedroadnumbersGetValueNullable(handle);
  final result = sdkRoutingLocalizedroadnumbersFromFfi(_handle);
  sdkRoutingLocalizedroadnumbersReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingLocalizedroadnumbersReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingLocalizedroadnumbersReleaseHandleNullable(handle);

// End of LocalizedRoadNumbers "private" section.


