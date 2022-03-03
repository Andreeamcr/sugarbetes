import 'package:flutter/material.dart';
import 'package:sugarbetes/components/bottom_button.dart';
import 'package:sugarbetes/components/custom_circle_avatar.dart';
import 'package:sugarbetes/components/form_field.dart';
import 'package:sugarbetes/utils/constants.dart';
import 'package:sugarbetes/background_design.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundColorWidget(),
        Scaffold(
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
                      'Sign In',
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
                      color: kBottomCardColor),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 35.0,
                        ),
                        MyFormField(
                            inputLabel: 'Enter your email',
                            icon: Icon(Icons.email),
                            obscure: false,
                            suggestions: true),
                        MyFormField(
                            inputLabel: 'Enter your password',
                            icon: Icon(Icons.password),
                            obscure: true,
                            suggestions: false),
                        SizedBox(
                          height: 20.0,
                        ),
                        BottomButton(
                          label: 'Log In',
                          onPress: () => print('Log in button pressed'),
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
      ],
    );
  }
}
