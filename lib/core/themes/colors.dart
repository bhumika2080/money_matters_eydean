import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  factory AppColors() {
    return _singleton;
  }

  static final AppColors _singleton = AppColors._();

  static final Map<int, Color> _colorMap = {
    50: const Color.fromRGBO(0, 73, 174, .1),
    100: const Color.fromRGBO(0, 73, 174, .2),
    200: const Color.fromRGBO(0, 73, 174, .3),
    300: const Color.fromRGBO(0, 73, 174, .4),
    400: const Color.fromRGBO(0, 73, 174, .5),
    500: const Color.fromRGBO(0, 73, 174, .6),
    600: const Color.fromRGBO(0, 73, 174, .7),
    700: const Color.fromRGBO(0, 73, 174, .8),
    800: const Color.fromRGBO(0, 73, 174, .9),
    900: const Color.fromRGBO(0, 73, 174, 1),
  };
  MaterialColor get primaryColor => MaterialColor(0xFF0049ae, _colorMap);

  ///
  Color get green => Colors.green;
  Color get red => Colors.red;
  Color get blue => Colors.blue;
  Color get orange => Colors.orange;
  Color get white => Colors.white;
  Color get black => Colors.black;

  Color get kLinkColor => Colors.blue;
  Color get kCardColor => Colors.grey.shade300;
  Color get kBorderColor => Colors.grey.shade400;

  Color get kTableHeaderColor => Colors.blueGrey;
  Color get kTableColor => Colors.blueGrey.withOpacity(.2);

  static Color get kIconColor => const Color.fromARGB(134, 10, 10, 10);

  ///
}
