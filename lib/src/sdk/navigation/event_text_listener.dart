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
import 'package:here_sdk/src/sdk/navigation/event_text.dart';

/// This abstract class should be implemented in order to receive notifications
/// when text notifications are available from [Navigator].
///
/// Multiple notifications
/// can be given for the same maneuver at different distances.
abstract class EventTextListener {
  /// This abstract class should be implemented in order to receive notifications
  /// when text notifications are available from [Navigator].
  ///
  /// Multiple notifications
  /// can be given for the same maneuver at different distances.

  factory EventTextListener(
    void Function(EventText) onEventTextUpdatedLambda,

  ) => EventTextListener$Lambdas(
    onEventTextUpdatedLambda,

  );

  /// Called whenever there is a new text notification for a maneuver (multiple notifications can be
  /// given for the same maneuver at different distances (for example: "After 500 meters turn
  /// right." or "Now turn right.") and in that case, this method will be called once for each
  /// distance.
  ///
  /// [eventText] Data related to next text announcement.
  ///
  void onEventTextUpdated(EventText eventText);
}


// EventTextListener "private" section, not exported.

final _sdkNavigationEventtextlistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_navigation_EventTextListener_register_finalizer'));
final _sdkNavigationEventtextlistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_EventTextListener_copy_handle'));
final _sdkNavigationEventtextlistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_EventTextListener_release_handle'));
final _sdkNavigationEventtextlistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_navigation_EventTextListener_create_proxy'));
final _sdkNavigationEventtextlistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_EventTextListener_get_type_id'));


class EventTextListener$Lambdas implements EventTextListener {
  void Function(EventText) onEventTextUpdatedLambda;

  EventTextListener$Lambdas(
    this.onEventTextUpdatedLambda,

  );

  @override
  void onEventTextUpdated(EventText eventText) =>
    onEventTextUpdatedLambda(eventText);
}

class EventTextListener$Impl extends __lib.NativeBase implements EventTextListener {

  EventTextListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onEventTextUpdated(EventText eventText) {
    final _onEventTextUpdatedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_EventTextListener_onEventTextUpdated__EventText'));
    final _eventTextHandle = sdkNavigationEventtextToFfi(eventText);
    final _handle = this.handle;
    _onEventTextUpdatedFfi(_handle, __lib.LibraryContext.isolateId, _eventTextHandle);
    sdkNavigationEventtextReleaseFfiHandle(_eventTextHandle);

  }


}

int _sdkNavigationEventtextlisteneronEventTextUpdatedStatic(Object _obj, Pointer<Void> eventText) {

  try {
    (_obj as EventTextListener).onEventTextUpdated(sdkNavigationEventtextFromFfi(eventText));
  } finally {
    sdkNavigationEventtextReleaseFfiHandle(eventText);
  }
  return 0;
}


Pointer<Void> sdkNavigationEventtextlistenerToFfi(EventTextListener value) {
  if (value is __lib.NativeBase) return _sdkNavigationEventtextlistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkNavigationEventtextlistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationEventtextlisteneronEventTextUpdatedStatic, __lib.unknownError)
  );

  return result;
}

EventTextListener sdkNavigationEventtextlistenerFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is EventTextListener) return instance;

  final _typeIdHandle = _sdkNavigationEventtextlistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkNavigationEventtextlistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : EventTextListener$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkNavigationEventtextlistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkNavigationEventtextlistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkNavigationEventtextlistenerReleaseHandle(handle);

Pointer<Void> sdkNavigationEventtextlistenerToFfiNullable(EventTextListener? value) =>
  value != null ? sdkNavigationEventtextlistenerToFfi(value) : Pointer<Void>.fromAddress(0);

EventTextListener? sdkNavigationEventtextlistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkNavigationEventtextlistenerFromFfi(handle) : null;

void sdkNavigationEventtextlistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationEventtextlistenerReleaseHandle(handle);

// End of EventTextListener "private" section.


