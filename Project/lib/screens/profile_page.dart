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
import 'dart:io' show Platform, sleep;
import 'package:sugarbetes/screens/insulin_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sugarbetes/services/databaseService.dart';
import 'package:firebase_core/firebase_core.dart';

enum GenderType { female, male }
double opacityLevel = 1;

class ProfilePage extends StatefulWidget {
  static String id = 'profile';
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  User loggedInUser = FirebaseAuth.instance.currentUser!;
  GenderType selectedGender = GenderType.female;
  String currentUser = "";
  DatabaseService dbService = DatabaseService();

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

  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String level in nivelActivitate) {
      var newItem = DropdownMenuItem(
        child: Padding(
          child: Text(level),
          padding: EdgeInsets.symmetric(horizontal: 25),
        ),
        value: level,
      );
      dropdownItems.add(newItem);
    }
    return DropdownButton(
      items: dropdownItems,
      value: DatabaseService.userInfo["activityLevel"] == ''
          ? dropdownItems[1].value
          : DatabaseService.userInfo["activityLevel"],
      onChanged: (value) {
        setState(() {
          dbService.setValueInDatabase("activityLevel", value.toString());
        });
      },
    );
  }

  String? getValueFromList(List<DropdownMenuItem<String>> list, String value) {
    String? result = '';
    for (var element in list) {
      if (element.value == value) {
        result = element.value;
      }
    }

    return result;
  }

  CupertinoPicker iosPicker() {
    List<Text> pickerItems = [];
    for (String level in nivelActivitate) {
      pickerItems.add(Text(level));
    }
    return CupertinoPicker(
        itemExtent: 32.0,
        onSelectedItemChanged: (selectedIndex) {
          print(selectedIndex);
        },
        children: pickerItems);
  }

  @override
  Widget build(BuildContext context) {
    //print("[ProfilePage] Build");
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
                  height: height * 0.05,
                ),
                Expanded(
                  flex: 1,
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyCircleAvatar(
                            imageUrl: 'assets/images/profile_circle.png',
                          ),
                          AnimatedOpacity(
                            duration: Duration(seconds: 0),
                            opacity: opacityLevel,
                            child: Padding(
                              padding: EdgeInsets.only(top: height * 0.02),
                              child: InkWell(
                                onTap: () {
                                  print('I changed the profile picture');
                                },
                                child: Text(
                                  'Schimb?? poza de profil',
                                  style: kHyperlinkTextStyle,
                                ),
                              ),
                            ),
                          ),
                          //TODO: Make this avatar to change profile picture
                          AnimatedOpacity(
                              duration: Duration(seconds: 0),
                              opacity: opacityLevel,
                              child: Text(
                                'Salut ${DatabaseService.getLoggedUserName()}!',
                                style: kWelcomeText,
                              )),
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
                            Padding(
                              padding: EdgeInsets.only(
                                  top: height * 0.025,
                                  left: width * 0.03,
                                  right: width * 0.03,
                                  bottom: height * 0.01),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: GenderSelectionCard(
                                      genderLabel: 'Femeie',
                                      onPressed: () {
                                        setState(() {
                                          selectedGender = GenderType.female;
                                          dbService.setValueInDatabase(
                                              "gender", "female");
                                          print('$selectedGender was pressed');
                                        });
                                      },
                                      color: selectedGender == GenderType.female
                                          ? kFullNavyBlue.withOpacity(0.8)
                                          : Colors.white.withOpacity(0.4),
                                    ),
                                  ),
                                  SizedBox(width: width * 0.02),
                                  Expanded(
                                    child: GenderSelectionCard(
                                      onPressed: () {
                                        setState(() {
                                          selectedGender = GenderType.male;
                                          dbService.setValueInDatabase(
                                              "gender", "male");
                                          print('$selectedGender was pressed');
                                        });
                                      },
                                      color: selectedGender == GenderType.male
                                          ? kFullNavyBlue.withOpacity(0.8)
                                          : Colors.white.withOpacity(0.4),
                                      genderLabel: 'B??rbat',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            MyFormField(
                                inputLabel:
                                    'V??rst??: ${DatabaseService.getUserValue("age")}',
                                icon: Icon(Icons.edit),
                                obscure: false,
                                suggestions: false,
                                onChange: (value) {
                                  opacityLevel == 1
                                      ? _changeOpacity(true)
                                      : opacityLevel;
                                  dbService.setValueInDatabase(
                                      "age", value.toString());
                                }),
                            MyFormField(
                                inputLabel:
                                    '??n??l??ime (cm): ${DatabaseService.getUserValue("height")}',
                                icon: Icon(Icons.height),
                                obscure: false,
                                suggestions: false,
                                onChange: (value) {
                                  opacityLevel == 1
                                      ? _changeOpacity(true)
                                      : opacityLevel;
                                  dbService.setValueInDatabase("height", value);
                                }),
                            MyFormField(
                                inputLabel:
                                    'Greutate (kg): ${DatabaseService.getUserValue("weight")}',
                                icon: Icon(Icons.monitor_weight),
                                obscure: false,
                                suggestions: false,
                                onChange: (value) {
                                  opacityLevel == 1
                                      ? _changeOpacity(true)
                                      : opacityLevel;
                                  dbService.setValueInDatabase("weight", value);
                                }),
                            Container(
                              padding: EdgeInsets.all(height * 0.015),
                              child: Platform.isAndroid
                                  ? androidDropdown()
                                  : iosPicker(),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: height * 0.02,
                                  horizontal: width * 0.03),
                              child: ReusableWelcomeButton(
                                width_factor: 0.08,
                                heigth_factor: 0.02,
                                color: kFullNavyBlue,
                                onPress: () => Navigator.pushNamed(
                                    context, InsulinPage.id),
                                buttonChild: Text('''Mergi la pagina
      tratament'''),
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
