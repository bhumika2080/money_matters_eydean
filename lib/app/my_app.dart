import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moneymatter/core/constants/screen_constants.dart';

import '../core/core.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final routerConfig = ref.watch(routeProvider);

          return MaterialApp.router(
            routerConfig: routerConfig,
            debugShowCheckedModeBanner: false,
            scrollBehavior: const ScrollBehavior().copyWith(
              physics: const BouncingScrollPhysics(),
            ),
            theme: ThemeData(
              useMaterial3: false,
              primaryColor: AppColors().primaryColor,
              primarySwatch: AppColors().primaryColor,
              appBarTheme: const AppBarTheme(elevation: 0.0, centerTitle: true),
            ),
          );
        },
      ),
    );
  }
}
