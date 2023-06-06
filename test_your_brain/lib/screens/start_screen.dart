import 'package:flutter/material.dart';
import 'package:test_your_brain/screens/game_screen.dart';

import '../styles/color.dart';

class StartScreen extends StatelessWidget {
  TextEditingController name = TextEditingController();
  static String routeName = '/start-game-screen';
  StartScreen({super.key});

  //function
  void startGame(BuildContext context) {
    Navigator.pushNamed(
      context,
      GameScreen.routeName,
      arguments: {'name': name},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.myColor,
        body: ListView(
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
            const SizedBox(height: 60),
            //text
            const Center(
              child: SizedBox(
                width: 300,
                child: Text(
                  'In this game ,you will solve 20 mathematic operations , each correct answer will earn you a point , but be carefull there is no coming back ',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            //space
            const SizedBox(height: 50),
            Builder(builder: (context) {
              return TextField(
                controller: name,
                decoration: InputDecoration(
                  labelText: 'Entrer votre nom',
                ),
                onChanged: (value) {
                  // Gérer les changements de texte
                },
              );
            }),
            const SizedBox(height: 50),
            //button
            ElevatedButton(
              onPressed: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GameScreen(
                              name: name.text,
                            )))
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                textStyle: const TextStyle(
                    // fontSize: 18,
                    // fontWeight: FontWeight.bold,
                    ),
                minimumSize: const Size(10, 55),
              ),
              child: const Text(
                'Get Started ?',
                style: TextStyle(
                  color: MyColors.myColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 80),
          ],
        ));
  }
}
