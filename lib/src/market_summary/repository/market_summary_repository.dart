import 'dart:convert';

import 'package:riverpod/riverpod.dart';

import '../../../core/core.dart';
import '../model/market_summary_model.dart';

final marketSummaryResponseData = StateProvider<List<MarketSummaryModel>>(
  (ref) => <MarketSummaryModel>[],
);

final fetchMarketSummary = FutureProvider.autoDispose<List<MarketSummaryModel>>(
  (ref) async {
    final response = await MarketSummaryRepository.getDataFromRemote();
    ref.watch(marketSummaryResponseData.notifier).state = response;
    return response;
  },
);

class MarketSummaryRepository {
  static Future<List<MarketSummaryModel>> getDataFromRemote() async {
    final endPoint = APIInfo().marketSummary;
    try {
      final responseData = await APIProvider.getAPI(endPoint: endPoint);

      List<dynamic> jsonList = jsonDecode(responseData);
      return MarketSummaryModel.fromJsonList(jsonList);
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
