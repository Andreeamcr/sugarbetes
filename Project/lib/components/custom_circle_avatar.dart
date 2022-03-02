import 'package:flutter/material.dart';
import 'package:sugarbetes/components/custom_clipper.dart';

class MyCircleAvatar extends StatelessWidget {
  const MyCircleAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: ClipOval(
        clipper: MyClipper(),
        child: Image.asset(
          'assets/images/BloodSugar.jpg',
          height: 150,
          width: 150,
          fit: BoxFit.cover,
        ),
      ),
      radius: 75,
    );
  }
}
