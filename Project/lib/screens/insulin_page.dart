import 'dart:core';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sugarbetes/components/custom_circle_avatar.dart';
import 'package:sugarbetes/components/reusable_button_welcome.dart';
import 'package:sugarbetes/services/databaseService.dart';
import 'package:sugarbetes/utils/background_design.dart';
import 'package:sugarbetes/utils/constants.dart';
import 'package:sugarbetes/components/form_field.dart';
import 'package:sugarbetes/screens/home_page.dart';

enum GenderType { female, male }
double opacityLevel = 1;

class InsulinPage extends StatefulWidget {
  static String id = 'insulin';
  @override
  _InsulinPageState createState() => _InsulinPageState();
}

class _InsulinPageState extends State<InsulinPage> {
  GenderType selectedGender = GenderType.female;
  DatabaseService dbService = new DatabaseService();

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
            elevation: 0,
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
                  Navigator.pushNamed(context, HomePage.id);
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
                  height: height * 0.05,
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
                                  'Schema de tratament',
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
                        top: height * 0.06,
                        bottom: height * 0.03,
                        left: width * 0.045,
                        right: width * 0.045),
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
                                inputLabel: 'Ce insulină rapidă folosiți?: ',
                                icon: Icon(Icons.bloodtype),
                                obscure: false,
                                suggestions: false,
                                onChange: (value) {
                                  opacityLevel == 1
                                      ? _changeOpacity(true)
                                      : opacityLevel;
                                  dbService.setValueInDatabase(
                                      "rapidInsulinType", value.toString());
                                }),
                            MyFormField(
                                inputLabel:
                                    'Doza totală de insulină rapidă/zi: ',
                                icon: Icon(Icons.opacity),
                                obscure: false,
                                suggestions: false,
                                onChange: (value) {
                                  opacityLevel == 1
                                      ? _changeOpacity(true)
                                      : opacityLevel;
                                  dbService.setValueInDatabase(
                                      "rapidInsulinQuantity", value.toString());
                                }),
                            MyFormField(
                                inputLabel: 'Ce insulină bazală folosiți?: ',
                                icon: Icon(Icons.bloodtype),
                                obscure: false,
                                suggestions: false,
                                onChange: (value) {
                                  opacityLevel == 1
                                      ? _changeOpacity(true)
                                      : opacityLevel;
                                  dbService.setValueInDatabase(
                                      "baseInsulinType", value.toString());
                                }),
                            MyFormField(
                                inputLabel:
                                    'Doza totală de insulină bazală/zi: ',
                                icon: Icon(Icons.opacity),
                                obscure: false,
                                suggestions: false,
                                onChange: (value) {
                                  opacityLevel == 1
                                      ? _changeOpacity(true)
                                      : opacityLevel;
                                  dbService.setValueInDatabase(
                                      "baseInsulinQuantity", value.toString());
                                }),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: height * 0.05,
                                  horizontal: width * 0.03),
                              child: ReusableWelcomeButton(
                                width_factor: 0.08,
                                heigth_factor: 0.02,
                                color: kFullNavyBlue,
                                onPress: () => print('I pressed save button'),
                                buttonChild: Text('Salvează'),
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
