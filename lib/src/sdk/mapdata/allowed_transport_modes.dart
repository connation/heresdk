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

/// Specifies which transport modes are allowed in a particular direction.
///
/// **Note:** This struct specifies a general restriction to that transport mode,
/// but additional restriction are possible.
///
/// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
/// Related APIs may change for new releases without a deprecation process.

class AllowedTransportModes {
  /// True if bicycles can access the segment in the given direction
  bool bicycleAllowed;

  /// True if buses can access the segment in the given direction
  bool busAllowed;

  /// True if cars can access the segment in the given direction
  bool carAllowed;

  /// True if pedestrians can access the segment in the given direction
  bool pedestrianAllowed;

  /// True if scooters can access the segment in the given direction
  bool scooterAllowed;

  /// True if taxis can access the segment in the given direction
  bool taxiAllowed;

  /// True if trucks can access the segment in the given direction
  bool truckAllowed;

  /// Creates a new instance with default values.

  /// [bicycleAllowed] True if bicycles can access the segment in the given direction

  /// [busAllowed] True if buses can access the segment in the given direction

  /// [carAllowed] True if cars can access the segment in the given direction

  /// [pedestrianAllowed] True if pedestrians can access the segment in the given direction

  /// [scooterAllowed] True if scooters can access the segment in the given direction

  /// [taxiAllowed] True if taxis can access the segment in the given direction

  /// [truckAllowed] True if trucks can access the segment in the given direction

  AllowedTransportModes._(this.bicycleAllowed, this.busAllowed, this.carAllowed, this.pedestrianAllowed, this.scooterAllowed, this.taxiAllowed, this.truckAllowed);
  AllowedTransportModes()
    : bicycleAllowed = false, busAllowed = false, carAllowed = false, pedestrianAllowed = false, scooterAllowed = false, taxiAllowed = false, truckAllowed = false;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! AllowedTransportModes) return false;
    AllowedTransportModes _other = other;
    return bicycleAllowed == _other.bicycleAllowed &&
        busAllowed == _other.busAllowed &&
        carAllowed == _other.carAllowed &&
        pedestrianAllowed == _other.pedestrianAllowed &&
        scooterAllowed == _other.scooterAllowed &&
        taxiAllowed == _other.taxiAllowed &&
        truckAllowed == _other.truckAllowed;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + bicycleAllowed.hashCode;
    result = 31 * result + busAllowed.hashCode;
    result = 31 * result + carAllowed.hashCode;
    result = 31 * result + pedestrianAllowed.hashCode;
    result = 31 * result + scooterAllowed.hashCode;
    result = 31 * result + taxiAllowed.hashCode;
    result = 31 * result + truckAllowed.hashCode;
    return result;
  }
}


// AllowedTransportModes "private" section, not exported.

final _sdkMapdataAllowedtransportmodesCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint8, Uint8, Uint8, Uint8, Uint8, Uint8, Uint8),
    Pointer<Void> Function(int, int, int, int, int, int, int)
  >('here_sdk_sdk_mapdata_AllowedTransportModes_create_handle'));
final _sdkMapdataAllowedtransportmodesReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_AllowedTransportModes_release_handle'));
final _sdkMapdataAllowedtransportmodesGetFieldbicycleAllowed = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_AllowedTransportModes_get_field_bicycleAllowed'));
final _sdkMapdataAllowedtransportmodesGetFieldbusAllowed = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_AllowedTransportModes_get_field_busAllowed'));
final _sdkMapdataAllowedtransportmodesGetFieldcarAllowed = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_AllowedTransportModes_get_field_carAllowed'));
final _sdkMapdataAllowedtransportmodesGetFieldpedestrianAllowed = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_AllowedTransportModes_get_field_pedestrianAllowed'));
final _sdkMapdataAllowedtransportmodesGetFieldscooterAllowed = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_AllowedTransportModes_get_field_scooterAllowed'));
final _sdkMapdataAllowedtransportmodesGetFieldtaxiAllowed = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_AllowedTransportModes_get_field_taxiAllowed'));
final _sdkMapdataAllowedtransportmodesGetFieldtruckAllowed = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_AllowedTransportModes_get_field_truckAllowed'));



