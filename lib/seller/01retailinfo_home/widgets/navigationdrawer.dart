import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  @override
  Widget build(BuildContext context) {
    Color bluebg = const Color.fromARGB(255, 76, 222, 230);
    double screenHeight = MediaQuery.of(context).size.height;
    //double screenWidth = MediaQuery.of(context).size.width;
    //double screenText = screenWidth * 0.05;
    TextStyle txtstyle=TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold);

    return Drawer(
      backgroundColor: Colors.white,
      child: Padding(
        padding: EdgeInsets.fromLTRB(10,20,5,10),
        child: Container(
          child:Column(
           // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height:screenHeight*0.2 ,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset("assets/man3.jpeg",
                  fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Text("Farmer's Name",style: txtstyle),
              const SizedBox(height: 10,),
              const Divider(thickness: 1.5,),
              Column(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                  ListTile(
                    leading: Icon(Icons.person, size: 30,),
                    title: Text("Profile", style: txtstyle,),
                    onTap: (){},
                  ),
                  ListTile(
                    leading: Icon(Icons.bar_chart_sharp,size: 30,),
                    title: Text("Statistics",style: txtstyle),
                    onTap: (){},
                  ),
                  ListTile(
                    leading: Icon(Icons.settings,size: 30,),
                    title: Text("Settings",style: txtstyle),
                    onTap: (){},
                  ),

                ],
              ),
               SizedBox(height: screenHeight*0.23,),
              BottomAppBar(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(bluebg),

                      ),
                      onPressed: (){},
                      child: const Row(
                        children: [
                          Icon(Icons.logout, color: Color.fromARGB(255, 4, 31, 54),),
                          SizedBox(width: 10,),
                          Text("Logout", style: TextStyle(
                            color:  Color.fromARGB(255, 4, 31, 54),
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          ),),
                        ],
                      ),
                      ),]
              ))
            ],
          ) ,),
          
        ),
    );
  }
}