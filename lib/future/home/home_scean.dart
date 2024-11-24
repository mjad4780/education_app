import 'package:flutter/material.dart';

class HomeScrean extends StatelessWidget {
  const HomeScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
            onTap: () async {
              // await AuthService.logout();
            },
            child: const Text('data1')),
      ),
    );
  }
}
