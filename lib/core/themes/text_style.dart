import 'package:flutter/material.dart';
import 'package:moneymatter/core/core.dart';

import 'colors.dart';

class AppTextStyle {
  AppTextStyle._();

  factory AppTextStyle() => _singleton;
  static final AppTextStyle _singleton = AppTextStyle._();

  ///
  TextStyle get kTitleText => TextStyle(
        color: AppColors().primaryColor,
        fontSize: 15.0,
        fontWeight: FontWeight.bold,
      );
  TextStyle get kSubTitleText => TextStyle(
        color: Colors.grey.shade600,
        fontSize: 13.0,
        fontWeight: FontWeight.bold,
      );

  ///
  TextStyle get kMenuTextStyle => const TextStyle(
        color: Colors.black,
        fontSize: 13.0,
        fontWeight: FontWeight.bold,
      );
  TextStyle get kNormalText => const TextStyle(fontSize: 13.0);

  TextStyle get kTableHeaderText => TextStyle(
        fontSize: 13.0,
        fontWeight: FontWeight.bold,
        color: AppColors().white,
      );
  TextStyle get kTableText => const TextStyle(
        fontSize: 13.0,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      );

  ///
  TextStyle get kButtonText => const TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      );
}
