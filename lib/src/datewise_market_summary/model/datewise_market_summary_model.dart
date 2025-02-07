// To parse this JSON data, do
//
//     final datewiseMarketSummaryModel = datewiseMarketSummaryModelFromJson(jsonString);

import 'dart:convert';

String datewiseMarketSummaryModelToJson(
        List<DatewiseMarketSummaryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DatewiseMarketSummaryModel {
  DateTime businessDate;
  double totalTurnover;
  int totalTradedShares;
  int totalTransactions;
  int tradedScrips;

  DatewiseMarketSummaryModel({
    required this.businessDate,
    required this.totalTurnover,
    required this.totalTradedShares,
    required this.totalTransactions,
    required this.tradedScrips,
  });

  factory DatewiseMarketSummaryModel.fromJson(Map<String, dynamic> json) =>
      DatewiseMarketSummaryModel(
        businessDate: DateTime.parse(json["businessDate"]),
        totalTurnover: json["totalTurnover"]?.toDouble(),
        totalTradedShares: json["totalTradedShares"],
        totalTransactions: json["totalTransactions"],
        tradedScrips: json["tradedScrips"],
      );

  Map<String, dynamic> toJson() => {
        "businessDate":
            "${businessDate.year.toString().padLeft(4, '0')}-${businessDate.month.toString().padLeft(2, '0')}-${businessDate.day.toString().padLeft(2, '0')}",
        "totalTurnover": totalTurnover,
        "totalTradedShares": totalTradedShares,
        "totalTransactions": totalTransactions,
        "tradedScrips": tradedScrips,
      };

  static List<DatewiseMarketSummaryModel> datewiseMarketSummaryListFromJson(
          List<dynamic> list) =>
      List<DatewiseMarketSummaryModel>.from(
          list.map((x) => DatewiseMarketSummaryModel.fromJson(x)));
}
