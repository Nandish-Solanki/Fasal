import 'package:flutter/material.dart';
import 'package:fasal/seller/03chatseller/widgets/chatcard.dart';

class Allchats extends StatefulWidget {
  final String? name1;
  final String? imgpath1; 
  const Allchats({super.key, this.name1, this.imgpath1}); 

  @override
  State<Allchats> createState() => _AllchatsState();
}

class _AllchatsState extends State<Allchats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("All Chats"),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const Divider(),
            Chatcard(fimgpath: 'assets/man1.jpeg', fname: "Suraj"),
            Chatcard(fimgpath: 'assets/man2.jpeg', fname: "Ram"),
            Chatcard(fimgpath: 'assets/man3.jpeg', fname: "Rakesh"),
            Chatcard(fimgpath: 'assets/man4.jpeg', fname: "Chandan")
          ],
        ),
      ),
    );
  }
}
