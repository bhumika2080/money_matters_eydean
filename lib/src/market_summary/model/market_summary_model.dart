class MarketSummaryModel {
  MarketSummaryModel({
    required this.detail,
    required this.value,
  });

  final String detail;
  final double value;

  factory MarketSummaryModel.fromJson(Map<String, dynamic> json) {
    return MarketSummaryModel(
      detail: json["detail"] ?? "",
      value: (json["value"] ?? 0.0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        "detail": detail,
        "value": value,
      };

  static List<MarketSummaryModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => MarketSummaryModel.fromJson(json)).toList();
  }
}

/*
[
	{
		"detail": "Total Turnover Rs:",
		"value": 5206208111.56
	},
	{
		"detail": "Total Traded Shares",
		"value": 13241217
	},
	{
		"detail": "Total Transactions",
		"value": 73667
	},
	{
		"detail": "Total Scrips Traded",
		"value": 317
	},
	{
		"detail": "Total Market Capitalization Rs:",
		"value": 3355261629647
	},
	{
		"detail": "Total Float Market Capitalization Rs:",
		"value": 1143335867815.8
	}
]*/