import 'package:riverpod/riverpod.dart';

import '../../../core/core.dart';

final dataIndexList = StateProvider<dynamic>((ref) {
  return [];
});

final dataIndexChartProvider = FutureProvider.autoDispose<dynamic>(
  (ref) async {
    var response = await ChartRepository.getDataFromRemote();
    ref.watch(dataIndexList.notifier).state = response;
    return response;
  },
);

class ChartRepository {
  static Future<dynamic> getDataFromRemote() async {
    final endPoint = APIInfo().graphDataIndex;
    try {
      final responseData = await APIProvider.getAPI(endPoint: endPoint);

      return responseData;
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
