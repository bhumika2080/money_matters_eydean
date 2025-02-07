import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moneymatter/core/constants/screen_constants.dart';
import 'package:moneymatter/core/core.dart';
import 'package:moneymatter/shared_provider/shared_state_provider.dart';
import 'package:moneymatter/src/datewise_market_summary/provider/datewise_market_summary_provider.dart';
import 'package:moneymatter/src/widgets/widgets.dart';

import '../model/datewise_market_summary_model.dart';

class DatewiseMarketSummaryScreen extends ConsumerWidget {
  const DatewiseMarketSummaryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final datewiseMarketSummary = ref.watch(dateWiseMarketSummaryProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Datewise Market Summary"),
        actions: [
          IconButton(
            onPressed: () => _datePickerWidget(context),
            icon: Icon(
              Icons.calendar_month,
              color: AppColors().white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const ClampingScrollPhysics(),
        child: SizedBox(
          width: kScreenWidth * 1.475,
          child: Column(
            children: [
              SizedBox(
                height: 45,
                child: _buildTableHeader(ref),
              ),
              datewiseMarketSummary.when(
                data: (data) {
                  final bool isAscending = ref.watch(sharedStateProvider);
                  late final List<DatewiseMarketSummaryModel> sortedList;
                  if (data.isNotEmpty) {
                    sortedList = List<DatewiseMarketSummaryModel>.from(data);
                    if (isAscending) {
                      sortedList.sort(
                          (a, b) => a.businessDate.compareTo(b.businessDate));
                    } else {
                      sortedList.sort(
                          (a, b) => b.businessDate.compareTo(a.businessDate));
                    }
                  }
                  return Expanded(
                    child: data.isNotEmpty
                        ? _buildDataList(sortedList, ref)
                        : const EmptyWidget(),
                  );
                },
                error: (error, stackTrace) => ErrorWidget(error),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildTableHeader(WidgetRef ref) {
  return Container(
    decoration: BoxDecoration(color: AppColors().kTableHeaderColor),
    alignment: Alignment.center,
    child: ListView(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _buildHeaderText("Date", kScreenWidth * 0.2, ref),
        _buildHeaderText("Turnover", kScreenWidth * 0.3, ref),
        _buildHeaderText("Traded Shares", kScreenWidth * 0.325, ref),
        _buildHeaderText("Transactions", kScreenWidth * 0.325, ref),
        _buildHeaderText("Traded Scripts", kScreenWidth * 0.325, ref),
      ],
    ).paddingSymmetric(10, 15),
  );
}

Widget _buildHeaderText(String text, double size, WidgetRef ref) {
  final isAscending = ref.watch(sharedStateProvider);
  return text.toUpperCase() != "DATE"
      ? SizedBox(
          width: size,
          child: Text(
            text,
            style: AppTextStyle().kTableHeaderText,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        )
      : SizedBox(
          width: size,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                text,
                style: AppTextStyle().kTableHeaderText,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                width: 8,
              ),
              InkWell(
                onTap: ref.read(sharedStateProvider.notifier).changeAscending,
                child: Icon(
                  isAscending ? Icons.arrow_upward : Icons.arrow_downward,
                  color: AppColors().white,
                  size: 14,
                ),
              )
            ],
          ),
        );
}

Widget _buildDataList(List<DatewiseMarketSummaryModel> data, WidgetRef ref) {
  customLog('Data received: ${data.length} items');

  return RefreshIndicator(
    child: ListView.builder(
      itemCount: data.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => _buildDataRow(data[index], index),
    ),
    onRefresh: () => ref.refresh(dateWiseMarketSummaryProvider.future),
  );
}

Widget _buildDataRow(DatewiseMarketSummaryModel marketSummary, int index) =>
    Container(
      height: 45,
      decoration: BoxDecoration(
        color: index % 2 == 0 ? AppColors().kTableColor : AppColors().white,
      ),
      alignment: Alignment.center,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _buildDataText(
            // marketSummary.businessDate.toString(),
            formatDate(marketSummary.businessDate),
            kScreenWidth * 0.2,
          ),
          _buildDataText(
            formatMoney(marketSummary.totalTurnover),
            kScreenWidth * 0.3,
          ),
          _buildDataText(
            formatMoney(marketSummary.totalTradedShares.toDouble()),
            kScreenWidth * 0.3,
          ),
          _buildDataText(
            formatMoney(marketSummary.totalTransactions.toDouble()),
            kScreenWidth * 0.3,
          ),
          _buildDataText(
            formatMoney(marketSummary.tradedScrips.toDouble()),
            kScreenWidth * 0.3,
          ),
        ],
      ),
    );

Widget _buildDataText(String text, double size) => Center(
      child: SizedBox(
        width: size,
        child: Text(
          text,
          style: AppTextStyle().kTableText,
          textAlign: TextAlign.center,
        ),
      ),
    );

void _datePickerWidget(BuildContext context) async {
  final today = DateTime.now();
  final selectedDate = await showDatePicker(
    context: context,
    firstDate: DateTime(today.year - 1),
    lastDate: today,
    initialDate: today,
  );
  print("%%%%%%%%%%%%");
  print(selectedDate.toString());
}
