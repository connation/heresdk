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

/// Text notifications options.

class EventTextOptions {
  /// A flag that indicates whether spatial audio details should be triggered when generating voice notifications
  /// under [EventTextListener]. If enabled, a set of details required to spatialize
  /// an audio cue will be generated and exposed.
  bool enableSpatialAudio;

  /// Creates a new instance.

  /// [enableSpatialAudio] A flag that indicates whether spatial audio details should be triggered when generating voice notifications
  /// under [EventTextListener]. If enabled, a set of details required to spatialize
  /// an audio cue will be generated and exposed.

  EventTextOptions._(this.enableSpatialAudio);
  EventTextOptions()
    : enableSpatialAudio = false;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! EventTextOptions) return false;
    EventTextOptions _other = other;
    return enableSpatialAudio == _other.enableSpatialAudio;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + enableSpatialAudio.hashCode;
    return result;
  }
}


// EventTextOptions "private" section, not exported.

final _sdkNavigationEventtextoptionsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint8),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_navigation_EventTextOptions_create_handle'));
final _sdkNavigationEventtextoptionsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_EventTextOptions_release_handle'));
final _sdkNavigationEventtextoptionsGetFieldenableSpatialAudio = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_EventTextOptions_get_field_enableSpatialAudio'));



Pointer<Void> sdkNavigationEventtextoptionsToFfi(EventTextOptions value) {
  final _enableSpatialAudioHandle = booleanToFfi(value.enableSpatialAudio);
  final _result = _sdkNavigationEventtextoptionsCreateHandle(_enableSpatialAudioHandle);
  booleanReleaseFfiHandle(_enableSpatialAudioHandle);
  return _result;
}

EventTextOptions sdkNavigationEventtextoptionsFromFfi(Pointer<Void> handle) {
  final _enableSpatialAudioHandle = _sdkNavigationEventtextoptionsGetFieldenableSpatialAudio(handle);
  try {
    return EventTextOptions._(
      booleanFromFfi(_enableSpatialAudioHandle)
    );
  } finally {
    booleanReleaseFfiHandle(_enableSpatialAudioHandle);
  }
}

void sdkNavigationEventtextoptionsReleaseFfiHandle(Pointer<Void> handle) => _sdkNavigationEventtextoptionsReleaseHandle(handle);

// Nullable EventTextOptions

final _sdkNavigationEventtextoptionsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_EventTextOptions_create_handle_nullable'));
final _sdkNavigationEventtextoptionsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_EventTextOptions_release_handle_nullable'));
final _sdkNavigationEventtextoptionsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_EventTextOptions_get_value_nullable'));

Pointer<Void> sdkNavigationEventtextoptionsToFfiNullable(EventTextOptions? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationEventtextoptionsToFfi(value);
  final result = _sdkNavigationEventtextoptionsCreateHandleNullable(_handle);
  sdkNavigationEventtextoptionsReleaseFfiHandle(_handle);
  return result;
}

EventTextOptions? sdkNavigationEventtextoptionsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationEventtextoptionsGetValueNullable(handle);
  final result = sdkNavigationEventtextoptionsFromFfi(_handle);
  sdkNavigationEventtextoptionsReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationEventtextoptionsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationEventtextoptionsReleaseHandleNullable(handle);

// End of EventTextOptions "private" section.


