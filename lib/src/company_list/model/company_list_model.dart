class CompanyModel {
  CompanyModel({
    required this.id,
    required this.companyName,
    required this.symbol,
    required this.securityName,
    required this.status,
    required this.companyEmail,
    required this.website,
    required this.sectorName,
    required this.regulatoryBody,
    required this.instrumentType,
  });

  final int id;
  final String companyName;
  final String symbol;
  final String securityName;
  final String status;
  final String companyEmail;
  final String website;
  final String sectorName;
  final String regulatoryBody;
  final String instrumentType;

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      id: json["id"] ?? 0,
      companyName: json["companyName"] ?? "",
      symbol: json["symbol"] ?? "",
      securityName: json["securityName"] ?? "",
      status: json["status"] ?? "",
      companyEmail: json["companyEmail"] ?? "",
      website: json["website"] ?? "",
      sectorName: json["sectorName"] ?? "",
      regulatoryBody: json["regulatoryBody"] ?? "",
      instrumentType: json["instrumentType"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "companyName": companyName,
        "symbol": symbol,
        "securityName": securityName,
        "status": status,
        "companyEmail": companyEmail,
        "website": website,
        "sectorName": sectorName,
        "regulatoryBody": regulatoryBody,
        "instrumentType": instrumentType,
      };

  static List<CompanyModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => CompanyModel.fromJson(json)).toList();
  }
}
