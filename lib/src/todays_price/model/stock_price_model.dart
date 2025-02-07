class StockPriceModel {
  StockPriceModel({
    required this.content,
    required this.pageable,
    required this.totalPages,
    required this.totalElements,
    required this.last,
    required this.number,
    required this.size,
    required this.numberOfElements,
    required this.sort,
    required this.first,
    required this.empty,
  });

  final List<Content> content;
  final Pageable? pageable;
  final int totalPages;
  final int totalElements;
  final bool last;
  final int number;
  final int size;
  final int numberOfElements;
  final Sort? sort;
  final bool first;
  final bool empty;

  factory StockPriceModel.fromJson(Map<String, dynamic> json) {
    return StockPriceModel(
      content: json["content"] == null
          ? []
          : List<Content>.from(
              json["content"]!.map((x) => Content.fromJson(x))),
      pageable:
          json["pageable"] == null ? null : Pageable.fromJson(json["pageable"]),
      totalPages: json["totalPages"] ?? 0,
      totalElements: json["totalElements"] ?? 0,
      last: json["last"] ?? false,
      number: json["number"] ?? 0,
      size: json["size"] ?? 0,
      numberOfElements: json["numberOfElements"] ?? 0,
      sort: json["sort"] == null ? null : Sort.fromJson(json["sort"]),
      first: json["first"] ?? false,
      empty: json["empty"] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        "content": content.map((x) => x.toJson()).toList(),
        "pageable": pageable?.toJson(),
        "totalPages": totalPages,
        "totalElements": totalElements,
        "last": last,
        "number": number,
        "size": size,
        "numberOfElements": numberOfElements,
        "sort": sort?.toJson(),
        "first": first,
        "empty": empty,
      };


}

class Content {
  Content({
    required this.id,
    required this.businessDate,
    required this.securityId,
    required this.symbol,
    required this.securityName,
    required this.openPrice,
    required this.highPrice,
    required this.lowPrice,
    required this.closePrice,
    required this.totalTradedQuantity,
    required this.totalTradedValue,
    required this.previousDayClosePrice,
    required this.fiftyTwoWeekHigh,
    required this.fiftyTwoWeekLow,
    required this.lastUpdatedTime,
    required this.lastUpdatedPrice,
    required this.totalTrades,
    required this.averageTradedPrice,
    required this.marketCapitalization,
  });

  final dynamic id;
  final String businessDate;
  final int securityId;
  final String symbol;
  final String securityName;
  final double openPrice;
  final double highPrice;
  final double lowPrice;
  final dynamic closePrice;
  final int totalTradedQuantity;
  final double totalTradedValue;
  final double previousDayClosePrice;
  final double fiftyTwoWeekHigh;
  final double fiftyTwoWeekLow;
  final String lastUpdatedTime;
  final double lastUpdatedPrice;
  final int totalTrades;
  final double averageTradedPrice;
  final dynamic marketCapitalization;

  factory Content.fromJson(Map<String, dynamic> json) {
    return Content(
      id: json["id"],
      businessDate: json["businessDate"] ?? "",
      securityId: json["securityId"] ?? 0,
      symbol: json["symbol"] ?? "",
      securityName: json["securityName"] ?? "",
      openPrice: (json["openPrice"] ?? 0.0).toDouble(),
      highPrice: (json["highPrice"] ?? 0.0).toDouble(),
      lowPrice: (json["lowPrice"] ?? 0.0).toDouble(),
      closePrice: json["closePrice"],
      totalTradedQuantity: json["totalTradedQuantity"] ?? 0,
      totalTradedValue: (json["totalTradedValue"] ?? 0.0).toDouble(),
      previousDayClosePrice: (json["previousDayClosePrice"] ?? 0.0).toDouble(),
      fiftyTwoWeekHigh: (json["fiftyTwoWeekHigh"] ?? 0.0).toDouble(),
      fiftyTwoWeekLow: (json["fiftyTwoWeekLow"] ?? 0.0).toDouble(),
      lastUpdatedTime: json["lastUpdatedTime"] ?? "",
      lastUpdatedPrice: (json["lastUpdatedPrice"] ?? 0.0).toDouble(),
      totalTrades: json["totalTrades"] ?? 0,
      averageTradedPrice: (json["averageTradedPrice"] ?? 0.0).toDouble(),
      marketCapitalization: json["marketCapitalization"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "businessDate": businessDate,
        "securityId": securityId,
        "symbol": symbol,
        "securityName": securityName,
        "openPrice": openPrice,
        "highPrice": highPrice,
        "lowPrice": lowPrice,
        "closePrice": closePrice,
        "totalTradedQuantity": totalTradedQuantity,
        "totalTradedValue": totalTradedValue,
        "previousDayClosePrice": previousDayClosePrice,
        "fiftyTwoWeekHigh": fiftyTwoWeekHigh,
        "fiftyTwoWeekLow": fiftyTwoWeekLow,
        "lastUpdatedTime": lastUpdatedTime,
        "lastUpdatedPrice": lastUpdatedPrice,
        "totalTrades": totalTrades,
        "averageTradedPrice": averageTradedPrice,
        "marketCapitalization": marketCapitalization,
      };

  static List<Content> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Content.fromJson(json)).toList();
  }
}

class Pageable {
  Pageable({
    required this.sort,
    required this.pageSize,
    required this.pageNumber,
    required this.offset,
    required this.paged,
    required this.unpaged,
  });

  final Sort? sort;
  final int pageSize;
  final int pageNumber;
  final int offset;
  final bool paged;
  final bool unpaged;

  factory Pageable.fromJson(Map<String, dynamic> json) {
    return Pageable(
      sort: json["sort"] == null ? null : Sort.fromJson(json["sort"]),
      pageSize: json["pageSize"] ?? 0,
      pageNumber: json["pageNumber"] ?? 0,
      offset: json["offset"] ?? 0,
      paged: json["paged"] ?? false,
      unpaged: json["unpaged"] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        "sort": sort?.toJson(),
        "pageSize": pageSize,
        "pageNumber": pageNumber,
        "offset": offset,
        "paged": paged,
        "unpaged": unpaged,
      };
}

class Sort {
  Sort({
    required this.sorted,
    required this.unsorted,
    required this.empty,
  });

  final bool sorted;
  final bool unsorted;
  final bool empty;

  factory Sort.fromJson(Map<String, dynamic> json) {
    return Sort(
      sorted: json["sorted"] ?? false,
      unsorted: json["unsorted"] ?? false,
      empty: json["empty"] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        "sorted": sorted,
        "unsorted": unsorted,
        "empty": empty,
      };
}
