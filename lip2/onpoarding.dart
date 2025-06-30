import 'package:flutter/material.dart';

class ModelOnBoarding {
  final String title, desc;

  ModelOnBoarding(this.title, this.desc);
}

List<ModelOnBoarding> onboarding = [
  ModelOnBoarding('title', ''),
  ModelOnBoarding('title', ''),
  ModelOnBoarding('title', '')
];

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
