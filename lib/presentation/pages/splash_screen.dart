import 'dart:async';
import 'package:flutter/material.dart';
import 'package:music_app/presentation/pages/home_screen.dart';
// import 'package:your_app/home_screen.dart'; // Import your main screen after splash

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simulate a long-running task by using Future.delayed
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set your desired background color
      body: Center(child: Image.asset('assets/image/music _img.png')),
    );
  }
}
