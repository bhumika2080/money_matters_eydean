import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widgets/top_gainer_widget.dart';

class TopGainerScreen extends StatelessWidget {
  const TopGainerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        // var response = ref.watch(topGainerData);

        return Scaffold(
          appBar: AppBar(title: const Text('Top Gainer')),
          body: const TopGainerWidget(),
          //         body: Column(
          //           children: [
          //             _buildTableHeader(),
          //             // Expanded(
          //             //   child: response.when(
          //             //     data: (data) => _buildDataList(data, ref),
          //             //     error: _buildErrorState,
          //             //     loading: () =>
          //             //         const Center(child: CircularProgressIndicator()),
          //             //   ),
          //             // ),
          //             Expanded(
          //               child: response.isNotEmpty
          //                   ? _buildDataList(response, ref)
          //                   : const EmptyWidget(),
          //             ),
          //           ],
          //         ),
        );
      },
    );
  }

  // Widget _buildTableHeader() {
  //   return Container(
  //     decoration: BoxDecoration(color: AppColors().kTableHeaderColor),
  //     child: Row(
  //       children: [
  //         _buildHeaderText("SN", 1),
  //         _buildHeaderText("SYM", 3),
  //         _buildHeaderText("CH", 2),
  //         _buildHeaderText("CH%", 2),
  //         _buildHeaderText("LTP", 2),
  //       ],
  //     ).paddingSymmetric(10.0, 15.0),
  //   );
  // }

  // Widget _buildHeaderText(String text, int flex) {
  //   return Expanded(
  //     flex: flex,
  //     child: Text(
  //       text,
  //       style: AppTextStyle().kTableHeaderText,
  //       textAlign: TextAlign.center,
  //     ),
  //   );
  // }

  // Widget _buildDataList(List<TopModel> data, WidgetRef ref) {
  //   customLog('Data received: ${data.length} items');
  //   return RefreshIndicator(
  //     onRefresh: () => ref.refresh(fetchTopGainer.future),
  //     child: ListView.builder(
  //       itemCount: data.length,
  //       itemBuilder: (context, index) {
  //         final trade = data[index];
  //         return _buildDataRow(trade, index);
  //       },
  //     ),
  //   );
  // }

  // Widget _buildDataRow(TopModel trade, int index) {
  //   return Container(
  //     decoration: BoxDecoration(
  //       color: index % 2 == 0 ? AppColors().kTableColor : AppColors().white,
  //     ),
  //     child: Row(
  //       children: [
  //         _buildDataText("${index + 1}", 1),
  //         _buildDataText(trade.symbol, 3),
  //         _buildDataText("${trade.pointChange}", 2),
  //         _buildDataText("${trade.percentageChange}", 2),
  //         _buildDataText("${trade.ltp}", 2),
  //       ],
  //     ).paddingSymmetric(10.0, 15.0),
  //   );
  // }

  // Widget _buildDataText(String text, int flex) {
  //   return Expanded(
  //     flex: flex,
  //     child: Text(
  //       text,
  //       style: AppTextStyle().kTableText,
  //       textAlign: TextAlign.center,
  //     ),
  //   );
  // }

  // // Widget _buildErrorState(Object error, StackTrace stackTrace) {
  // //   customLog(stackTrace.toString());
  // //   return Center(child: Text("$error"));
  // // }
}
