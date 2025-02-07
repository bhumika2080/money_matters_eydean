import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moneymatter/core/core.dart';
import 'package:moneymatter/src/widgets/date_title_widget.dart';
import 'package:moneymatter/src/widgets/widgets.dart';

import '../../model/stock_price_model.dart';
import '../../repository/stock_price_repository.dart';
import 'widgets/stock_price_navbar.dart';

class StockPriceScreen extends ConsumerStatefulWidget {
  const StockPriceScreen({super.key});

  @override
  ConsumerState<StockPriceScreen> createState() => _StockPriceScreenState();
}

class _StockPriceScreenState extends ConsumerState<StockPriceScreen> {
  String _searchQuery = '';
  late TextEditingController _searchController;
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var response = ref.watch(fetchStockPrice);
    return Scaffold(
      appBar: _isSearching
          ? AppBar(
              leading: IconButton(
                onPressed: () {
                  setState(() {
                    _isSearching = false;
                    _searchQuery = '';
                    _searchController.clear();
                  });
                },
                icon: const Icon(Icons.arrow_back),
              ),
              title: CustomTextField(
                autofocus: true,
                controller: _searchController,
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value.replaceAll(' ', '');
                  });
                },
                hintText: 'Search',
                hintStyle: TextStyle(color: AppColors().white),
              ).paddingSymmetric(16),
              actions: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      _isSearching = false;
                      _searchQuery = '';
                      _searchController.clear();
                    });
                  },
                  icon: const Icon(Icons.clear),
                ),
              ],
            )
          : AppBar(
              actions: [
                IconButton(
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      firstDate: DateTime(2000),
                      lastDate: DateTime.now(),
                    );
                  },
                  icon: const Icon(Icons.calendar_today),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.filter_alt_rounded),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _isSearching = true;
                    });
                  },
                  icon: const Icon(Icons.search),
                ),
              ],
              title: const DateTitleWidget(title: 'Stock Price'),
            ),
      bottomNavigationBar: response.when(
        data: (data) {
          var counts = _calculateCounts(data);
          return StockPriceNavigationBar(
            advancedCount: counts['advanced']!,
            declinedCount: counts['declined']!,
            unchangedCount: counts['unchanged']!,
            positiveCircuitCount: counts['positiveCircuit']!,
            negativeCircuitCount: counts['negativeCircuit']!,
          );
        },
        error: (error, stackTrace) => const StockPriceNavigationBar(),
        loading: () => const StockPriceNavigationBar(),
      ),
      body: Column(
        children: [
          _buildTableHeader(),
          Expanded(
            child: response.when(
              data: (data) => _buildDataList(data
                  .where((trade) => trade.symbol
                      .replaceAll(' ', '')
                      .toLowerCase()
                      .contains(_searchQuery.toLowerCase()))
                  .toList()),
              error: (error, stackTrace) => _buildErrorState(error, stackTrace),
              loading: () => const Center(child: CircularProgressIndicator()),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTableHeader() {
    return Container(
      decoration: BoxDecoration(color: AppColors().kTableHeaderColor),
      child: Row(
        children: [
          _buildHeaderText("SYM", 2),
          _buildHeaderText("LTP", 3),
          _buildHeaderText("HIGH", 3),
          _buildHeaderText("LOW", 3),
          _buildHeaderText("CH", 2),
          _buildHeaderText("CH%", 3),
          _buildHeaderText("PCLOSE", 3),
        ],
      ).paddingSymmetric(10.0, 15.0),
    );
  }

  Widget _buildHeaderText(String text, int flex) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildDataList(List<Content> data) {
    customLog('Data received: ${data.length} items');
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        final trade = data[index];
        return _buildDataRow(trade, index);
      },
    );
  }

  Widget _buildDataRow(Content trade, int index) {
    var (changePercentage, change) = changeAndChangePercent(trade);

    Color rowColor;
    if (changePercentage > 0) {
      rowColor = AppColors().green;
    } else if (changePercentage < 0) {
      rowColor = AppColors().red;
    } else {
      rowColor = AppColors().kLinkColor;
    }

    return Container(
      decoration: BoxDecoration(
        color: rowColor,
      ),
      child: Row(
        children: [
          _buildDataText(trade.symbol, 2),
          _buildDataText(formatMoney(trade.lastUpdatedPrice), 3),
          _buildDataText(formatMoney(trade.highPrice), 3),
          _buildDataText(formatMoney(trade.lowPrice), 3),
          _buildDataText(change.toStringAsFixed(2), 2),
          _buildDataText("${(changePercentage.toStringAsFixed(2))}%", 3),
          _buildDataText(formatMoney(trade.previousDayClosePrice), 3),
        ],
      ).paddingSymmetric(10.0, 15.0),
    );
  }

  Widget _buildDataText(String text, int flex) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildErrorState(Object error, StackTrace stackTrace) {
    customLog(stackTrace as String);
    return Center(child: Text("Error: $error"));
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

      if (changePercentage >= 10.00) {
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
