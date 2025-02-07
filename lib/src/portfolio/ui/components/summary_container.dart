import 'package:flutter/material.dart';
import 'package:moneymatter/core/core.dart';
import 'package:moneymatter/src/portfolio/portfolio.dart';

class SummaryContainer extends StatelessWidget {
  const SummaryContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return DoubleColoredContainer(
      firstContainerChild: Text(
        "SUMMARY",
        style: AppTextStyle().kTitleText.copyWith(
              color: AppColors().black,
            ),
      ),
      firstContainerColor: AppColors().orange.withOpacity(0.7),
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
                  ...textField("Current Value", "Rs 0"),
                  20.xGap,
                  ...textField("Estimate Loss", "Rs -2,600", true),
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
                  ...textField("Loss Per.", "Rs -50%", true),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...textField("Investment", "Rs 2,600"),
                  20.xGap,
                  ...textField("Dividend", "Rs 0"),
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
          horizontalText("Recv. Amount", "Rs 2,600"),
        ],
      ),
      secondContainerColor: AppColors().orange.withOpacity(0.2),
    );
  }
}

List<Widget> textField(String text, String value, [bool? loss]) {
  return [
    Text(
      text,
      style: AppTextStyle().kNormalText,
    ),
    5.xGap,
    Text(
      value,
      style: AppTextStyle().kTitleText.copyWith(
            color: loss == null
                ? AppColors().black
                : loss
                    ? AppColors().red
                    : AppColors().blue,
          ),
    )
  ];
}

Widget horizontalText(String text, String value, [bool? loss]) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        "$text : ",
        style: AppTextStyle().kNormalText,
      ),
      Text(
        value,
        style: AppTextStyle().kTitleText.copyWith(
              color: loss == null
                  ? AppColors().black
                  : loss
                      ? AppColors().red
                      : AppColors().blue,
            ),
      )
    ],
  );
}
