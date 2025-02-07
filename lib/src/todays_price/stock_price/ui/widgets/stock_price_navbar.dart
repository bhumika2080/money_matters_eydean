import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/core.dart';
import 'bottom_navbar_item_widget.dart';

class StockPriceNavigationBar extends StatelessWidget {
  final int advancedCount;
  final int declinedCount;
  final int unchangedCount;
  final int positiveCircuitCount;
  final int negativeCircuitCount;

  const StockPriceNavigationBar({
    super.key,
    this.advancedCount = 0,
    this.declinedCount = 0,
    this.unchangedCount = 0,
    this.positiveCircuitCount = 0,
    this.negativeCircuitCount = 0,
  });

  void _onItemTapped(BuildContext context, int index) {
    context.push('${AppRoute().stockPriceTabsScreen}/$index');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BottomNavItem(
              backgroundColor: AppColors().green,
              text: 'Advanced $advancedCount',
              onTap: () => _onItemTapped(context, 0)),
          BottomNavItem(
              backgroundColor: AppColors().red,
              text: 'Declined $declinedCount',
              onTap: () => _onItemTapped(context, 1)),
          BottomNavItem(
              backgroundColor: AppColors().blue,
              text: 'Unchanged $unchangedCount',
              onTap: () => _onItemTapped(context, 2)),
          BottomNavItem(
              backgroundColor: AppColors().green,
              text: '+ve Circuit $positiveCircuitCount',
              onTap: () => _onItemTapped(context, 3)),
          BottomNavItem(
              backgroundColor: AppColors().red,
              text: '-ve Circuit $negativeCircuitCount',
              onTap: () => _onItemTapped(context, 4)),
        ],
      ),
    );
  }
}
