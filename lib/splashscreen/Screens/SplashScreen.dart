import 'package:flutter/material.dart';
import 'Screen1.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Screen1()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Center(
        child: Image.asset(
          'assets/logo.jpg',
          width: MediaQuery.of(context).size.width*0.8,
          height: MediaQuery.of(context).size.height*0.4 ,
          ),
      ),
    );
  }
}