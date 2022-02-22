import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../background_design.dart';
import 'package:sugarbetes/constants.dart';

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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  child: Text(
                    'Welcome to Sugarbetes!',
                    style: kWelcomeText,
                  ),
                  padding: EdgeInsets.only(top: 100),
                ),
              ),
              SizedBox(height: 50.0),
              CircleAvatar(
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
              Expanded(
                child: Text(
                  'ghiaaavjerkfa',
                  style: kWelcomeText,
                ),
                flex: 2,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class MyClipper extends CustomClipper<Rect> {
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, 150, 150);
  }

  bool shouldReclip(oldClipper) {
    return false;
  }
}
