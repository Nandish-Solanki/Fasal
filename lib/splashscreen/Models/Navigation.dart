import 'package:flutter/material.dart';

void navigateToNextScreen(BuildContext context, Widget screen) {
  Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.linear;
        var tween = Tween(
          begin: begin, 
          end: end
          ).chain(
            CurveTween(
              curve: curve
            )
          );
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(position: offsetAnimation, child: child);
      },
    ),
  );
}

void navigateToPreviousScreen(BuildContext context) {
  Navigator.pop(context);
}
