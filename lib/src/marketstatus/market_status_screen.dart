import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moneymatter/core/core.dart';

import 'repository/market_status_repository.dart';

class MarketStatusScreen extends ConsumerWidget {
  const MarketStatusScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final marketStatus = ref.watch(marketStatusInfo);
    return marketStatus.isOpen.isNotEmpty
        ? Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: AppColors().kBorderColor),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    longDateFormat(marketStatus.asOf),
                    style: AppTextStyle().kTitleText,
                    textAlign: TextAlign.start,
                  ).paddingLeft(10.0),
                ),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 2,
                        child: Chip(
                          label: Text(
                            marketStatus.isOpen,
                            style: AppTextStyle().kButtonText.copyWith(
                                  color: AppColors().white,
                                ),
                          ),
                          backgroundColor: marketStatus.isOpen == "CLOSE"
                              ? AppColors().red
                              : AppColors().green,
                        ),
                      ),
                      Flexible(
                        child: IconButton(
                          onPressed: () {
                            return ref.refresh(marketStatusProvider);
                          },
                          icon: const Icon(Icons.refresh),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ).paddingSymmetric(10.0)
        : const SizedBox.shrink();
  }
}
