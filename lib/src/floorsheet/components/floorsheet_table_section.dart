import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moneymatter/core/core.dart';
import 'package:moneymatter/src/floorsheet/floorsheet.dart';

class FlooeSheetTableSection extends StatelessWidget {
  final AsyncValue<FloorSheetModel> response;
  final WidgetRef ref;
  const FlooeSheetTableSection({
    super.key,
    required this.response,
    required this.ref,
  });

  @override
  Widget build(BuildContext context) {
    return response.when(
      data: (data) {
        return _buildDataList(
          data.floorsheets ?? Floorsheets.fromJson({}),
          ref,
        );
      },
      error: (error, stackTrace) {
        return _buildErrorState(error, stackTrace);
      },
      loading: () {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _buildHeaderText(String text, int flex, {TextAlign? textAlign}) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        style: AppTextStyle().kTableHeaderText,
        textAlign: textAlign ?? TextAlign.center,
      ),
    );
  }

  Widget _buildDataList(Floorsheets sheetData, WidgetRef ref) {
    final data = sheetData.content;
    customLog('Data received: ${data.length} items');

    return Column(
      children: [
        _buildTableHeader(),
        Flexible(
          child: RefreshIndicator(
            onRefresh: () => ref.refresh(fetchFloorSheet.future),
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final trade = data[index];
                return _buildDataRow(trade, index);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTableHeader() {
    return Container(
      decoration: BoxDecoration(color: AppColors().kTableHeaderColor),
      child: Row(children: [
        _buildHeaderText("SN", 1, textAlign: TextAlign.start),
        _buildHeaderText("SYM", 3),
        _buildHeaderText("BB", 1),
        _buildHeaderText("SB", 1),
        _buildHeaderText("QTY", 2),
        _buildHeaderText("RATE", 2),
        _buildHeaderText("AMOUNT", 2, textAlign: TextAlign.end),
      ]).paddingSymmetric(10.0, 15.0),
    );
  }

  Widget _buildDataRow(Content trade, int index) {
    return Container(
      decoration: BoxDecoration(
        color: index % 2 == 0 ? AppColors().kTableColor : AppColors().white,
      ),
      child: Row(children: [
        _buildDataText("${index + 1}", 1, textAlign: TextAlign.start),
        _buildDataText(trade.stockSymbol, 3),
        _buildDataText(trade.buyerMemberId, 1),
        _buildDataText(trade.sellerMemberId, 1),
        _buildDataText("${trade.contractQuantity}", 2),
        _buildDataText("${trade.contractRate}", 2),
        _buildDataText("${trade.contractAmount}", 2, textAlign: TextAlign.end),
      ]).paddingSymmetric(10.0, 15.0),
    );
  }

  Widget _buildDataText(String text, int flex, {TextAlign? textAlign}) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        style: AppTextStyle().kTableText,
        textAlign: textAlign ?? TextAlign.center,
      ),
    );
  }

  Widget _buildErrorState(Object error, StackTrace stackTrace) {
    customLog(stackTrace.toString());
    return Center(child: Text("$error"));
  }
}
