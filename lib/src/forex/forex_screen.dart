import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moneymatter/core/core.dart';

import 'model/forex_model.dart';
import 'repository/forex_repository.dart';

class ForexScreen extends ConsumerWidget {
  const ForexScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apiResponse = ref.watch(forexProvider);
    return Scaffold(
      appBar: AppBar(title: const Text("Forex Rates")),
      body: apiResponse.when(
        data: _buildData,
        error: (error, _) => _buildErrorData(error),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }

  Widget _buildData(List<ForexModel> data) {
    return Column(
      children: [
        _buildTableHeader(),
        Expanded(
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final forexInfo = data[index];
              return Container(
                color:
                    index.isEven ? AppColors().kTableColor : AppColors().white,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        "${_getFlag(forexInfo.iso3)} ${forexInfo.name}",
                        style: AppTextStyle().kTableText.copyWith(
                              fontSize: 14.0,
                            ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "${forexInfo.unit}",
                        textAlign: TextAlign.end,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        forexInfo.buy,
                        textAlign: TextAlign.end,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        forexInfo.sell,
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ).paddingSymmetric(10.0, 12.0),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTableHeader() {
    return Container(
      decoration: BoxDecoration(color: AppColors().kTableHeaderColor),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              "CURRENCY",
              style: AppTextStyle().kTableHeaderText,
            ),
          ),
          Expanded(
            child: Text(
              "UNIT",
              style: AppTextStyle().kTableHeaderText,
              textAlign: TextAlign.end,
            ),
          ),
          Expanded(
            child: Text(
              "BUY",
              style: AppTextStyle().kTableHeaderText,
              textAlign: TextAlign.end,
            ),
          ),
          Expanded(
            child: Text(
              "SELL",
              style: AppTextStyle().kTableHeaderText,
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ).paddingSymmetric(10.0, 12.0),
    );
  }

  Widget _buildErrorData(Object error) {
    customLog(error.toString());
    return Center(child: Text("Error: $error"));
  }

  String _getFlag(String countryCode) {
    final code = countryCode.substring(0, 2).toUpperCase();
    return code.replaceAllMapped(RegExp(r'[A-Z]'), (match) {
      return String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397);
    });
  }
}
