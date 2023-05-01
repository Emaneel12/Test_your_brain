import 'package:flutter/material.dart';

class GameOverScreen extends StatelessWidget {
  final int score;
  final int level;

  GameOverScreen({required this.score, required this.level});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Free space at the top of the interface
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),

          // Space for the logo
          Image.asset(
            'logo.png.jpg',
            height: 100,
            width: 100,
          ),

          // "The Game is over" message
          SizedBox(height: 20),
          Text(
            'The Game is over',
            style: TextStyle(fontSize: 24),
          ),

          // Rectangular container for final score
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              'Your final score is: $score',
              style: TextStyle(fontSize: 20),
            ),
          ),

          // Rectangular container for level
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              'Your level is: $level',
              style: TextStyle(fontSize: 20),
            ),
          ),

          // Rectangular container for "Play again?" button
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Play again?',
                  style: TextStyle(fontSize: 20),
                ),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
//comment