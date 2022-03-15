import 'package:flutter/material.dart';
import 'package:sugarbetes/utils/constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.label, required this.onPress});

  final VoidCallback onPress;
  final String label;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onPress,
      // Future.delayed(Duration.zero, () {
      // });
      child: Container(
        width: double.infinity,
        height: height * 0.13,
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
    );
  }
}
