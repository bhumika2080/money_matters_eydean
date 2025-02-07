import 'package:flutter/material.dart';

extension BuildContextX on BuildContext {
  double get screenHeight => MediaQuery.sizeOf(this).height;
  double get screenWidth => MediaQuery.sizeOf(this).width;

  Size get size => MediaQuery.sizeOf(this);
}
