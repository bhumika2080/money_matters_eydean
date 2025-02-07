import 'dart:convert';

import 'package:riverpod/riverpod.dart';

import '../../../../core/core.dart';
import '../model/datewise_market_cap_model.dart';

final fetchDatewiseMarketCap =
    FutureProvider.autoDispose<List<DatewiseMarketCapModel>>((ref) async {
  var response = await DatewiseMarketCapRepository.getDataFromRemote();
  ref.watch(datewiseMarketCapData.notifier).state = response;
  return response;
});

final datewiseMarketCapData =
    StateProvider<List<DatewiseMarketCapModel>>((ref) {
  return [];
});

class DatewiseMarketCapRepository {
  static Future<List<DatewiseMarketCapModel>> getDataFromRemote() async {
    final endPoint = APIInfo().datewiseMarketCap;
    try {
      final responseData = await APIProvider.getAPI(endPoint: endPoint);
      List<dynamic> jsonList = jsonDecode(responseData);
      return DatewiseMarketCapModel.fromJsonList(jsonList);
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
