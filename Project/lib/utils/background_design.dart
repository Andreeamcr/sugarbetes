import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:sugarbetes/utils/constants.dart';

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

class Mypainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    Paint paint = Paint();
    Path ovalPath = Path();
    ovalPath.moveTo(0, height * 0.3);
    ovalPath.quadraticBezierTo(
        width * 0.5, height * 0.5, width * 1, height * 0.3);
    //the first 2 parameters are for the direction of stretching of the curve; the last 2 parameters are for the final point
    paint.color = kFullNavyBlue;
    canvas.drawPath(ovalPath, paint);
    Path rectPath = Path();
    rectPath.moveTo(0, 0);
    rectPath.addRect(Rect.fromLTRB(0, 0, width, height * 0.301));
    paint.color = kFullNavyBlue;
    canvas.drawPath(rectPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
    //I made this to not build the custom paint every time, just if the color modify for ex
  }
}
