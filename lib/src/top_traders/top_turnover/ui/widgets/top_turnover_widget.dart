import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moneymatter/core/core.dart';

import '../../model/top_turnover_model.dart';
import '../../repository/top_turnover_repository.dart';

class TopTurnoverWidget extends StatelessWidget {
  const TopTurnoverWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        var response = ref.watch(fetchTopTurnover);
        return Column(
          children: [
            _buildTableHeader(),
            Expanded(
              child: response.when(
                data: (data) => _buildDataList(data, ref),
                error: (error, stackTrace) =>
                    _buildErrorState(error, stackTrace),
                loading: () => const Center(child: CircularProgressIndicator()),
              ),
            ),
            // Expanded(
            //   child: response.isNotEmpty
            //       ? _buildDataList(response, ref)
            //       : const EmptyWidget(),
            // ),
          ],
        );
      },
    );
  }

  Widget _buildTableHeader() {
    return Container(
      decoration: BoxDecoration(color: AppColors().kTableHeaderColor),
      child: Row(
        children: [
          _buildHeaderText("SN", 1),
          _buildHeaderText("SYM", 3),
          _buildHeaderText("TURNOVER", 4),
          _buildHeaderText("LTP", 2),
        ],
      ).paddingSymmetric(10.0, 15.0),
    );
  }

  Widget _buildHeaderText(String text, int flex) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        style: AppTextStyle().kTableHeaderText,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildDataList(List<TopTurnoverModel> data, WidgetRef ref) {
    customLog('Data received: ${data.length} items');
    return RefreshIndicator(
      onRefresh: () => ref.refresh(fetchTopTurnover.future),
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          final trade = data[index];
          return _buildDataRow(trade, index);
        },
      ),
    );
  }

  Widget _buildDataRow(TopTurnoverModel trade, int index) {
    return Container(
      decoration: BoxDecoration(
        color: index % 2 == 0 ? AppColors().kTableColor : AppColors().white,
      ),
      child: Row(
        children: [
          _buildDataText("${index + 1}", 1),
          _buildDataText(trade.symbol, 3),
          _buildDataText("${trade.turnover}", 4),
          _buildDataText("${trade.closingPrice}", 2),
        ],
      ).paddingSymmetric(10.0, 15.0),
    );
  }

  Widget _buildDataText(String text, int flex) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        style: AppTextStyle().kTableText,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildErrorState(Object error, StackTrace stackTrace) {
    customLog(stackTrace.toString());
    return Center(child: Text("$error"));
  }
}
