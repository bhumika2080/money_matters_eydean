import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:moneymatter/src/daily_trade/model/daily_trade_model.dart';

import '../../core/core.dart';

final fetchUserData = FutureProvider<List<DailyTradeModel>>(
  (ref) async {
    final url = APIInfo().baseUrl + APIInfo().dailyTradeStat;
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List<dynamic> jsonList = jsonDecode(response.body);
        return DailyTradeModel.fromJsonList(jsonList);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      _handleException(e);
      return [];
    }
  },
);

void _handleException(dynamic e) {
  if (e is AppException) {
    ExceptionHandler().parseError(e.message);
  }
}

class DailyTradeScreen extends StatelessWidget {
  const DailyTradeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        var user = ref.watch(fetchUserData);
        return Scaffold(
          appBar: AppBar(title: const Text('Daily Trade Stats')),
          body: user.when(
            data: (data) => ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final trade = data[index];
                return Card(
                  child: ListTile(
                    title: Text(trade.securityName),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Symbol: ${trade.symbol}'),
                        Text('Last Traded Price: ${trade.lastTradedPrice}'),
                        Text(
                          'Total Trade Quantity: ${trade.totalTradeQuantity}',
                        ),
                        Text('Percentage Change: ${trade.percentageChange}'),
                        Text('Previous Close: ${trade.previousClose}'),
                        Text('Last Updated: ${trade.lastUpdatedDateTime}'),
                      ],
                    ),
                  ),
                );
              },
            ),
            error: (error, stackTrace) {
              customLog(stackTrace.toString());
              return Center(child: Text("$error"));
            },
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }
}
