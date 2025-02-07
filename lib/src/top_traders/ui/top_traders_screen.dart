import 'package:flutter/material.dart';
import 'package:moneymatter/src/top/top_losers/ui/widgets/top_loser_widget.dart';
import 'package:moneymatter/src/top_traders/top_traders.dart';
import 'package:moneymatter/src/widgets/date_title_widget.dart';

import '../../top/top.dart';

class TopTradersScreen extends StatefulWidget {
  const TopTradersScreen({super.key});

  @override
  State<TopTradersScreen> createState() => _TopTradersScreenState();
}

class _TopTradersScreenState extends State<TopTradersScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const DateTitleWidget(title: 'Top Traders'),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: const [
            Tab(text: 'Top Gainers'),
            Tab(text: 'Top Losers'),
            Tab(text: 'Top Turnover'),
            Tab(text: 'Top Shares Traded'),
            Tab(text: 'Top Transactions'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          TopGainerWidget(),
          TopLoserWidget(),
          TopTurnoverWidget(),
          TopSharesTradedWidget(),
          TopTransactionWidget(),
        ],
      ),
    );
  }
}
