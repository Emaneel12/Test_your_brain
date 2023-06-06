import 'package:flutter/material.dart';
import 'package:test_your_brain/styles/text_styles.dart';

import '../styles/color.dart';

class NumberButton extends StatelessWidget {
  final String child;

  final VoidCallback onTap;

  var buttonColor = MyColors.boxColor;

  NumberButton({
    super.key,
    required this.child,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    //condition so the = is green
    if (child == '=') {
      buttonColor = Color.fromRGBO(76, 175, 80, 1);
    } else if (child == '') {
      buttonColor = MyColors.myColor;
    } else if (child == 'DEL') {
      buttonColor = Color.fromRGBO(244, 67, 54, 1);
    } else if (child == 'AC') {
      buttonColor = Color.fromRGBO(96, 125, 139, 1);
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),

      //button in a way
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Center(
            child: Text(
              child,
              style: SmallTextStyle.smallTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
