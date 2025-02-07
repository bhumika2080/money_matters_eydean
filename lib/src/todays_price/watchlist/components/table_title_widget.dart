import 'package:flutter/material.dart';
import 'package:moneymatter/core/core.dart';

class TableTitleWidget extends StatelessWidget {
  const TableTitleWidget({
    super.key,
    required this.flex,
    required this.title,
  });

  final int flex;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Text(
        title,
        style: AppTextStyle().kTableText,
      ),
    );
  }
}