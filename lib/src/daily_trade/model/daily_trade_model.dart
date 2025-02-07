class DailyTradeModel {
  DailyTradeModel({
    required this.securityId,
    required this.securityName,
    required this.symbol,
    required this.indexId,
    required this.totalTradeQuantity,
    required this.lastTradedPrice,
    required this.percentageChange,
    required this.lastUpdatedDateTime,
    required this.previousClose,
  });

  final String securityId;
  final String securityName;
  final String symbol;
  final int indexId;
  final int totalTradeQuantity;
  final String lastTradedPrice;
  final String percentageChange;
  final DateTime? lastUpdatedDateTime;
  final String previousClose;

  factory DailyTradeModel.fromJson(Map<String, dynamic> json) {
    return DailyTradeModel(
      securityId: json["securityId"] ?? "",
      securityName: json["securityName"] ?? "",
      symbol: json["symbol"] ?? "",
      indexId: json["indexId"] ?? 0,
      totalTradeQuantity: json["totalTradeQuantity"] ?? 0,
      lastTradedPrice: json["lastTradedPrice"] == null
          ? "0.0"
          : json["lastTradedPrice"].toString(),
      percentageChange: json["percentageChange"] == null
          ? "0.0"
          : json["percentageChange"].toString(),
      lastUpdatedDateTime: DateTime.tryParse(json["lastUpdatedDateTime"] ?? ""),
      previousClose: json["previousClose"] == null
          ? "0.0"
          : json["previousClose"].toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        "securityId": securityId,
        "securityName": securityName,
        "symbol": symbol,
        "indexId": indexId,
        "totalTradeQuantity": totalTradeQuantity,
        "lastTradedPrice": lastTradedPrice,
        "percentageChange": percentageChange,
        "lastUpdatedDateTime": lastUpdatedDateTime?.toIso8601String(),
        "previousClose": previousClose,
      };

  static List<DailyTradeModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => DailyTradeModel.fromJson(json)).toList();
  }
}

/*
[
	{
		"securityId": "2790",
		"securityName": "Aarambha Chautari Laghubitta Bittiya Sanstha Limited",
		"symbol": "ACLBSL",
		"indexId": 58,
		"totalTradeQuantity": 14299,
		"lastTradedPrice": 916.6,
		"percentageChange": 1.53982497,
		"lastUpdatedDateTime": "2024-05-09 14:59:59.70084",
		"previousClose": 902.7
	},
	{
		"securityId": "397",
		"securityName": "Agricultural Development Bank Limited",
		"symbol": "ADBL",
		"indexId": 58,
		"totalTradeQuantity": 37949,
		"lastTradedPrice": 239,
		"percentageChange": 2.575107296,
		"lastUpdatedDateTime": "2024-05-09 14:59:04.261222",
		"previousClose": 233
	}
]*/