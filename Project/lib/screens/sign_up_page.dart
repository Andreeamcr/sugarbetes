import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sugarbetes/utils/constants.dart';
import '../utils/background_design.dart';
import 'package:sugarbetes/components/custom_circle_avatar.dart';
import 'package:sugarbetes/components/form_field.dart';
import 'package:sugarbetes/components/bottom_button.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
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
          backgroundColor: Colors.transparent,
        ),
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyCircleAvatar(),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Sign Up',
                    style: kWelcomeText,
                  ),
                ],
              ),
              flex: 1,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0)),
                  color: kBottomCardColor,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      MyFormField(
                        inputLabel: 'Enter your firstname',
                        icon: Icon(Icons.people),
                        obscure: false,
                        suggestions: true,
                      ),
                      MyFormField(
                        inputLabel: 'Enter your lastname',
                        icon: Icon(Icons.people),
                        obscure: false,
                        suggestions: true,
                      ),
                      MyFormField(
                        inputLabel: 'Enter your email address',
                        icon: Icon(Icons.email),
                        obscure: false,
                        suggestions: true,
                      ),
                      MyFormField(
                        inputLabel: 'Enter password',
                        icon: Icon(Icons.password),
                        obscure: true,
                        suggestions: false,
                      ),
                      MyFormField(
                        inputLabel: 'Confirm password',
                        icon: Icon(Icons.password),
                        obscure: true,
                        suggestions: false,
                      ),
                      BottomButton(
                        label: 'Create account',
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
