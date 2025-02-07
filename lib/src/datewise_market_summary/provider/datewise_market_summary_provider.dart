import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moneymatter/core/core.dart';
import 'package:moneymatter/src/datewise_market_summary/model/datewise_market_summary_model.dart';

final dateWiseMarketSummaryProvider =
    FutureProvider<List<DatewiseMarketSummaryModel>>((ref) async {
  final list = await DateWiseMarketSummaryApi.fetchMarketSummary();
  return list;
});

class DateWiseMarketSummaryApi {
  static Future<List<DatewiseMarketSummaryModel>> fetchMarketSummary() async {
    final endPoint = APIInfo().datewiseMarketSummary;
    try {
      final response = await APIProvider.getAPI(endPoint: endPoint);
      List<dynamic> list = json.decode(response);
      return DatewiseMarketSummaryModel.datewiseMarketSummaryListFromJson(list);
    } catch (e) {
      _handleException(e);
      return [];
    }
  }

  static void _handleException(dynamic e) {
    customLog(e.toString());
    if (e is AppException) {
      ExceptionHandler().parseError(e.message);
    }
  }
}
