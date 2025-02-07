class TopSharesTradedModel {
  TopSharesTradedModel({
    required this.symbol,
    required this.shareTraded,
    required this.closingPrice,
    required this.securityName,
    required this.securityId,
  });

  final String symbol;
  final int shareTraded;
  final double closingPrice;
  final String securityName;
  final int securityId;

  factory TopSharesTradedModel.fromJson(Map<String, dynamic> json) {
    return TopSharesTradedModel(
      symbol: json["symbol"] ?? "",
      shareTraded: json["shareTraded"] ?? 0,
      closingPrice: (json["closingPrice"] ?? 0.0).toDouble(),
      securityName: json["securityName"] ?? "",
      securityId: json["securityId"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "symbol": symbol,
        "shareTraded": shareTraded,
        "closingPrice": closingPrice,
        "securityName": securityName,
        "securityId": securityId,
      };
  static List<TopSharesTradedModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => TopSharesTradedModel.fromJson(json)).toList();
  }
}
