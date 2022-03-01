import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../background_design.dart';
import 'package:sugarbetes/constants.dart';
import 'package:sugarbetes/components/custom_clipper.dart';
import 'package:sugarbetes/components/reusable_button_welcome.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundColorWidget(),
        Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Center(
                  child: Container(
                    // color: Colors.red,
                    child: Text(
                      'Welcome to Sugarbetes!',
                      style: kWelcomeText,
                    ),
                    padding: EdgeInsets.only(top: 120),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: CircleAvatar(
                  child: ClipOval(
                    clipper: MyClipper(),
                    child: Image.asset(
                      'assets/images/BloodSugar.jpg',
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  radius: 75,
                ),
              ),
              Expanded(
                flex: 0,
                child: SizedBox(
                  height: 50,
                  child: ReusableWelcomeButton(
                    color: kGradient1,
                    onPress: () {
                      setState(() {
                        Navigator.pushNamed(context, '/signUp');
                      });
                    },
                    buttonChild: Text(
                      'Sign up',
                      style: kWelcomeText,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                flex: 0,
                child: SizedBox(
                  height: 50,
                  child: ReusableWelcomeButton(
                    color: kGradient2,
                    onPress: () {
                      setState(() {});
                    },
                    buttonChild: Text(
                      'Sign in',
                      style: kWelcomeText,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 80,
              ),
            ],
          ),
        )
      ],
    );
  }
}