import 'package:flutter/material.dart';

import '../themes/colors.dart';



extension StringSnackBarExtension on String {
  void successSnackBar(BuildContext context, {Duration duration = const Duration(seconds: 3)}) {
    _showSnackBar(context, AppColors().green, duration);
  }

  void errorSnackBar(BuildContext context, {Duration duration = const Duration(seconds: 3)}) {
    _showSnackBar(context, AppColors().red, duration);
  }

  void customSnackBar(BuildContext context, {
    Duration duration = const Duration(seconds: 3),
    Color backgroundColor = Colors.blue,
    TextStyle? textStyle,
  }) {
    _showSnackBar(context, backgroundColor, duration, textStyle: textStyle);
  }

  void _showSnackBar(
    BuildContext context, 
    Color backgroundColor, 
    Duration duration, {
    TextStyle? textStyle,
  }) {
    final snackBar = SnackBar(
      content: Text(
        this,
        style: textStyle ?? const TextStyle(color: Colors.white),
      ),
      backgroundColor: backgroundColor,
      duration: duration,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
