import 'package:intl/intl.dart';

String formatDate(DateTime date) => DateFormat('yyy-MM-dd').format(date);

String longDateFormat(String string) {
  final date = DateTime.parse(string);
  String formattedDate = DateFormat('EEEE, MMM d, h:mm:ss a').format(date);
  return formattedDate;
}

String formatMoney(double money) {
  final format = NumberFormat("#,##,###.##");
  if (money < 10000000) {
    return format.format(money);
  } else if (money < 1000000000) {
    return "${(money / 10000000).toStringAsFixed(2)} Crore";
  } else if (money < 100000000000) {
    return "${(money / 1000000000).toStringAsFixed(2)} Arba";
  } else {
    return "${(money / 100000000000).toStringAsFixed(2)} Kharab";
  }
}


// List<dynamic> sortItemsAscending(List<dynamic> list) {
//   final newList = List.from(list);
//   newList.sort((a, b) => a.businessDate.compareTo(b.businessDate));
//   return newList;
// }

// List<dynamic> sortDescendingItems(List<dynamic> list) {
//   final newList = List.from(list);
//   newList.sort((a, b) => b.businessDate.compareTo(a.businessDate));
//   return newList;
// }
