import 'package:flutter/material.dart';
import '../Widget/Background.dart';
import '../Widget/Screen.dart';
import 'screen2.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});
  @override
  Widget build(BuildContext context) {
    return Screen(
      screenNumber: 1,
      nextScreen: Screen2(),
      backScreen: null,
      backgroundColor: const Color.fromARGB(255, 142, 244, 255),
      bubbles: [
        Bubble(
          color: const Color.fromARGB(255, 62, 209, 225).withOpacity(0.6),
          size: MediaQuery.of(context).size.height * 0.5,
          alignment: Alignment.topLeft,
        ),
        Bubble(
          color: const Color.fromARGB(255, 62, 209, 225).withOpacity(0.6),
          size: MediaQuery.of(context).size.height * 0.5,
          alignment: Alignment.bottomRight,
        ),
      ],
      title: "FASAL",
      titleSize: MediaQuery.of(context).size.width * 0.25,
      text: "where the journey begins",
      textSize: MediaQuery.of(context).size.width * 0.06,
      startOffset: const Offset(1.0, 0.0), 
      endOffset: const Offset(-0.1, 0.0), 
      finalOffset: const Offset(-0.1, 0.0), 
      );
  }
}
