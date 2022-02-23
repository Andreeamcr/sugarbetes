import 'package:flutter/material.dart';

class MyClipper extends CustomClipper<Rect> {
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, 150, 150);
  }

  bool shouldReclip(oldClipper) {
    return false;
  }
}
