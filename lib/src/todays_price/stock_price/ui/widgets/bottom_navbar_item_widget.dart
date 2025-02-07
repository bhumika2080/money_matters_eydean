import 'package:flutter/material.dart';

class BottomNavItem extends StatelessWidget {
  final Color backgroundColor;
  final String text;
  final VoidCallback onTap;

  const BottomNavItem({
    required this.backgroundColor,
    required this.text,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          color: backgroundColor,
          alignment: Alignment.center,
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
