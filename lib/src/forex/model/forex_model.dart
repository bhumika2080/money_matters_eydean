class ForexModel {
  ForexModel({
    required this.iso3,
    required this.name,
    required this.unit,
    required this.buy,
    required this.sell,
    required this.date,
    required this.publishedOn,
    required this.modifiedOn,
  });

  final String iso3;
  final String name;
  final int unit;
  final String buy;
  final String sell;
  final String date;
  final String publishedOn;
  final String modifiedOn;

  factory ForexModel.fromJson(Map<String, dynamic> json) {
    return ForexModel(
      iso3: json["iso3"] ?? "",
      name: json["name"] ?? "",
      unit: json["unit"] ?? 0,
      buy: json["buy"] ?? "",
      sell: json["sell"] ?? "",
      date: json["date"] ?? "",
      publishedOn: json["published_on"] ?? "",
      modifiedOn: json["modified_on"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "iso3": iso3,
        "name": name,
        "unit": unit,
        "buy": buy,
        "sell": sell,
        "date": date,
        "published_on": publishedOn,
        "modified_on": modifiedOn,
      };

  static ForexModel get nepaliForex => ForexModel(
        iso3: "NPL",
        name: "Nepal",
        unit: 1,
        buy: "1",
        sell: "1",
        date: "${DateTime.now()}".substring(0, 10),
        publishedOn: "${DateTime.now()}".substring(0, 10),
        modifiedOn: "${DateTime.now()}".substring(0, 10),
      );
}

/*
[
	{
		"iso3": "INR",
		"name": "Indian Rupee",
		"unit": 100,
		"buy": "160.00",
		"sell": "160.15",
		"date": "2024-03-17",
		"published_on": "2024-03-17 00:00:24",
		"modified_on": "2024-03-15 17:42:48"
	},
	{
		"iso3": "USD",
		"name": "U.S. Dollar",
		"unit": 1,
		"buy": "132.31",
		"sell": "132.91",
		"date": "2024-03-17",
		"published_on": "2024-03-17 00:00:24",
		"modified_on": "2024-03-15 17:42:48"
	}
	}
]*/