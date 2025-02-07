import 'package:go_router/go_router.dart';
import 'package:moneymatter/src/broker_list/broker_list.dart';
import 'package:moneymatter/src/company_detail/company_detail_screen.dart';
import 'package:moneymatter/src/company_list/company_list.dart';
import 'package:moneymatter/src/datewise_indices/datewise_indices.dart';
import 'package:moneymatter/src/datewise_market_cap/datewise_market_cap.dart';
import 'package:moneymatter/src/datewise_market_summary/ui/datewise_market_summary_screen.dart';
import 'package:moneymatter/src/forex/forex.dart';
import 'package:moneymatter/src/home/home.dart';
import 'package:moneymatter/src/portfolio/portfolio.dart';
import 'package:moneymatter/src/premium_screen/premium_purchase_screen.dart';
import 'package:moneymatter/src/profile/profile.dart';
import 'package:moneymatter/src/sectorwise_summary/sectorwise_summary.dart';
import 'package:moneymatter/src/top/top.dart';
import 'package:moneymatter/src/top_traders/top_traders.dart';
import 'package:moneymatter/src/widgets/widgets.dart';
import 'package:riverpod/riverpod.dart';

import '../../src/daily_trade/daily_trade.dart';
import '../../src/floorsheet/floorsheet.dart';
import '../../src/more_service/more_service.dart';
import '../../src/splash/splash.dart';
import '../../src/todays_price/todays_price.dart';
import 'route_name.dart';

final routeProvider = Provider<GoRouter>(
  (ref) {
    final router = GoRouter(
      routes: [
        GoRoute(
          path: AppRoute().splashScreen,
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: AppRoute().homeScreen,
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: AppRoute().premiumPurchaseScreen,
          builder: (context, state) => const PremiumPurchaseScreen(),
        ),
        GoRoute(
          path: AppRoute().portfolioScreen,
          builder: (context, state) => const PortfolioScreen(),
        ),
        GoRoute(
          path: AppRoute().portfolioSettingsScreen,
          builder: (context, state) => const PortfolioSettingsScreen(),
        ),
        GoRoute(
          path: AppRoute().profileScreen,
          builder: (context, state) => const ProfileScreen(),
        ),
        GoRoute(
          path: AppRoute().watchlistScreen,
          builder: (context, state) => const WatchlistScreen(),
        ),
        GoRoute(
          path: AppRoute().addStockScreen,
          builder: (context, state) => const AddStockScreen(),
        ),
        GoRoute(
          path: AppRoute().dailyTradeScreen,
          builder: (context, state) => const DailyTradeScreen(),
        ),
        GoRoute(
          path: AppRoute().moreServiceScreen,
          builder: (context, state) => const MoreServiceScreen(),
        ),
        GoRoute(
          path: AppRoute().topGainerScreen,
          builder: (context, state) => const TopGainerScreen(),
        ),
        GoRoute(
          path: AppRoute().topLoserScreen,
          builder: (context, state) => const TopLoserScreen(),
        ),
        GoRoute(
          path: AppRoute().floorSheetScreen,
          builder: (context, state) => const FloorSheetScreen(),
        ),
        GoRoute(
          path: AppRoute().companyListScreen,
          builder: (context, state) => const CompanyListScreen(),
        ),
        GoRoute(
          path: AppRoute().companyDetailScreen,
          builder: (context, state) => const CompanyDetailScreen(),
        ),
        GoRoute(
          path: AppRoute().searchMoreService,
          builder: (context, state) => const SearchMoreService(),
        ),
        GoRoute(
          path: AppRoute().webviewScreen,
          builder: (context, state) => WebviewScreen(
            url: state.extra as String,
          ),
        ),
        GoRoute(
          path: AppRoute().stockPriceScreen,
          builder: (context, state) => const StockPriceScreen(),
        ),
        GoRoute(
          path: '${AppRoute().stockPriceTabsScreen}/:index',
          builder: (context, state) {
            final index = int.parse(state.pathParameters['index']!);
            return StockPriceTabsScreen(index: index);
          },
        ),
        GoRoute(
          path: AppRoute().brokerListScreen,
          builder: (context, state) => const BrokerListScreen(),
        ),
        GoRoute(
          path: AppRoute().sectorWiseSummaryScreen,
          builder: (context, state) => const SectorWiseSummaryScreen(),
        ),
        GoRoute(
          path: AppRoute().forexScreen,
          builder: (context, state) => const ForexScreen(),
        ),
        GoRoute(
          path: AppRoute().topTradersScreen,
          builder: (context, state) => const TopTradersScreen(),
        ),
        GoRoute(
          path: AppRoute().topTransactionScreen,
          builder: (context, state) => const TopTransactionScreen(),
        ),
        GoRoute(
          path: AppRoute().topTurnoverScreen,
          builder: (context, state) => const TopTurnoverScreen(),
        ),
        GoRoute(
          path: AppRoute().datewiseMarketCapScreen,
          builder: (context, state) => const DatewiseMarketCapScreen(),
        ),
        GoRoute(
          path: AppRoute().dateWiseIndices,
          builder: (context, state) => const DatewiseIndicesScreen(),
        ),
        GoRoute(
          path: AppRoute().datewiseMarketSummary,
          builder: (context, state) => const DatewiseMarketSummaryScreen(),
        )
      ],
    );
    return router;
  },
);
