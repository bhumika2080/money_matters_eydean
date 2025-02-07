import 'package:flutter/material.dart';

extension EmptyPadding on num {
  SizedBox get xGap => SizedBox(height: toDouble());
  SizedBox get yGap => SizedBox(width: toDouble());
}
