import 'package:flutter/material.dart';
import 'package:moneymatter/core/core.dart';
import 'package:moneymatter/src/portfolio/portfolio.dart';
import 'package:moneymatter/src/portfolio/ui/components/summary_container.dart';

class StockContainer extends StatelessWidget {
  const StockContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return DoubleColoredContainer(
      firstContainerChild: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "000011",
            style: AppTextStyle().kTitleText.copyWith(
                  color: AppColors().black,
                ),
          ),
          _buildHeader("LTP", "0"),
          _buildHeader("CH", "+0.00"),
          _buildHeader("CH%", "0.00%"),
        ],
      ).paddingSymmetric(10),
      firstContainerColor: AppColors().kTableHeaderColor,
      secondContainerChild: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...textField("Current Units", "160"),
                  20.xGap,
                  ...textField("WACC", "Rs 0"),
                  20.xGap,
                  ...textField(
                    "Current Value",
                    "Rs 600",
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...textField("Sold Units", "0"),
                  20.xGap,
                  ...textField("Sold Value", "Rs 0"),
                  20.xGap,
                  ...textField("Dividend", "Rs 50%"),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...textField("Investment", "Rs 2,600"),
                  20.xGap,
                  ...textField("Estimated Loss", "Rs -35", true),
                  20.xGap,
                  ...textField("Today's Gain", "Rs 50", false),
                ],
              ),
            ],
          ),
          Divider(
            color: AppColors().black,
          ).paddingVertical(5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  horizontalText("Current Investment", "Rs 2,600"),
                  10.xGap,
                  horizontalText("Real Gain", "Rs 2,600", true),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  horizontalText("Loss", "20 %"),
                  10.xGap,
                  horizontalText("Unreal Loss", "Rs -2,600", true),
                ],
              ),
            ],
          ),
          10.xGap,
          horizontalText("Receivable Amount", "Rs 2,600"),
        ],
      ),
      secondContainerColor: AppColors().kCardColor,
    );
  }
}

Widget _buildHeader(String text, String value) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        "$text :",
        style: AppTextStyle().kNormalText,
      ),
      5.yGap,
      Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: AppColors().blue,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          value,
          style: AppTextStyle().kTitleText.copyWith(color: AppColors().white),
        ),
      ),
    ],
  );
}
