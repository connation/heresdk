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
import 'package:here_sdk/src/sdk/navigation/school_zone_warning.dart';

/// This Abstract class
/// should be implemented in order to receive school zone warnings.
///
/// **Note:** This Abstract class will provide
/// school zone warnings only in case the speed limit inside the school zone is different than the
/// default speed limit applicable for cars outside the school zone. For warnings about school zones
/// regardless of their speed limits, the [NavigatorInterface.roadSignWarningListener] should be
/// used and the [RoadSignWarning.type] should be checked for value [RoadSignType.schoolZone].
/// The school zone warner is a zone warner, which means that for a school zone there will _always_ be
/// 3 warnings emitted, with the [SchoolZoneWarning.distanceType] set to [DistanceType.ahead], [DistanceType.reached]
/// and lastly [DistanceType.passed] when the end of the school zone is passed.
abstract class SchoolZoneWarningListener {
  /// This Abstract class
  /// should be implemented in order to receive school zone warnings.
  ///
  /// **Note:** This Abstract class will provide
  /// school zone warnings only in case the speed limit inside the school zone is different than the
  /// default speed limit applicable for cars outside the school zone. For warnings about school zones
  /// regardless of their speed limits, the [NavigatorInterface.roadSignWarningListener] should be
  /// used and the [RoadSignWarning.type] should be checked for value [RoadSignType.schoolZone].
  /// The school zone warner is a zone warner, which means that for a school zone there will _always_ be
  /// 3 warnings emitted, with the [SchoolZoneWarning.distanceType] set to [DistanceType.ahead], [DistanceType.reached]
  /// and lastly [DistanceType.passed] when the end of the school zone is passed.

  factory SchoolZoneWarningListener(
    void Function(List<SchoolZoneWarning>) onSchoolZoneWarningUpdatedLambda,

  ) => SchoolZoneWarningListener$Lambdas(
    onSchoolZoneWarningUpdatedLambda,

  );

  /// Called whenever a new school zone warning is available.
  ///
  /// [schoolZoneWarning] The object that contains details on the school zone warning.
  ///
  void onSchoolZoneWarningUpdated(List<SchoolZoneWarning> schoolZoneWarning);
}


// SchoolZoneWarningListener "private" section, not exported.

final _sdkNavigationSchoolzonewarninglistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_navigation_SchoolZoneWarningListener_register_finalizer'));
final _sdkNavigationSchoolzonewarninglistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SchoolZoneWarningListener_copy_handle'));
final _sdkNavigationSchoolzonewarninglistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SchoolZoneWarningListener_release_handle'));
final _sdkNavigationSchoolzonewarninglistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_navigation_SchoolZoneWarningListener_create_proxy'));
final _sdkNavigationSchoolzonewarninglistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SchoolZoneWarningListener_get_type_id'));


class SchoolZoneWarningListener$Lambdas implements SchoolZoneWarningListener {
  void Function(List<SchoolZoneWarning>) onSchoolZoneWarningUpdatedLambda;

  SchoolZoneWarningListener$Lambdas(
    this.onSchoolZoneWarningUpdatedLambda,

  );

  @override
  void onSchoolZoneWarningUpdated(List<SchoolZoneWarning> schoolZoneWarning) =>
    onSchoolZoneWarningUpdatedLambda(schoolZoneWarning);
}

class SchoolZoneWarningListener$Impl extends __lib.NativeBase implements SchoolZoneWarningListener {

  SchoolZoneWarningListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onSchoolZoneWarningUpdated(List<SchoolZoneWarning> schoolZoneWarning) {
    final _onSchoolZoneWarningUpdatedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_SchoolZoneWarningListener_onSchoolZoneWarningUpdated__ListOf_sdk_navigation_SchoolZoneWarning'));
    final _schoolZoneWarningHandle = heresdkNavigationBindingslistofSdkNavigationSchoolzonewarningToFfi(schoolZoneWarning);
    final _handle = this.handle;
    _onSchoolZoneWarningUpdatedFfi(_handle, __lib.LibraryContext.isolateId, _schoolZoneWarningHandle);
    heresdkNavigationBindingslistofSdkNavigationSchoolzonewarningReleaseFfiHandle(_schoolZoneWarningHandle);

  }


}

int _sdkNavigationSchoolzonewarninglisteneronSchoolZoneWarningUpdatedStatic(Object _obj, Pointer<Void> schoolZoneWarning) {

  try {
    (_obj as SchoolZoneWarningListener).onSchoolZoneWarningUpdated(heresdkNavigationBindingslistofSdkNavigationSchoolzonewarningFromFfi(schoolZoneWarning));
  } finally {
    heresdkNavigationBindingslistofSdkNavigationSchoolzonewarningReleaseFfiHandle(schoolZoneWarning);
  }
  return 0;
}


Pointer<Void> sdkNavigationSchoolzonewarninglistenerToFfi(SchoolZoneWarningListener value) {
  if (value is __lib.NativeBase) return _sdkNavigationSchoolzonewarninglistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkNavigationSchoolzonewarninglistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationSchoolzonewarninglisteneronSchoolZoneWarningUpdatedStatic, __lib.unknownError)
  );

  return result;
}

SchoolZoneWarningListener sdkNavigationSchoolzonewarninglistenerFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is SchoolZoneWarningListener) return instance;

  final _typeIdHandle = _sdkNavigationSchoolzonewarninglistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkNavigationSchoolzonewarninglistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : SchoolZoneWarningListener$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkNavigationSchoolzonewarninglistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkNavigationSchoolzonewarninglistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkNavigationSchoolzonewarninglistenerReleaseHandle(handle);

Pointer<Void> sdkNavigationSchoolzonewarninglistenerToFfiNullable(SchoolZoneWarningListener? value) =>
  value != null ? sdkNavigationSchoolzonewarninglistenerToFfi(value) : Pointer<Void>.fromAddress(0);

SchoolZoneWarningListener? sdkNavigationSchoolzonewarninglistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkNavigationSchoolzonewarninglistenerFromFfi(handle) : null;

void sdkNavigationSchoolzonewarninglistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationSchoolzonewarninglistenerReleaseHandle(handle);

// End of SchoolZoneWarningListener "private" section.


