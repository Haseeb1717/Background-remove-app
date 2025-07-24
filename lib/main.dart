import 'package:flutter/material.dart';
import 'screens/Splash_screen.dart';
import 'screens/welcome_screen.dart'; // 👈 Make sure this file exists
import 'screens/login_screen.dart';   // For navigation
import 'screens/signup_screen.dart';  // For navigation
import 'screens/Home_screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Online Compiler',
  //   home: WelcomeScreen(), // 👈 Start with Welcome screen
    home:HomeScreen(),
    );
  }
}
