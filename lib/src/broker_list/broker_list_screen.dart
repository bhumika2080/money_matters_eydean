import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moneymatter/core/core.dart';

class BrokerListScreen extends ConsumerWidget {
  const BrokerListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("Brokers")),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return _buildBrokerInfo(index);
        },
      ),
    );
  }

  Widget _buildBrokerInfo(int index) {
    return Container(
      decoration: BoxDecoration(
        color: index % 2 == 0 ? AppColors().kTableColor : AppColors().white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Kumari Securities Private Limited",
                  style: AppTextStyle().kMenuTextStyle,
                ),
                5.xGap,
                Text(
                  "tms01.nepsetms.com.np",
                  style: AppTextStyle().kNormalText,
                ),
              ],
            ),
          ),

          ///
          Flexible(
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_border_rounded),
            ),
          ),

          ///
          Flexible(
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.call,
                color: AppColors().green,
              ),
            ),
          )

          ///
        ],
      ).paddingSymmetric(10.0, 20.0),
    );
  }
}
