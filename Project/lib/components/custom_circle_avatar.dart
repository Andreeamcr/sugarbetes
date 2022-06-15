import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCircleAvatar extends StatelessWidget {
  MyCircleAvatar({required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return CircleAvatar(
      radius: height * 0.11,
      child: Image.asset(imageUrl),
    );
  }
}
