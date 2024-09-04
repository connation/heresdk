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
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/venue/service/venue_listener.dart';
import 'package:here_sdk/src/sdk/venue/service/venue_service_init_status.dart';
import 'package:here_sdk/src/sdk/venue/service/venue_service_listener.dart';

/// Offers methods to download venues.
///
/// Use of this
/// object does not necessitate Map involvement.
///
/// <p>
/// Before loading the venues, initialize the venue service
/// with one of the start methods.
/// </p>
/// <p>
/// The venue service is online only. Even if there is a cached
/// venue on the device, the venue service requires an online
/// connection to check if the venue is available for the user.
/// </p>
abstract class VenueService {

  /// Stops the venue service.
  ///
  void stop();
  /// Adds a service .
  ///
  /// The
  /// is not added if it is `null` or is already present in the list of
  /// .
  ///
  /// [listener] The service  to add.
  ///
  void addServiceListener(VenueServiceListener listener);
  /// Removes a service .
  ///
  /// The
  /// is not removed if it is not present in the list of .
  ///
  /// [listener] The service  to remove.
  ///
  void removeServiceListener(VenueServiceListener listener);
  /// Adds a venue .
  ///
  /// The
  /// is not added if it is `null` or is already present in the list of
  /// .
  ///
  /// [listener] The venue  to add.
  ///
  void addVenueListener(VenueListener listener);
  /// Removes a venue .
  ///
  /// The
  /// is not removed if it is not present in the list of .
  ///
  /// [listener] The venue  to remove.
  ///
  void removeVenueListener(VenueListener listener);
  /// Gets an initialization status.
  ///
  /// Returns [VenueServiceInitStatus]. The initialization status.
  ///
  VenueServiceInitStatus getInitStatus();
  /// Checks if the venue service is initialized.
  ///
  /// Returns [bool]. True if the venue service is initialized and false otherwise.
  ///
  bool isInitialized();
  /// Adds a venue to the loading queue.
  ///
  /// [venueId] The id of the venue to load.
  ///
  void addVenueToLoad(int venueId);
  /// Sets HRN of platform catalog.
  ///
  /// [hrn] The HRN of platform catalog.
  ///
  void setHrn(String hrn);
  /// Sets override labelTextPreference for labels.
  ///
  /// [labelTextPref] The list of string override labelTextPreference.
  ///
  /// <p>
  /// "OCCUPANT_NAMES" - To display only occupant names on map as a label text. Example: Boutique Du Chocolat for id 7348
  /// </p>
  /// <p>
  /// "SPACE_NAME" - To display only space names on map as a label text. Example: Family Services/First Aid for id 7348
  /// </p>
  /// <p>
  /// "SPACE_TYPE_NAME" - To display only space types on map as a label text. Example: DEFIBRILLATOR for id 7348
  /// </p>
  /// <p>
  /// "SPACE_CATEGORY_NAME" - To display only space categories on map as a label text. Example: SAFETY for id 7348
  /// </p>
  /// <p>
  /// "INTERNAL_ADDRESS" - To display only internal addresses on map as a label text. Example: "51/D for id 7348
  /// </p>
  ///
  void setLabeltextPreference(List<String> labelTextPref);
  /// Lets user load topologies for current session
  ///
  void loadTopologies();
  /// Gets the languages available in the venue service.
  List<String> get languages;

  /// Gets an active language in the venue service. The venue service will try to load
  /// a venue with a translation in the active language. If such translation doesn't
  /// exist, a venue will be loaded in its default language.
  String get language;
  /// Sets an active language.
  set language(String value);

}


// VenueService "private" section, not exported.

final _sdkVenueServiceVenueserviceRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_venue_service_VenueService_register_finalizer'));
final _sdkVenueServiceVenueserviceCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_service_VenueService_copy_handle'));
final _sdkVenueServiceVenueserviceReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_service_VenueService_release_handle'));













class VenueService$Impl extends __lib.NativeBase implements VenueService {

  VenueService$Impl(Pointer<Void> handle) : super(handle);

  @override
  void stop() {
    final _stopFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_venue_service_VenueService_stop'));
    final _handle = this.handle;
    _stopFfi(_handle, __lib.LibraryContext.isolateId);

  }

  @override
  void addServiceListener(VenueServiceListener listener) {
    final _addServiceListenerFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_service_VenueService_add__VenueServiceListener'));
    final _listenerHandle = sdkVenueServiceVenueservicelistenerToFfi(listener);
    final _handle = this.handle;
    _addServiceListenerFfi(_handle, __lib.LibraryContext.isolateId, _listenerHandle);
    sdkVenueServiceVenueservicelistenerReleaseFfiHandle(_listenerHandle);

  }

