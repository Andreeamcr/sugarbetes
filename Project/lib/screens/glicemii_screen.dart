import 'package:flutter/material.dart';
import 'package:sugarbetes/utils/background_design.dart';

class GlicemiiPage extends StatefulWidget {
  static String id = 'glicemii';

  @override
  _GlicemiiPageState createState() => _GlicemiiPageState();
}

class _GlicemiiPageState extends State<GlicemiiPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundColorWidget(),
        Scaffold(
          body: Text('blabla'),
          backgroundColor: Colors.transparent,
        ),
      ],
    );
  }
}
