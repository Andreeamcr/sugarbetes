import 'package:flutter/material.dart';
import 'package:sugarbetes/utils/constants.dart';

class IconTextWidget extends StatelessWidget {
  IconTextWidget({required this.icon, required this.label});

  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 60.0,
        ),
        SizedBox(height: height * 0.01),
        Text(
          label,
          style: kIconTextLabel,
        ),
      ],
    );
  }
}
