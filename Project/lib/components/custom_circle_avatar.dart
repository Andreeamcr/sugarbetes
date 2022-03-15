import 'package:flutter/material.dart';
import 'package:sugarbetes/components/custom_clipper.dart';

class MyCircleAvatar extends StatelessWidget {
  MyCircleAvatar({required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: ClipOval(
        clipper: MyClipper(),
        child: Image.asset(
          imageUrl,
          height: 150,
          width: 150,
          fit: BoxFit.cover,
        ),
      ),
      radius: 75,
    );
  }
}
