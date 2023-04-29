import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:test_your_brain/screens/welcome_screen/welcome_screen.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
          pageTransitionType: PageTransitionType.topToBottom,
          backgroundColor: Color.fromARGB(255, 97, 119, 156),
          splashTransition: SplashTransition.rotationTransition,
          splashIconSize: 200,
          splash: CircleAvatar(
            radius: 130,
            backgroundImage: AssetImage("assets/images/logo.jpeg"),
          ),
          nextScreen: const WelcomeScreen()),
    );
  }
}
