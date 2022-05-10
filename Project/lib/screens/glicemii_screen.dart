import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sugarbetes/screens/settings_screen.dart';
import 'package:sugarbetes/utils/background_design.dart';
import 'package:sugarbetes/utils/constants.dart';
import 'package:sugarbetes/components/glucose_table.dart';

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: height * 0.04, horizontal: width * 0.09),
                    child: FloatingActionButton(
                      heroTag: 'btn1',
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
              ListView(
                children: [
                  GlucoseTable(
                    dataRow: [
                      DataRow(cells: [
                        DataCell(
                          Text(
                            '6:48',
                            style: kToggleText,
                          ),
                        ),
                        DataCell(
                          Text(
                            '68',
                            style: kToggleText,
                          ),
                        ),
                      ]),
                      DataRow(cells: [
                        DataCell(
                          Text(
                            '12:05',
                            style: kToggleText,
                          ),
                        ),
                        DataCell(
                          Text(
                            '95',
                            style: kToggleText,
                          ),
                        ),
                      ]),
                    ],
                  ),
                ],
                shrinkWrap: true,
              ),
              Padding(
                padding: EdgeInsets.all(width * 0.06),
                child: SizedBox(
                  width: width * 0.55,
                  height: height * 0.06,
                  child: FloatingActionButton(
                    heroTag: 'btn2',
                    onPressed: () {
                      print("Hello!");
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Adaugă o nouă valoare',
                      style: kToggleText,
                    ),
                    backgroundColor: kFullNavyBlue,
                  ),
                ),
              ),
            ],
          ),
          // ),
          backgroundColor: Colors.transparent,
        ),
      ],
    );
  }
}
