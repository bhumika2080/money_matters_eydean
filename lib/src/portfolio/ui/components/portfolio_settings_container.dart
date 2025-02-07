import 'package:flutter/material.dart';
import 'package:moneymatter/core/core.dart';

class PortfolioSettingsContainer extends StatelessWidget {
  const PortfolioSettingsContainer({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    required this.onPressed,
    this.isDelete = false,
  });

  final IconData icon;
  final String title;
  final String subTitle;
  final VoidCallback onPressed;
  final bool isDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isDelete ? AppColors().red : AppColors().kCardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: isDelete ? AppColors().white : AppColors().black,
        ),
        title: Text(
          title,
          style: AppTextStyle().kTitleText.copyWith(
                color: isDelete ? AppColors().white : AppColors().black,
              ),
        ),
        subtitle: Text(
          title,
          style: AppTextStyle().kSubTitleText.copyWith(
                color: isDelete
                    ? AppColors().kCardColor
                    : AppColors().kBorderColor,
              ),
        ),
        onTap: onPressed,
      ),
    );
  }
}
