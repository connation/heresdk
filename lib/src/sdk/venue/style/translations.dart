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

/// Specifies the language translations.
/// @nodoc
abstract class Translations {

  /// Gets the translation of a term in a language.
  ///
  /// [term] The term to translate.
  ///
  /// [lang] The language to translate to.
  ///
  /// Returns [String]. The translations.
  ///
  String getTranslation(String term, String lang);
}


// Translations "private" section, not exported.

final _sdkVenueStyleTranslationsRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_venue_style_Translations_register_finalizer'));
final _sdkVenueStyleTranslationsCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_style_Translations_copy_handle'));
final _sdkVenueStyleTranslationsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_style_Translations_release_handle'));



class Translations$Impl extends __lib.NativeBase implements Translations {

  Translations$Impl(Pointer<Void> handle) : super(handle);

  @override
  String getTranslation(String term, String lang) {
    final _getTranslationFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_venue_style_Translations_getTranslation__String_String'));
    final _termHandle = stringToFfi(term);
    final _langHandle = stringToFfi(lang);
    final _handle = this.handle;
    final __resultHandle = _getTranslationFfi(_handle, __lib.LibraryContext.isolateId, _termHandle, _langHandle);
    stringReleaseFfiHandle(_termHandle);
    stringReleaseFfiHandle(_langHandle);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }


}

Pointer<Void> sdkVenueStyleTranslationsToFfi(Translations value) =>
  _sdkVenueStyleTranslationsCopyHandle((value as __lib.NativeBase).handle);

Translations sdkVenueStyleTranslationsFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is Translations) return instance;

  final _copiedHandle = _sdkVenueStyleTranslationsCopyHandle(handle);
  final result = Translations$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkVenueStyleTranslationsRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkVenueStyleTranslationsReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkVenueStyleTranslationsReleaseHandle(handle);

Pointer<Void> sdkVenueStyleTranslationsToFfiNullable(Translations? value) =>
  value != null ? sdkVenueStyleTranslationsToFfi(value) : Pointer<Void>.fromAddress(0);

Translations? sdkVenueStyleTranslationsFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkVenueStyleTranslationsFromFfi(handle) : null;

void sdkVenueStyleTranslationsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkVenueStyleTranslationsReleaseHandle(handle);

// End of Translations "private" section.


