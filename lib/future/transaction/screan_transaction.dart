import 'package:flutter/material.dart';

import 'widget/header.dart';
import 'widget/transaction_item.dart';

class ScreanTransaction extends StatelessWidget {
  const ScreanTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(33, 0, 14, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(),
            const SizedBox(height: 5),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                    children: List.generate(
                        10,
                        (index) => const TransactionItem(
                              title: 'Build Personal Branding',
                              subtitle: 'Web Designer',
                            ))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
