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
import 'package:here_sdk/src/sdk/core/engine/s_d_k_native_engine.dart';
import 'package:here_sdk/src/sdk/core/errors/instantiation_error_code.dart';
import 'package:here_sdk/src/sdk/core/errors/instantiation_exception.dart';
import 'package:here_sdk/src/sdk/mapdata/directed_o_c_m_segment_id.dart';
import 'package:here_sdk/src/sdk/routing/segment_reference.dart';
import 'package:meta/meta.dart';

/// A SegmentReferenceConverter provides possibility to convert mapmatched instances of
/// [SegmentReference] to corresponding instances of [DirectedOCMSegmentId].
///
/// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected
/// behaviors. Related APIs may change for new releases without a deprecation process.
abstract class SegmentReferenceConverter {
  /// Creates a new instance of this class.
  ///
  /// [sdkEngine] A SDKEngine instance.
  ///
  /// Throws [InstantiationException]. Indicates what went wrong when the instantiation was attempted.
  ///
  factory SegmentReferenceConverter(SDKNativeEngine sdkEngine) => $prototype.make(sdkEngine);

  /// The [DirectedOCMSegmentId] for provided [SegmentReference].
  ///
  /// [segmentReference] [SegmentReference] to convert.
  ///
  /// Returns [DirectedOCMSegmentId?]. [DirectedOCMSegmentId] corresponding to provided [SegmentReference].
  ///
  DirectedOCMSegmentId? getOCMSegmentId(SegmentReference segmentReference);

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = SegmentReferenceConverter$Impl(Pointer<Void>.fromAddress(0));
}


// SegmentReferenceConverter "private" section, not exported.

final _sdkMapdataSegmentreferenceconverterRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapdata_SegmentReferenceConverter_register_finalizer'));
final _sdkMapdataSegmentreferenceconverterCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_SegmentReferenceConverter_copy_handle'));
final _sdkMapdataSegmentreferenceconverterReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_SegmentReferenceConverter_release_handle'));


final _makesdkMapdataSegmentreferenceconverterMakeSdknativeengineReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_SegmentReferenceConverter_make__SDKNativeEngine_return_release_handle'));
final _makesdkMapdataSegmentreferenceconverterMakeSdknativeengineReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_SegmentReferenceConverter_make__SDKNativeEngine_return_get_result'));
final _makesdkMapdataSegmentreferenceconverterMakeSdknativeengineReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_SegmentReferenceConverter_make__SDKNativeEngine_return_get_error'));
final _makesdkMapdataSegmentreferenceconverterMakeSdknativeengineReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_SegmentReferenceConverter_make__SDKNativeEngine_return_has_error'));



/// @nodoc
@visibleForTesting
class SegmentReferenceConverter$Impl extends __lib.NativeBase implements SegmentReferenceConverter {

  SegmentReferenceConverter$Impl(Pointer<Void> handle) : super(handle);


  SegmentReferenceConverter make(SDKNativeEngine sdkEngine) {
    final _result_handle = _make(sdkEngine);
    final _result = SegmentReferenceConverter$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkMapdataSegmentreferenceconverterRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _make(SDKNativeEngine sdkEngine) {
    final _makeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_mapdata_SegmentReferenceConverter_make__SDKNativeEngine'));
    final _sdkEngineHandle = sdkCoreEngineSdknativeengineToFfi(sdkEngine);
    final __callResultHandle = _makeFfi(__lib.LibraryContext.isolateId, _sdkEngineHandle);
    sdkCoreEngineSdknativeengineReleaseFfiHandle(_sdkEngineHandle);
    if (_makesdkMapdataSegmentreferenceconverterMakeSdknativeengineReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _makesdkMapdataSegmentreferenceconverterMakeSdknativeengineReturnGetError(__callResultHandle);
        _makesdkMapdataSegmentreferenceconverterMakeSdknativeengineReturnReleaseHandle(__callResultHandle);
        try {
          throw InstantiationException(sdkCoreErrorsInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkCoreErrorsInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _makesdkMapdataSegmentreferenceconverterMakeSdknativeengineReturnGetResult(__callResultHandle);
    _makesdkMapdataSegmentreferenceconverterMakeSdknativeengineReturnReleaseHandle(__callResultHandle);
    return __resultHandle;
  }

  @override
  DirectedOCMSegmentId? getOCMSegmentId(SegmentReference segmentReference) {
    final _getOCMSegmentIdFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapdata_SegmentReferenceConverter_getOCMSegmentId__SegmentReference'));
    final _segmentReferenceHandle = sdkRoutingSegmentreferenceToFfi(segmentReference);
    final _handle = this.handle;
    final __resultHandle = _getOCMSegmentIdFfi(_handle, __lib.LibraryContext.isolateId, _segmentReferenceHandle);
    sdkRoutingSegmentreferenceReleaseFfiHandle(_segmentReferenceHandle);
    try {
      return sdkMapdataDirectedocmsegmentidFromFfiNullable(__resultHandle);
    } finally {
      sdkMapdataDirectedocmsegmentidReleaseFfiHandleNullable(__resultHandle);

    }

  }


}

Pointer<Void> sdkMapdataSegmentreferenceconverterToFfi(SegmentReferenceConverter value) =>
  _sdkMapdataSegmentreferenceconverterCopyHandle((value as __lib.NativeBase).handle);

SegmentReferenceConverter sdkMapdataSegmentreferenceconverterFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is SegmentReferenceConverter) return instance;

  final _copiedHandle = _sdkMapdataSegmentreferenceconverterCopyHandle(handle);
  final result = SegmentReferenceConverter$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMapdataSegmentreferenceconverterRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapdataSegmentreferenceconverterReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapdataSegmentreferenceconverterReleaseHandle(handle);

Pointer<Void> sdkMapdataSegmentreferenceconverterToFfiNullable(SegmentReferenceConverter? value) =>
  value != null ? sdkMapdataSegmentreferenceconverterToFfi(value) : Pointer<Void>.fromAddress(0);

SegmentReferenceConverter? sdkMapdataSegmentreferenceconverterFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapdataSegmentreferenceconverterFromFfi(handle) : null;

void sdkMapdataSegmentreferenceconverterReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapdataSegmentreferenceconverterReleaseHandle(handle);

// End of SegmentReferenceConverter "private" section.


