import 'package:flutter/material.dart';
import '../background_design.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      BackgroundColorWidget(),
      Container(
        child: Text('blahblah'),
      )
      // Container(
      //   color: Colors.transparent,
      //   child: Center(child: Text('page2')),
      // ),
    ]);
  }
}
