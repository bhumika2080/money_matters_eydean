import 'package:flutter/material.dart';

late double kScreenHeight;
late double kScreenWidth;
late bool kHasPremium;

class ScreenUtils {
  static void init(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    kScreenHeight = size.height;
    kScreenWidth = size.width;
  }
}
