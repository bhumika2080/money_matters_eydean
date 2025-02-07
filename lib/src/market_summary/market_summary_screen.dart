import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moneymatter/core/core.dart';

import 'model/market_summary_model.dart';
import 'repository/market_summary_repository.dart';

class MarketSummary extends ConsumerWidget {
  const MarketSummary({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.watch(fetchMarketSummary);
    final data = ref.watch(marketSummaryResponseData);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: AppColors().kBorderColor),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "MARKET SUMMARY",
            style: AppTextStyle().kTitleText.copyWith(fontSize: 16.0),
          ).paddingVertical(5.0),
          Flexible(child: _buildDataList(data)),
        ],
      ),
    ).paddingAll(10.0);
  }

  Widget _buildDataList(List<MarketSummaryModel> data) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: data.length,
      itemBuilder: (context, index) {
        return _buildInfo(
          data[index].detail,
          "${data[index].value}",
        );
      },
    ).paddingAll(10.0);
  }

  Widget _buildInfo(String title, String desc) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            style: AppTextStyle().kSubTitleText.copyWith(
                  fontSize: 14.0,
                  color: Colors.black,
                  letterSpacing: .4,
                ),
          ),
        ),
        Expanded(
          child: Text(
            desc.formatNumber(),
            style: AppTextStyle().kNormalText,
            textAlign: TextAlign.end,
          ),
        ),
      ],
    ).paddingVertical(5.0);
  }
}
