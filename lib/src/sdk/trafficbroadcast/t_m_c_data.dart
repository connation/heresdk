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
import 'package:here_sdk/src/generic_types__conversion.dart';

/// Represents the traffic events in RDS-TMC format.

class TMCData {
  /// Number of groups (1 to 5).
  int numberOfGroups;

  /// Extent.
  int extent;

  /// Street direction.
  int direction;

  /// Diversion advice.
  int diversionAdvice;

  /// Duration persitence.
  int durationPersistence;

  /// Traffic event data.
  int event;

  /// Traffic event location.
  int location;

  /// Additional traffic events.
  List<int> additionalEvents;

  /// Additional traffic locations.
  List<int> additionalLocations;

  /// Creates a new instance.

  /// [numberOfGroups] Number of groups (1 to 5).

  /// [extent] Extent.

  /// [direction] Street direction.

  /// [diversionAdvice] Diversion advice.

  /// [durationPersistence] Duration persitence.

  /// [event] Traffic event data.

  /// [location] Traffic event location.

  /// [additionalEvents] Additional traffic events.

  /// [additionalLocations] Additional traffic locations.

  TMCData(this.numberOfGroups, this.extent, this.direction, this.diversionAdvice, this.durationPersistence, this.event, this.location, this.additionalEvents, this.additionalLocations);
}


// TMCData "private" section, not exported.

final _sdkTrafficbroadcastTmcdataCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint8, Uint8, Uint8, Uint8, Uint8, Int32, Uint32, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(int, int, int, int, int, int, int, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_TMCData_create_handle'));
final _sdkTrafficbroadcastTmcdataReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_TMCData_release_handle'));
final _sdkTrafficbroadcastTmcdataGetFieldnumberOfGroups = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_TMCData_get_field_numberOfGroups'));
final _sdkTrafficbroadcastTmcdataGetFieldextent = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_TMCData_get_field_extent'));
final _sdkTrafficbroadcastTmcdataGetFielddirection = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_TMCData_get_field_direction'));
final _sdkTrafficbroadcastTmcdataGetFielddiversionAdvice = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_TMCData_get_field_diversionAdvice'));
final _sdkTrafficbroadcastTmcdataGetFielddurationPersistence = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_TMCData_get_field_durationPersistence'));
final _sdkTrafficbroadcastTmcdataGetFieldevent = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_TMCData_get_field_event'));
final _sdkTrafficbroadcastTmcdataGetFieldlocation = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_TMCData_get_field_location'));
final _sdkTrafficbroadcastTmcdataGetFieldadditionalEvents = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_TMCData_get_field_additionalEvents'));
final _sdkTrafficbroadcastTmcdataGetFieldadditionalLocations = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_TMCData_get_field_additionalLocations'));



Pointer<Void> sdkTrafficbroadcastTmcdataToFfi(TMCData value) {
  final _numberOfGroupsHandle = (value.numberOfGroups);
  final _extentHandle = (value.extent);
  final _directionHandle = (value.direction);
  final _diversionAdviceHandle = (value.diversionAdvice);
  final _durationPersistenceHandle = (value.durationPersistence);
  final _eventHandle = (value.event);
  final _locationHandle = (value.location);
  final _additionalEventsHandle = heresdkTrafficBroadcastBindingslistofIntToFfi(value.additionalEvents);
  final _additionalLocationsHandle = heresdkTrafficBroadcastBindingslistofUintToFfi(value.additionalLocations);
  final _result = _sdkTrafficbroadcastTmcdataCreateHandle(_numberOfGroupsHandle, _extentHandle, _directionHandle, _diversionAdviceHandle, _durationPersistenceHandle, _eventHandle, _locationHandle, _additionalEventsHandle, _additionalLocationsHandle);
  
  
  
  
  
  
  
  heresdkTrafficBroadcastBindingslistofIntReleaseFfiHandle(_additionalEventsHandle);
  heresdkTrafficBroadcastBindingslistofUintReleaseFfiHandle(_additionalLocationsHandle);
  return _result;
}

TMCData sdkTrafficbroadcastTmcdataFromFfi(Pointer<Void> handle) {
  final _numberOfGroupsHandle = _sdkTrafficbroadcastTmcdataGetFieldnumberOfGroups(handle);
  final _extentHandle = _sdkTrafficbroadcastTmcdataGetFieldextent(handle);
  final _directionHandle = _sdkTrafficbroadcastTmcdataGetFielddirection(handle);
  final _diversionAdviceHandle = _sdkTrafficbroadcastTmcdataGetFielddiversionAdvice(handle);
  final _durationPersistenceHandle = _sdkTrafficbroadcastTmcdataGetFielddurationPersistence(handle);
  final _eventHandle = _sdkTrafficbroadcastTmcdataGetFieldevent(handle);
  final _locationHandle = _sdkTrafficbroadcastTmcdataGetFieldlocation(handle);
  final _additionalEventsHandle = _sdkTrafficbroadcastTmcdataGetFieldadditionalEvents(handle);
  final _additionalLocationsHandle = _sdkTrafficbroadcastTmcdataGetFieldadditionalLocations(handle);
  try {
    return TMCData(
      (_numberOfGroupsHandle), 
      (_extentHandle), 
      (_directionHandle), 
      (_diversionAdviceHandle), 
      (_durationPersistenceHandle), 
      (_eventHandle), 
      (_locationHandle), 
      heresdkTrafficBroadcastBindingslistofIntFromFfi(_additionalEventsHandle), 
      heresdkTrafficBroadcastBindingslistofUintFromFfi(_additionalLocationsHandle)
    );
  } finally {
    
    
    
    
    
    
    
    heresdkTrafficBroadcastBindingslistofIntReleaseFfiHandle(_additionalEventsHandle);
    heresdkTrafficBroadcastBindingslistofUintReleaseFfiHandle(_additionalLocationsHandle);
  }
}

void sdkTrafficbroadcastTmcdataReleaseFfiHandle(Pointer<Void> handle) => _sdkTrafficbroadcastTmcdataReleaseHandle(handle);

// Nullable TMCData

final _sdkTrafficbroadcastTmcdataCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_TMCData_create_handle_nullable'));
final _sdkTrafficbroadcastTmcdataReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_TMCData_release_handle_nullable'));
final _sdkTrafficbroadcastTmcdataGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_trafficbroadcast_TMCData_get_value_nullable'));

Pointer<Void> sdkTrafficbroadcastTmcdataToFfiNullable(TMCData? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkTrafficbroadcastTmcdataToFfi(value);
  final result = _sdkTrafficbroadcastTmcdataCreateHandleNullable(_handle);
  sdkTrafficbroadcastTmcdataReleaseFfiHandle(_handle);
  return result;
}

TMCData? sdkTrafficbroadcastTmcdataFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkTrafficbroadcastTmcdataGetValueNullable(handle);
  final result = sdkTrafficbroadcastTmcdataFromFfi(_handle);
  sdkTrafficbroadcastTmcdataReleaseFfiHandle(_handle);
  return result;
}

void sdkTrafficbroadcastTmcdataReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkTrafficbroadcastTmcdataReleaseHandleNullable(handle);

// End of TMCData "private" section.


