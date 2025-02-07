import 'dart:convert';

import 'package:riverpod/riverpod.dart';

import '../../../../core/core.dart';
import '../../model/top_model.dart';

final fetchTopGainer = FutureProvider.autoDispose<List<TopModel>>((ref) async {
  var response = await TopGainerRepository.getDataFromRemote();
  ref.watch(topGainerData.notifier).state = response;
  ref.watch(topFiveGainerData.notifier).state = response.take(5).toList();
  return response;
});

final topGainerData = StateProvider<List<TopModel>>((ref) {
  return [];
});
final topFiveGainerData = StateProvider<List<TopModel>>((ref) {
  return [];
});

class TopGainerRepository {
  static Future<List<TopModel>> getDataFromRemote() async {
    final endPoint = APIInfo().topGainer;
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
