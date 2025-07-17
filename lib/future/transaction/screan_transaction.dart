import 'package:flutter/material.dart';

import 'widget/header.dart';
import 'widget/transaction_item.dart';

class ScreanTransaction extends StatelessWidget {
  const ScreanTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Header(),
          const SizedBox(height: 5),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    children: List.generate(
                        10,
                        (index) => const TransactionItem(
                              title: 'Build Personal Branding',
                              subtitle: 'Web Designer',
                            ))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