Pointer<Void> sdkMapdataAllowedtransportmodesToFfi(AllowedTransportModes value) {
  final _bicycleAllowedHandle = booleanToFfi(value.bicycleAllowed);
  final _busAllowedHandle = booleanToFfi(value.busAllowed);
  final _carAllowedHandle = booleanToFfi(value.carAllowed);
  final _pedestrianAllowedHandle = booleanToFfi(value.pedestrianAllowed);
  final _scooterAllowedHandle = booleanToFfi(value.scooterAllowed);
  final _taxiAllowedHandle = booleanToFfi(value.taxiAllowed);
  final _truckAllowedHandle = booleanToFfi(value.truckAllowed);
  final _result = _sdkMapdataAllowedtransportmodesCreateHandle(_bicycleAllowedHandle, _busAllowedHandle, _carAllowedHandle, _pedestrianAllowedHandle, _scooterAllowedHandle, _taxiAllowedHandle, _truckAllowedHandle);
  booleanReleaseFfiHandle(_bicycleAllowedHandle);
  booleanReleaseFfiHandle(_busAllowedHandle);
  booleanReleaseFfiHandle(_carAllowedHandle);
  booleanReleaseFfiHandle(_pedestrianAllowedHandle);
  booleanReleaseFfiHandle(_scooterAllowedHandle);
  booleanReleaseFfiHandle(_taxiAllowedHandle);
  booleanReleaseFfiHandle(_truckAllowedHandle);
  return _result;
}

AllowedTransportModes sdkMapdataAllowedtransportmodesFromFfi(Pointer<Void> handle) {
  final _bicycleAllowedHandle = _sdkMapdataAllowedtransportmodesGetFieldbicycleAllowed(handle);
  final _busAllowedHandle = _sdkMapdataAllowedtransportmodesGetFieldbusAllowed(handle);
  final _carAllowedHandle = _sdkMapdataAllowedtransportmodesGetFieldcarAllowed(handle);
  final _pedestrianAllowedHandle = _sdkMapdataAllowedtransportmodesGetFieldpedestrianAllowed(handle);
  final _scooterAllowedHandle = _sdkMapdataAllowedtransportmodesGetFieldscooterAllowed(handle);
  final _taxiAllowedHandle = _sdkMapdataAllowedtransportmodesGetFieldtaxiAllowed(handle);
  final _truckAllowedHandle = _sdkMapdataAllowedtransportmodesGetFieldtruckAllowed(handle);
  try {
    return AllowedTransportModes._(
      booleanFromFfi(_bicycleAllowedHandle), 
      booleanFromFfi(_busAllowedHandle), 
      booleanFromFfi(_carAllowedHandle), 
      booleanFromFfi(_pedestrianAllowedHandle), 
      booleanFromFfi(_scooterAllowedHandle), 
      booleanFromFfi(_taxiAllowedHandle), 
      booleanFromFfi(_truckAllowedHandle)
    );
  } finally {
    booleanReleaseFfiHandle(_bicycleAllowedHandle);
    booleanReleaseFfiHandle(_busAllowedHandle);
    booleanReleaseFfiHandle(_carAllowedHandle);
    booleanReleaseFfiHandle(_pedestrianAllowedHandle);
    booleanReleaseFfiHandle(_scooterAllowedHandle);
    booleanReleaseFfiHandle(_taxiAllowedHandle);
    booleanReleaseFfiHandle(_truckAllowedHandle);
  }
}

void sdkMapdataAllowedtransportmodesReleaseFfiHandle(Pointer<Void> handle) => _sdkMapdataAllowedtransportmodesReleaseHandle(handle);

// Nullable AllowedTransportModes

final _sdkMapdataAllowedtransportmodesCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_AllowedTransportModes_create_handle_nullable'));
final _sdkMapdataAllowedtransportmodesReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_AllowedTransportModes_release_handle_nullable'));
final _sdkMapdataAllowedtransportmodesGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapdata_AllowedTransportModes_get_value_nullable'));

Pointer<Void> sdkMapdataAllowedtransportmodesToFfiNullable(AllowedTransportModes? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapdataAllowedtransportmodesToFfi(value);
  final result = _sdkMapdataAllowedtransportmodesCreateHandleNullable(_handle);
  sdkMapdataAllowedtransportmodesReleaseFfiHandle(_handle);
  return result;
}

AllowedTransportModes? sdkMapdataAllowedtransportmodesFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapdataAllowedtransportmodesGetValueNullable(handle);
  final result = sdkMapdataAllowedtransportmodesFromFfi(_handle);
  sdkMapdataAllowedtransportmodesReleaseFfiHandle(_handle);
  return result;
}

void sdkMapdataAllowedtransportmodesReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapdataAllowedtransportmodesReleaseHandleNullable(handle);

// End of AllowedTransportModes "private" section.


