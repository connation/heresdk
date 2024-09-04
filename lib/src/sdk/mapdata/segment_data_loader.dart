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
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/engine/s_d_k_native_engine.dart';
import 'package:here_sdk/src/sdk/core/errors/instantiation_error_code.dart';
import 'package:here_sdk/src/sdk/core/errors/instantiation_exception.dart';
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';
import 'package:here_sdk/src/sdk/mapdata/o_c_m_segment_id.dart';
import 'package:here_sdk/src/sdk/mapdata/segment_data.dart';
import 'package:here_sdk/src/sdk/mapdata/segment_data_loader_error_code.dart';
import 'package:here_sdk/src/sdk/mapdata/segment_data_loader_exception_exception.dart';
import 'package:here_sdk/src/sdk/mapdata/segment_data_loader_options.dart';
import 'package:meta/meta.dart';

/// Provides the abstract class for the  access to the
/// segments data available in the local OCM map.
///
/// Please be aware that the methods within this class
/// load map data synchronously. In the event of absent data in the disk cache, the data will be
/// retrieved from the remote server. To mitigate the potential freezing of the calling thread,
/// it is advisable to proactively prefetch map data around the working area.
///
/// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected
/// behaviors. Related APIs may change for new releases without a deprecation process.
abstract class SegmentDataLoader {
  /// Creates a new instance of this class.
  ///
  /// Throws [InstantiationException]. Indicates what went wrong when the instantiation was attempted.
  ///
  factory SegmentDataLoader() => $prototype.$init();
  /// Creates a new instance of this class.
  ///
  /// [sdkEngine] A SDKEngine instance.
  ///
  /// Throws [InstantiationException]. Indicates what went wrong when the instantiation was attempted.
  ///
  factory SegmentDataLoader.withEngine(SDKNativeEngine sdkEngine) => $prototype.withEngine(sdkEngine);

  /// Loads the segments around a certain coordinates.
  ///
  /// [coordinates] The location to explore
  ///
  /// [radiusInMeters] The radius of the search. Only values between 1m and 5000m are accepted.
  ///
  /// Returns [List<OCMSegmentId>]. The list of segments around the given position.
  ///
  /// The segments are sorted by distance
  /// from the point.
  /// Throws if it's not possible to return list of a list of segments.
  ///
  /// Throws [SegmentDataLoaderExceptionException]. Specifies reason, why list of a list of segments is not returned.
  ///
  List<OCMSegmentId> getSegmentsAroundCoordinates(GeoCoordinates coordinates, double radiusInMeters);
  /// Synchronously load the data for the given map segment
  ///
  /// [segment] The segment to load.
  ///
  /// [options] Request options
  ///
  /// Returns [SegmentData]. Requested data of a segment.
  ///
  /// Throws [SegmentDataLoaderExceptionException]. Specifies reason, why list of data of a segment is not returned.
  ///
  SegmentData loadData(OCMSegmentId segment, SegmentDataLoaderOptions options);

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = SegmentDataLoader$Impl(Pointer<Void>.fromAddress(0));
}


// SegmentDataLoader "private" section, not exported.

final _sdkMapdataSegmentdataloaderRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapdata_SegmentDataLoader_register_finalizer'));
final _sdkMapdataSegmentdataloaderCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_SegmentDataLoader_copy_handle'));
final _sdkMapdataSegmentdataloaderReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_SegmentDataLoader_release_handle'));


final _$initsdkMapdataSegmentdataloaderMakeReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_SegmentDataLoader_make_return_release_handle'));
final _$initsdkMapdataSegmentdataloaderMakeReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_SegmentDataLoader_make_return_get_result'));
final _$initsdkMapdataSegmentdataloaderMakeReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_SegmentDataLoader_make_return_get_error'));
final _$initsdkMapdataSegmentdataloaderMakeReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_SegmentDataLoader_make_return_has_error'));


final _withEnginesdkMapdataSegmentdataloaderMakeSdknativeengineReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_SegmentDataLoader_make__SDKNativeEngine_return_release_handle'));
final _withEnginesdkMapdataSegmentdataloaderMakeSdknativeengineReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_SegmentDataLoader_make__SDKNativeEngine_return_get_result'));
final _withEnginesdkMapdataSegmentdataloaderMakeSdknativeengineReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_SegmentDataLoader_make__SDKNativeEngine_return_get_error'));
final _withEnginesdkMapdataSegmentdataloaderMakeSdknativeengineReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_SegmentDataLoader_make__SDKNativeEngine_return_has_error'));


