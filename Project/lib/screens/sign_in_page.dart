import 'package:flutter/material.dart';
import 'package:sugarbetes/components/custom_circle_avatar.dart';
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
