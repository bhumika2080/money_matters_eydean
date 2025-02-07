import 'dart:convert';

import 'package:moneymatter/src/sectorwise_summary/model/sectorwise_model.dart';
import 'package:riverpod/riverpod.dart';

import '../../../core/core.dart';

final fetchSectorwiseSummaryProvider = FutureProvider.autoDispose<List<SectorwiseSummaryModel>>(
  (ref) async {
    return await SectorwiseSummaryRepository.getDataFromRemote();
  },
);

class SectorwiseSummaryRepository {
  static Future<List<SectorwiseSummaryModel>> getDataFromRemote() async {
    final endPoint = APIInfo().sectorwiseOptions;
    try {
      final responseData = await APIProvider.getAPI(endPoint: endPoint);

      List<dynamic> jsonList = jsonDecode(responseData);
      return SectorwiseSummaryModel.fromJsonList(jsonList);
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
