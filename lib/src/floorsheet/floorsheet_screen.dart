import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:moneymatter/core/core.dart';
import 'package:moneymatter/src/company_list/company_list.dart';
import 'package:moneymatter/src/floorsheet/components/floorsheet_table_section.dart';
import 'package:moneymatter/src/floorsheet/repository/floorsheet_repository.dart';
import 'package:moneymatter/src/widgets/custom_text_field.dart';
import 'package:moneymatter/src/widgets/date_title_widget.dart';

class FloorSheetScreen extends StatelessWidget {
  const FloorSheetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        var response = ref.watch(fetchFloorSheet);

        return Scaffold(
          appBar: AppBar(
            title: const DateTitleWidget(title: "FloorSheet"),
          ),
          body: Column(
            children: [
              _buildFilterHeader(context),
              Expanded(
                child: FlooeSheetTableSection(response: response, ref: ref),
              ),
              Container(
                color: AppColors().kTableHeaderColor,
                child: response.when(
                  data: (data) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Total Amount : Rs.${data.totalAmount}",
                          style: AppTextStyle().kTableHeaderText,
                        ),
                        5.xGap,
                        Text(
                          "Total Quantity : ${data.totalQty}",
                          style: AppTextStyle().kTableHeaderText,
                        ),
                      ],
                    ).paddingSymmetric(20.0, 10.0);
                  },
                  error: (error, stackTrace) {
                    return Center(child: Text("$error"));
                  },
                  loading: () {
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFilterHeader(BuildContext context) {
    var selectedStock = TextEditingController(text: "");
    return Container(
      color: AppColors().primaryColor,
      child: Column(
        children: [
          Row(children: [
            Expanded(
              flex: 3,
              child: StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return CustomTextField(
                    controller: selectedStock,
                    hintText: "Select Stock",
                    readOnly: true,
                    onTap: () async {
                      final companyInfo = await context.push(
                        AppRoute().companyListScreen,
                      ) as CompanyModel;

                      // CompanyModel companyInfo = result as CompanyModel;

                      selectedStock.text = companyInfo.companyName;
                      setState(() {});
                    },
                  );
                },
              ),
            ),
            5.yGap,
            const Expanded(
              child: CustomTextField(hintText: "Page Size"),
            ),
          ]),
          Row(
            children: [
              const Expanded(
                flex: 2,
                child: CustomTextField(hintText: "Buyer Broker"),
              ),
              5.yGap,
              const Expanded(
                flex: 2,
                child: CustomTextField(hintText: "Seller Broker"),
              ),
              5.yGap,
              Expanded(
                flex: 2,
                child: CustomButton(
                  text: 'FILTER',
                  onTap: () {},
                ),
              ),
              5.yGap,
              Expanded(
                child: CustomIconButton(icon: Icons.refresh, onTap: () {}),
              ),
            ],
          ),
        ],
      ).paddingSymmetric(20.0, 10.0),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const CustomButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38.0,
      decoration: BoxDecoration(
        color: AppColors().kCardColor,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Text(
            text,
            style: AppTextStyle().kButtonText,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final void Function()? onTap;
  const CustomIconButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38.0,
      decoration: BoxDecoration(
        color: AppColors().kCardColor,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: InkWell(
        onTap: onTap,
        child: Center(child: Icon(icon)),
      ),
    );
  }
}
