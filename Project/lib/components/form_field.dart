import 'package:flutter/material.dart';

class MyFormField extends StatelessWidget {
  MyFormField(
      {required this.inputLabel,
      required this.icon,
      required this.obscure,
      required this.suggestions});

  final String inputLabel;
  final Icon icon;
  final bool obscure;
  final bool suggestions;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: TextFormField(
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: inputLabel,
          prefixIcon: icon,
        ),
        obscureText: obscure,
        enableSuggestions: suggestions,
      ),
    );
  }
}
