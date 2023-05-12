import 'package:flutter/material.dart';
import 'package:test_your_brain/screens/game_screen.dart';
import 'package:test_your_brain/utils/user_score.dart';
import '../styles/color.dart';
import '../database/database_helper.dart';

class FinalScreen extends StatefulWidget {
  static const routeName = '/final-screen';

  const FinalScreen({Key? key}) : super(key: key);

  @override
  State<FinalScreen> createState() => _FinalScreenState();
}

class _FinalScreenState extends State<FinalScreen> {
  void startGame(BuildContext context) {
    Navigator.pushNamed(context, GameScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<UserScore>>(
        future: DatabaseHelper.instance.getUserScores('username'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.connectionState == ConnectionState.active) {
            return const Text('Loading user scores...');
          } else if (snapshot.hasData) {
            final userScores = snapshot.data!;
            final oldScore = userScores.isNotEmpty ? userScores[0].score : 0;
            final args = ModalRoute.of(context)!.settings.arguments
                as Map<String, dynamic>;
            final score = args['score'] as int;
            //table
            debugPrint("User Scores:");
            for (var userScore in userScores) {
              debugPrint("${userScore.username}: ${userScore.score}");
            }

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

            // //////////////// SCAFOLD /////////////
            return Scaffold(
              backgroundColor: MyColors.myColor,
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //logo
                    Image.asset(
                      'images/logo_image.jpg',
                      width: 500,
                      height: 100,
                    ),
                    //Space
                    const SizedBox(height: 40),
                    //
                    //GAme over text
                    const Text(
                      'Game Over',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    //Space
                    const SizedBox(height: 30),
                    //Current Score ///////////////////////////////////////
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
                            'Your current score is $score/20',
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                    //Space
                    const SizedBox(height: 15),
                    // OLD SCore ///////////////////////////////
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
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500, // add this line
                            ),
                          )
                        ],
                      ),
                    ),
                    /////////////
                    const SizedBox(height: 30),
                    //TO ADD A LEVEL LATER
                    Container(
                      width: 500,
                      height: 60,
                      decoration: BoxDecoration(
                        color: MyColors.boxColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          'Your are at the $level level', // Remove "const" from here
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    //Space
                    const SizedBox(height: 20),
                    //button Play again
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
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          return CircularProgressIndicator();
        });
  }
}
