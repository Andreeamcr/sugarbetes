import 'package:flutter/material.dart';
import 'package:sugarbetes/utils/constants.dart';

class IconTextWidget extends StatelessWidget {
  IconTextWidget({required this.icon, required this.label});

  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 60.0,
        ),
        SizedBox(height: 15.0),
        Text(
          label,
          style: kIconTextLabel,
        ),
      ],
    );
  }
}
