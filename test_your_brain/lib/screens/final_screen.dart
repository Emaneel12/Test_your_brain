import 'package:flutter/material.dart';
import 'package:test_your_brain/screens/game_screen.dart';
import '../styles/color.dart';

class FinalScreen extends StatelessWidget {
  static const routeName = '/final-screen';

  void startGame(BuildContext context) {
    Navigator.pushNamed(context, GameScreen.routeName);
  }

  const FinalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final score = args['score'] as int;

    ////////// Level//////////////////
    String level;
    if (score <= 5) {
      level = 'Beginner';
    } else if (score <= 10) {
      level = 'Intermediate';
    } else if (score <= 15) {
      level = 'Advanced';
    } else {
      level = 'Expert';
    }

    var oldScore = 2;
    return Scaffold(
      backgroundColor: MyColors.myColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/logo_image.jpg',
              width: 500,
              height: 100,
            ),
            const SizedBox(height: 40),
            const Text(
              'Game Over',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            //current score
            const SizedBox(height: 30),
            Container(
              width: 500,
              height: 60,
              decoration: BoxDecoration(
                color: MyColors.boxColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Your current score is ' + score.toString() + '/20',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold, // add this line
                    ),
                  )
                ],
              ),
            ),
            //old score
            const SizedBox(height: 15),
            Container(
              width: 500,
              height: 60,
              decoration: BoxDecoration(
                color: MyColors.boxColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Your old score is $oldScore/20',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold, // add this line
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            //IF WE WANT TO ADD A LEVEL LATER
            Container(
              width: 500,
              height: 60,
              decoration: BoxDecoration(
                color: MyColors.boxColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  'Your are at the ' +
                      level +
                      ' level', // Remove "const" from here
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

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
                'play again ?',
                style: TextStyle(
                  color: MyColors.myColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
