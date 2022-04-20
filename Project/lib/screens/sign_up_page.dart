import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sugarbetes/utils/constants.dart';
import '../utils/background_design.dart';
import 'package:sugarbetes/components/custom_circle_avatar.dart';
import 'package:sugarbetes/components/form_field.dart';
import 'package:sugarbetes/components/bottom_button.dart';

class SignUpPage extends StatefulWidget {
  static String id = 'signUp';
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Stack(children: [
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
          backgroundColor: Colors.transparent,
        ),
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: height * 0.07),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyCircleAvatar(
                        imageUrl: 'assets/images/BloodSugar.jpg',
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      Text(
                        'Creare cont',
                        style: kWelcomeText,
                      ),
                    ],
                  ),
                ),
              ),
              flex: 1,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0)),
                  color: kFullGreen,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: height * 0.03,
                      ),
                      MyFormField(
                          inputLabel: 'Introduceți numele',
                          icon: Icon(Icons.people),
                          obscure: false,
                          suggestions: true,
                          onPressed: () {}),
                      MyFormField(
                          inputLabel: 'Introduceți prenumele',
                          icon: Icon(Icons.people),
                          obscure: false,
                          suggestions: true,
                          onPressed: () {}),
                      MyFormField(
                          inputLabel: 'Introduceți adresa de email',
                          icon: Icon(Icons.email),
                          obscure: false,
                          suggestions: true,
                          onPressed: () {}),
                      MyFormField(
                          inputLabel: 'Introduceți parola',
                          icon: Icon(Icons.password),
                          obscure: true,
                          suggestions: false,
                          onPressed: () {}),
                      MyFormField(
                          inputLabel: 'Confirmare parolă',
                          icon: Icon(Icons.password),
                          obscure: true,
                          suggestions: false,
                          onPressed: () {}),
                      BottomButton(
                        label: 'Crează cont',
                        onPress: () {
                          print('Hello!');
                        },
                      ),
                    ],
                  ),
                ),
              ),
              flex: 1,
            ),
          ],
        ),
      ),
    ]);
  }
}
