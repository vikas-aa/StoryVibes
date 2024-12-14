import 'package:audio_book/Home_screen.dart';
import 'package:audio_book/Login.dart';
import 'package:audio_book/Splah_screen.dart';
import 'package:audio_book/achievements_screen.dart';
import 'package:audio_book/leaderboard_screen.dart';
import 'package:audio_book/onboarding_screen.dart';
import 'package:audio_book/profile_screen.dart';
import 'package:audio_book/progress_screen.dart';
import 'package:audio_book/settings_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();

    // Listening to auth state changes
    _auth.authStateChanges().listen((User? user) {
      // Navigate based on user state after the widget build is complete
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (user != null) {
          // Navigate to home if the user is already signed in
          Navigator.pushReplacementNamed(context, '/home');
        } else {
          // Navigate to login screen if not signed in
          Navigator.pushReplacementNamed(context, '/login');
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AudioBook App',
      initialRoute: '/', // Set initial route to Splash Screen
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (_) => SplashScreen());
          case '/onboarding':
            return MaterialPageRoute(builder: (_) => OnboardingScreen());
          case '/login':
            return MaterialPageRoute(builder: (_) => AuthScreen());
          case '/home':
            return MaterialPageRoute(builder: (_) => HomeScreen());
          case '/leaderboard':
            return MaterialPageRoute(builder: (_) => LeaderboardScreen());
          case '/achievements':
            return MaterialPageRoute(builder: (_) => AchievementsScreen());
          case '/profile':
            return MaterialPageRoute(builder: (_) => ProfileScreen());
          case '/settings':
            return MaterialPageRoute(builder: (_) => SettingsScreen());
          case '/progress':
            return MaterialPageRoute(builder: (_) => ProgressScreen());
          default:
            return MaterialPageRoute(builder: (_) => ErrorScreen());
        }
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}

class ErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Error")),
      body: Center(child: Text("Page not found!", style: TextStyle(fontSize: 18))),
    );
  }
}
