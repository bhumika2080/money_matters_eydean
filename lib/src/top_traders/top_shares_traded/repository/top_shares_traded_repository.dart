import 'dart:convert';

import 'package:riverpod/riverpod.dart';

import '../../../../core/core.dart';
import '../model/top_shares_traded_model.dart';

final fetchTopSharesTraded =
    FutureProvider.autoDispose<List<TopSharesTradedModel>>((ref) async {
  var response = await TopSharesTradedRepository.getDataFromRemote();
  ref.watch(topSharesTradedData.notifier).state = response;
  return response;
});

final topSharesTradedData = StateProvider<List<TopSharesTradedModel>>((ref) {
  return [];
});

class TopSharesTradedRepository {
  static Future<List<TopSharesTradedModel>> getDataFromRemote() async {
    final endPoint = APIInfo().topSharesTraded;
    try {
      final responseData = await APIProvider.getAPI(endPoint: endPoint);

      List<dynamic> jsonList = jsonDecode(responseData);
      return TopSharesTradedModel.fromJsonList(jsonList);
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
