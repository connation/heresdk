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

/// Specifies possible errors that may result from a w3w search query.
enum W3WSearchError {
    /// Invalid or non-existent 3 word address.
    badWords,
    /// Bad parameter `language`.
    badLanguage,
    /// Missing parameter: a required words parameter was missing.
    missingWords,
    /// W3W backend return result with unexpected json schema.
    /// This is not expected to happen. Try updating to the newest
    /// version of the SDK. If the problem persists, please report a bug in the SDK.
    parsingError,
    /// Generic internal error.
    internalError,
    /// What3Words server is unreachable.
    serverUnreachable,
    /// A general network request error.
    httpError,
    /// What3Words operation is not authenticated. Check your credentials.
    authenticationFailed,
    /// Credentials exceeded the allowed requests limit.
    exceededUsageLimit,
    /// The request timed out.
    timedOut,
    /// The device has no internet connection.
    offline,
    /// The request was cancelled (usually by the user).
    operationCancelled,
    /// Proxy is not authenticated. Check your proxy credentials.
    proxyAuthenticationFailed,
    /// Proxy server unreachable.
    proxyServerUnreachable,
    /// Unknown error, that was not introduced by HERE SDK, but exists on W3W backend.
    unknown
}

// W3WSearchError "private" section, not exported.

int sdkSearchW3wsearcherrorToFfi(W3WSearchError value) {
  switch (value) {
  case W3WSearchError.badWords:
    return 0;
  case W3WSearchError.badLanguage:
    return 1;
  case W3WSearchError.missingWords:
    return 2;
  case W3WSearchError.parsingError:
    return 3;
  case W3WSearchError.internalError:
    return 4;
  case W3WSearchError.serverUnreachable:
    return 5;
  case W3WSearchError.httpError:
    return 6;
  case W3WSearchError.authenticationFailed:
    return 7;
  case W3WSearchError.exceededUsageLimit:
    return 8;
  case W3WSearchError.timedOut:
    return 9;
  case W3WSearchError.offline:
    return 10;
  case W3WSearchError.operationCancelled:
    return 11;
  case W3WSearchError.proxyAuthenticationFailed:
    return 12;
  case W3WSearchError.proxyServerUnreachable:
    return 13;
  case W3WSearchError.unknown:
    return 14;
  default:
    throw StateError("Invalid enum value $value for W3WSearchError enum.");
  }
}

W3WSearchError sdkSearchW3wsearcherrorFromFfi(int handle) {
  switch (handle) {
  case 0:
    return W3WSearchError.badWords;
  case 1:
    return W3WSearchError.badLanguage;
  case 2:
    return W3WSearchError.missingWords;
  case 3:
    return W3WSearchError.parsingError;
  case 4:
    return W3WSearchError.internalError;
  case 5:
    return W3WSearchError.serverUnreachable;
  case 6:
    return W3WSearchError.httpError;
  case 7:
    return W3WSearchError.authenticationFailed;
  case 8:
    return W3WSearchError.exceededUsageLimit;
  case 9:
    return W3WSearchError.timedOut;
  case 10:
    return W3WSearchError.offline;
  case 11:
    return W3WSearchError.operationCancelled;
  case 12:
    return W3WSearchError.proxyAuthenticationFailed;
  case 13:
    return W3WSearchError.proxyServerUnreachable;
  case 14:
    return W3WSearchError.unknown;
  default:
    throw StateError("Invalid numeric value $handle for W3WSearchError enum.");
  }
}

void sdkSearchW3wsearcherrorReleaseFfiHandle(int handle) {}

final _sdkSearchW3wsearcherrorCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_search_W3WSearchError_create_handle_nullable'));
final _sdkSearchW3wsearcherrorReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_W3WSearchError_release_handle_nullable'));
final _sdkSearchW3wsearcherrorGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_W3WSearchError_get_value_nullable'));

Pointer<Void> sdkSearchW3wsearcherrorToFfiNullable(W3WSearchError? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchW3wsearcherrorToFfi(value);
  final result = _sdkSearchW3wsearcherrorCreateHandleNullable(_handle);
  sdkSearchW3wsearcherrorReleaseFfiHandle(_handle);
  return result;
}

W3WSearchError? sdkSearchW3wsearcherrorFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchW3wsearcherrorGetValueNullable(handle);
  final result = sdkSearchW3wsearcherrorFromFfi(_handle);
  sdkSearchW3wsearcherrorReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchW3wsearcherrorReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchW3wsearcherrorReleaseHandleNullable(handle);

// End of W3WSearchError "private" section.


