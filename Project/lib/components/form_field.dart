import 'package:flutter/material.dart';

class MyFormField extends StatelessWidget {
  MyFormField(
      {required this.inputLabel,
      required this.icon,
      required this.obscure,
      required this.suggestions,
      required this.onChange});

  final String inputLabel;
  final Icon icon;
  final bool obscure;
  final bool suggestions;
  Function(String) onChange;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      child: TextFormField(
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: inputLabel,
          prefixIcon: icon,
        ),
        obscureText: obscure,
        enableSuggestions: suggestions,
        //onTap: onPressed,
        onChanged: onChange,
      ),
    );
  }
}
