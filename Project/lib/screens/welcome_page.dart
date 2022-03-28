import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sugarbetes/components/custom_circle_avatar.dart';
import '../utils/background_design.dart';
import 'package:sugarbetes/utils/constants.dart';
import 'package:sugarbetes/components/reusable_button_welcome.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
                    child: Center(
                      child: Text(
                        'Bine ați venit la Sugarbetes!',
                        style: kWelcomeText,
                      ),
                    ),
                    padding: EdgeInsets.only(top: height * 0.1),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: MyCircleAvatar(
                  imageUrl: 'assets/images/BloodSugar.jpg',
                ),
              ),
              Expanded(
                flex: 0,
                child: SizedBox(
                  height:
                      height * 0.08, //8% from the total height of the screen
                  child: ReusableWelcomeButton(
                    color: kGradient1,
                    onPress: () {
                      setState(() {
                        Navigator.pushNamed(context, '/signUp');
                      });
                    },
                    width_factor: 0.15,
                    heigth_factor: 0.01,
                    buttonChild: Padding(
                      padding:EdgeInsets.symmetric(horizontal: width * 0.03),
                      child: Text(
                        'Creare cont',
                        style: kWelcomeText,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Expanded(
                flex: 0,
                child: SizedBox(
                  height: height * 0.08,
                  child: ReusableWelcomeButton(
                    color: kGradient2,
                    onPress: () {
                      setState(() {
                        Navigator.pushNamed(context, '/signIn');
                      });
                    },
                    width_factor: 0.15,
                    heigth_factor: 0.01,
                    buttonChild: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width*0.01),
                      child: Text(
                        'Autentificare',
                        style: kWelcomeText,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.13,
              ),
            ],
          ),
        )
      ],
    );
  }
}
