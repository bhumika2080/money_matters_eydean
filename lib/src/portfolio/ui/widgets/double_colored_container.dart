import 'package:flutter/material.dart';

class DoubleColoredContainer extends StatelessWidget {
  const DoubleColoredContainer({
    super.key,
    required this.firstContainerChild,
    required this.firstContainerColor,
    required this.secondContainerChild,
    required this.secondContainerColor,
  });

  final Widget firstContainerChild;
  final Color firstContainerColor;
  final Widget secondContainerChild;
  final Color secondContainerColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(color: firstContainerColor),
            padding: const EdgeInsets.symmetric(vertical: 10),
            alignment: Alignment.center,
            child: firstContainerChild,
          ),
          Container(
            decoration: BoxDecoration(
              color: secondContainerColor,
            ),
            padding: const EdgeInsets.all(10),
            child: secondContainerChild,
          )
        ],
      ),
    );
  }
}
