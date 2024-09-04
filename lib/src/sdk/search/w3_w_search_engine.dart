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
import 'package:here_sdk/src/sdk/core/engine/s_d_k_native_engine.dart';
import 'package:here_sdk/src/sdk/core/errors/instantiation_error_code.dart';
import 'package:here_sdk/src/sdk/core/errors/instantiation_exception.dart';
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';
import 'package:here_sdk/src/sdk/core/threading/task_handle.dart';
import 'package:here_sdk/src/sdk/search/w3_w_search_callback.dart';
import 'package:meta/meta.dart';

/// what3words is an alternative geocode system designed to identify any location on the planet.
///
/// The system divides the world into a grid of 57 trillion 3-by-3-metre squares, each of which
/// has a three-word address. For example, the front door of HERE’s Berlin office is identified by
/// "///wage.mere.heap".
/// `W3WSearchEngine` allows you to convert 3 word addresses to coordinates and also coordinates
/// to 3 word addresses.
///
/// **Note:** Using W3WSearchEngine requires a licence to access HERE what3words APIs.
///
/// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
/// Related APIs may change for new releases without a deprecation process.
abstract class W3WSearchEngine {
  /// Creates a new instance of this class.
  ///
  /// Throws [InstantiationException]. Indicates what went wrong when the instantiation was attempted.
  ///
  factory W3WSearchEngine() => $prototype.$init();
  /// Creates a new instance of this class.
  ///
  /// [sdkEngine] Instance of an existing SDKEngine.
  ///
  /// Throws [InstantiationException]. Indicates what went wrong when the instantiation was attempted.
  ///
  factory W3WSearchEngine.withSdkEngine(SDKNativeEngine sdkEngine) => $prototype.withSdkEngine(sdkEngine);

  /// Performs an asynchronous request to search for a [W3WSquare] that corresponds to
  /// the given 3 words.
  ///
  /// [words] A 3 word address as a string. It must be three words separated with dots or
  /// a japanese middle dot character (・). Words separated by spaces will be rejected.
  /// Optionally, the 3 word address can be prefixed with ///.
  ///
  /// [callback] Callback which receives the result on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that can be used to manipulate the execution of the task.
  ///
  TaskHandle searchByWords(String words, W3WSearchCallback callback);
  /// Performs an asynchronous request to search for a [W3WSquare], which includes
  /// the 3 word address, that corresponds to the given coordinates.
  ///
  /// [coordinates] The coordinates where to search.
  ///
  /// [language] A supported 3 word address language as an ISO 639-1 2 letter code.
  /// For Bosnian-Croatian-Montenegrin-Serbian use "oo". Defaults to "en" (English).
  ///
  /// [callback] Callback which receives the result on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that can be used to manipulate the execution of the task.
  ///
  TaskHandle searchByCoordinates(GeoCoordinates coordinates, String? language, W3WSearchCallback callback);

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = W3WSearchEngine$Impl(Pointer<Void>.fromAddress(0));
}


// W3WSearchEngine "private" section, not exported.

final _sdkSearchW3wsearchengineRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_search_W3WSearchEngine_register_finalizer'));
final _sdkSearchW3wsearchengineCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_W3WSearchEngine_copy_handle'));
final _sdkSearchW3wsearchengineReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_W3WSearchEngine_release_handle'));


final _$initsdkSearchW3wsearchengineMakeReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_W3WSearchEngine_make_return_release_handle'));
final _$initsdkSearchW3wsearchengineMakeReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_W3WSearchEngine_make_return_get_result'));
final _$initsdkSearchW3wsearchengineMakeReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_W3WSearchEngine_make_return_get_error'));
final _$initsdkSearchW3wsearchengineMakeReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_W3WSearchEngine_make_return_has_error'));


final _withSdkEnginesdkSearchW3wsearchengineMakeSdknativeengineReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_W3WSearchEngine_make__SDKNativeEngine_return_release_handle'));
final _withSdkEnginesdkSearchW3wsearchengineMakeSdknativeengineReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_W3WSearchEngine_make__SDKNativeEngine_return_get_result'));
final _withSdkEnginesdkSearchW3wsearchengineMakeSdknativeengineReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_W3WSearchEngine_make__SDKNativeEngine_return_get_error'));
final _withSdkEnginesdkSearchW3wsearchengineMakeSdknativeengineReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_W3WSearchEngine_make__SDKNativeEngine_return_has_error'));




/// @nodoc
@visibleForTesting
class W3WSearchEngine$Impl extends __lib.NativeBase implements W3WSearchEngine {

  W3WSearchEngine$Impl(Pointer<Void> handle) : super(handle);


