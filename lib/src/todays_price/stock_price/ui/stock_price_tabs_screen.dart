import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moneymatter/core/core.dart';

import '../../model/stock_price_model.dart';
import '../../repository/stock_price_repository.dart';

class StockPriceTabsScreen extends ConsumerStatefulWidget {
  final int index;

  const StockPriceTabsScreen({super.key, required this.index});

  @override
  ConsumerState<StockPriceTabsScreen> createState() =>
      _StockPriceTabsScreenState();
}

class _StockPriceTabsScreenState extends ConsumerState<StockPriceTabsScreen> {
  @override
  Widget build(BuildContext context) {
    final response = ref.watch(fetchStockPrice);

    return DefaultTabController(
      initialIndex: widget.index,
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Change Summary'),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'Advanced'),
              Tab(text: 'Declined'),
              Tab(text: 'Unchanged'),
              Tab(text: '+ve Circuit'),
              Tab(text: '-ve Circuit'),
            ],
          ),
        ),
        body: response.when(
          data: (data) => TabBarView(
            children: [
              _buildTable(ref.watch(advancedStockPriceList)),
              _buildTable(ref.watch(declinedStockPriceList)),
              _buildTable(ref.watch(unchangedStockPriceList)),
              _buildTable(ref.watch(positiveCircuitStockPriceList)),
              _buildTable(ref.watch(negativeCircuitStockPriceList)),
            ],
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => _buildErrorState(error, stackTrace),
        ),
      ),
    );
  }

  Widget _buildTable(List<Content> dataList) {
    return Column(
      children: [
        _buildTableHeader(),
        Expanded(child: _buildDataList(dataList)),
      ],
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
          _buildHeaderText("CH%", 2),
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
      rowColor = AppColors().blue;
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
          _buildDataText(formatMoney(change), 2),
          _buildDataText("${changePercentage.toStringAsFixed(2)}%", 2),
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
    customLog(stackTrace.toString());
    return Center(child: Text("Error: $error"));
  }
}
