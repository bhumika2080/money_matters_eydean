import 'dart:convert';

import 'package:riverpod/riverpod.dart';

import '../../../core/core.dart';
import '../model/company_list_model.dart';

final fetchCompanyList =
    FutureProvider.autoDispose<List<CompanyModel>>((ref) async {
  return await CompanyListRepository.getDataFromRemote();
});

class CompanyListRepository {
  static Future<List<CompanyModel>> getDataFromRemote() async {
    final endPoint = APIInfo().companyList;
    try {
      final responseData = await APIProvider.getAPI(endPoint: endPoint);

      List<dynamic> jsonList = jsonDecode(responseData);
      return CompanyModel.fromJsonList(jsonList);
    } catch (e) {
      _handleException(e);
      return CompanyModel.fromJsonList([]);
    }
  }

  static void _handleException(dynamic e) {
    customLog(e.toString());
    if (e is AppException) {
      ExceptionHandler().parseError(e.message);
    }
  }
}
