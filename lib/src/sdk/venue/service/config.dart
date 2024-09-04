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
import 'package:here_sdk/src/_type_repository.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';

/// Specifies the  of a configuration object.
/// @nodoc
abstract class Config {
  /// Specifies the  of a configuration object.
  /// @nodoc

  factory Config(
    void Function() initialiseRendererLambda,
    String Function() privateDirGetLambda,
    String Function() publicDirGetLambda
  ) => Config$Lambdas(
    initialiseRendererLambda,
    privateDirGetLambda,
    publicDirGetLambda
  );

  /// Initialises render to be able to display venues on the map.
  ///
  void initialiseRenderer();
  /// Gets the path to the directory for caching private venues.
  String get privateDir;

  /// Gets the path to the directory for caching public venues.
  String get publicDir;

}


// Config "private" section, not exported.

final _sdkVenueServiceConfigRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_venue_service_Config_register_finalizer'));
final _sdkVenueServiceConfigCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_service_Config_copy_handle'));
final _sdkVenueServiceConfigReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_service_Config_release_handle'));
final _sdkVenueServiceConfigCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer, Pointer)
  >('here_sdk_sdk_venue_service_Config_create_proxy'));
final _sdkVenueServiceConfigGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_service_Config_get_type_id'));


class Config$Lambdas implements Config {
  void Function() initialiseRendererLambda;
  String Function() privateDirGetLambda;
  String Function() publicDirGetLambda;

  Config$Lambdas(
    this.initialiseRendererLambda,
    this.privateDirGetLambda,
    this.publicDirGetLambda
  );

  @override
  void initialiseRenderer() =>
    initialiseRendererLambda();
  @override
  String get privateDir => privateDirGetLambda();
  @override
  String get publicDir => publicDirGetLambda();
}

class Config$Impl extends __lib.NativeBase implements Config {

  Config$Impl(Pointer<Void> handle) : super(handle);

  @override
  void initialiseRenderer() {
    final _initialiseRendererFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_venue_service_Config_initialiseRenderer'));
    final _handle = this.handle;
    _initialiseRendererFfi(_handle, __lib.LibraryContext.isolateId);

  }

  /// Gets the path to the directory for caching private venues.
  String get privateDir {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_service_Config_privateDir_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }


  /// Gets the path to the directory for caching public venues.
  String get publicDir {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_service_Config_publicDir_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }



}

int _sdkVenueServiceConfiginitialiseRendererStatic(Object _obj) {

  try {
    (_obj as Config).initialiseRenderer();
  } finally {
  }
  return 0;
}

int _sdkVenueServiceConfigprivateDirGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = stringToFfi((_obj as Config).privateDir);
  return 0;
}
int _sdkVenueServiceConfigpublicDirGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = stringToFfi((_obj as Config).publicDir);
  return 0;
}

Pointer<Void> sdkVenueServiceConfigToFfi(Config value) {
  if (value is __lib.NativeBase) return _sdkVenueServiceConfigCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkVenueServiceConfigCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle)>(_sdkVenueServiceConfiginitialiseRendererStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkVenueServiceConfigprivateDirGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkVenueServiceConfigpublicDirGetStatic, __lib.unknownError)
  );

  return result;
}

Config sdkVenueServiceConfigFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is Config) return instance;

  final _typeIdHandle = _sdkVenueServiceConfigGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkVenueServiceConfigCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : Config$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkVenueServiceConfigRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkVenueServiceConfigReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkVenueServiceConfigReleaseHandle(handle);

Pointer<Void> sdkVenueServiceConfigToFfiNullable(Config? value) =>
  value != null ? sdkVenueServiceConfigToFfi(value) : Pointer<Void>.fromAddress(0);

Config? sdkVenueServiceConfigFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkVenueServiceConfigFromFfi(handle) : null;

void sdkVenueServiceConfigReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkVenueServiceConfigReleaseHandle(handle);

// End of Config "private" section.


