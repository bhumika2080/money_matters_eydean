import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moneymatter/src/top_traders/top_transaction/ui/widgets/top_transaction_widget.dart';

class TopTransactionScreen extends StatelessWidget {
  const TopTransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return Scaffold(
            appBar: AppBar(
              title: const Text('Top Transaction'),
            ),
            body: const TopTransactionWidget());
      },
    );
  }
}
