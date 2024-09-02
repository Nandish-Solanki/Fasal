import 'package:flutter/material.dart';

class Bubble {
  final Color color;
  final double size;
  final Alignment alignment;

  Bubble({
    required this.color,
    required this.size,
    required this.alignment,
  });
}

class CustomBackground extends StatelessWidget {
  final Color backgroundColor;
  final List<Bubble> bubbles;

  CustomBackground({
    required this.backgroundColor,
    required this.bubbles,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      color: backgroundColor,
      child: Stack(
        children: bubbles.map((bubble) {
          double left = 0.0;
          double top = 0.0;

          switch (bubble.alignment) {
            case Alignment.topRight:
              left = size.width - bubble.size / 2;
              top = -bubble.size / 2;
              break;
            case Alignment.topLeft:
              left = -bubble.size / 2;
              top = -bubble.size / 2;
              break;
            case Alignment.bottomRight:
              left = size.width - bubble.size / 2;
              top = size.height - bubble.size / 2;
              break;
            case Alignment.bottomLeft:
              left = -bubble.size / 2;
              top = size.height - bubble.size / 2;
              break;
            default:
              left = size.width / 2 - bubble.size / 2;
              top = size.height / 2 - bubble.size / 2;
              break;
          }

          return Positioned(
            left: left,
            top: top,
            child: Container(
              width: bubble.size,
              height: bubble.size,
              decoration: BoxDecoration(
                color: bubble.color,
                shape: BoxShape.circle,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

