import 'package:flutter/material.dart';
import 'package:moneymatter/core/constants/screen_constants.dart';
import 'package:moneymatter/core/core.dart';
import 'package:moneymatter/core/themes/colors.dart';

class DatewiseIndicesScreen extends StatefulWidget {
  const DatewiseIndicesScreen({super.key});

  @override
  State<DatewiseIndicesScreen> createState() => _DatewiseIndicesScreenState();
}

class _DatewiseIndicesScreenState extends State<DatewiseIndicesScreen> {
  final List<String> dropDownMenuItems = const [
    "NEPSE",
    "Sensitive",
    "Float",
    "Sensitive Float",
    "Finance",
    "Banking",
    "Trading",
    "Investment",
    "Hotels And Tourism",
    "Others",
    "Hydro Power",
    "Microfinance",
    "Mutual Fund",
    "Life Insurance",
    "Development Bank",
    "Non Life Insurance",
    "Manufacturing And Processing",
  ];

  String _selectedValue = "NEPSE";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          child: DropdownButton(
            value: _selectedValue,
            underline: const SizedBox(),
            isExpanded: true,
            // style: AppTextStyle().kTitleText,
            items: dropDownMenuItems
                .map((item) => DropdownMenuItem(
                      value: item,
                      child: Text(
                        item,
                        style:
                            AppTextStyle().kSubTitleText.copyWith(fontSize: 15),
                      ),
                    ))
                .toList(),
            selectedItemBuilder: (context) {
              return dropDownMenuItems
                  .map((item) => DropdownMenuItem(
                        value: item,
                        child: Text(
                          item,
                          style: AppTextStyle()
                              .kSubTitleText
                              .copyWith(fontSize: 15),
                        ),
                      ))
                  .toList();
            },
            onChanged: (value) {
              if (value == null) return;
              setState(() {
                _selectedValue = value;
              });
            },
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.calendar_today,
              color: AppColors().white,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 45,
            child: _buildTableHeader(),
          ),
          // Expanded(
          //   child: ,
          //   )
        ],
      ),
    );
  }
}

Widget _buildTableHeader() {
  return Container(
    decoration: BoxDecoration(color: AppColors().kTableHeaderColor),
    child: ListView(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      children: [
        _buildHeaderText("DATE", kScreenWidth * 0.25),
        _buildHeaderText("OPEN", kScreenWidth * 0.225),
        _buildHeaderText("CLOSE", kScreenWidth * 0.225),
        _buildHeaderText("TURNOVER", kScreenWidth * 0.3),
        _buildHeaderText("VOLUME", kScreenWidth * 0.3),
        _buildHeaderText("TRANSACTIONS", kScreenWidth * 0.3),
        _buildHeaderText("HIGH", kScreenWidth * 0.25),
        _buildHeaderText("LOW", kScreenWidth * 0.25),
        _buildHeaderText("52W H", kScreenWidth * 0.2),
        _buildHeaderText("52W L", kScreenWidth * 0.2),
      ],
    ).paddingSymmetric(10, 15),
  );
}

Widget _buildHeaderText(String text, double size) {
  return SizedBox(
    width: size,
    child: Text(
      text,
      style: AppTextStyle().kTableHeaderText,
      textAlign: TextAlign.center,
    ),
  );
}
