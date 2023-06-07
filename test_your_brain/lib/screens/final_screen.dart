import 'package:flutter/material.dart';
import 'package:test_your_brain/screens/game_screen.dart';
import 'package:test_your_brain/screens/start_screen.dart';

import '../styles/color.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FinalScreen extends StatefulWidget {
  static const routeName = '/final-screen';

  const FinalScreen({Key? key}) : super(key: key);

  @override
  State<FinalScreen> createState() => _FinalScreenState();
}

class _FinalScreenState extends State<FinalScreen> {
  void startGame(BuildContext context) {
    Navigator.pushNamed(context, StartScreen.routeName);
  }

  //Retrieve the old score from shared preferences
  Future<int> getOldScore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('score') ?? 0;
  }

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
    //the old score var
    final Future<int> oldScore = getOldScore();

    //////////////////SCAFOLD /////////////////////////////////////////////////////////////////////////
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
              width: 300,
              height: 65,
              decoration: BoxDecoration(
                color: MyColors.boxColor,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Your current score is $score/20',
                    style: const TextStyle(
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
              width: 319,
              height: 65,
              decoration: BoxDecoration(
                color: MyColors.boxColor,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FutureBuilder<int>(
                    future: oldScore,
                    builder:
                        (BuildContext context, AsyncSnapshot<int> snapshot) {
                      if (snapshot.hasData) {
                        return Text('Your best score is ${snapshot.data}/20 ',
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ));
                      } else if (snapshot.hasError) {
                        return Text("Error: ${snapshot.error}");
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            //IF WE WANT TO ADD A LEVEL LATER
            Container(
              width: 323,
              height: 65,
              decoration: BoxDecoration(
                color: MyColors.boxColor,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Text(
                  'Your are at the $level level', // Remove "const" from here
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),

            ElevatedButton(
              onPressed: () => startGame(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                textStyle: const TextStyle(
                    // fontSize: 18,
                    // fontWeight: FontWeight.bold,
                    ),
                minimumSize: const Size(200, 55),
              ),
              child: const Text(
                'PLAY AGAIN ?',
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
