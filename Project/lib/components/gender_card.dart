import 'package:flutter/material.dart';
import 'package:sugarbetes/utils/constants.dart';

class GenderSelectionCard extends StatelessWidget {
  GenderSelectionCard(
      {required this.genderLabel,
      required this.color,
      required this.onPressed});
  final String genderLabel;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: color),
        height: 40,
        child: Center(
            child: Text(
          genderLabel,
          style: kGenderTextStyle,
        )),
      ),
    );
  }
}
