import 'dart:core';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sugarbetes/components/custom_circle_avatar.dart';
import 'package:sugarbetes/components/reusable_button_welcome.dart';
import 'package:sugarbetes/utils/background_design.dart';
import 'package:sugarbetes/utils/constants.dart';
import 'package:sugarbetes/components/form_field.dart';
import 'package:sugarbetes/components/gender_card.dart';

enum GenderType { female, male }
double opacityLevel = 1;

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
                padding: EdgeInsets.only(right: 15.0),
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
                Expanded(
                  flex: 1,
                  child: Wrap(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyCircleAvatar(
                            imageUrl: 'assets/images/user-profile.jpg',
                          ),
                          AnimatedOpacity(
                            duration: Duration(seconds: 0),
                            opacity: opacityLevel,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: InkWell(
                                onTap: () {
                                  print('I changed the profile picture');
                                },
                                child: Text(
                                  'Change profile picture',
                                  style: kHyperlinkTextStyle,
                                ),
                              ),
                            ),
                          ),
                          //TODO: Make this avatar to change profile picture
                          AnimatedOpacity(
                            duration: Duration(seconds: 0),
                            opacity: opacityLevel,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: Center(
                                child: Text(
                                  'Hello Andreea!',
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
                    padding: const EdgeInsets.only(
                        top: 40, bottom: 20, left: 20, right: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.white.withOpacity(0.5),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 15.0,
                                  left: 15.0,
                                  right: 15.0,
                                  bottom: 10.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: GenderSelectionCard(
                                      genderLabel: 'Female',
                                      onPressed: () {
                                        setState(() {
                                          selectedGender = GenderType.female;
                                          print('$selectedGender was pressed');
                                        });
                                      },
                                      color: selectedGender == GenderType.female
                                          ? kFullNavyBlue.withOpacity(0.8)
                                          : Colors.white.withOpacity(0.4),
                                    ),
                                  ),
                                  SizedBox(width: 5.0),
                                  Expanded(
                                    child: GenderSelectionCard(
                                      onPressed: () {
                                        setState(() {
                                          selectedGender = GenderType.male;
                                          print('$selectedGender was pressed');
                                        });
                                      },
                                      color: selectedGender == GenderType.male
                                          ? kFullNavyBlue.withOpacity(0.8)
                                          : Colors.white.withOpacity(0.4),
                                      genderLabel: 'Male',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            MyFormField(
                                inputLabel: 'Age: ',
                                icon: Icon(Icons.edit),
                                obscure: false,
                                suggestions: false,
                                onPressed: () {
                                  opacityLevel == 1
                                      ? _changeOpacity(true)
                                      : opacityLevel = 1;
                                }),
                            MyFormField(
                                inputLabel: 'Height: ',
                                icon: Icon(Icons.height),
                                obscure: false,
                                suggestions: false,
                                onPressed: () {
                                  opacityLevel == 1
                                      ? _changeOpacity(true)
                                      : opacityLevel = 1;
                                }),
                            MyFormField(
                                inputLabel: 'Weight: ',
                                icon: Icon(Icons.monitor_weight),
                                obscure: false,
                                suggestions: false,
                                onPressed: () {
                                  opacityLevel == 1
                                      ? _changeOpacity(true)
                                      : opacityLevel = 1;
                                }),
                            MyFormField(
                                inputLabel:
                                    'Level of activity (low, medium, high): ',
                                icon: Icon(Icons.fitness_center),
                                obscure: false,
                                suggestions: false,
                                onPressed: () {
                                  opacityLevel == 1
                                      ? _changeOpacity(true)
                                      : opacityLevel = 1;
                                }),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 15.0),
                              child: ReusableWelcomeButton(
                                color: kFullNavyBlue,
                                onPress: () =>
                                    Navigator.pushNamed(context, '/insulin'),
                                buttonChild: Text('Go to insulin page'),
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
