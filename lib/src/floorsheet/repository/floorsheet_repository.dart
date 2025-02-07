import 'dart:convert';

import 'package:riverpod/riverpod.dart';

import '../../../core/core.dart';
import '../model/floorsheet_model.dart';

final fetchFloorSheet = FutureProvider.autoDispose<FloorSheetModel>(
  (ref) async {
    return await FloorSheetRepository.getDataFromRemote();
  },
);

class FloorSheetRepository {
  static Future<FloorSheetModel> getDataFromRemote() async {
    final endPoint = APIInfo().floorsheet;
    try {
      final responseData = await APIProvider.getAPI(endPoint: endPoint);

      return FloorSheetModel.fromJson(jsonDecode(responseData));
    } catch (e) {
      _handleException(e);
      return FloorSheetModel.fromJson({});
    }
  }

  static void _handleException(dynamic e) {
    customLog(e.toString());
    if (e is AppException) {
      ExceptionHandler().parseError(e.message);
    }
  }
}
