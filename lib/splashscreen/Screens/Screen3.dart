import 'package:flutter/material.dart';
import '../Widget/Background.dart';
import '../Widget/Screen.dart';
import 'screen2.dart';
import 'screen4.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Screen(
      screenNumber: 3,
      nextScreen: Screen4(),
      backScreen: Screen2(),
      backgroundColor: const Color.fromARGB(255, 255, 228, 156),
      bubbles: [
        Bubble(
          color: const Color.fromARGB(255, 207, 173, 80).withOpacity(0.6), 
          size: MediaQuery.of(context).size.height * 0.5, 
          alignment: Alignment.topLeft
        ),
        Bubble(
          color: const Color.fromARGB(255, 207, 173, 80).withOpacity(0.6), 
          size: MediaQuery.of(context).size.height * 0.5,
          alignment: Alignment.bottomRight
          ),
      ],
      title: null,
      titleSize: 0,
      text: "From soil to market, we've got your back - meet your new farming partner.",
      textSize: MediaQuery.of(context).size.width*0.08,
      startOffset: Offset(-1.0, 1.0), 
      endOffset: Offset(0.01, 0.3), 
      finalOffset: Offset(0.01, 0.3)
    );
  }
}