  @override
  void removeServiceListener(VenueServiceListener listener) {
    final _removeServiceListenerFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_service_VenueService_remove__VenueServiceListener'));
    final _listenerHandle = sdkVenueServiceVenueservicelistenerToFfi(listener);
    final _handle = this.handle;
    _removeServiceListenerFfi(_handle, __lib.LibraryContext.isolateId, _listenerHandle);
    sdkVenueServiceVenueservicelistenerReleaseFfiHandle(_listenerHandle);

  }

  @override
  void addVenueListener(VenueListener listener) {
    final _addVenueListenerFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_service_VenueService_add__VenueListener'));
    final _listenerHandle = sdkVenueServiceVenuelistenerToFfi(listener);
    final _handle = this.handle;
    _addVenueListenerFfi(_handle, __lib.LibraryContext.isolateId, _listenerHandle);
    sdkVenueServiceVenuelistenerReleaseFfiHandle(_listenerHandle);

  }

  @override
  void removeVenueListener(VenueListener listener) {
    final _removeVenueListenerFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_service_VenueService_remove__VenueListener'));
    final _listenerHandle = sdkVenueServiceVenuelistenerToFfi(listener);
    final _handle = this.handle;
    _removeVenueListenerFfi(_handle, __lib.LibraryContext.isolateId, _listenerHandle);
    sdkVenueServiceVenuelistenerReleaseFfiHandle(_listenerHandle);

  }

  @override
  VenueServiceInitStatus getInitStatus() {
    final _getInitStatusFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_venue_service_VenueService_getInitStatus'));
    final _handle = this.handle;
    final __resultHandle = _getInitStatusFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkVenueServiceVenueserviceinitstatusFromFfi(__resultHandle);
    } finally {
      sdkVenueServiceVenueserviceinitstatusReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  bool isInitialized() {
    final _isInitializedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_venue_service_VenueService_isInitialized'));
    final _handle = this.handle;
    final __resultHandle = _isInitializedFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  void addVenueToLoad(int venueId) {
    final _addVenueToLoadFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Int32), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_venue_service_VenueService_addVenueToLoad__Int'));
    final _venueIdHandle = (venueId);
    final _handle = this.handle;
    _addVenueToLoadFfi(_handle, __lib.LibraryContext.isolateId, _venueIdHandle);


  }

  @override
  void setHrn(String hrn) {
    final _setHrnFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_service_VenueService_setHrn__String'));
    final _hrnHandle = stringToFfi(hrn);
    final _handle = this.handle;
    _setHrnFfi(_handle, __lib.LibraryContext.isolateId, _hrnHandle);
    stringReleaseFfiHandle(_hrnHandle);

  }

  @override
  void setLabeltextPreference(List<String> labelTextPref) {
    final _setLabeltextPreferenceFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_service_VenueService_setLabeltextPreference__ListOf_String'));
    final _labelTextPrefHandle = venuecoreBindingslistofStringToFfi(labelTextPref);
    final _handle = this.handle;
    _setLabeltextPreferenceFfi(_handle, __lib.LibraryContext.isolateId, _labelTextPrefHandle);
    venuecoreBindingslistofStringReleaseFfiHandle(_labelTextPrefHandle);

  }

  @override
  void loadTopologies() {
    final _loadTopologiesFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_venue_service_VenueService_loadTopologies'));
    final _handle = this.handle;
    _loadTopologiesFfi(_handle, __lib.LibraryContext.isolateId);

  }

  @override
  List<String> get languages {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_service_VenueService_languages_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return venuecoreBindingslistofStringFromFfi(__resultHandle);
    } finally {
      venuecoreBindingslistofStringReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  String get language {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_service_VenueService_language_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set language(String value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_service_VenueService_language_set__String'));
    final _valueHandle = stringToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    stringReleaseFfiHandle(_valueHandle);

  }



}

Pointer<Void> sdkVenueServiceVenueserviceToFfi(VenueService value) =>
  _sdkVenueServiceVenueserviceCopyHandle((value as __lib.NativeBase).handle);

VenueService sdkVenueServiceVenueserviceFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is VenueService) return instance;

  final _copiedHandle = _sdkVenueServiceVenueserviceCopyHandle(handle);
  final result = VenueService$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkVenueServiceVenueserviceRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkVenueServiceVenueserviceReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkVenueServiceVenueserviceReleaseHandle(handle);

Pointer<Void> sdkVenueServiceVenueserviceToFfiNullable(VenueService? value) =>
  value != null ? sdkVenueServiceVenueserviceToFfi(value) : Pointer<Void>.fromAddress(0);

VenueService? sdkVenueServiceVenueserviceFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkVenueServiceVenueserviceFromFfi(handle) : null;

void sdkVenueServiceVenueserviceReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkVenueServiceVenueserviceReleaseHandle(handle);

// End of VenueService "private" section.


