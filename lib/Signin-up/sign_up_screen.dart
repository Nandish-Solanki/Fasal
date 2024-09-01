import 'package:fasal/Signin-up/bluebutton.dart';
import 'package:fasal/Signin-up/textbox.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
              right: 0,
              child: Image.asset('assets/images/shape2.png'),
            ),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.08),
                child: Column(
                  children: [
                    SizedBox(
                      height: screenSize.height * 0.1,
                    ),
                    Image.asset(
                      'assets/images/tree1.png',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    const Text(
                      "WELCOME ONBOARD!",
                      style: TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      "Let's help you meet up with your tasks",
                      style: TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: screenSize.height * 0.05,
                    ),
                    Textbox(text: "Enter your Full Name", isPwd: false),
                    Textbox(text: "Enter your email", isPwd: false),
                    Textbox(text: "Enter Password", isPwd: true),
                    Textbox(text: "Confirm Password", isPwd: true),
                    SizedBox(
                      height: screenSize.height * 0.02,
                    ),
                    Bluebutton(buttonText: "Register"),
                    const SizedBox(height: 20),
                    const Text(
                      "or you can sign in with",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: screenSize.height * 0.04,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Image.asset(
                            'assets/images/google.png',
                            width: 50,
                            height: 50,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenSize.height * 0.02,
                    ),
                    const Text(
                      "This app is protected by reCAPTCHA and the Google Privacy Policy and Terms of Service apply.",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: screenSize.height * 0.02,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
