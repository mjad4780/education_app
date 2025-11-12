import 'package:flutter/material.dart';

class ScreanTransaction extends StatelessWidget {
  const ScreanTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Center(
      child: Text('In the next new update'),
    )

        //  Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     const Header(),
        //     const SizedBox(height: 5),
        //     Expanded(
        //       child: SingleChildScrollView(
        //         child: Padding(
        //           padding: const EdgeInsets.all(8.0),
        //           child: Column(
        //               children: List.generate(
        //                   10,
        //                   (index) => const TransactionItem(
        //                         title: 'Build Personal Branding',
        //                         subtitle: 'Web Designer',
        //                       ))),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),

        );
  }
}
