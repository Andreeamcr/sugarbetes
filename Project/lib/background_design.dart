import 'package:flutter/material.dart';

class BackgroundColorWidget extends StatelessWidget {
  BackgroundColorWidget({required this.backgroundChild});
  final Widget backgroundChild;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: backgroundChild,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xFF255B7C),
            Color(0xFF77E6B6),
          ],
        ),
      ),
    );
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
