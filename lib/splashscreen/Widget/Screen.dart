import 'package:flutter/material.dart';

import '../Models/Navigation.dart';
import 'Animation.dart';
import 'Background.dart';


class Screen extends StatelessWidget {
  final int screenNumber;
  final Widget? nextScreen;
  final Widget? backScreen;
  final Color backgroundColor; 
  final List<Bubble> bubbles;
  final String? title; 
  final String text; 
  final double titleSize; 
  final double textSize;
  final Offset startOffset;
  final Offset endOffset;
  final Offset finalOffset;


  Screen({
    required this.screenNumber,
    required this.nextScreen,
    required this.backScreen,
    required this.backgroundColor,
    required this.bubbles,
    this.title, 
    required this.text, 
    required this.titleSize, 
    required this.textSize,
    required this.startOffset,
    required this.endOffset,
    required this.finalOffset, required child,
   
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        fit: StackFit.expand,
        children: [
          CustomBackground(
            backgroundColor: backgroundColor,
            bubbles: bubbles,
          ),
          Align(
             alignment: Alignment.center,
              child: AnimatedText(
                text: text,
                textSize: textSize,
                titleSize: titleSize,
                title: title,
                startOffset: startOffset,
                endOffset: endOffset,
                finalOffset: finalOffset,
              ),
            ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Visibility(
                visible: backScreen != null,
                child: ElevatedButton(
                    child: Text('Back'),
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.black),
                      foregroundColor: WidgetStateProperty.all(Colors.white),
                    ),
                    onPressed: () {
                      navigateToPreviousScreen(context);
                    },
                  )
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Visibility(
                visible: nextScreen != null,
                child: ElevatedButton(
                    child: Text('Next'),
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.black),
                      foregroundColor: WidgetStateProperty.all(Colors.white),
                    ),
                    onPressed: () {
                      navigateToNextScreen(context, nextScreen!);
                    },
                  )
                ),
            ),
          ),
        ],
      ),
    );
  }
}
