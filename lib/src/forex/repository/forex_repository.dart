import 'dart:async';
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../model/forex_model.dart';

final forexProvider = FutureProvider.autoDispose<List<ForexModel>>(
  (ref) async {
    return await ForexAPI.get();
  },
);

class ForexAPI {
  static const String _api = "https://www.nrb.org.np/api/forex/v1/app-rate";

  static Future<List<ForexModel>> get() async {
    try {
      final response = await http.get(Uri.parse(_api));

      final forexData = jsonDecode(response.body) as List;
      final List<ForexModel> forexList =
          forexData.map((data) => ForexModel.fromJson(data)).toList();

      return forexList;
    } catch (e) {
      return [];
    }
  }
}
