class DatewiseMarketCapModel {
  DatewiseMarketCapModel({
    required this.businessDate,
    required this.marCap,
    required this.senMarCap,
    required this.floatMarCap,
    required this.senFloatMarCap,
  });

  final DateTime? businessDate;
  final double marCap;
  final double senMarCap;
  final double floatMarCap;
  final double senFloatMarCap;

  factory DatewiseMarketCapModel.fromJson(Map<String, dynamic> json) {
    return DatewiseMarketCapModel(
      businessDate: (DateTime.tryParse(json["businessDate"] ?? "")),
      marCap: (json["marCap"] ?? 0.0).toDouble(),
      senMarCap: (json["senMarCap"] ?? 0.0).toDouble(),
      floatMarCap: (json["floatMarCap"] ?? 0.0).toDouble(),
      senFloatMarCap: (json["senFloatMarCap"] ?? 0.0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        "businessDate": businessDate != null
            ? "${businessDate!.year.toString().padLeft(4, '0')}-${businessDate!.month.toString().padLeft(2, '0')}-${businessDate!.day.toString().padLeft(2, '0')}"
            : null,
        "marCap": marCap,
        "senMarCap": senMarCap,
        "floatMarCap": floatMarCap,
        "senFloatMarCap": senFloatMarCap,
      };

  static List<DatewiseMarketCapModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList
        .map((json) => DatewiseMarketCapModel.fromJson(json))
        .toList();
  }
}
