import 'package:flutter/material.dart';
import 'package:moneymatter/core/core.dart';
import 'package:moneymatter/src/company_detail/components/screens/announcements_screen.dart';
import 'package:moneymatter/src/company_detail/components/screens/broker_analyss_screen.dart';
import 'package:moneymatter/src/company_detail/components/screens/company_floor_sheet_screen.dart';
import 'package:moneymatter/src/company_detail/components/screens/company_news_screen.dart';
import 'package:moneymatter/src/company_detail/components/screens/compare_stocks_screen.dart';
import 'package:moneymatter/src/company_detail/components/screens/dividends_screen.dart';
import 'package:moneymatter/src/company_detail/components/screens/financial_reports_screen.dart';
import 'package:moneymatter/src/company_detail/components/screens/fundamentals_screen.dart';
import 'package:moneymatter/src/company_detail/components/screens/market_depth_screen.dart';
import 'package:moneymatter/src/company_detail/components/screens/price_history_screen.dart';
import 'package:moneymatter/src/company_detail/components/screens/right_share_screen.dart';
import 'package:moneymatter/src/company_detail/components/screens/stock_information_screen.dart';

class CompanyDetailScreen extends StatelessWidget {
  const CompanyDetailScreen({super.key});

  final List<String> tabs = const [
    "Stock Information",
    "Market Depth",
    "Floor Sheet",
    "Broker Analysis",
    "Price History",
    "Fundamentals",
    "Compare Stocks",
    "Dividends",
    "Right Share",
    "Financial Reports",
    "Company News",
    "Announcements",
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 12,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Company Detail"),
          actions: [
            Align(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors().kCardColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Remove Ads",
                    style: AppTextStyle().kButtonText,
                  ),
                ),
              ),
            ).paddingRight(10),
          ],
          bottom: TabBar(
            isScrollable: true,
            tabs: tabs
                .map(
                  (tab) => Tab(
                    text: tab,
                  ),
                )
                .toList(),
          ),
        ),
        body: const TabBarView(
          children: [
            StockInformationScreen(),
            MarketDepthScreen(),
            CompanyFloorSheetScreen(),
            BrokerAnalyssScreen(),
            PriceHistoryScreen(),
            FundamentalsScreen(),
            CompareStocksScreen(),
            DividendsScreen(),
            RightShareScreen(),
            FinancialReportsScreen(),
            CompanyNewsScreen(),
            AnnouncementsScreen()
          ],
        ),
      ),
    );
  }
}
