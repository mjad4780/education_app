import 'package:flutter/material.dart';

enum RouteTransitionType {
  fade,
  slideRight,
  slideLeft,
  slideUp,
  slideDown,
  scale,
  rotation,
  size,
}

class BaseRoute extends PageRouteBuilder {
  final Widget page;
  final RouteTransitionType transitionType;

  BaseRoute({
    required this.page,
    this.transitionType = RouteTransitionType.fade,
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          // Increase the duration to make animations slower and smoother
          transitionDuration: const Duration(milliseconds: 700),
          reverseTransitionDuration: const Duration(milliseconds: 700),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = 0.0;
            const end = 1.0;
            // Use a smoother curve for better animation feel
            const curve = Curves.easeInOutCubic;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            Tween<Offset> offsetTween;

            switch (transitionType) {
              case RouteTransitionType.fade:
                return FadeTransition(
                  opacity: animation.drive(tween),
                  child: child,
                );
              case RouteTransitionType.slideRight:
                offsetTween =
                    Tween(begin: const Offset(-1, 0), end: Offset.zero);
                return SlideTransition(
                  position: animation
                      .drive(offsetTween.chain(CurveTween(curve: curve))),
                  child: child,
                );
              case RouteTransitionType.slideLeft:
                offsetTween =
                    Tween(begin: const Offset(1, 0), end: Offset.zero);
                return SlideTransition(
                  position: animation
                      .drive(offsetTween.chain(CurveTween(curve: curve))),
                  child: child,
                );
              case RouteTransitionType.slideUp:
                offsetTween =
                    Tween(begin: const Offset(0, -1), end: Offset.zero);
                return SlideTransition(
                  position: animation
                      .drive(offsetTween.chain(CurveTween(curve: curve))),
                  child: child,
                );
              case RouteTransitionType.slideDown:
                offsetTween =
                    Tween(begin: const Offset(0, 1), end: Offset.zero);
                return SlideTransition(
                  position: animation
                      .drive(offsetTween.chain(CurveTween(curve: curve))),
                  child: child,
                );
              case RouteTransitionType.scale:
                return ScaleTransition(
                  scale: animation.drive(tween),
                  child: child,
                );
              case RouteTransitionType.rotation:
                // Reduce rotation to make it less jarring
                final rotationTween =
                    Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve));
                return RotationTransition(
                  turns: animation.drive(rotationTween),
                  child: FadeTransition(
                    opacity: animation.drive(tween),
                    child: child,
                  ),
                );
              case RouteTransitionType.size:
                return SizeTransition(
                  sizeFactor: animation.drive(tween),
                  axisAlignment: 0.0,
                  child: FadeTransition(
                    opacity: animation.drive(tween),
                    child: child,
                  ),
                );
            }
          },
        );
}
