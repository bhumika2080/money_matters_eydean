import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moneymatter/core/core.dart';
import 'package:moneymatter/src/todays_price/stock_price/ui/widgets/stock_price_navbar.dart';

import '../../todays_price/todays_price.dart';

class StockPriceSection extends ConsumerStatefulWidget {
  const StockPriceSection({super.key});

  @override
  ConsumerState<StockPriceSection> createState() => _StockPriceSectionState();
}

class _StockPriceSectionState extends ConsumerState<StockPriceSection> {
  @override
  Widget build(BuildContext context) {
    final advancedStockPrice = ref.watch(advancedStockPriceList);
    final declinedStockPrice = ref.watch(declinedStockPriceList);
    final unchangedStockPrice = ref.watch(unchangedStockPriceList);
    final positiveCircuitStockPrice = ref.watch(positiveCircuitStockPriceList);
    final negativeCircuitStockPrice = ref.watch(negativeCircuitStockPriceList);

    final response = [
      ...advancedStockPrice,
      ...declinedStockPrice,
      ...unchangedStockPrice,
      ...positiveCircuitStockPrice,
      ...negativeCircuitStockPrice,
    ];

    if (response.isEmpty) {
      return const StockPriceNavigationBar();
    }

    var counts = _calculateCounts(response);
    return StockPriceNavigationBar(
      advancedCount: counts['advanced']!,
      declinedCount: counts['declined']!,
      unchangedCount: counts['unchanged']!,
      positiveCircuitCount: counts['positiveCircuit']!,
      negativeCircuitCount: counts['negativeCircuit']!,
    ).paddingAll(8);
  }

  Map<String, int> _calculateCounts(List<Content> data) {
    int advancedCount = 0;
    int declinedCount = 0;
    int unchangedCount = 0;
    int positiveCircuitCount = 0;
    int negativeCircuitCount = 0;

    for (var trade in data) {
      double previousDayClosePrice = trade.previousDayClosePrice.toDouble();
      double lastUpdatedPrice = trade.lastUpdatedPrice.toDouble();

      double change = lastUpdatedPrice - previousDayClosePrice;
      double changePercentage = (previousDayClosePrice != 0)
          ? (change / previousDayClosePrice) * 100
          : 0.0;

      if (changePercentage >= 10) {
        positiveCircuitCount++;
      } else if (changePercentage <= -10) {
        negativeCircuitCount++;
      }

      if (changePercentage > 0) {
        advancedCount++;
      } else if (changePercentage < 0) {
        declinedCount++;
      } else {
        unchangedCount++;
      }
    }

    return {
      'advanced': advancedCount,
      'declined': declinedCount,
      'unchanged': unchangedCount,
      'positiveCircuit': positiveCircuitCount,
      'negativeCircuit': negativeCircuitCount,
    };
  }
}
