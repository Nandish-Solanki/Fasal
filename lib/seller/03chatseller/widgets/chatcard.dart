import 'package:flutter/material.dart';
import 'package:fasal/seller/03chatseller/pages/chatwithbuyer.dart';

class Chatcard extends StatefulWidget {
  final String fname;
  final String fimgpath;
  const Chatcard({super.key,
  required this.fimgpath,
  required this.fname});


  @override
  State<Chatcard> createState() => _ChatcardState();
}

class _ChatcardState extends State<Chatcard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
            child: ListTile(
              title: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(widget.fimgpath, height: 50, width: 50,)),
                    const SizedBox( width: 20,),
                  Text(widget.fname, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                ],
              ),
              trailing: IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatwithBuyerScreen(username: widget.fname)));
              }, icon: Icon(Icons.chevron_right_rounded)),
            ),
           );
  }
}