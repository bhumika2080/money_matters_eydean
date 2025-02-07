import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:moneymatter/core/core.dart';

class APIProvider {
  static Future<dynamic> _handleRequest(
    String api,
    Future<http.Response> Function(Uri) request,
  ) async {
    customLog('Requesting API: $api');

    try {
      final response = await request(Uri.parse(api)).timeout(
        const Duration(minutes: 1),
      );
      customLog('Response from API: $api\nResponse Body: ${response.body}');

      return response.body;
    } on SocketException {
      customLog('No Internet Connection for API: $api');
      throw NetworkConnectionException("No Internet Connection", api);
    } on TimeoutException {
      customLog('API not responded in time: $api');
      throw NetworkTimeoutException("API not responded in time", api);
    } catch (e) {
      customLog('Something goes wrong for API: $api\nError: $e');
      throw ErrorException("Something goes wrong", api);
    }
  }

  static Future<dynamic> getAPI({required String endPoint}) async {
    final api = "${APIInfo().baseUrl}$endPoint";
    return _handleRequest(api, http.get);
  }

  static Future<dynamic> postAPI({
    required String endPoint,
    required Object body,
  }) async {
    final api = "${APIInfo().baseUrl}$endPoint";
    var headers = {'Content-Type': 'application/json'};
    customLog('POST Request to API: $api\nHeaders: $headers\nBody: $body');
    return _handleRequest(
      api,
      (uri) => http.post(uri, body: body, headers: headers),
    );
  }
}
