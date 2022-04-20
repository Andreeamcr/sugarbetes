import 'package:flutter/material.dart';
import 'package:sugarbetes/utils/background_design.dart';

class ReminderPage extends StatefulWidget {
  static String id = 'reminder';
  const ReminderPage({Key? key}) : super(key: key);

  @override
  _ReminderPageState createState() => _ReminderPageState();
}

class _ReminderPageState extends State<ReminderPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
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
          ),
          backgroundColor: Colors.transparent,
          body: Container(
            child: Text('a new start'),
            //TODO: add an image on the top of the page, add plus button, add new container for the new alarm, add checkboxes for every alarm to check the days for the alarm to ring, add pop-up window to set the alarm time
          ),
        ),
      ],
    );
  }
}
