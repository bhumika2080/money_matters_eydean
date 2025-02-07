import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:moneymatter/core/core.dart';
import 'package:moneymatter/src/widgets/menu_widget.dart';

import '../widgets/menu_header_widget.dart';
import 'menu_list.dart';
import 'model/menu_model.dart';

final menuViewProvider = StateProvider<bool>((ref) => true);

class MoreServiceScreen extends StatelessWidget {
  const MoreServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final isGridview = ref.watch(menuViewProvider);
        return Scaffold(
          appBar: AppBar(
            title: const Text("More Services"),
            actions: [
              IconButton(
                onPressed: () {
                  ref.read(menuViewProvider.notifier).update((state) => !state);
                },
                icon: Icon(isGridview ? Icons.list : Icons.grid_view_outlined),
              ),
              IconButton(
                onPressed: () {
                  context.push(AppRoute().searchMoreService);
                },
                icon: const Icon(Icons.search),
              ),
              IconButton(
                onPressed: () => context.push(AppRoute().companyListScreen),
                icon: const Icon(Icons.home),
              ),
            ],
          ),
          body: GroupedListView<MenuCategoryModel, String>(
            elements: moreServiceMenuList,
            groupBy: (element) => element.category,
            groupComparator: _groupComparator,
            groupSeparatorBuilder: _groupSeparatorBuilder,
            itemBuilder: (context, element) {
              return _buildMenuItems(element, isGridview);
            },
          ),
        );
      },
    );
  }

  int _groupComparator(String value1, String value2) {
    const filterOrder = [
      'Your Info Section',
      'Premium Section',
      'NEPSE Section',
      'News And Investment Section',
      'Stock Information Section',
      'Market Tools Section',
      'Other Information Section',
      'Share Hub Exclusive Section',
    ];
    return filterOrder.indexOf(value1).compareTo(filterOrder.indexOf(value2));
  }

  Widget _groupSeparatorBuilder(String groupByValue) {
    return MenuHeaderWidget(title: groupByValue).paddingSymmetric(0, 20.0);
  }

  Widget _buildMenuItems(MenuCategoryModel element, bool isGridview) {
    return isGridview
        ? Center(
            child: Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            children: element.menus.map((menu) {
              return GridMenuWidget(
                modelInfo: menu,
                checkPremium: element.category == "Premium Section",
              );
            }).toList(),
          ))
        : Column(
            children: element.menus.map((menu) {
            return ListMenuWidget(modelInfo: menu).paddingSymmetric(10.0, 4.0);
          }).toList());
  }
}
