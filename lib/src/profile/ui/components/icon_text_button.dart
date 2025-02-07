import 'package:flutter/material.dart';
import 'package:moneymatter/core/core.dart';

class IconTextButton extends StatelessWidget {
  const IconTextButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: AppColors().black,
      ),
      title: Text(
        text,
        style: AppTextStyle().kTitleText.copyWith(color: Colors.black),
      ),
      onTap: onPressed,
    );
  }
}
