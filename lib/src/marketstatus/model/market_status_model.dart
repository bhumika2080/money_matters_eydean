class MarketStatusModel {
  MarketStatusModel({
    required this.isOpen,
    required this.asOf,
    required this.id,
  });

  final String isOpen;
  final String asOf;
  final int id;

  factory MarketStatusModel.fromJson(Map<String, dynamic> json) {
    return MarketStatusModel(
      isOpen: json["isOpen"] ?? "",
      asOf: json["asOf"] ?? "",
      id: json["id"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "isOpen": isOpen,
        "asOf": asOf,
        "id": id,
      };
}

/*
{
	"isOpen": "CLOSE",
	"asOf": "2024",
	"id": 80
}*/