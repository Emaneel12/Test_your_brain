import 'package:flutter/material.dart';
import 'package:test_your_brain/styles/color.dart';
import 'package:test_your_brain/utils/pad_buttons.dart';
import 'package:test_your_brain/styles/text_styles.dart';
import 'package:test_your_brain/screens/final_screen.dart';
import '../utils/random_operators.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GameScreen extends StatefulWidget {
  //route
  final String name;
  static String routeName = '/game-screen';
  GameScreen({super.key, required this.name});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int score = 0;
  String level = '';

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

  get name => null;

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
        if (userAnswer.length < 3 ||
            (userAnswer.length == 3 && userAnswer.startsWith('-'))) {
          userAnswer += clicked;
        }
      }
    });
  }

//checking the results///////////////////////////////////
  int checkResult() {
    int userAnswerInt = int.tryParse(userAnswer) ?? 0;
    if (userAnswerInt == randomOperators.getCorrectAnswer()) {
      score += 1;
      // user is correct
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Color.fromRGBO(76, 175, 80, 1),
            content: Container(
              height: 200,
              color: Color.fromRGBO(76, 175, 80, 1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Correct answer',
                    style: SmallTextStyle.smallTextStyle,
                  ),
                  GestureDetector(
                    onTap: () =>
                        nextOperation(), // move to next operation immediately
                    child: Container(
                      height: 36,
                      width: 36,
                      decoration: BoxDecoration(
                        color: Colors.green[300],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
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
        },
      );
      saveScore(score); // Save the score
      //score
    } else {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Color.fromRGBO(244, 67, 54, 1),
              content: Container(
                height: 200,
                color: Color.fromRGBO(244, 67, 54, 1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      'Wrong answer',
                      style: SmallTextStyle.smallTextStyle,
                    ),
                    GestureDetector(
                      onTap: () =>
                          nextOperation(), // move to next operation immediately
                      child: Container(
                        height: 36,
                        width: 36,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 217, 11, 11),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
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
    }
    return score;
  }

  int i = 1;
  //next question function
  void nextOperation() {
    //removing dialog
    Navigator.of(context).pop();
    //reset operation and userAnswer
    setState(() {
      randomOperators = RandomOperations();
      userAnswer = '';
    });
    ++i;
    cond();
  }

  void cond() {
    ///i=4 for now , just for test , will be changed later to 20
    if (i == 5) {
      saveScore(score); // Save the score
      Navigator.pushNamed(
        context,
        FinalScreen.routeName,
        arguments: {'score': score},
      );
    }
  }

  void saveScore(int score) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int bestScore = prefs.getInt('score') ?? 0;

    if (score > bestScore) {
      prefs.setInt('score', score);
    }
  }

  //////////////////////////The SCAFFOLD ///////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myColor,
      appBar: AppBar(
        centerTitle: false,
        title: Row(
          children: [
            Image.asset(
              'images/logo_image.jpg',
              width: 90,
              height: 52,
            ),
            SizedBox(width: 20),
            Expanded(
              child: Text(
                '       Test Your Brain',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
        elevation: 10,
        backgroundColor: Color.fromARGB(255, 3, 22, 98),
        toolbarHeight: 80,
        automaticallyImplyLeading:
            false, //remove the leading arrow icon
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            "Hello ${widget.name}",
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Operation Number  $i ",
            style: TextStyle(fontSize: 25),
          ),
          //logo and Timer////////////////////////////////////////////////

          //operation//////////////////////////////////////////////////////
          Expanded(
            flex: 1,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //operation
                  SizedBox(
                    height: 50,
                    child: Text(
                      '${randomOperators.firstNumber}  ${randomOperators.operator}  ${randomOperators.secondNumber}  =  ',
                      style: NumberTextStyle.numberTextStyle,
                    ),
                  ),
                  //answer
                  SizedBox(
                    //color: Colors.amber,
                    height: 50,
                    width: 130,
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
            flex: 3,
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
