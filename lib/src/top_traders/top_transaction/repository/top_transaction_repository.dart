import 'dart:convert';

import 'package:riverpod/riverpod.dart';

import '../../../../core/core.dart';
import '../model/top_transaction_model.dart';
final fetchTopTransaction =
    FutureProvider.autoDispose<List<TopTransactionModel>>((ref) async {
  return await TopTransactionRepository.getDataFromRemote();
});

class TopTransactionRepository {
  static Future<List<TopTransactionModel>> getDataFromRemote() async {
    final endPoint = APIInfo().topTransaction;
    try {
      final responseData = await APIProvider.getAPI(endPoint: endPoint);

      List<dynamic> jsonList = jsonDecode(responseData);
      return TopTransactionModel.fromJsonList(jsonList);
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
