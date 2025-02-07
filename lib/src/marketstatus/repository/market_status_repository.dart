import 'dart:convert';

import 'package:riverpod/riverpod.dart';

import '../../../core/core.dart';
import '../marketstatus.dart';

final marketStatusProvider = FutureProvider.autoDispose<MarketStatusModel>(
  (ref) async {
    var response = await MarketStatusRepository.getDataFromRemote();
    ref.watch(marketStatusInfo.notifier).state = response;
    return response;
  },
);
final marketStatusInfo = StateProvider<MarketStatusModel>(
  (ref) {
    return MarketStatusModel.fromJson({});
  },
);

class MarketStatusRepository {
  static Future<MarketStatusModel> getDataFromRemote() async {
    final endPoint = APIInfo().marketStatus;
    try {
      final responseData = await APIProvider.getAPI(endPoint: endPoint);

      return MarketStatusModel.fromJson(jsonDecode(responseData));
    } catch (e) {
      _handleException(e);
      return MarketStatusModel.fromJson({});
    }
  }

  static void _handleException(dynamic e) {
    customLog(e.toString());
    if (e is AppException) {
      ExceptionHandler().parseError(e.message);
    }
  }
}
