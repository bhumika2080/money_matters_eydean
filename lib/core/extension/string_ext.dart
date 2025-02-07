import 'package:intl/intl.dart';

extension StringX on String {
  String formatNumber() {
    final NumberFormat formatter = NumberFormat('#,##0.00');
    return formatter.format(double.parse(this));
  }
}
