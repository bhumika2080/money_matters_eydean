class FloorSheetModel {
  FloorSheetModel({
    required this.totalAmount,
    required this.totalQty,
    required this.floorsheets,
    required this.totalTrades,
  });

  final double totalAmount;
  final int totalQty;
  final Floorsheets? floorsheets;
  final int totalTrades;

  factory FloorSheetModel.fromJson(Map<String, dynamic> json) {
    return FloorSheetModel(
      totalAmount: (json["totalAmount"] ?? 0.0).toDouble(),
      totalQty: json["totalQty"] ?? 0,
      floorsheets: json["floorsheets"] == null
          ? null
          : Floorsheets.fromJson(json["floorsheets"]),
      totalTrades: json["totalTrades"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "totalAmount": totalAmount,
        "totalQty": totalQty,
        "floorsheets": floorsheets?.toJson(),
        "totalTrades": totalTrades,
      };
}

class Floorsheets {
  Floorsheets({
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

  factory Floorsheets.fromJson(Map<String, dynamic> json) {
    return Floorsheets(
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
    required this.contractId,
    required this.contractType,
    required this.stockSymbol,
    required this.buyerMemberId,
    required this.sellerMemberId,
    required this.contractQuantity,
    required this.contractRate,
    required this.contractAmount,
    required this.businessDate,
    required this.tradeBookId,
    required this.stockId,
    required this.buyerBrokerName,
    required this.sellerBrokerName,
    required this.tradeTime,
    required this.securityName,
  });

  final dynamic id;
  final int contractId;
  final dynamic contractType;
  final String stockSymbol;
  final String buyerMemberId;
  final String sellerMemberId;
  final int contractQuantity;
  final double contractRate;
  final double contractAmount;
  final String businessDate;
  final int tradeBookId;
  final int stockId;
  final String buyerBrokerName;
  final String sellerBrokerName;
  final String tradeTime;
  final String securityName;

  factory Content.fromJson(Map<String, dynamic> json) {
    return Content(
      id: json["id"],
      contractId: json["contractId"] ?? 0,
      contractType: json["contractType"],
      stockSymbol: json["stockSymbol"] ?? "",
      buyerMemberId: json["buyerMemberId"] ?? "",
      sellerMemberId: json["sellerMemberId"] ?? "",
      contractQuantity: json["contractQuantity"] ?? 0,
      contractRate: (json["contractRate"] ?? 0.0).toDouble(),
      contractAmount: (json["contractAmount"] ?? 0.0).toDouble(),
      businessDate: json["businessDate"] ?? "",
      tradeBookId: json["tradeBookId"] ?? 0,
      stockId: json["stockId"] ?? 0,
      buyerBrokerName: json["buyerBrokerName"] ?? "",
      sellerBrokerName: json["sellerBrokerName"] ?? "",
      tradeTime: json["tradeTime"] ?? "",
      securityName: json["securityName"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "contractId": contractId,
        "contractType": contractType,
        "stockSymbol": stockSymbol,
        "buyerMemberId": buyerMemberId,
        "sellerMemberId": sellerMemberId,
        "contractQuantity": contractQuantity,
        "contractRate": contractRate,
        "contractAmount": contractAmount,
        "businessDate": businessDate,
        "tradeBookId": tradeBookId,
        "stockId": stockId,
        "buyerBrokerName": buyerBrokerName,
        "sellerBrokerName": sellerBrokerName,
        "tradeTime": tradeTime,
        "securityName": securityName,
      };
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
