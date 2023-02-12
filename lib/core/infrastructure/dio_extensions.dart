import 'dart:io';

import 'package:diox/diox.dart';

extension DioErroX on DioError {
  bool get isNullConnectionError {
    return type == DioErrorType.unknown && error is SocketException;
  }
}
