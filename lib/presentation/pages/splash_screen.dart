import 'dart:async';
import 'package:flutter/material.dart';
// import 'package:your_app/home_screen.dart'; // Import your main screen after splash

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simulate a long-running task by using Future.delayed
    Timer(const Duration(seconds: 3), () {
      // Navigate to the main screen once the splash screen is done
      // Navigator.of(context).pushReplacement(
      //   MaterialPageRoute(builder: (_) => HomeScreen()),
      // );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, // Set your desired background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Your logo or branding widget
            Image.asset('assets/logo.png'), // Example image asset
            SizedBox(height: 20), // Adjust spacing as needed
            CircularProgressIndicator(), // Loading indicator or any other loading widget
          ],
        ),
      ),
    );
  }
}