import 'dart:convert';

import 'package:riverpod/riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/core.dart';
import '../model/stock_price_model.dart';

final unchangedStockPriceList = StateProvider<List<Content>>((ref) {
  return [];
});

final advancedStockPriceList = StateProvider<List<Content>>((ref) {
  return [];
});

final declinedStockPriceList = StateProvider<List<Content>>((ref) {
  return [];
});

final positiveCircuitStockPriceList = StateProvider<List<Content>>((ref) {
  return [];
});

final negativeCircuitStockPriceList = StateProvider<List<Content>>((ref) {
  return [];
});

final fetchStockPrice = FutureProvider.autoDispose<List<Content>>((ref) async {
  var response = await StockPriceRepository.getDataFromRemote();
  List<Content> advancedStockPrice = [];
  List<Content> declinedStockPrice = [];
  List<Content> unchangedStockPrice = [];
  List<Content> positiveCircuitStockPrice = [];
  List<Content> negativeCircuitStockPrice = [];

  for (var element in response) {
    var (changePercentage, _) = changeAndChangePercent(element);
    if (changePercentage >= 10.00) {
      positiveCircuitStockPrice.add(element);
    } else if (changePercentage <= -10.00) {
      negativeCircuitStockPrice.add(element);
    } else if (changePercentage > 0) {
      advancedStockPrice.add(element);
    } else if (changePercentage < 0) {
      declinedStockPrice.add(element);
    } else {
      unchangedStockPrice.add(element);
    }
  }

  ref.watch(advancedStockPriceList.notifier).state = advancedStockPrice;
  ref.watch(declinedStockPriceList.notifier).state = declinedStockPrice;
  ref.watch(unchangedStockPriceList.notifier).state = unchangedStockPrice;
  ref.watch(positiveCircuitStockPriceList.notifier).state =
      positiveCircuitStockPrice;
  ref.watch(negativeCircuitStockPriceList.notifier).state =
      negativeCircuitStockPrice;

  return response;
});

(double, double) changeAndChangePercent(Content trade) {
  double previousDayClosePrice = trade.previousDayClosePrice.toDouble();
  double lastUpdatedPrice = trade.lastUpdatedPrice.toDouble();
  double change = lastUpdatedPrice - previousDayClosePrice;
  double changePercentage = (previousDayClosePrice != 0)
      ? (change / previousDayClosePrice) * 100
      : 0.0;
  return (changePercentage, change);
}

class StockPriceRepository {
  static Future<List<Content>> getDataFromRemote() async {
    final endPoint = APIInfo().stockPrice;
    try {
      final responseData = await APIProvider.getAPI(endPoint: endPoint);
      customLog("responseData: $responseData");
      final jsonMap = jsonDecode(responseData);
      final jsonList = jsonMap["content"];
      if (jsonList != null && jsonList is List<dynamic>) {
        return Content.fromJsonList(jsonList);
      } else {
        return Content.fromJsonList([]);
      }
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

// class WatchListNotifier extends StateNotifier<List<Content>> {
//   WatchListNotifier() : super([]);

//   void addItem(Content item) {
//     state = [...state, item];
//   }

//   void removeItem(Content item) {
//     state = state.where((element) => element.symbol != item.symbol).toList();
//   }
// }


class WatchListNotifier extends StateNotifier<List<Content>> {
  WatchListNotifier() : super([]) {
    _loadWatchList();
  }

  static const String _watchListKey = 'watchList';

  void addItem(Content item) {
    // state = [...state, item];
    // _saveWatchList();
    if (!state.any((element) => element.symbol == item.symbol)) {
      state = [...state, item];
      _saveWatchList();
    } else {
      customLog('Item already exists in the watchlist: ${item.symbol}');
    }
  }

  void removeItem(Content item) {
    state = state.where((element) => element.symbol != item.symbol).toList();
    _saveWatchList();
  }

  Future<void> _saveWatchList() async {
    final prefs = await SharedPreferences.getInstance();
    final watchListJson =
        jsonEncode(state.map((item) => item.toJson()).toList());
    await prefs.setString(_watchListKey, watchListJson);
  }

  Future<void> _loadWatchList() async {
    final prefs = await SharedPreferences.getInstance();
    final watchListJson = prefs.getString(_watchListKey);
    if (watchListJson != null) {
      final List<dynamic> jsonList = jsonDecode(watchListJson);
      final List<Content> watchList =
          jsonList.map((json) => Content.fromJson(json)).toList();
      state = watchList;
    }
  }
}

final watchListProvider =
    StateNotifierProvider<WatchListNotifier, List<Content>>((ref) {
  return WatchListNotifier();
});
