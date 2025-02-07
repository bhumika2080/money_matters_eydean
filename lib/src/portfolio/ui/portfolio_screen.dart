import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';

import 'package:moneymatter/core/constants/screen_constants.dart';
import 'package:moneymatter/core/core.dart';
import 'package:moneymatter/core/themes/colors.dart';
import 'package:moneymatter/core/themes/text_style.dart';
import 'package:moneymatter/src/widgets/custom_text_field.dart';
import 'package:moneymatter/src/widgets/date_title_widget.dart';
import 'package:moneymatter/src/portfolio/portfolio.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  late TextEditingController _searchController;
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: !_isSearching
            ? AppBar(
                title: const DateTitleWidget(title: "User's Portfolio"),
                actions: [
                  IconButton(
                    onPressed: () => _openBottomModal(context),
                    icon: Icon(
                      Ionicons.options,
                      color: AppColors().white,
                    ),
                  ),
                  IconButton(
                    onPressed: () => setState(() {
                      _isSearching = true;
                    }),
                    icon: Icon(
                      Ionicons.search_outline,
                      color: AppColors().white,
                    ),
                  ),
                  _popUpMenu(),
                ],
                bottom: TabBar(
                  indicatorColor: AppColors().white,
                  padding: EdgeInsets.symmetric(horizontal: kScreenWidth * 0.1),
                  tabs: const [
                    Tab(
                      text: "Portfolio Overview",
                    ),
                    Tab(
                      text: "Indicators / Charts",
                    )
                  ],
                ),
              )
            : AppBar(
                leading: IconButton(
                  onPressed: () {
                    setState(() {
                      _isSearching = false;
                      _searchController.clear();
                    });
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                title: CustomTextField(
                  autofocus: true,
                  controller: _searchController,
                  onChanged: (value) {},
                  hintText: 'Search',
                  hintStyle: TextStyle(color: AppColors().white),
                ).paddingSymmetric(16),
                actions: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _isSearching = false;

                        _searchController.clear();
                      });
                    },
                    icon: const Icon(Icons.clear),
                  ),
                ],
              ),
        body: const TabBarView(
          children: [
            PortfolioOverviewScreen(),
            IndicatorsOrChartsScreen(),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            context.push(AppRoute().addStockScreen);
          },
          label: const Text(
            'ADD STOCK',
            style: TextStyle(
              color: Colors.white,
            ),
          ).paddingLeft(10),
          icon: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: AppColors().primaryColor,
        ),
      ),
    );
  }
}

void _openBottomModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    constraints: BoxConstraints(
      maxHeight: kScreenHeight * 0.6,
      maxWidth: double.infinity,
      minWidth: double.infinity,
    ),
    builder: (context) => Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        color: AppColors().white,
      ),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "FILTER BY SECTORS",
                style: AppTextStyle().kTitleText.copyWith(
                      color: AppColors().black,
                      fontSize: 20,
                    ),
              ),
              const SizedBox(
                width: 5,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors().kCardColor,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "CLEAR",
                      style: AppTextStyle()
                          .kButtonText
                          .copyWith(color: AppColors().black),
                    ),
                    Icon(
                      Ionicons.close_outline,
                      color: AppColors().black,
                    ),
                  ],
                ),
              ),
            ],
          ),
          ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) => ListTile(
              title: Text(
                "Finance",
                style: AppTextStyle().kTitleText.copyWith(
                      color: AppColors().black,
                    ),
              ),
              trailing: Checkbox(
                value: true,
                onChanged: (value) {},
                activeColor: AppColors().black,
              ),
            ),
            separatorBuilder: (context, index) => Divider(
              color: AppColors().black,
            ),
            itemCount: 2,
          ),
        ],
      ),
    ),
  );
}

Widget _popUpMenu() {
  return PopupMenuButton(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    itemBuilder: (context) => [
      PopupMenuItem(
        child: GestureDetector(
          onTap: () => context.push(AppRoute().portfolioSettingsScreen),
          child: const Text("Settings"),
        ),
      ),
      PopupMenuItem(
        child: GestureDetector(
          onTap: () => _addPortfolio(
            context,
          ),
          child: const Text("Add Portfolio"),
        ),
      ),
      PopupMenuItem(
        child: GestureDetector(
          onTap: () => _showImportStocksDialog(context),
          child: const Text("Import Stocks"),
        ),
      )
    ],
  );
}

void _addPortfolio(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => const AddPortfolioDialog(),
  );
}

void _showImportStocksDialog(
  BuildContext context,
) {
  showDialog(
    context: context,
    builder: (context) => const ImportStocksDialog(),
  );
}
