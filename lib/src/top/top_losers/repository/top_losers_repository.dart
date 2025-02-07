import 'dart:convert';

import 'package:moneymatter/core/core.dart';
import 'package:riverpod/riverpod.dart';

import '../../model/top_model.dart';

final fetchTopLoser = FutureProvider.autoDispose<List<TopModel>>((ref) async {
  var response = await TopLoserRepository.getDataFromRemote();
  ref.watch(topLoserData.notifier).state = response;
  ref.watch(topFiveLoserData.notifier).state = response.take(5).toList();
  return response;
});

final topLoserData = StateProvider<List<TopModel>>((ref) {
  return [];
});
final topFiveLoserData = StateProvider<List<TopModel>>((ref) {
  return [];
});

class TopLoserRepository {
  static Future<List<TopModel>> getDataFromRemote() async {
    final endPoint = APIInfo().topLosers;
    try {
      final responseData = await APIProvider.getAPI(endPoint: endPoint);

      List<dynamic> jsonList = jsonDecode(responseData);
      return TopModel.fromJsonList(jsonList);
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
