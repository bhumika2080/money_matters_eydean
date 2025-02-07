class AppRoute {
  AppRoute._();

  static final AppRoute _singleton = AppRoute._();
  factory AppRoute() => _singleton;

  //bottom navigation
  String get portfolioScreen => "/PortfolioScreen";
  String get portfolioSettingsScreen => "/PortfolioSettingsScreen";
  String get profileScreen => "/ProfileScreen";

  String get premiumPurchaseScreen => "/PremiumPurchaseScreen";

  ///
  // String get splashScreen => "SplashScreen";
  String get splashScreen => "/";
  String get homeScreen => "/HomeScreen";

  String get dailyTradeScreen => "/DailyTradeScreen";
  String get moreServiceScreen => "/MoreServiceScreen";
  String get searchMoreService => "/SearchMoreService";

  ///
  String get watchlistScreen => "/WatchListScreen";
  String get addStockScreen => "/AddStockScreen";

  ///
  String get topGainerScreen => "/TopGainerScreen";
  String get topLoserScreen => "/TopLoserScreen";
  String get floorSheetScreen => "/FloorSheetScreen";
  String get companyListScreen => "/CompanyListScreen";
  String get companyDetailScreen => "/CompanyDetailScreen";
  String get stockPriceScreen => "/StockPriceScreen";
  String get brokerListScreen => "/BrokerListScreen";
  String get sectorWiseSummaryScreen => "/SectorWiseSummaryScreen";
  String get stockPriceTabsScreen => "/StockPriceTabScreen";

  ///
  String get topTradersScreen => "/TopTradersScreen";
  String get topTransactionScreen => "/TopTransactionScreen";
  String get topTurnoverScreen => "/TopTurnoverScreen";
  String get topSharesTradedScreen => "/TopSharesTradedScreen";

  ///
  String get datewiseMarketCapScreen => "/DatewiseMarketCapScreen";
  String get dateWiseIndices => "/DateWiseIndicesScreen";

  ///
  String get webviewScreen => "/WebviewScreen";
  String get forexScreen => "/ForexScreen";
  String get datewiseMarketSummary => "/DatewiseMarketSummary";
  // String get
}
