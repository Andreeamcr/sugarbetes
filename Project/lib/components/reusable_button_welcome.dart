// import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sugarbetes/utils/constants.dart';

class ReusableWelcomeButton extends StatelessWidget {
  ReusableWelcomeButton(
      {required this.color, required this.onPress, required this.buttonChild});
  final Color color;
  final VoidCallback onPress;
  final Widget buttonChild;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
        padding: EdgeInsets.only(left: width*0.05 , right: width*0.05,top: height*0.01, bottom: height * 0.01),
      ),
    );
  }
}
