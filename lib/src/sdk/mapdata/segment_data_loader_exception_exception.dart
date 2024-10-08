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

import 'package:here_sdk/src/sdk/mapdata/segment_data_loader_error_code.dart';

/// Error occurred during obtaining data form the map.
///
/// [SegmentDataLoaderErrorCode] represents possible errors.
class SegmentDataLoaderExceptionException implements Exception {
  final SegmentDataLoaderErrorCode error;
  SegmentDataLoaderExceptionException(this.error);
}