final _getSegmentsAroundCoordinatessdkMapdataSegmentdataloaderGetsegmentsaroundcoordinatesGeocoordinatesDoubleReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_SegmentDataLoader_getSegmentsAroundCoordinates__GeoCoordinates_Double_return_release_handle'));
final _getSegmentsAroundCoordinatessdkMapdataSegmentdataloaderGetsegmentsaroundcoordinatesGeocoordinatesDoubleReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_SegmentDataLoader_getSegmentsAroundCoordinates__GeoCoordinates_Double_return_get_result'));
final _getSegmentsAroundCoordinatessdkMapdataSegmentdataloaderGetsegmentsaroundcoordinatesGeocoordinatesDoubleReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_SegmentDataLoader_getSegmentsAroundCoordinates__GeoCoordinates_Double_return_get_error'));
final _getSegmentsAroundCoordinatessdkMapdataSegmentdataloaderGetsegmentsaroundcoordinatesGeocoordinatesDoubleReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_SegmentDataLoader_getSegmentsAroundCoordinates__GeoCoordinates_Double_return_has_error'));


final _loadDatasdkMapdataSegmentdataloaderLoaddataOcmsegmentidSegmentdataloaderoptionsReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_SegmentDataLoader_loadData__OCMSegmentId_SegmentDataLoaderOptions_return_release_handle'));
final _loadDatasdkMapdataSegmentdataloaderLoaddataOcmsegmentidSegmentdataloaderoptionsReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_SegmentDataLoader_loadData__OCMSegmentId_SegmentDataLoaderOptions_return_get_result'));
final _loadDatasdkMapdataSegmentdataloaderLoaddataOcmsegmentidSegmentdataloaderoptionsReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_SegmentDataLoader_loadData__OCMSegmentId_SegmentDataLoaderOptions_return_get_error'));
final _loadDatasdkMapdataSegmentdataloaderLoaddataOcmsegmentidSegmentdataloaderoptionsReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_SegmentDataLoader_loadData__OCMSegmentId_SegmentDataLoaderOptions_return_has_error'));


/// @nodoc
@visibleForTesting
class SegmentDataLoader$Impl extends __lib.NativeBase implements SegmentDataLoader {

  SegmentDataLoader$Impl(Pointer<Void> handle) : super(handle);


  SegmentDataLoader $init() {
    final _result_handle = _$init();
    final _result = SegmentDataLoader$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkMapdataSegmentdataloaderRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }


