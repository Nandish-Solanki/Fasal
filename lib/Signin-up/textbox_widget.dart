import 'package:flutter/material.dart';

class TextboxWidget extends StatefulWidget {
  
  String text;
   TextboxWidget({super.key, required this.text});

  @override
  State<TextboxWidget> createState() => _TextboxWidgetState();
}

class _TextboxWidgetState extends State<TextboxWidget> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width * 0.95,
      height: screenSize.height * 0.05,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Text(this.widget.text)
        ],
      ),
    );
  }
}
