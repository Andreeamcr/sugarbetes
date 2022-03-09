import 'package:flutter/material.dart';
import 'constants.dart';

class BackgroundColorWidget extends StatelessWidget {
  static final BackgroundColorWidget _singleton =
      BackgroundColorWidget._internal();

  factory BackgroundColorWidget() {
    return _singleton;
  }

  BackgroundColorWidget._internal();
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [kGradient1, kGradient2],
          ),
        ),
      )
    ]);
  }
}

//in case i'll do the circles from the corners
// class MyPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final height = size.height;
//     final width = size.width;
//     Paint paint = Paint();
//
//     Path firstOvalPath = Path();
//     firstOvalPath.moveTo(10.0, 0);
//     paint.color = Color(0xFF6FD394);
//     canvas.drawPath(firstOvalPath, paint);
//   }
//
//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return oldDelegate != this;
//   }
// }
