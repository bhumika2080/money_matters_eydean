import 'package:connectivity_plus/connectivity_plus.dart';

import 'toast_ext.dart';

extension FunctionX on Function {
  Future<void> checkConncetion() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      await this();
    } else {
      "No internet connection".errorToast();
    }
  }

  Future<void> delayedOf({Duration? duration, int seconds = 3}) async {
    await Future.delayed(duration ?? Duration(seconds: seconds), () async {
      await this();
    });
  }
}
