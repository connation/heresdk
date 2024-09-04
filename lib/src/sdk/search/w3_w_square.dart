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
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/geo_box.dart';
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';

/// Contains information about one of the squares in the what3words geocode system.
///
/// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
/// Related APIs may change for new releases without a deprecation process.

class W3WSquare {
  /// A 3-by-3-metre square defined by the what3words geocode system.
  GeoBox square;

  /// The center of the square.
  GeoCoordinates coordinates;

  /// 3 word address of the square, for example "///wage.mere.heap".
  String words;

  /// The language code of the words as an ISO 639-1 2 letter code.
  /// Each supported language has its own set of words for each of the squares in
  /// the what3words geocode system.
  /// For Bosnian-Croatian-Montenegrin-Serbian, a special code "oo" is used.
  String languageCode;

  /// Country that contains the square.
  /// Not set if the square is in an area not governed by a specific country, such as
  /// international waters, Antarctica, some uninhabited islands etc.
  String? countryCode;

  /// Creates a new instance.

  /// [square] A 3-by-3-metre square defined by the what3words geocode system.

  /// [coordinates] The center of the square.

  /// [words] 3 word address of the square, for example "///wage.mere.heap".

  /// [languageCode] The language code of the words as an ISO 639-1 2 letter code.
  /// Each supported language has its own set of words for each of the squares in
  /// the what3words geocode system.
  /// For Bosnian-Croatian-Montenegrin-Serbian, a special code "oo" is used.

  /// [countryCode] Country that contains the square.
  /// Not set if the square is in an area not governed by a specific country, such as
  /// international waters, Antarctica, some uninhabited islands etc.

  W3WSquare._(this.square, this.coordinates, this.words, this.languageCode, this.countryCode);
  W3WSquare(GeoBox square, GeoCoordinates coordinates, String words, String languageCode)
    : square = square, coordinates = coordinates, words = words, languageCode = languageCode, countryCode = null;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! W3WSquare) return false;
    W3WSquare _other = other;
    return square == _other.square &&
        coordinates == _other.coordinates &&
        words == _other.words &&
        languageCode == _other.languageCode &&
        countryCode == _other.countryCode;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + square.hashCode;
    result = 31 * result + coordinates.hashCode;
    result = 31 * result + words.hashCode;
    result = 31 * result + languageCode.hashCode;
    result = 31 * result + countryCode.hashCode;
    return result;
  }
}


// W3WSquare "private" section, not exported.

final _sdkSearchW3wsquareCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_search_W3WSquare_create_handle'));
final _sdkSearchW3wsquareReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_W3WSquare_release_handle'));
final _sdkSearchW3wsquareGetFieldsquare = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_W3WSquare_get_field_square'));
final _sdkSearchW3wsquareGetFieldcoordinates = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_W3WSquare_get_field_coordinates'));
final _sdkSearchW3wsquareGetFieldwords = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_W3WSquare_get_field_words'));
final _sdkSearchW3wsquareGetFieldlanguageCode = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_W3WSquare_get_field_languageCode'));
final _sdkSearchW3wsquareGetFieldcountryCode = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_W3WSquare_get_field_countryCode'));



Pointer<Void> sdkSearchW3wsquareToFfi(W3WSquare value) {
  final _squareHandle = sdkCoreGeoboxToFfi(value.square);
  final _coordinatesHandle = sdkCoreGeocoordinatesToFfi(value.coordinates);
  final _wordsHandle = stringToFfi(value.words);
  final _languageCodeHandle = stringToFfi(value.languageCode);
  final _countryCodeHandle = stringToFfiNullable(value.countryCode);
  final _result = _sdkSearchW3wsquareCreateHandle(_squareHandle, _coordinatesHandle, _wordsHandle, _languageCodeHandle, _countryCodeHandle);
  sdkCoreGeoboxReleaseFfiHandle(_squareHandle);
  sdkCoreGeocoordinatesReleaseFfiHandle(_coordinatesHandle);
  stringReleaseFfiHandle(_wordsHandle);
  stringReleaseFfiHandle(_languageCodeHandle);
  stringReleaseFfiHandleNullable(_countryCodeHandle);
  return _result;
}

W3WSquare sdkSearchW3wsquareFromFfi(Pointer<Void> handle) {
  final _squareHandle = _sdkSearchW3wsquareGetFieldsquare(handle);
  final _coordinatesHandle = _sdkSearchW3wsquareGetFieldcoordinates(handle);
  final _wordsHandle = _sdkSearchW3wsquareGetFieldwords(handle);
  final _languageCodeHandle = _sdkSearchW3wsquareGetFieldlanguageCode(handle);
  final _countryCodeHandle = _sdkSearchW3wsquareGetFieldcountryCode(handle);
  try {
    return W3WSquare._(
      sdkCoreGeoboxFromFfi(_squareHandle), 
      sdkCoreGeocoordinatesFromFfi(_coordinatesHandle), 
      stringFromFfi(_wordsHandle), 
      stringFromFfi(_languageCodeHandle), 
      stringFromFfiNullable(_countryCodeHandle)
    );
  } finally {
    sdkCoreGeoboxReleaseFfiHandle(_squareHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_coordinatesHandle);
    stringReleaseFfiHandle(_wordsHandle);
    stringReleaseFfiHandle(_languageCodeHandle);
    stringReleaseFfiHandleNullable(_countryCodeHandle);
  }
}

void sdkSearchW3wsquareReleaseFfiHandle(Pointer<Void> handle) => _sdkSearchW3wsquareReleaseHandle(handle);

// Nullable W3WSquare

final _sdkSearchW3wsquareCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_W3WSquare_create_handle_nullable'));
final _sdkSearchW3wsquareReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_W3WSquare_release_handle_nullable'));
final _sdkSearchW3wsquareGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_W3WSquare_get_value_nullable'));

Pointer<Void> sdkSearchW3wsquareToFfiNullable(W3WSquare? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchW3wsquareToFfi(value);
  final result = _sdkSearchW3wsquareCreateHandleNullable(_handle);
  sdkSearchW3wsquareReleaseFfiHandle(_handle);
  return result;
}

W3WSquare? sdkSearchW3wsquareFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchW3wsquareGetValueNullable(handle);
  final result = sdkSearchW3wsquareFromFfi(_handle);
  sdkSearchW3wsquareReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchW3wsquareReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchW3wsquareReleaseHandleNullable(handle);

// End of W3WSquare "private" section.


