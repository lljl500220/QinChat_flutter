import 'package:flutter/cupertino.dart';

class ScaleAndSlideRoute extends PageRouteBuilder {
  final Widget page;

  ScaleAndSlideRoute({required this.page})
      : super(
          transitionDuration: const Duration(milliseconds: 300),
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // Tween for offset animation
            var scaleTween = Tween(begin: 0.0, end: 1.0);

            // Using CurveTween to adjust animation's curve
            var curveTween = CurveTween(curve: Curves.easeInOut);

            // Driving the tween with the animation
            var scaleAnimation = animation.drive(curveTween).drive(scaleTween );

            return ScaleTransition(
              scale: scaleAnimation,
              alignment: Alignment.center,
              child: child,
            );
          },
        );
}
