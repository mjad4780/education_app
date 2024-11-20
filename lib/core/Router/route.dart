import 'package:education/core/Router/route_string.dart';
import 'package:education/future/auth/login/login_screan.dart';
import 'package:education/future/onboarding/onboarding_view.dart';
import 'package:flutter/material.dart';
import '../../future/auth/sign up/sign_up.dart';
import 'base_routes.dart';

class AppRoutes {
  static Route<void> onGenerateRoute(RouteSettings settings) {
    // final args = settings.arguments;
    switch (settings.name) {
      case StringRoute.onBoarding:
        return BaseRoute(
          page: const OnboardingView(),
        );

      case StringRoute.login:
        return BaseRoute(
          page: const LoginScrean(),
        );
      case StringRoute.signUp:
        return BaseRoute(
          page: const SignUpScreen(),
        );
      case StringRoute.checkcode:
        return BaseRoute(
          page: const LoginScrean(),
        );
      default:
        return BaseRoute(page: const Scaffold());
    }
  }
}
