// import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sugarbetes/utils/constants.dart';

class ReusableWelcomeButton extends StatelessWidget {
  ReusableWelcomeButton(
      {required this.color, required this.onPress, required this.buttonChild, this.width_factor, this.heigth_factor});
  final Color color;
  final VoidCallback onPress;
  final Widget buttonChild;
  final double? width_factor;
  final double? heigth_factor;

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
        padding: EdgeInsets.symmetric(horizontal: width * width_factor! ,vertical: height * heigth_factor!),
      ),
    );
  }
}
