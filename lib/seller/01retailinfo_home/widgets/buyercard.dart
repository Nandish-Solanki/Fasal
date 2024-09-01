import 'package:flutter/material.dart';


import '../../03chatseller/pages/chatwithbuyer.dart';



class Buyercard extends StatefulWidget {
  final String rname;
  final String rdesc;
  final String imgpath;
  final String rating;
  final VoidCallback? onPressed; 
  const Buyercard({super.key,
  required this.rname,
  required this.imgpath,
  required this.rdesc,
  required this.rating,
  this.onPressed});
 

  @override
  State<Buyercard> createState() => _BuyercardState();
}

class _BuyercardState extends State<Buyercard> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    //double screenText = screenWidth * 0.05;
    TextStyle txtstyle=TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold);
    TextStyle buyercardtext=TextStyle(color: const Color.fromARGB(255, 40, 39, 39), fontSize: 20, fontWeight: FontWeight.bold);


    void _showBuyerInfo(){
      showDialog(
        context: context, 
        builder: (context){
          return Container(
            height: 200,
            child: AlertDialog(
              backgroundColor: Colors.white,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Buyer Details', style: txtstyle,),
                  IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon: Icon(Icons.cancel_sharp))
                ],
              ),
              content: SizedBox(
                height: screenHeight*0.5,
                width: screenWidth,
                
                child: Column(
                  children: [
                    Image.asset(widget.imgpath),
                    SizedBox(height: 10,),
                    Text(widget.rname, style: buyercardtext,),
                    Divider(thickness: 3,),
                    Text(widget.rdesc, style: buyercardtext,),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 15,),
                        Icon(Icons.location_on, color: Colors.red,),
                        SizedBox(width: 15,),
                        Text("Location", style: buyercardtext,),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      children: [
                        SizedBox(width: 15,),
                        Icon(Icons.phone, color: Colors.grey[850],),
                        SizedBox(width: 15,),
                        Text("Contact Info", style: buyercardtext,),
                      ],
                    ),
                            
                  ],
                ),
              ),
              actions: [
                
                MaterialButton(onPressed: (){
                 
                },
                child: ElevatedButton(onPressed: () { 
                   Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChatwithBuyerScreen(username: widget.rname,)),
            );
            
                 },
                child: Text('CHAT',style:TextStyle(color: Color.fromARGB(255, 34, 99, 52), fontSize: 20, fontWeight: FontWeight.bold))),
                )
              ],
            
            ),
          );
        });
    }


    return TextButton(
      onPressed: _showBuyerInfo,
      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Card(
                          color: Colors.white,
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              //color: Colors.white,
                              height: screenHeight*0.15,
                              width: screenWidth,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [

                                  ClipRRect
                                  (
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.asset(widget.imgpath)),
      
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(widget.rname, style: buyercardtext,),
                                      Text(widget.rdesc, style: buyercardtext,),
                                      Row(
                                        children: [
                                          Icon(Icons.star, color: Colors.yellow[600],),
                                          Text(" ${widget.rating}/5", style: buyercardtext.copyWith(fontSize: 15),)
                                        ]
                                        
                                      )
                                    ],
                                  ),
                                
                                ],
                              ),
                              
                            ),
                          ),
                        ),
                      ),
    );
  }
}