import 'dart:core';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sugarbetes/components/custom_circle_avatar.dart';
import 'package:sugarbetes/components/reusable_button_welcome.dart';
import 'package:sugarbetes/utils/background_design.dart';
import 'package:sugarbetes/utils/constants.dart';
import 'package:sugarbetes/components/form_field.dart';

enum GenderType { female, male }
double opacityLevel = 1;

class InsulinPage extends StatefulWidget {
  @override
  _InsulinPageState createState() => _InsulinPageState();
}

class _InsulinPageState extends State<InsulinPage> {
  GenderType selectedGender = GenderType.female;

  void _changeOpacity(bool isPressed) {
    setState(() {
      if (isPressed) {
        if (opacityLevel == 1) {
          opacityLevel = 0;
        } else
          opacityLevel = 1;
      }
    });
  }

  void initState() {
    super.initState();
    opacityLevel = 1;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
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
                icon: Icon(Icons.home),
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
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
                  height: height*0.05,
                ),
                Expanded(
                  flex: 1,
                  child: Wrap(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyCircleAvatar(
                            imageUrl: 'assets/images/insulin_treatment.jpg',
                          ),
                          AnimatedOpacity(
                            duration: Duration(seconds: 0),
                            opacity: opacityLevel,
                            child: Padding(
                              padding:
                              EdgeInsets.symmetric(vertical: height * 0.01),
                              child: Center(
                                child: Text(
                                  'Insulin treatment',
                                  //TODO: Make the name to be not hardcoded
                                  style: kWelcomeText,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: height * 0.06, bottom: height * 0.03, left: width * 0.045, right: width * 0.045),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.white.withOpacity(0.5),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(
                              height: height * 0.02,
                            ),
                            MyFormField(
                                inputLabel: 'Fast acting insulin type: ',
                                icon: Icon(Icons.bloodtype),
                                obscure: false,
                                suggestions: false,
                                onPressed: () {
                                  opacityLevel == 1
                                      ? _changeOpacity(true)
                                      : opacityLevel;
                                }),
                            MyFormField(
                                inputLabel: 'Total amount of fast acting insulin/day: ',
                                icon: Icon(Icons.opacity),
                                obscure: false,
                                suggestions: false,
                                onPressed: () {
                                  opacityLevel == 1
                                      ? _changeOpacity(true)
                                      : opacityLevel;
                                }),
                            MyFormField(
                                inputLabel: 'Basal insulin type: ',
                                icon: Icon(Icons.bloodtype),
                                obscure: false,
                                suggestions: false,
                                onPressed: () {
                                  opacityLevel == 1
                                      ? _changeOpacity(true)
                                      : opacityLevel;
                                }),
                            MyFormField(
                                inputLabel:
                                'Total amount of basal insulin/day: ',
                                icon: Icon(Icons.opacity),
                                obscure: false,
                                suggestions: false,
                                onPressed: () {
                                  opacityLevel == 1
                                      ? _changeOpacity(true)
                                      : opacityLevel;
                                }),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: height * 0.05, horizontal: width * 0.03),
                              child: ReusableWelcomeButton(
                                width_factor: 0.08,
                                heigth_factor: 0.02,
                                color: kFullNavyBlue,
                                onPress: () =>
                                    print('I pressed save button'),
                                buttonChild: Text('Save'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
