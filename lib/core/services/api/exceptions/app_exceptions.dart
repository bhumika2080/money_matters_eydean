class AppException implements Exception {
  final String message;
  final String prefix;
  final String url;

  AppException(this.message, this.prefix, this.url);
}

class ErrorException extends AppException {
  ErrorException(String message, String url)
      : super(message, 'Bad Request', url);
}

class NetworkConnectionException extends AppException {
  NetworkConnectionException(String message, String url)
      : super(message, 'Unable to process', url);
}

class NetworkTimeoutException extends AppException {
  NetworkTimeoutException(String message, String url)
      : super(message, 'Api not responding', url);
}
