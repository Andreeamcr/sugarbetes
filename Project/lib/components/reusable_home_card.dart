import 'package:flutter/material.dart';
import 'dart:core';

class ReusableHomeCard extends StatelessWidget {
  ReusableHomeCard(
      {required this.color,
        this.gradient,
      required this.onPress,
      required this.radius,
      required this.cardChild});
  final Color color;
  final LinearGradient? gradient;
  final VoidCallback onPress;
  final BorderRadius radius;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
          gradient: gradient,
          color: color,
          borderRadius: radius,
        ),
        child: cardChild,

      ),
    );
  }
}
