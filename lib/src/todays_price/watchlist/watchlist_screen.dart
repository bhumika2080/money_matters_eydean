import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:moneymatter/core/core.dart';
import 'package:moneymatter/src/widgets/date_title_widget.dart';
import 'package:moneymatter/src/widgets/widgets.dart';

import '../repository/stock_price_repository.dart';

class WatchlistScreen extends ConsumerWidget {
  const WatchlistScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watchList = ref.watch(watchListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const DateTitleWidget(title: 'Live Watch List'),
      ),
      body: Column(
        children: [
          _buildTableHeader(),
          Expanded(
            child: watchList.isNotEmpty
                ? _buildDataList(watchList, ref)
                : const EmptyWidget(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.push(AppRoute().addStockScreen);
        },
        label: Text(
          'ADD STOCK',
          style: TextStyle(
            color: AppColors().white,
          ),
        ).paddingLeft(10),
        icon: Icon(
          Icons.add,
          color: AppColors().white,
        ),
        backgroundColor: AppColors().primaryColor,
      ),
    );
  }

  Widget _buildTableHeader() {
    return Container(
      decoration: BoxDecoration(color: AppColors().kTableHeaderColor),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
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
        ),
      ),
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

  Widget _buildDataList(List watchList, WidgetRef ref) {
    customLog('Data received: ${watchList.length} items');
    return ListView.builder(
      itemCount: watchList.length,
      itemBuilder: (context, index) {
        final stock = watchList[index];
        var (changePercentage, change) = changeAndChangePercent(stock);
        return Slidable(
          key: ValueKey(stock.symbol),
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (context) => _deleteStock(ref, stock),
                backgroundColor: AppColors().red,
                icon: Icons.delete,
              )
            ],
          ),
          child: Container(
            decoration: BoxDecoration(color: AppColors().kTableColor),
            child: Row(
              children: [
                _buildDataText(" ${stock.symbol}", 2),
                _buildDataText(formatMoney(stock.lastUpdatedPrice), 3),
                _buildDataText(formatMoney(stock.highPrice), 3),
                _buildDataText(formatMoney(stock.lowPrice), 3),
                _buildDataText(change.toStringAsFixed(2), 2),
                _buildDataText("${changePercentage.toStringAsFixed(2)}%", 3),
                _buildDataText(formatMoney(stock.previousDayClosePrice), 3),
              ],
            ).paddingSymmetric(15, 10),
          ),
        );
      },
    );
  }

  Widget _buildDataText(String text, int flex) {
    return Expanded(
      flex: flex,
      child: Text(text,
          style: AppTextStyle().kTableText, textAlign: TextAlign.center),
    );
  }

  void _deleteStock(WidgetRef ref, var stock) {
    ref.read(watchListProvider.notifier).removeItem(stock);
    customLog('Deleted: ${stock.symbol}');
  }
}
