import 'package:fasal/Signin-up/textbox2.dart';
import 'package:flutter/material.dart';
// import '../textbox2.dart';

class Myprofile extends StatefulWidget {
  const Myprofile({super.key});

  @override
  State<Myprofile> createState() => _MyprofileState();
}

class _MyprofileState extends State<Myprofile> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading:  IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back)),
          title: const Text("My Profile", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
          backgroundColor: Color.fromARGB(255, 131, 220, 226),
          
        ),
        body:  Center(
          child: Column(
            children: [
              SizedBox(
                height: screenSize.height*0.03,
              ),
              Image.asset('assets/images/profile.png', scale: 2,),
              const Text("Profile photo", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              SizedBox(
                height: screenSize.height*0.03,
              ),
              Textbox2(category: "Name"),
              
              Textbox2(category: "Phone Number"),
              Textbox2(category: "Email"),
              Textbox2(category: "Address"),
              Textbox2(category: "PIN Code"),
              Textbox2(category: "Date of birth")
            ],
          ),
        ),
      ),
    );
  }
}