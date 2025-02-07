import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moneymatter/core/constants/screen_constants.dart';
import 'package:moneymatter/core/core.dart';
import 'package:moneymatter/src/datewise_market_cap/repository/datewise_market_cap_repository.dart';
import 'package:moneymatter/src/widgets/widgets.dart';

import '../../../shared_provider/shared_state_provider.dart';
import '../model/datewise_market_cap_model.dart';

class DatewiseMarketCapScreen extends StatefulWidget {
  const DatewiseMarketCapScreen({super.key});

  @override
  State<DatewiseMarketCapScreen> createState() =>
      _DatewiseMarketCapScreenState();
}

class _DatewiseMarketCapScreenState extends State<DatewiseMarketCapScreen> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final datewiseMarketCapValue = ref.watch(fetchDatewiseMarketCap);
        return Scaffold(
          appBar: AppBar(
            title: const Text('Datewise Market Cap'),
            actions: [
              IconButton(
                onPressed: () async {
                  var selected = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2020),
                    lastDate: DateTime.now(),
                  );
                  if (selected != null) {
                    setState(() {
                      selectedDate = selected;
                    });
                  }
                },
                icon: const Icon(Icons.calendar_today),
              ),
            ],
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const ClampingScrollPhysics(),
            child: SizedBox(
              width: kScreenWidth * 1.55,
              child: Column(
                children: [
                  SizedBox(height: 45, child: _buildTableHeader(ref)),
                  Expanded(
                    child: datewiseMarketCapValue.when(
                      data: (response) {
                        final bool isAscending = ref.watch(sharedStateProvider);
                        List<DatewiseMarketCapModel>
                            sortedDatewiseMarketCapList = [];

                        if (response.isNotEmpty) {
                          sortedDatewiseMarketCapList =
                              List<DatewiseMarketCapModel>.from(response);

                          if (isAscending) {
                            sortedDatewiseMarketCapList.sort((a, b) =>
                                a.businessDate!.compareTo(b.businessDate!));
                          } else {
                            sortedDatewiseMarketCapList.sort((a, b) =>
                                b.businessDate!.compareTo(a.businessDate!));
                          }

                          if (selectedDate != null) {
                            sortedDatewiseMarketCapList =
                                sortedDatewiseMarketCapList
                                    .where((item) =>
                                        item.businessDate == selectedDate)
                                    .toList();
                          }
                        }

                        return sortedDatewiseMarketCapList.isNotEmpty
                            ? _buildDataList(sortedDatewiseMarketCapList, ref)
                            : const EmptyWidget();
                      },
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      error: (error, stackTrace) =>
                          Center(child: Text('Error: $error')),
                    ),
                  ),
                  if (selectedDate != null)
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedDate = null;
                        });
                      },
                      child: const Text('Clear Date'),
                    ),
                  if (selectedDate != null)
                    const Expanded(child: SizedBox.expand()),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTableHeader(WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(color: AppColors().kTableHeaderColor),
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          _buildHeaderText("DATE", kScreenWidth * 0.3, ref),
          _buildHeaderText("Mar. Cap", kScreenWidth * 0.3, ref),
          _buildHeaderText("Sen. Mar. Cap", kScreenWidth * 0.3, ref),
          _buildHeaderText("Float Mar. Cap", kScreenWidth * 0.3, ref),
          _buildHeaderText("Sen. Float Mar. Cap", kScreenWidth * 0.31, ref),
        ],
      ).paddingSymmetric(10.0, 15.0),
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
        : InkWell(
            onTap: ref.read(sharedStateProvider.notifier).changeAscending,
            child: SizedBox(
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
                  Icon(
                    isAscending ? Icons.arrow_upward : Icons.arrow_downward,
                    color: AppColors().white,
                    size: 14,
                  )
                ],
              ),
            ),
          );
  }

  Widget _buildDataList(List<DatewiseMarketCapModel> data, WidgetRef ref) {
    customLog('Data received: ${data.length} items');
    return RefreshIndicator(
      onRefresh: () => ref.refresh(fetchDatewiseMarketCap.future),
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          final trade = data[index];
          return _buildDataRow(trade, index);
        },
      ),
    );
  }

  Widget _buildDataRow(DatewiseMarketCapModel trade, int index) {
    return Container(
      decoration: BoxDecoration(
        color: index % 2 == 0 ? AppColors().kTableColor : AppColors().white,
      ),
      child: Row(
        children: [
          _buildDataText(formatDate(trade.businessDate!), kScreenWidth * 0.3),
          _buildDataText(formatMoney(trade.marCap), kScreenWidth * 0.3),
          _buildDataText(formatMoney(trade.senMarCap), kScreenWidth * 0.3),
          _buildDataText(formatMoney(trade.floatMarCap), kScreenWidth * 0.3),
          _buildDataText(formatMoney(trade.senFloatMarCap), kScreenWidth * 0.3),
        ],
      ).paddingSymmetric(10.0, 15.0),
    );
  }

  Widget _buildDataText(String text, double width) {
    return SizedBox(
      width: width,
      child: Text(
        text,
        style: AppTextStyle().kTableText,
        textAlign: TextAlign.center,
      ),
    );
  }
}
