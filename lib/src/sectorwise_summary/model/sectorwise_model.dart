class SectorwiseSummaryModel {
  SectorwiseSummaryModel({
    required this.businessDate,
    required this.sectorName,
    required this.turnOverValues,
    required this.turnOverVolume,
    required this.totalTransaction,
  });

  final String businessDate;
  final String sectorName;
  final double turnOverValues;
  final int turnOverVolume;
  final int totalTransaction;

  factory SectorwiseSummaryModel.fromJson(Map<String, dynamic> json) {
    return SectorwiseSummaryModel(
      businessDate: json["businessDate"] ?? "",
      sectorName: json["sectorName"] ?? "",
      turnOverValues: (json["turnOverValues"] ?? 0).toDouble(),
      turnOverVolume: json["turnOverVolume"] ?? 0,
      totalTransaction: json["totalTransaction"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "businessDate": businessDate,
        "sectorName": sectorName,
        "turnOverValues": turnOverValues,
        "turnOverVolume": turnOverVolume,
        "totalTransaction": totalTransaction,
      };

  static List<SectorwiseSummaryModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList
        .map((json) => SectorwiseSummaryModel.fromJson(json))
        .toList();
  }
}


/*
[
	{
		"businessDate": "1970-01-01",
		"sectorName": "Preference Share",
		"turnOverValues": 0,
		"turnOverVolume": 0,
		"totalTransaction": 0
	},
	{
		"businessDate": "2024-05-22",
		"sectorName": "Commercial Banks",
		"turnOverValues": 1072427189.8,
		"turnOverVolume": 4005481,
		"totalTransaction": 15332
	},
	{
		"businessDate": "2024-05-22",
		"sectorName": "Corporate Debenture",
		"turnOverValues": 2031902.9,
		"turnOverVolume": 1961,
		"totalTransaction": 60
	},
	{
		"businessDate": "2024-05-22",
		"sectorName": "Development Banks",
		"turnOverValues": 262885630.4,
		"turnOverVolume": 689611,
		"totalTransaction": 3039
	},
	{
		"businessDate": "2024-05-22",
		"sectorName": "Finance",
		"turnOverValues": 597402943.9,
		"turnOverVolume": 1113571,
		"totalTransaction": 5422
	},
	{
		"businessDate": "2024-05-22",
		"sectorName": "Hotels And Tourism",
		"turnOverValues": 206612957.4,
		"turnOverVolume": 313694,
		"totalTransaction": 2454
	},
	{
		"businessDate": "2024-05-22",
		"sectorName": "Hydro Power",
		"turnOverValues": 1213264241.1,
		"turnOverVolume": 4067890,
		"totalTransaction": 22651
	},
	{
		"businessDate": "2024-05-22",
		"sectorName": "Investment",
		"turnOverValues": 306749951.2,
		"turnOverVolume": 462410,
		"totalTransaction": 2527
	},
	{
		"businessDate": "2024-05-22",
		"sectorName": "Life Insurance",
		"turnOverValues": 270780755.7,
		"turnOverVolume": 539883,
		"totalTransaction": 5746
	},
	{
		"businessDate": "2024-05-22",
		"sectorName": "Manufacturing And Processing",
		"turnOverValues": 268804774.2,
		"turnOverVolume": 454601,
		"totalTransaction": 3610
	},
	{
		"businessDate": "2024-05-22",
		"sectorName": "Microfinance",
		"turnOverValues": 1064350200.2,
		"turnOverVolume": 1150718,
		"totalTransaction": 11267
	},
	{
		"businessDate": "2024-05-22",
		"sectorName": "Mutual Fund",
		"turnOverValues": 8169852.7,
		"turnOverVolume": 938080,
		"totalTransaction": 458
	},
	{
		"businessDate": "2024",
		"sectorName": "Non Life Insurance",
		"turnOverValues": 203664026.6,
		"turnOverVolume": 302674,
		"totalTransaction": 1753
	},
	{
		"businessDate": "2024-05-22",
		"sectorName": "Others",
		"turnOverValues": 192913228.7,
		"turnOverVolume": 315833,
		"totalTransaction": 3579
	},
	{
		"businessDate": "2024-05-22",
		"sectorName": "Promoter Share",
		"turnOverValues": 13202327.8,
		"turnOverVolume": 60692,
		"totalTransaction": 96
	},
	{
		"businessDate": "2024-05-22",
		"sectorName": "Tradings",
		"turnOverValues": 4409496.2,
		"turnOverVolume": 1022,
		"totalTransaction": 49
	}
]*/