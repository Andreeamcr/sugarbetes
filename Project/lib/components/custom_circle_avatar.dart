import 'package:flutter/material.dart';
import 'package:sugarbetes/components/custom_clipper.dart';
import 'package:sugarbetes/utils/constants.dart';

class MyCircleAvatar extends StatelessWidget {
  MyCircleAvatar({required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return CircleAvatar(
      child: ClipOval(
        clipper: MyClipper(),
        child: Image.asset(
          imageUrl,
          height: height * 0.22,
          width: width * 0.4,
          fit: BoxFit.cover,
        ),
      ),
      radius: height * 0.11,
      backgroundColor: kFullNavyBlue,
    );
  }
}
