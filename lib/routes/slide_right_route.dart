//实现一个flutter的路由，这个路由是一个滑动路由，这个路由的动画是从下滑动到上，这个路由的动画时间是300毫秒
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
            var scaleAnimation = animation.drive(curveTween).drive(scaleTween);

            return ScaleTransition(
              scale: scaleAnimation,
              alignment: Alignment.center,
              child: child,
            );
          },
        );
}
