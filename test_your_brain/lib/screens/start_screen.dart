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
          //space
          children: [
            const SizedBox(height: 100),
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
            //text
            Builder(builder: (context) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 250,
                        child: TextField(
                          controller: name,
                          decoration: const InputDecoration(
                            labelText: 'Entrer votre nom',
                            contentPadding: EdgeInsets.symmetric(vertical: 5),
                          ),
                          maxLines: 5,
                          minLines: 1,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
            const SizedBox(height: 50),
            //button
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
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
                        fixedSize: Size(200, 60),
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
                  ),
                ),
              ],
            ),
            const SizedBox(height: 80),
          ],
        ));
  }
}
