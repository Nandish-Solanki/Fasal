import 'package:flutter/material.dart';
import '../Widget/Background.dart';
import '../Widget/Screen.dart';
import 'screen1.dart';
import 'screen3.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Screen(
      screenNumber: 2,
      nextScreen:  Screen3(),
      backScreen: Screen1(),
      backgroundColor: const Color.fromARGB(255, 245, 189, 189),
      bubbles: [
        Bubble(
          color: const Color.fromARGB(255, 243, 144, 144).withOpacity(0.6),
          size: MediaQuery.of(context).size.height * 0.5, 
          alignment: Alignment.topRight
        ),
        Bubble(
          color: const Color.fromARGB(255, 243, 144, 144).withOpacity(0.6), 
          size: MediaQuery.of(context).size.height * 0.5, 
          alignment: Alignment.bottomLeft
        ),
      ],
      title: null,
      titleSize: 0,
      text: "Farming just got a whole  lot easier- welcome to your new favourite tool.",
      textSize: MediaQuery.of(context).size.width*0.08,
      startOffset: Offset(1.0, 1.0), 
      endOffset: Offset(-0.01, 0.5), 
      finalOffset: Offset(-0.01, 0.5), child: null,
    );
  }
}
