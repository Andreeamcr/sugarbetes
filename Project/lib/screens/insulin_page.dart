import 'package:flutter/material.dart';
import 'package:sugarbetes/utils/background_design.dart';

class InsulinPage extends StatefulWidget {
  @override
  _InsulinPageState createState() => _InsulinPageState();
}

class _InsulinPageState extends State<InsulinPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        BackgroundColorWidget(),
        Scaffold(
          appBar: AppBar(
            shadowColor: Colors.transparent,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.check),
                onPressed: () {
                  print('check pressed');
                },
                padding: EdgeInsets.only(right: width * 0.05),
              )
            ],
            backgroundColor: Colors.transparent,
          ),
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.transparent,
          body: CustomPaint(
            painter: Mypainter(),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 20,
                  ),

                ]),
          ),
        ),
      ],
    );
  }
}
