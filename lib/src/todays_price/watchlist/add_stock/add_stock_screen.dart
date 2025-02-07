import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:moneymatter/core/core.dart';
import 'package:moneymatter/core/extension/snackbar_ext.dart';
import 'package:moneymatter/src/todays_price/repository/stock_price_repository.dart';
import 'package:moneymatter/src/todays_price/model/stock_price_model.dart';

class AddStockScreen extends StatefulWidget {
  const AddStockScreen({super.key});

  @override
  State<AddStockScreen> createState() => _AddStockScreenState();
}

class _AddStockScreenState extends State<AddStockScreen> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        var response = ref.watch(fetchStockPrice);
        return Scaffold(
          appBar: AppBar(
            title: const Text("Select Stock"),
            actions: [
              IconButton(
                onPressed: () => ref.refresh(fetchStockPrice),
                icon: Icon(
                  Icons.refresh,
                  color: AppColors().white,
                ),
              )
            ],
          ),
          body: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: AppColors().white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: TextFormField(
                  controller: _searchController,
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColors().primaryColor,
                      size: 20,
                    ),
                    hintText: 'Search Stock ....',
                    hintStyle: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                    ),
                  ),
                ),
              ).paddingSymmetric(20, 12),
              Expanded(
                child: response.when(
                  data: (data) => _buildDataList(ref, data),
                  error: _buildErrorState,
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDataList(WidgetRef ref, List<Content> data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        final trade = data[index];
        return _buildDataRow(ref, trade, index);
      },
    );
  }

  Widget _buildDataRow(WidgetRef ref, Content trade, int index) {
    return InkWell(
      onTap: () {
        _handleRowTap(ref, trade);
        context.pop();
      },
      child: Container(
        decoration: BoxDecoration(
          color: index % 2 == 0 ? AppColors().kTableColor : AppColors().white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            "(${trade.symbol})  ${trade.securityName}",
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 17,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildErrorState(Object error, StackTrace stackTrace) {
    customLog(stackTrace.toString());
    return Center(child: Text("Error: $error"));
  }

  void _handleRowTap(WidgetRef ref, Content trade) {
    var watchList = ref.read(watchListProvider);

    if (!watchList.any((element) => element.symbol == trade.symbol)) {
      ref.read(watchListProvider.notifier).addItem(trade);
    } else {
      "Stock already exists in the watchlist".errorSnackBar(context);
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(
      //     content: Text('Stock already exists in the watchlist'),
      //   ),
      // );
    }
  }
}
