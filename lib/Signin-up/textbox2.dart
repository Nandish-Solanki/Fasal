import 'package:flutter/material.dart';
//textbox used in myprofile screen
class Textbox2 extends StatefulWidget {
  String category;
   Textbox2({super.key, required this.category});

  @override
  State<Textbox2> createState() => _Textbox2State();
}

class _Textbox2State extends State<Textbox2> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width*0.9,
      // height: 50,
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              // border: OutlineInputBorder(),
              hintText: widget.category,
            ),
          ),
          SizedBox(
                height: screenSize.height*0.02,
              ),
        ],
      ),
    );
  }
}
