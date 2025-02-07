import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moneymatter/core/constants/screen_constants.dart';
import 'package:moneymatter/shared_provider/shared_state_provider.dart';
import 'package:moneymatter/src/home/components/stock_price_section.dart';

import '../../core/core.dart';
import '../charts/chart_screen.dart';
import '../market_summary/market_summary.dart';
import '../marketstatus/marketstatus.dart';
import 'components/bottom_sheet_section.dart';
import 'components/top_five_section.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool hasPremium = ref.watch(premiumStateNotifier);

    // final loadingNotifier = ref.read(loadingStateProvider.notifier);
    // loadingNotifier.startLoading();

    // ref.watch(marketStatusProvider);
    // ref.watch(fetchTopGainer);
    // ref.watch(fetchTopLoser);
    // ref.watch(fetchMarketSummary);

    // loadingNotifier.stopLoading();

    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard"), actions: [
        IconButton(
          icon: Icon(
            hasPremium ? Icons.diamond : Icons.disabled_by_default,
          ),
          onPressed: () {
            kHasPremium =
                ref.read(premiumStateNotifier.notifier).changePremium();
          },
        ),
      ]),
      body: _buildBodyDetails(),
      bottomNavigationBar: const BottomSheetSection(),
    );
  }

  Widget _buildBodyDetails() {
    return ListView(
      children: [
        10.xGap,
        const MarketStatusScreen(),
        const StockPriceSection(),
        const IndexChart(),
        const TopFiveSection(),
        const MarketSummary(),
      ],
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:moneymatter/core/utils/loading_notifier.dart';

// import '../../core/core.dart';
// import '../charts/chart_screen.dart';
// import '../market_summary/market_summary.dart';
// import '../marketstatus/marketstatus.dart';
// import '../top/top.dart';
// import 'components/bottom_sheet_section.dart';
// import 'components/top_five_section.dart';

// class HomeScreen extends ConsumerWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final loadingNotifier = ref.read(loadingStateProvider.notifier);

//     // Call startLoading method outside of build
//     loadingNotifier.startLoading();

//     return Scaffold(
//       appBar: AppBar(title: const Text("Dashboard")),
//       body: FutureBuilder(
//         future: _loadData(ref),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else {
//             // Call stopLoading method outside of build
//             loadingNotifier.stopLoading();
//             return _buildBodyDetails();
//           }
//         },
//       ),
//       bottomNavigationBar: const BottomSheetSection(),
//     );
//   }

//   Future<void> _loadData(WidgetRef ref) async {
//     ref.watch(marketStatusProvider);
//     ref.watch(fetchTopGainer);
//     ref.watch(fetchTopLoser);
//     ref.watch(fetchMarketSummary);
//   }

//   Widget _buildBodyDetails() {
//     return ListView(
//       children: [
//         10.xGap,
//         const MarketStatusScreen(),
//         const IndexChart(),
//         const TopFiveSection(),
//         const MarketSummary(),
//       ],
//     );
//   }
// }
