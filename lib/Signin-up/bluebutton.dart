import 'package:flutter/material.dart';
// SIGN In and register button used in signup and signin screens
class Bluebutton extends StatefulWidget {
  String buttonText;
   Bluebutton({super.key, required this.buttonText});

  @override
  State<Bluebutton> createState() => _BluebuttonState();
}

class _BluebuttonState extends State<Bluebutton> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height * 0.08,
      width: screenSize.width * 0.9,
      decoration: const BoxDecoration(color: Colors.lightBlueAccent),
      child:  Center(
          child: Text(widget.buttonText
        ,
        style: TextStyle(fontSize: 30, color: Colors.white),
      )),
    );
  }
}
