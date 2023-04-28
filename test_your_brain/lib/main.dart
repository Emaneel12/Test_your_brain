import 'package:flutter/material.dart';
import 'package:test_your_brain/screens/start_screen.dart';
import 'package:test_your_brain/screens/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'test_your_brain',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 83, 49, 157),
        ),
      ),
      //home: WelcomePage(),
      //route to other pages(widgets)
      routes: {
        WelcomePage.routeName: (context) => const WelcomePage(),
        StartScreen.routeName: (context) => const StartScreen(),
        // CreateRoomScreen.routeName: (context) => const CreateRoomScreen(),
      },
      initialRoute: WelcomePage.routeName,
    );
  }
}
