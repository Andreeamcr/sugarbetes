import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sugarbetes/components/form_field.dart';
import 'package:sugarbetes/screens/home_page.dart';
import 'package:sugarbetes/utils/background_design.dart';
import 'package:sugarbetes/screens/glicemii_screen.dart';
import '../components/reusable_button_welcome.dart';
import '../utils/constants.dart';

class SettingsPage extends StatefulWidget {
  static String id = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        BackgroundColorWidget(),
        Scaffold(
          appBar: AppBar(
            shadowColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  Navigator.pushNamed(context, HomePage.id);
                },
                padding: EdgeInsets.only(right: width * 0.05),
              ),
            ],
            backgroundColor: Colors.transparent,
          ),
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Align(
                child: Container(
                  padding: EdgeInsets.only(top: height * 0.1),
                  child: SvgPicture.asset(
                    'assets/svg/database.svg',
                    width: width * 0.2,
                    height: height * 0.2,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
              Expanded(
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
                            height: height * 0.03,
                          ),
                          MyFormField(
                              inputLabel: 'Tipul senzorului de glicemie',
                              icon: Icon(Icons.settings),
                              obscure: false,
                              suggestions: false,
                              onChange: (value) {}),
                          MyFormField(
                              inputLabel: 'Denumirea bazei de date',
                              icon: Icon(Icons.storage),
                              obscure: false,
                              suggestions: false,
                              onChange: (value) {}),
                          MyFormField(
                              inputLabel: 'Link de conectare',
                              icon: Icon(Icons.link),
                              obscure: false,
                              suggestions: false,
                              onChange: (value) {}),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: height * 0.07,
                                horizontal: width * 0.03),
                            child: ReusableWelcomeButton(
                              width_factor: 0.08,
                              heigth_factor: 0.02,
                              color: kFullNavyBlue,
                              onPress: () {
                                Navigator.pushNamed(context, GlicemiiPage.id);
                              },
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
      ],
    );
  }
}
