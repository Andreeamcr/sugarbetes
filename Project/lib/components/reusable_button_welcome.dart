// import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sugarbetes/constants.dart';

class ReusableWelcomeButton extends StatelessWidget {
  ReusableWelcomeButton(
      {required this.color, required this.onPress, required this.buttonChild});
  final Color color;
  final VoidCallback onPress;
  final Widget buttonChild;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      child: buttonChild,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        primary: color,
        textStyle: kWelcomeText,
        elevation: 10,
        padding: EdgeInsets.only(left: 50, right: 50),
      ),
    );
  }
}
