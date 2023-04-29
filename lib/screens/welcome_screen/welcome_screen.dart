import 'package:flutter/material.dart';
import 'package:test_your_brain/screens/game_screen/game_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 95, 119, 159),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.jpeg'),
              Text(
                'Welcome !',
                style: TextStyle(
                  fontFamily: 'Signatra',
                  fontSize: 50,
                  color: Colors.white,
                ),
              ),
              Text(
                'Test your brain now',
                style: TextStyle(
                  fontFamily: 'Signatra',
                  fontSize: 50,
                  color: Colors.white,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const SecondPage();
                      },
                    ),
                  );
                },
                child: Text('Next'),
              ),
            ],
          ),
        ));
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 95, 119, 159),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.jpeg'),
              Text(
                'In this game you will solve 20 mathematic operations the maximum time to solve each operation is 10s at the end you will know your score out of 20',
                style: TextStyle(
                  fontFamily: 'Signatra',
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const GameScreen();
                      },
                    ),
                  );
                },
                child: Text('Get Started'),
              ),
            ],
          ),
        ));
  }
}
