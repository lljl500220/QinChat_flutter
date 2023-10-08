//我需要在这个类中实现一个flutter的路由，这个路由是一个滑动路由，这个路由的动画是从右边滑动到左边，这个路由的动画时间是300毫秒

import 'package:flutter/cupertino.dart';

class SlideRightRoute extends PageRouteBuilder {
  final Widget page;
  SlideRightRoute({required this.page})
      : super(
            transitionDuration: const Duration(milliseconds: 300),
            pageBuilder: (context, animation, secondaryAnimation) => page,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              var tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
              var curveTween = CurveTween(curve: Curves.easeInOut);
              var offsetAnimation = animation.drive(curveTween).drive(tween);
              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            });
}