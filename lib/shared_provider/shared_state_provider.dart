import 'package:moneymatter/core/core.dart';
import 'package:riverpod/riverpod.dart';

class SharedStateProvider extends StateNotifier<bool> {
  SharedStateProvider() : super(true);

  void changeAscending() {
    state = !state;
    customLog('$state');
    return;
  }
}

final sharedStateProvider = StateNotifierProvider<SharedStateProvider, bool>(
    (ref) => SharedStateProvider());

class PremiumStateNotifier extends StateNotifier<bool> {
  PremiumStateNotifier() : super(false);

  bool changePremium() {
    state = !state;
    customLog('new premium value : $state');
    return state;
  }
}

final premiumStateNotifier = StateNotifierProvider<PremiumStateNotifier, bool>(
    (ref) => PremiumStateNotifier());
