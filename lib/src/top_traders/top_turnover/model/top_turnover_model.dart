class TopTurnoverModel {
  TopTurnoverModel({
    required this.symbol,
    required this.turnover,
    required this.closingPrice,
    required this.securityName,
    required this.securityId,
  });

  final String symbol;
  final double turnover;
  final double closingPrice;
  final String securityName;
  final int securityId;

  factory TopTurnoverModel.fromJson(Map<String, dynamic> json) {
    return TopTurnoverModel(
      symbol: json["symbol"] ?? "",
      turnover: (json["turnover"] ?? 0.0).toDouble(),
      closingPrice: (json["closingPrice"] ?? 0.0).toDouble(),
      securityName: json["securityName"] ?? "",
      securityId: json["securityId"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "symbol": symbol,
        "turnover": turnover,
        "closingPrice": closingPrice,
        "securityName": securityName,
        "securityId": securityId,
      };

  static List<TopTurnoverModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => TopTurnoverModel.fromJson(json)).toList();
  }
}
