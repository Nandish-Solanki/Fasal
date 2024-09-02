import 'package:flutter/material.dart';
import '../Widget/Background.dart';
import '../Widget/Screen.dart';
import 'screen3.dart';
import 'screen5.dart';

class Screen4 extends StatelessWidget {
  const Screen4({super.key});

  @override
  Widget build(BuildContext context) {
    return Screen(
      screenNumber: 4,
      nextScreen: Screen5(),
      backScreen: Screen3(),
      backgroundColor: const Color.fromARGB(255, 254, 254, 183),
      bubbles: [
        Bubble(
          color: const Color.fromARGB(255, 247, 247, 106).withOpacity(0.6), 
          size: MediaQuery.of(context).size.height * 0.5, 
          alignment: Alignment.topRight
        ),
        Bubble(
          color: const Color.fromARGB(255, 247, 247, 106).withOpacity(0.6), 
          size: MediaQuery.of(context).size.height * 0.50, 
          alignment: Alignment.bottomLeft
          ),
      ],
      title: null,
      titleSize: 0,
      text: "Seamless crop management, right from your pocket.",
      textSize: MediaQuery.of(context).size.width*0.08,
      startOffset: Offset(1.0, -0.5), 
      endOffset: Offset(-0.01, 0.4), 
      finalOffset: Offset(-0.01, 0.4),
    );
  }
}
