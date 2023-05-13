import 'package:flutter/material.dart';
import 'package:test_your_brain/screens/final_screen.dart';
import 'package:test_your_brain/screens/game_screen.dart';
import 'package:test_your_brain/screens/start_screen.dart';
import 'package:test_your_brain/screens/welcome_page.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:test_your_brain/styles/color.dart';
import 'package:dcdg/dcdg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedSplashScreen(
          pageTransitionType: PageTransitionType.topToBottom,
          backgroundColor: MyColors.myColor,
          splashTransition: SplashTransition.rotationTransition,
          splashIconSize: 200,
          splash: CircleAvatar(
            radius: 100,
            backgroundImage: AssetImage("images/logo_image.jpeg"),
          ),
          nextScreen: const WelcomePage()),
      debugShowCheckedModeBanner: false,
      title: 'test_your_brain',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: MyColors.myColor,
        ),
      ),

      //home: WelcomePage(),

      //route to other pages(widgets)
      routes: {
        WelcomePage.routeName: (context) => const WelcomePage(),
        StartScreen.routeName: (context) => StartScreen(),
        GameScreen.routeName: (context) => GameScreen(
              name: '',
            ),
        FinalScreen.routeName: (context) => FinalScreen(),
      },
      // initialRoute: FinalScreen.routeName,
    );
  }
}
