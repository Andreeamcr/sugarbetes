import 'package:flutter/material.dart';
import 'package:sugarbetes/utils/constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.label, required this.onPress});

  final Function onPress;
  final String label;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(top: 5.0),
        width: double.infinity,
        height: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                label,
                style: kWelcomeText,
              ),
            ),
          ],
        ),
      ),
      onTap: onPress(),
    );
  }
}
