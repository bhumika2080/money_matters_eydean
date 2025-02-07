import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:moneymatter/core/core.dart';
import 'package:moneymatter/src/portfolio/portfolio.dart';

class PortfolioSettingsScreen extends StatefulWidget {
  const PortfolioSettingsScreen({super.key});

  @override
  State<PortfolioSettingsScreen> createState() =>
      _PortfolioSettingsScreenState();
}

class _PortfolioSettingsScreenState extends State<PortfolioSettingsScreen> {
  bool _hideLiquidatedStocks = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Portfolio Settings"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Hide Liquidated Stocks",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Checkbox(
                activeColor: AppColors().black,
                value: _hideLiquidatedStocks,
                onChanged: (value) =>
                    setState(() => _hideLiquidatedStocks = value!),
              )
            ],
          ).paddingSymmetric(10),
          PortfolioSettingsContainer(
            icon: Ionicons.person_circle_outline,
            title: "Portfolio Type",
            subTitle: "INDIVIDUAL",
            onPressed: () {},
          ),
          15.xGap,
          PortfolioSettingsContainer(
            icon: Ionicons.refresh_outline,
            title: "Sync Profile",
            subTitle: "Sync User's to latest values",
            onPressed: () {},
          ),
          15.xGap,
          PortfolioSettingsContainer(
            icon: Ionicons.trash_sharp,
            title: "Reset Portfolio",
            subTitle: "All portfolio data will be deleted",
            onPressed: () {},
            isDelete: true,
          ),
        ],
      ).paddingSymmetric(10, 20),
    );
  }
}
