import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moneymatter/core/core.dart';
import 'package:moneymatter/src/widgets/date_title_widget.dart';

import 'model/sectorwise_model.dart';
import 'repository/sectorwise_repository.dart';

class SectorWiseSummaryScreen extends ConsumerWidget {
  const SectorWiseSummaryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var apiResponse = ref.watch(fetchSectorwiseSummaryProvider);
    return Scaffold(
      appBar: AppBar(
        title: const DateTitleWidget(title: "Sectorwise Summary"),
      ),
      body: apiResponse.when(
        data: _buildListData,
        error: _buildErrorState,
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }

  Widget _buildListData(List<SectorwiseSummaryModel> data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildListInfo(data[index]);
      },
    ).paddingAll(10.0);
  }

  Widget _buildListInfo(SectorwiseSummaryModel info) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors().kCardColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            info.sectorName,
            style: AppTextStyle().kMenuTextStyle,
          ),
          const Divider(color: Colors.black54),
          _buildTitleValue("Turnover Volumn", "${info.turnOverVolume}"),
          _buildTitleValue("Total Transactions", "${info.totalTransaction}"),
          _buildTitleValue(
            "Turnover Amount",
            "${info.turnOverValues}",
            isBold: true,
          ),
        ],
      ).paddingAll(10.0),
    ).paddingVertical(4.0);
  }

  Widget _buildTitleValue(String title, String value, {bool isBold = false}) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: isBold
                ? AppTextStyle().kMenuTextStyle
                : AppTextStyle().kNormalText,
          ),
        ),
        Expanded(
          child: Text(
            value,
            textAlign: TextAlign.end,
            style: isBold
                ? AppTextStyle().kMenuTextStyle
                : AppTextStyle().kNormalText,
          ),
        ),
      ],
    ).paddingSymmetric(10.0, 4.0);
  }

  Widget _buildErrorState(Object error, StackTrace stackTrace) {
    customLog(stackTrace.toString());
    return Center(child: Text("$error"));
  }
}
