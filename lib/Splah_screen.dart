import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Set a delay to show the splash screen for 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      // Navigate to onboarding screen after splash animation
      Navigator.pushReplacementNamed(context, '/onboarding');
    });

    return Scaffold(
      backgroundColor: Colors.white, // Background color for splash screen
      body: Center(
        // Lottie animation for a pleasant introduction
        child: Lottie.asset(
          'assets/animations/splash.json',  // Path to your Lottie animation file
          width: 200,  // Set the width of the animation
          height: 200,  // Set the height of the animation
          fit: BoxFit.contain,  // Fit the animation within the screen
        ),
      ),
    );
  }
}
