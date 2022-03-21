import 'package:flutter/material.dart';
import 'package:sugarbetes/utils/constants.dart';

class MathTwoCardsGroup extends StatelessWidget {
  MathTwoCardsGroup(
      {required this.label1,
      required this.label2,
      required this.label3,
      required this.label4});
  final String label1;
  final String label2;
  final String label3;
  final String label4;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(width * 0.04),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(height * 0.02),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withOpacity(0.5)),
            child: Column(
              children: [
                Center(
                  child: Text(
                    label1,
                    style: kMathTextStyle,
                  ),
                ),
                Center(
                  child: Text(
                    label2,
                    style: kMathTextStyleBold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Container(
            padding: EdgeInsets.all(height * 0.02),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Center(
                  child: Text(
                    label3,
                    style: kMathTextStyleBold,
                  ),
                ),
                Text(
                  label4,
                  style: kMathTextStyle,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
