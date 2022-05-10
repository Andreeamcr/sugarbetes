import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sugarbetes/screens/settings_screen.dart';
import 'package:sugarbetes/utils/background_design.dart';
import 'package:sugarbetes/utils/constants.dart';

class GlicemiiPage extends StatefulWidget {
  static String id = 'glicemii';

  @override
  _GlicemiiPageState createState() => _GlicemiiPageState();
}

class _GlicemiiPageState extends State<GlicemiiPage> {
  Icon customIcon = const Icon(
    Icons.link_off,
    color: kFullGreen,
    size: 30,
  );
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    String dbStatus = 'Deconectat';
    return Stack(
      children: [
        BackgroundColorWidget(),
        Scaffold(
          appBar: AppBar(
            shadowColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: height * 0.03, horizontal: width * 0.09),
                    child: FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          if (customIcon.icon == Icons.link_off) {
                            customIcon = const Icon(Icons.link,
                                color: kFullGreen, size: 30);
                            Navigator.pushNamed(context, SettingsPage.id);
                          } else {
                            customIcon = const Icon(
                              Icons.link_off,
                              color: kFullGreen,
                              size: 30,
                            );
                          }
                        });
                      },
                      child: customIcon,
                      backgroundColor: kFullNavyBlue,
                    ),
                  ),
                  Text(
                    'Status:  $dbStatus',
                    //TODO: de implementat variabila sa nu mai fie hardcodata
                    style: kMathTextStyleBold,
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.start,
              ),
            ],
          ),
          backgroundColor: Colors.transparent,
        ),
      ],
    );
  }
}
