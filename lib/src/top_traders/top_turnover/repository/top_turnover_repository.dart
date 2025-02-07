import 'dart:convert';

import 'package:riverpod/riverpod.dart';

import '../../../../core/core.dart';
import '../model/top_turnover_model.dart';

final fetchTopTurnover =
    FutureProvider.autoDispose<List<TopTurnoverModel>>((ref) async {
  var response = await TopTurnoverRepository.getDataFromRemote();
  ref.watch(topTurnoverData.notifier).state = response;
  return response;
});

final topTurnoverData = StateProvider<List<TopTurnoverModel>>((ref) {
  return [];
});

class TopTurnoverRepository {
  static Future<List<TopTurnoverModel>> getDataFromRemote() async {
    final endPoint = APIInfo().topTurnover;
    try {
      final responseData = await APIProvider.getAPI(endPoint: endPoint);

      List<dynamic> jsonList = jsonDecode(responseData);
      return TopTurnoverModel.fromJsonList(jsonList);
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
