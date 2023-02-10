import 'dart:io';

import 'package:dio/dio.dart';

extension DioErroX on DioError {
  bool get isNullConnectionError {
    return type == DioErrorType.other && error is SocketException;
  }
}
