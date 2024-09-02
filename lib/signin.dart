import 'package:flutter/material.dart';

// Textbox used in Sign_in_screen and Sign_up_screen
class Textbox extends StatefulWidget {
  final String text;
  final bool isPwd;

  Textbox({super.key, required this.text, required this.isPwd});

  @override
  State<Textbox> createState() => _TextboxState();
}

class _TextboxState extends State<Textbox> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose(); // Clean up the controller when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: screenSize.width * 0.9,
          child: TextField(
            controller: _controller,
            obscureText: widget.isPwd,
            decoration: InputDecoration(
              hintText: widget.text,
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

// Textbox used in Myprofile screen
class Textbox2 extends StatefulWidget {
  final String category;

  Textbox2({super.key, required this.category});

  @override
  State<Textbox2> createState() => _Textbox2State();
}

class _Textbox2State extends State<Textbox2> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width * 0.9,
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: widget.category,
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          SizedBox(height: screenSize.height * 0.02),
        ],
      ),
    );
  }
}

// Button used in SignInScreen and SignUpScreen
class Bluebutton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  Bluebutton({super.key, required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent, // Button color
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

// SignInScreen
class SignInScreen extends StatelessWidget {
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
              child: Image.asset('assets/images/shape1.png'),
            ),
            SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: screenSize.height * 0.1),
                    Image.asset(
                      'assets/images/tree1.png',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    const Text(
                      "WELCOME BACK !",
                      style: TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.02),
                    Image.asset('assets/images/phone.png'),
                    SizedBox(height: screenSize.height * 0.05),
                    Textbox(text: "Enter your Email", isPwd: false),
                    Textbox(text: "Enter password", isPwd: true),
                    SizedBox(height: screenSize.height * 0.02),
                    const Text(
                      "Forgot Password?",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.02),
                    Bluebutton(
                      buttonText: "Sign In",
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/chooseRole');
                      },
                    ),
                    SizedBox(height: screenSize.height * 0.035),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(width: 20),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, '/signUp');
                          },
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Colors.lightBlueAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenSize.height * 0.05),
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

// SignUpScreen
class SignUpScreen extends StatelessWidget {
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
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/signIn');
                  },
                  icon: Icon(Icons.arrow_back),
                ),
              ],
            ),
            SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: screenSize.height * 0.1),
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
                    ),
                    const Text(
                      "Let's help you meet up with your tasks",
                      style: TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.05),
                    Textbox(text: "Enter your Full Name", isPwd: false),
                    Textbox(text: "Enter your email", isPwd: false),
                    Textbox(text: "Enter Password", isPwd: true),
                    Textbox(text: "Confirm Password", isPwd: true),
                    SizedBox(height: screenSize.height * 0.02),
                    Bluebutton(
                      buttonText: "Register",
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/chooseRole');
                      },
                    ),
                    const Text(
                      "or you can sign in with",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.04),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Image.asset('assets/images/google.png'),
                        ),
                      ],
                    ),
                    SizedBox(height: screenSize.height * 0.02),
                    const Text(
                      "This app is protected by reCAPTCHA and the Google Privacy Policy and Terms of Service apply.",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 15,
                      ),
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

// Myprofile Screen
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
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back),
          ),
          title: const Text(
            "My Profile",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          backgroundColor: Color.fromARGB(255, 131, 220, 226),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: screenSize.height * 0.03),
              Image.asset('assets/images/profile.png', scale: 2),
              const Text(
                "Profile photo",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: screenSize.height * 0.03),
              Textbox2(category: "Name"),
              Textbox2(category: "Phone Number"),
              Textbox2(category: "Email"),
              Textbox2(category: "Address"),
              Textbox2(category: "PIN Code"),
              Textbox2(category: "Date of birth"),
            ],
          ),
        ),
      ),
    );
  }
}
