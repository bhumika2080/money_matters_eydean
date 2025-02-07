class APIInfo {
  APIInfo._();

  factory APIInfo() {
    return _singleton;
  }

  static final APIInfo _singleton = APIInfo._();

  String get baseUrl => "http://139.59.41.77:81/api/";

  ///
  String get dailyTradeStat => "daily_trade_stat";
  String get topGainer => "top_gainers";
  String get topLosers => "top_losers";
  String get floorsheet => "floorsheet";
  String get companyList => "company_list";
  String get marketSummary => "market_summary";
  String get stockPrice => "todays_price";
  String get sectorwiseOptions => "sectorwise_options";
  String get marketStatus => "market_status";
  String get topTurnover => "top_turnover";
  String get topTransaction => "top_transaction";
  String get topSharesTraded => "top_volume";
  String get datewiseMarketSummary => "market_history";
  String get datewiseMarketCap => "market_capitilization_by_date";

  /// CHART
  String get graphDataIndex => "graph_data_index";
}