  SegmentDataLoader withEngine(SDKNativeEngine sdkEngine) {
    final _result_handle = _withEngine(sdkEngine);
    final _result = SegmentDataLoader$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkMapdataSegmentdataloaderRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _$init() {
    final _$initFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('here_sdk_sdk_mapdata_SegmentDataLoader_make'));
    final __callResultHandle = _$initFfi(__lib.LibraryContext.isolateId);
    if (_$initsdkMapdataSegmentdataloaderMakeReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _$initsdkMapdataSegmentdataloaderMakeReturnGetError(__callResultHandle);
        _$initsdkMapdataSegmentdataloaderMakeReturnReleaseHandle(__callResultHandle);
        try {
          throw InstantiationException(sdkCoreErrorsInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkCoreErrorsInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _$initsdkMapdataSegmentdataloaderMakeReturnGetResult(__callResultHandle);
    _$initsdkMapdataSegmentdataloaderMakeReturnReleaseHandle(__callResultHandle);
    return __resultHandle;
  }

  static Pointer<Void> _withEngine(SDKNativeEngine sdkEngine) {
    final _withEngineFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_mapdata_SegmentDataLoader_make__SDKNativeEngine'));
    final _sdkEngineHandle = sdkCoreEngineSdknativeengineToFfi(sdkEngine);
    final __callResultHandle = _withEngineFfi(__lib.LibraryContext.isolateId, _sdkEngineHandle);
    sdkCoreEngineSdknativeengineReleaseFfiHandle(_sdkEngineHandle);
    if (_withEnginesdkMapdataSegmentdataloaderMakeSdknativeengineReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _withEnginesdkMapdataSegmentdataloaderMakeSdknativeengineReturnGetError(__callResultHandle);
        _withEnginesdkMapdataSegmentdataloaderMakeSdknativeengineReturnReleaseHandle(__callResultHandle);
        try {
          throw InstantiationException(sdkCoreErrorsInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkCoreErrorsInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _withEnginesdkMapdataSegmentdataloaderMakeSdknativeengineReturnGetResult(__callResultHandle);
    _withEnginesdkMapdataSegmentdataloaderMakeSdknativeengineReturnReleaseHandle(__callResultHandle);
    return __resultHandle;
  }

  @override
  List<OCMSegmentId> getSegmentsAroundCoordinates(GeoCoordinates coordinates, double radiusInMeters) {
    final _getSegmentsAroundCoordinatesFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Double), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, double)>('here_sdk_sdk_mapdata_SegmentDataLoader_getSegmentsAroundCoordinates__GeoCoordinates_Double'));
    final _coordinatesHandle = sdkCoreGeocoordinatesToFfi(coordinates);
    final _radiusInMetersHandle = (radiusInMeters);
    final _handle = this.handle;
    final __callResultHandle = _getSegmentsAroundCoordinatesFfi(_handle, __lib.LibraryContext.isolateId, _coordinatesHandle, _radiusInMetersHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_coordinatesHandle);

    if (_getSegmentsAroundCoordinatessdkMapdataSegmentdataloaderGetsegmentsaroundcoordinatesGeocoordinatesDoubleReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _getSegmentsAroundCoordinatessdkMapdataSegmentdataloaderGetsegmentsaroundcoordinatesGeocoordinatesDoubleReturnGetError(__callResultHandle);
        _getSegmentsAroundCoordinatessdkMapdataSegmentdataloaderGetsegmentsaroundcoordinatesGeocoordinatesDoubleReturnReleaseHandle(__callResultHandle);
        try {
          throw SegmentDataLoaderExceptionException(sdkMapdataSegmentdataloadererrorcodeFromFfi(__errorHandle));
        } finally {
          sdkMapdataSegmentdataloadererrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _getSegmentsAroundCoordinatessdkMapdataSegmentdataloaderGetsegmentsaroundcoordinatesGeocoordinatesDoubleReturnGetResult(__callResultHandle);
    _getSegmentsAroundCoordinatessdkMapdataSegmentdataloaderGetsegmentsaroundcoordinatesGeocoordinatesDoubleReturnReleaseHandle(__callResultHandle);
    try {
      return heresdkMapdataBindingslistofSdkMapdataOcmsegmentidFromFfi(__resultHandle);
    } finally {
      heresdkMapdataBindingslistofSdkMapdataOcmsegmentidReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  SegmentData loadData(OCMSegmentId segment, SegmentDataLoaderOptions options) {
    final _loadDataFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_mapdata_SegmentDataLoader_loadData__OCMSegmentId_SegmentDataLoaderOptions'));
    final _segmentHandle = sdkMapdataOcmsegmentidToFfi(segment);
    final _optionsHandle = sdkMapdataSegmentdataloaderoptionsToFfi(options);
    final _handle = this.handle;
    final __callResultHandle = _loadDataFfi(_handle, __lib.LibraryContext.isolateId, _segmentHandle, _optionsHandle);
    sdkMapdataOcmsegmentidReleaseFfiHandle(_segmentHandle);
    sdkMapdataSegmentdataloaderoptionsReleaseFfiHandle(_optionsHandle);
    if (_loadDatasdkMapdataSegmentdataloaderLoaddataOcmsegmentidSegmentdataloaderoptionsReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _loadDatasdkMapdataSegmentdataloaderLoaddataOcmsegmentidSegmentdataloaderoptionsReturnGetError(__callResultHandle);
        _loadDatasdkMapdataSegmentdataloaderLoaddataOcmsegmentidSegmentdataloaderoptionsReturnReleaseHandle(__callResultHandle);
        try {
          throw SegmentDataLoaderExceptionException(sdkMapdataSegmentdataloadererrorcodeFromFfi(__errorHandle));
        } finally {
          sdkMapdataSegmentdataloadererrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _loadDatasdkMapdataSegmentdataloaderLoaddataOcmsegmentidSegmentdataloaderoptionsReturnGetResult(__callResultHandle);
    _loadDatasdkMapdataSegmentdataloaderLoaddataOcmsegmentidSegmentdataloaderoptionsReturnReleaseHandle(__callResultHandle);
    try {
      return sdkMapdataSegmentdataFromFfi(__resultHandle);
    } finally {
      sdkMapdataSegmentdataReleaseFfiHandle(__resultHandle);

    }

  }


}

Pointer<Void> sdkMapdataSegmentdataloaderToFfi(SegmentDataLoader value) =>
  _sdkMapdataSegmentdataloaderCopyHandle((value as __lib.NativeBase).handle);

SegmentDataLoader sdkMapdataSegmentdataloaderFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is SegmentDataLoader) return instance;

  final _copiedHandle = _sdkMapdataSegmentdataloaderCopyHandle(handle);
  final result = SegmentDataLoader$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMapdataSegmentdataloaderRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapdataSegmentdataloaderReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapdataSegmentdataloaderReleaseHandle(handle);

Pointer<Void> sdkMapdataSegmentdataloaderToFfiNullable(SegmentDataLoader? value) =>
  value != null ? sdkMapdataSegmentdataloaderToFfi(value) : Pointer<Void>.fromAddress(0);

SegmentDataLoader? sdkMapdataSegmentdataloaderFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapdataSegmentdataloaderFromFfi(handle) : null;

void sdkMapdataSegmentdataloaderReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapdataSegmentdataloaderReleaseHandle(handle);

// End of SegmentDataLoader "private" section.


