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
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/location/location_issue_type.dart';

/// abstract class used to notify when new location issue
/// has occurred.
abstract class LocationIssueListener {
  /// abstract class used to notify when new location issue
  /// has occurred.

  factory LocationIssueListener(
    void Function(List<LocationIssueType>) onLocationIssueChangedLambda,

  ) => LocationIssueListener$Lambdas(
    onLocationIssueChangedLambda,

  );

  /// Called when location issue has been noticed.
  ///
  /// [issues] List of location issues.
  ///
  void onLocationIssueChanged(List<LocationIssueType> issues);
}


// LocationIssueListener "private" section, not exported.

final _sdkLocationLocationissuelistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_location_LocationIssueListener_register_finalizer'));
final _sdkLocationLocationissuelistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_location_LocationIssueListener_copy_handle'));
final _sdkLocationLocationissuelistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_location_LocationIssueListener_release_handle'));
final _sdkLocationLocationissuelistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_location_LocationIssueListener_create_proxy'));
final _sdkLocationLocationissuelistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_location_LocationIssueListener_get_type_id'));


class LocationIssueListener$Lambdas implements LocationIssueListener {
  void Function(List<LocationIssueType>) onLocationIssueChangedLambda;

  LocationIssueListener$Lambdas(
    this.onLocationIssueChangedLambda,

  );

  @override
  void onLocationIssueChanged(List<LocationIssueType> issues) =>
    onLocationIssueChangedLambda(issues);
}

class LocationIssueListener$Impl extends __lib.NativeBase implements LocationIssueListener {

  LocationIssueListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onLocationIssueChanged(List<LocationIssueType> issues) {
    final _onLocationIssueChangedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_location_LocationIssueListener_onLocationIssueChanged__ListOf_sdk_location_LocationIssueType'));
    final _issuesHandle = heresdkPositioningBindingslistofSdkLocationLocationissuetypeToFfi(issues);
    final _handle = this.handle;
    _onLocationIssueChangedFfi(_handle, __lib.LibraryContext.isolateId, _issuesHandle);
    heresdkPositioningBindingslistofSdkLocationLocationissuetypeReleaseFfiHandle(_issuesHandle);

  }


}

int _sdkLocationLocationissuelisteneronLocationIssueChangedStatic(Object _obj, Pointer<Void> issues) {

  try {
    (_obj as LocationIssueListener).onLocationIssueChanged(heresdkPositioningBindingslistofSdkLocationLocationissuetypeFromFfi(issues));
  } finally {
    heresdkPositioningBindingslistofSdkLocationLocationissuetypeReleaseFfiHandle(issues);
  }
  return 0;
}


Pointer<Void> sdkLocationLocationissuelistenerToFfi(LocationIssueListener value) {
  if (value is __lib.NativeBase) return _sdkLocationLocationissuelistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkLocationLocationissuelistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkLocationLocationissuelisteneronLocationIssueChangedStatic, __lib.unknownError)
  );

  return result;
}

LocationIssueListener sdkLocationLocationissuelistenerFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is LocationIssueListener) return instance;

  final _typeIdHandle = _sdkLocationLocationissuelistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkLocationLocationissuelistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : LocationIssueListener$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkLocationLocationissuelistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkLocationLocationissuelistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkLocationLocationissuelistenerReleaseHandle(handle);

Pointer<Void> sdkLocationLocationissuelistenerToFfiNullable(LocationIssueListener? value) =>
  value != null ? sdkLocationLocationissuelistenerToFfi(value) : Pointer<Void>.fromAddress(0);

LocationIssueListener? sdkLocationLocationissuelistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkLocationLocationissuelistenerFromFfi(handle) : null;

void sdkLocationLocationissuelistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkLocationLocationissuelistenerReleaseHandle(handle);

// End of LocationIssueListener "private" section.