  W3WSearchEngine $init() {
    final _result_handle = _$init();
    final _result = W3WSearchEngine$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkSearchW3wsearchengineRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }


  W3WSearchEngine withSdkEngine(SDKNativeEngine sdkEngine) {
    final _result_handle = _withSdkEngine(sdkEngine);
    final _result = W3WSearchEngine$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkSearchW3wsearchengineRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _$init() {
    final _$initFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('here_sdk_sdk_search_W3WSearchEngine_make'));
    final __callResultHandle = _$initFfi(__lib.LibraryContext.isolateId);
    if (_$initsdkSearchW3wsearchengineMakeReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _$initsdkSearchW3wsearchengineMakeReturnGetError(__callResultHandle);
        _$initsdkSearchW3wsearchengineMakeReturnReleaseHandle(__callResultHandle);
        try {
          throw InstantiationException(sdkCoreErrorsInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkCoreErrorsInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _$initsdkSearchW3wsearchengineMakeReturnGetResult(__callResultHandle);
    _$initsdkSearchW3wsearchengineMakeReturnReleaseHandle(__callResultHandle);
    return __resultHandle;
  }

  static Pointer<Void> _withSdkEngine(SDKNativeEngine sdkEngine) {
    final _withSdkEngineFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_search_W3WSearchEngine_make__SDKNativeEngine'));
    final _sdkEngineHandle = sdkCoreEngineSdknativeengineToFfi(sdkEngine);
    final __callResultHandle = _withSdkEngineFfi(__lib.LibraryContext.isolateId, _sdkEngineHandle);
    sdkCoreEngineSdknativeengineReleaseFfiHandle(_sdkEngineHandle);
    if (_withSdkEnginesdkSearchW3wsearchengineMakeSdknativeengineReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _withSdkEnginesdkSearchW3wsearchengineMakeSdknativeengineReturnGetError(__callResultHandle);
        _withSdkEnginesdkSearchW3wsearchengineMakeSdknativeengineReturnReleaseHandle(__callResultHandle);
        try {
          throw InstantiationException(sdkCoreErrorsInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkCoreErrorsInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _withSdkEnginesdkSearchW3wsearchengineMakeSdknativeengineReturnGetResult(__callResultHandle);
    _withSdkEnginesdkSearchW3wsearchengineMakeSdknativeengineReturnReleaseHandle(__callResultHandle);
    return __resultHandle;
  }

  @override
  TaskHandle searchByWords(String words, W3WSearchCallback callback) {
    final _searchByWordsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_W3WSearchEngine_search__String_W3WSearchCallback'));
    final _wordsHandle = stringToFfi(words);
    final _callbackHandle = sdkSearchW3wsearchcallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _searchByWordsFfi(_handle, __lib.LibraryContext.isolateId, _wordsHandle, _callbackHandle);
    stringReleaseFfiHandle(_wordsHandle);
    sdkSearchW3wsearchcallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle searchByCoordinates(GeoCoordinates coordinates, String? language, W3WSearchCallback callback) {
    final _searchByCoordinatesFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_W3WSearchEngine_search__GeoCoordinates_String__W3WSearchCallback'));
    final _coordinatesHandle = sdkCoreGeocoordinatesToFfi(coordinates);
    final _languageHandle = stringToFfiNullable(language);
    final _callbackHandle = sdkSearchW3wsearchcallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _searchByCoordinatesFfi(_handle, __lib.LibraryContext.isolateId, _coordinatesHandle, _languageHandle, _callbackHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_coordinatesHandle);
    stringReleaseFfiHandleNullable(_languageHandle);
    sdkSearchW3wsearchcallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }


}

Pointer<Void> sdkSearchW3wsearchengineToFfi(W3WSearchEngine value) =>
  _sdkSearchW3wsearchengineCopyHandle((value as __lib.NativeBase).handle);

W3WSearchEngine sdkSearchW3wsearchengineFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is W3WSearchEngine) return instance;

  final _copiedHandle = _sdkSearchW3wsearchengineCopyHandle(handle);
  final result = W3WSearchEngine$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkSearchW3wsearchengineRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkSearchW3wsearchengineReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkSearchW3wsearchengineReleaseHandle(handle);

Pointer<Void> sdkSearchW3wsearchengineToFfiNullable(W3WSearchEngine? value) =>
  value != null ? sdkSearchW3wsearchengineToFfi(value) : Pointer<Void>.fromAddress(0);

W3WSearchEngine? sdkSearchW3wsearchengineFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkSearchW3wsearchengineFromFfi(handle) : null;

void sdkSearchW3wsearchengineReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchW3wsearchengineReleaseHandle(handle);

// End of W3WSearchEngine "private" section.


