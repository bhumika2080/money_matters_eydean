import 'package:flutter/material.dart';
import 'package:moneymatter/core/extension/context_ext.dart';
import 'package:moneymatter/core/extension/padding_ext.dart';

import '../../core/themes/colors.dart';
import '../../core/themes/text_style.dart';

class MenuHeaderWidget extends StatelessWidget {
  final String title;
  const MenuHeaderWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(color: AppColors().kCardColor, height: 5.0),
        Center(
          child: Container(
            width: context.screenWidth / 1.7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: AppColors().kCardColor,
            ),
            child: Text(
              title,
              style: AppTextStyle().kMenuTextStyle,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ).paddingAll(10.0),
          ),
        ),
      ],
    );
  }
}
