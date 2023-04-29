import 'package:flutter/material.dart';
import 'package:test_your_brain/styles/color.dart';
import 'package:test_your_brain/utils/pad_buttons.dart';
import 'package:test_your_brain/styles/text_styles.dart';

import '../utils/random_operators.dart';

class GameScreen extends StatefulWidget {
  //route
  static String routeName = '/game-screen';
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  //numbers of the pad
  List<String> numberPad = [
    '7',
    '8',
    '9',
    'AC',
    '4',
    '5',
    '6',
    'DEL',
    '1',
    '2',
    '3',
    '-',
    '0',
    '',
    '',
    '='
  ];
  //operation////////////////////////////////////
  RandomOperations randomOperators = RandomOperations();
  //user's answer////////////
  String userAnswer = '';
  //tapped button/////////////////////////////////
  void tappedButton(String clicked) {
    setState(() {
      if (clicked == '=') {
        //seing if the user is correct
        checkResult();
      } else if (clicked == '') {
        userAnswer;
      } else if (clicked == 'DEL') {
        if (userAnswer == '') {
          userAnswer = '';
        } else {
          userAnswer = userAnswer.substring(0, userAnswer.length - 1);
        }
        //deliting the last number only
      } else if (clicked == 'AC') {
        //deleting everything
        userAnswer = '';
      } else {
        //max numbers ton enter
        if (userAnswer.length < 3) {
          userAnswer += clicked;
        }
      }
    });
  }

//checking the results///////////////////////////////////
  void checkResult() {
    int userAnswerInt = int.tryParse(userAnswer) ?? 0;
    if (userAnswerInt == randomOperators.getCorrectAnswer()) {
      // user is correct
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Container(
                height: 200,
                color: Colors.green,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Correct answer',
                      style: SmallTextStyle.smallTextStyle,
                    ),
                    GestureDetector(
                      onTap: () => nextOperation(),
                      child: Container(
                        height: 36,
                        width: 36,
                        decoration: BoxDecoration(
                          color: Colors.green[300],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ),
                    )
                    //button to the next operation
                  ],
                ),
              ),
            );
          });
      //score
      // move to next operation immediately
    } else {
      // user is incorrect
      // showDialog(
      //     context: context,
      //     builder: (context) {
      //       return AlertDialog(
      //         content: Container(
      //           height: 200,
      //           color: Colors.red,
      //           child: Text('Incorrect Answer',style: SmallTextStyle.smallTextStyle,),
      //         ),
      //       );
      //     });
      //// if the answer is incorrect, keep the current operation and
      ///// reset the user's answer
      setState(() {
        userAnswer = '';
      });
    }
  }

  //next question function
  void nextOperation() {
    //removing dialog
    Navigator.of(context).pop();
    //reset operation and userAnswer
    setState(() {
      randomOperators = RandomOperations();
      userAnswer = '';
    });
  }

  //////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myColor,
      body: Column(
        children: [
          //logo and Timer////////////////////////////////////////////////
          Container(
            height: 120,
            color: Colors.amber,
          ),
          //operation//////////////////////////////////////////////////////
          Expanded(
            flex: 1,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //operation
                  Text(
                    '${randomOperators.firstNumber}${randomOperators.operator}${randomOperators.secondNumber}  =',
                    style: NumberTextStyle.numberTextStyle,
                  ),
                  //answer
                  Container(
                    height: 60,
                    width: 90,
                    //color: Colors.amber,
                    child: Text(
                      userAnswer,
                      style: NumberTextStyle.numberTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),

          //buttons of numbers +delete + submit answer///////////////////////////
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: GridView.builder(
                  itemCount: numberPad
                      .length, //number of the boxes also is indexed from 0 to 11
                  physics:
                      const NeverScrollableScrollPhysics(), //because it scrolls
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, //3colomns
                  ),
                  itemBuilder: (context, index) {
                    return NumberButton(
                      child: numberPad[index],
                      onTap: () => tappedButton(numberPad[index]),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
