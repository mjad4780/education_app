import 'package:education/core/Router/route_string.dart';
import 'package:education/future/onboarding/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'base_routes.dart';

class AppRoutes {
  static Route<void> onGenerateRoute(RouteSettings settings) {
    // final args = settings.arguments;
    switch (settings.name) {
      case StringRoute.onBoarding:
        return BaseRoute(
          page: const OnboardingView(),
        );

      default:
        return BaseRoute(page: const Scaffold());
    }
  }
}
