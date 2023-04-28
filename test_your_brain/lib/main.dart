import 'package:flutter/material.dart';

import 'screens/Welcome_Page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test your Brain',
      home: WelcomePage(),
      //route to other pages(widgets)
      routes: {
        // MainRoomChoice.routeName: (context) => const MainRoomChoice(),
        // JoinRoomScreen.routeName: (context) => const JoinRoomScreen(),
        // CreateRoomScreen.routeName: (context) => const CreateRoomScreen(),
      },
      // initialRoute: MainRoomChoice.routeName,
    );
  }
}
