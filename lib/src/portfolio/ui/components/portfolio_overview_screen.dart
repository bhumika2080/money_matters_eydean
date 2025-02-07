import 'package:flutter/material.dart';
import 'package:moneymatter/core/core.dart';
import 'package:moneymatter/src/portfolio/portfolio.dart';
import 'package:moneymatter/src/portfolio/ui/components/summary_container.dart';

class PortfolioOverviewScreen extends StatelessWidget {
  const PortfolioOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SummaryContainer(),
            Divider(
              color: AppColors().black,
            ).paddingVertical(10),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 2,
              itemBuilder: (context, index) => const StockContainer(),
              separatorBuilder: (context, index) => 10.xGap,
            ),
          ],
        ).paddingVertical(10),
      ),
    );
  }
}
