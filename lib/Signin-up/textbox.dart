import 'package:flutter/material.dart';
// Textbox used in Sign_in_screen and Sign_up_screen
class Textbox extends StatefulWidget {
  String text;
  bool isPwd;
   Textbox({super.key, required this.text, required this.isPwd});

  @override
  State<Textbox> createState() => _TextboxState();
}

class _TextboxState extends State<Textbox> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller
        .dispose(); // Clean up the controller when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: screenSize.width*0.9,

          child: TextField(
            controller: _controller,
            obscureText: widget.isPwd,
            decoration:  InputDecoration(
              
              hintText: widget.text,
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide.none),
            ),
            
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
