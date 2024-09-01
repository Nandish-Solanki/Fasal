import 'package:fasal/Signin-up/bluebutton.dart';
import 'package:fasal/Signin-up/sign_up_screen.dart';
import 'package:fasal/Signin-up/textbox.dart';
import 'package:flutter/material.dart';
// import '../bluebutton.dart';
// import '../sign_up_screen.dart';
// import '../textbox.dart';
// import 'package:sih/textbox_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 228, 228, 228),
        body: Stack(
          children: [
            Positioned(
                top: 0,
                left: 0,
                child: Image.asset('assets/images/shape1.png')),
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: screenSize.height * 0.1,
                  ),
                  Image.asset(
                    'assets/images/tree1.png',
                    width: 100, // Set the desired width
                    height: 100, // Set the desired height
                    fit: BoxFit.cover,
                  ),
                  const Text(
                    "WELCOME BACK !",
                    style: TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: screenSize.height * 0.02,
                  ),
                  Image.asset('assets/images/phone.png'),
                  // SizedBox(
                  //   height: 30,
                  // ),
                  SizedBox(
                    height: screenSize.height * 0.05,
                  ),
                  Textbox(text: "Enter your Email", isPwd: false),
                  Textbox(text: "Enter password", isPwd: true),
                  SizedBox(
                    height: screenSize.height * 0.02,
                  ),
                  const Text(
                    "Forgot Password?",
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  // SizedBox(
                  //   height: 40,
                  // ),
                  SizedBox(
                    height: screenSize.height * 0.02,
                  ),
                  Bluebutton(buttonText: "Sign In"),
                  SizedBox(
                    height: screenSize.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Dont have an account ?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpScreen()));
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                              color: Colors.lightBlueAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
