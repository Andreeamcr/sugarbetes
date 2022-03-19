import 'package:flutter/material.dart';
import 'package:sugarbetes/utils/background_design.dart';
import 'package:sugarbetes/utils/constants.dart';

class MathPage extends StatefulWidget {


  @override
  _MathPageState createState() => _MathPageState();
}

class _MathPageState extends State<MathPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        BackgroundColorWidget(),
        Scaffold(
          appBar: AppBar(
            shadowColor: Colors.transparent,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
            backgroundColor: Colors.transparent,
          ),
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.transparent,
          body:
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.all(width * 0.04),
                  child: Column(
                    children: [
                      Container(padding: EdgeInsets.all(height * 0.02),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white.withOpacity(0.3)
                        ),
                        child: Center(child: Text('''Necesarul tau caloric/zi (NC):  
                        1800kcal''',
                        style: kMathTextStyle,)),
                      ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(child: Text('   Ce este necesarul caloric (NC)? aaaaaaaaaaaaaafsevfagaervavWVevaaaaaaaaaaaaaaaaasvjhsbkcbkjabkshcbkaNCKbjbs',style: kMathTextStyle,),),
                     )
                  ],),
                ),
                Column(children: [
                  Container(color: Colors.red,
                  child: Text('this is mambo no5'),),
                  Container(color: Colors.blue,
                  child: Text('this is not mambo no5'),)
                ],),
                Column(
                  children: [
                    Container(
                      color: Colors.red,
                      child: Text('blaaaaah'),
                    ),
                    Container(
                      color: Colors.blue,
                      child: Text('blahblahblah'),
                    ),
                  ],
                )

              ],
            ),
          ),

      ],
    );
  }
}
