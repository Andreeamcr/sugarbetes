import 'package:flutter/material.dart';
import 'package:sugarbetes/utils/background_design.dart';

class MathFormulas extends StatefulWidget {

  @override
  _MathFormulasState createState() => _MathFormulasState();
}

class _MathFormulasState extends State<MathFormulas> {
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
          ),
          backgroundColor: Colors.transparent,
          body:
            Container(
              color: Colors.red,
              child: Text("OOOOWWWWW"),
            ),

        ),
      ],
    );
  }
}
