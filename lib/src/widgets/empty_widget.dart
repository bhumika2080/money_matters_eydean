import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  final String text;
  const EmptyWidget({super.key, this.text = "No data found"});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(text));
  }
}
