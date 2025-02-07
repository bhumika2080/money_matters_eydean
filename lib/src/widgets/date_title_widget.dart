import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:moneymatter/core/themes/colors.dart';
import 'package:moneymatter/core/themes/text_style.dart';

class DateTitleWidget extends ConsumerWidget {
  const DateTitleWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todayDate = ref.watch(realTimeDateProvider);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title),
        Text(
          todayDate,
          style: AppTextStyle().kSubTitleText.copyWith(
                color: AppColors().white,
              ),
        )
      ],
    );
  }
}

class RealTimeDateNotifier extends StateNotifier<String> {
  late Timer _timer;

  RealTimeDateNotifier() : super(_getCurrentFormattedDate()) {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      state = _getCurrentFormattedDate();
    });
  }

  static String _getCurrentFormattedDate() {
    return DateFormat("EEE, M/d/yyyy h:mm:ss a").format(DateTime.now());
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

final realTimeDateProvider =
    StateNotifierProvider<RealTimeDateNotifier, String>((ref) {
  return RealTimeDateNotifier();
});
