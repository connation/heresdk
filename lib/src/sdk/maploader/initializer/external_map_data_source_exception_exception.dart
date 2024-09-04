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

import 'package:here_sdk/src/sdk/maploader/initializer/external_map_data_source_error_code.dart';

/// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
///
/// Related APIs may change for new releases without a deprecation process.
class ExternalMapDataSourceExceptionException implements Exception {
  final ExternalMapDataSourceErrorCode error;
  ExternalMapDataSourceExceptionException(this.error);
}


