// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'app/my_app.dart';

// void main() {
//   runApp(const ProviderScope(child: MainApp()));
// }

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moneymatter/core/core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/my_app.dart';

void main() {
  ///
  runZonedGuarded(
    () async {
      /// Dependency Injector
      // await configureDependencies();
      WidgetsFlutterBinding.ensureInitialized();
      // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
      // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

      /// Lock device orientation to portrait
      SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
      ).then((_) {
        ///  Load SharedPref before load My App Widget
        SharedPreferences.getInstance().then((value) async {
          // initPrefManager(value);
          runApp(
            const ProviderScope(
              // observers: [
              //   MyObserver(),
              // ],
              child: MainApp(),
            ),
          );
        });
      });
    },
    (error, stack) {
      // Handle any uncaught errors here
      customLog("Uncaught error: $error");
      customLog("Stack trace: $stack");
    },
  );
}
