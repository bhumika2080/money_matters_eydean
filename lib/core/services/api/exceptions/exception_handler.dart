import 'dart:io';

import 'app_exceptions.dart';

class ExceptionHandler {
  ExceptionHandler._();

  static final ExceptionHandler _instance = ExceptionHandler._();

  factory ExceptionHandler() => _instance;

  String parseError(dynamic error) {
    if (error is ErrorException) {
      return error.message;
    } else if (error is SocketException) {
      return "No Internet Connection";
    } else if (error is NetworkTimeoutException) {
      return "Connection Time Out";
    } else if (error is NetworkConnectionException) {
      return error.message;
    } else {
      return error;
    }
  }
}
