import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:moneymatter/core/constants/screen_constants.dart';
import 'package:moneymatter/core/core.dart';
import 'package:moneymatter/shared_provider/shared_state_provider.dart';
import 'package:moneymatter/src/todays_price/todays_price.dart';

import '../market_summary/market_summary.dart';
import '../marketstatus/marketstatus.dart';
import '../top/top.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    loadDatas();
  }

  loadDatas() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await ref.watch(marketStatusProvider.future);
      await ref.watch(fetchTopGainer.future);
      await ref.watch(fetchTopLoser.future);
      await ref.watch(fetchMarketSummary.future);
      await ref.watch(fetchStockPrice.future);
      kHasPremium = ref.watch(premiumStateNotifier);
      await navigate();
    });
  }

  navigate() async {
    context.go(AppRoute().homeScreen);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Money Matter")),
    );
  }
}
