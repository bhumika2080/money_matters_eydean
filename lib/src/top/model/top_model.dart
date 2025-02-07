class TopModel {
  TopModel({
    required this.symbol,
    required this.ltp,
    required this.pointChange,
    required this.percentageChange,
    required this.securityName,
    required this.securityId,
  });

  final String symbol;
  final double ltp;
  final double pointChange;
  final double percentageChange;
  final String securityName;
  final double securityId;

  factory TopModel.fromJson(Map<String, dynamic> json) {
    return TopModel(
      symbol: json["symbol"] ?? "",
      ltp: (json["ltp"] is int ? json["ltp"].toDouble() : json["ltp"]) ?? 0.0,
      pointChange: (json["pointChange"] is int
              ? json["pointChange"].toDouble()
              : json["pointChange"]) ??
          0.0,
      percentageChange: (json["percentageChange"] is int
              ? json["percentageChange"].toDouble()
              : json["percentageChange"]) ??
          0.0,
      securityName: json["securityName"] ?? "",
      securityId: (json["securityId"] is int
              ? json["securityId"].toDouble()
              : json["securityId"]) ??
          0.0,
    );
  }

  Map<String, dynamic> toJson() => {
        "symbol": symbol,
        "ltp": ltp,
        "pointChange": pointChange,
        "percentageChange": percentageChange,
        "securityName": securityName,
        "securityId": securityId,
      };

  static List<TopModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => TopModel.fromJson(json)).toList();
  }
}
