import 'package:flutter/material.dart';
import 'package:test_your_brain/screens/game_screen.dart';

import '../styles/color.dart';

class StartScreen extends StatelessWidget {
  static String routeName = '/start-game-screen';
  const StartScreen({super.key});

  //function
  void startGame(BuildContext context) {
    Navigator.pushNamed(context, GameScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.myColor,
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          //space
          children: [
            Container(
              height: 200,
            ),
            SizedBox(
              height: 100,
              width: 350,
              child: Image.asset('images/logo_image.jpg'),
            ),
            //space
            const SizedBox(height: 100),
            //text
            const Center(
              child: SizedBox(
                width: 300,
                child: Text(
                  'In this game ,you will solve 20 mathematic operations , each correct answer will earn you a point , but be carefull there is no coming back ',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            //space
            const SizedBox(height: 50),
            //button
            ElevatedButton(
                onPressed: () => startGame(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  textStyle: const TextStyle(
                      // fontSize: 18,
                      // fontWeight: FontWeight.bold,
                      ),
                  minimumSize: const Size(200, 50),
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                    color: MyColors.myColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ],
        ));
  }
}
