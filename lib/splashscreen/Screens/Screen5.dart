import 'package:fasal/firebase/signin.dart';
// import 'package:fasal/signin.dart';
import 'package:flutter/material.dart';
import '../Widget/Background.dart';
import '../Widget/Screen.dart';
import 'screen4.dart';

class Screen5 extends StatelessWidget {
  const Screen5({super.key});

  @override
  Widget build(BuildContext context) {
    return Screen(
      screenNumber: 5,
      nextScreen: AuthPage(), 
      backScreen: Screen4(),
      backgroundColor: const Color.fromARGB(255, 184, 248, 201),
      bubbles: [
        Bubble(
          color: const Color.fromARGB(255, 109, 248, 146).withOpacity(0.6), 
          size: MediaQuery.of(context).size.height * 0.5, 
          alignment: Alignment.topLeft
        ),
        Bubble(
          color: const Color.fromARGB(255, 109, 248, 146).withOpacity(0.6), 
          size: MediaQuery.of(context).size.height * 0.5, 
          alignment: Alignment.bottomRight
        ),
      ],
      title: null,
      titleSize: 0,
      text: "Grow smarter,not harder: Your farming companion is here",
      textSize: MediaQuery.of(context).size.width*0.08,
      startOffset: Offset(-1.5, -1.0), 
      endOffset: Offset(0.02, 0.3), 
      finalOffset: Offset(0.02, 0.3)
    );
  }
}
