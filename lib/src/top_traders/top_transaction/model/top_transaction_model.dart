class TopTransactionModel {
  TopTransactionModel({
    required this.securityId,
    required this.totalTrades,
    required this.lastTradedPrice,
    required this.securityName,
    required this.symbol,
  });

  final int securityId;
  final int totalTrades;
  final double lastTradedPrice;
  final String securityName;
  final String symbol;

  factory TopTransactionModel.fromJson(Map<String, dynamic> json) {
    return TopTransactionModel(
      securityId: json["securityId"] ?? 0,
      totalTrades: json["totalTrades"] ?? 0,
      lastTradedPrice: (json["lastTradedPrice"] ?? 0.0).toDouble(),
      securityName: json["securityName"] ?? "",
      symbol: json["symbol"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "securityId": securityId,
        "totalTrades": totalTrades,
        "lastTradedPrice": lastTradedPrice,
        "securityName": securityName,
        "symbol": symbol,
      };

  static List<TopTransactionModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => TopTransactionModel.fromJson(json)).toList();
  }
}
