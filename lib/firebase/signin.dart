import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

// Firebase Auth Class
class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign up with email and password
  Future<UserCredential> signUpWithEmailAndPassword(String email, String password) async {
    return await _auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  // Sign in with email and password
  Future<UserCredential> signInWithEmailAndPassword(String email, String password) async {
    return await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  // Sign in with Google
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await _auth.signInWithCredential(credential);
  }
}

// Main Page with both Sign In and Sign Up
class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isSignIn = true; // To toggle between sign in and sign up
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 228, 228, 228),
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset('assets/images/shape1.png'),
            ),
            SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                    Image.asset(
                      'assets/images/tree1.png',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    Text(
                      isSignIn ? "WELCOME BACK!" : "WELCOME ONBOARD!",
                      style: const TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),

                    // Text Fields for Email and Password
                    Textbox(text: "Enter your email", isPwd: false, controller: emailController,),
                    Textbox(text: "Enter password", isPwd: true, controller: passwordController,),

                    // If Sign-Up, show confirm password field
                    if (!isSignIn)
                      Textbox(text: "Confirm password", isPwd: true, controller: confirmPasswordController,),

                    // Sign In / Sign Up button
                    Bluebutton(
                      buttonText: isSignIn ? "Sign In" : "Sign Up",
                      onPressed: () async {
                        if (isSignIn) {
                          // Handle Sign In
                          await _handleSignIn(context);
                        } else {
                          // Handle Sign Up
                          await _handleSignUp(context);
                        }
                      },
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    // Toggle between Sign In and Sign Up
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isSignIn = !isSignIn;
                        });
                      },
                      child: Text(
                        isSignIn ? "Don't have an account? Sign Up" : "Already have an account? Sign In",
                        style: const TextStyle(
                          color: Colors.lightBlueAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                    // Google Sign In button
                    GestureDetector(
                      onTap: () => _handleGoogleSignIn(context),
                      child: Image.asset('assets/images/google.png'),
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

  // Handle Sign In
  Future<void> _handleSignIn(BuildContext context) async {
    try {
      await Auth().signInWithEmailAndPassword(
        emailController.text,
        passwordController.text,
      );
      // Navigate to next screen upon successful sign in
      Navigator.pushReplacementNamed(context, '/chooseRole');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to sign in: $e')),
      );
    }
  }

  // Handle Sign Up
  Future<void> _handleSignUp(BuildContext context) async {
    if (passwordController.text == confirmPasswordController.text) {
      try {
        await Auth().signUpWithEmailAndPassword(
          emailController.text,
          passwordController.text,
        );
        // Navigate to next screen upon successful sign up
        Navigator.pushReplacementNamed(context, '/chooseRole');
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to sign up: $e')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Passwords do not match')),
      );
    }
  }

  // Handle Google Sign In
  Future<void> _handleGoogleSignIn(BuildContext context) async {
    try {
      await Auth().signInWithGoogle();
      // Navigate to next screen upon successful Google Sign In
      Navigator.pushReplacementNamed(context, '/chooseRole');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to sign in with Google: $e')),
      );
    }
  }
}

// Textbox widget
class Textbox extends StatelessWidget {
  final String text;
  final bool isPwd;
  final TextEditingController controller;

  Textbox({required this.text, required this.isPwd, required this.controller});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: screenSize.width * 0.9,
          child: TextField(
            controller: controller,
            obscureText: isPwd,
            decoration: InputDecoration(
              hintText: text,
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}

// Blue button widget
class Bluebutton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  Bluebutton({required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      child: Text(
        buttonText,
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }
}
