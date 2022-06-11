import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sugarbetes/utils/background_design.dart';
import 'package:sugarbetes/utils/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sugarbetes/components/alarm_card.dart';

class ReminderPage extends StatefulWidget {
  static String id = 'reminder';
  const ReminderPage({Key? key}) : super(key: key);

  @override
  _ReminderPageState createState() => _ReminderPageState();
}

class _ReminderPageState extends State<ReminderPage> {
  TimeOfDay selectedTime = TimeOfDay(hour: 20, minute: 30);
  List<bool> _selections = List.generate(7, (_) => false);
  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
        context: context,
        initialTime: selectedTime,
        initialEntryMode: TimePickerEntryMode.dial,
        builder: (context, child) {
          return Theme(
              data: ThemeData.dark().copyWith(
                colorScheme: ColorScheme.light(
                  primary: kFullNavyBlue,
                  onSurface: kFullNavyBlue,
                ),
                buttonTheme: ButtonThemeData(
                  colorScheme: ColorScheme.dark(
                    primary: kFullNavyBlue,
                  ),
                ),
              ),
              child: child!);
        });
    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(() {
        selectedTime = timeOfDay;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    int _toggleValue = 0;
    int currentHour = DateTime.now().hour;
    int currentMinute = DateTime.now().minute;
    return Stack(
      children: [
        BackgroundColorWidget(),
        Scaffold(
          appBar: AppBar(
            title: Text(
              "Alarma insulinei bazale",
              style: kMathTextStyleBold,
            ),
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
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.07,
                          right: width * 0.17,
                          top: height * 0.1,
                          bottom: height * 0.03),
                      child: FloatingActionButton(
                        onPressed: () {
                          _selectTime(context);
                        },
                        child: Icon(
                          Icons.add,
                          color: kFullGreen,
                          size: 30,
                        ),
                        backgroundColor: kFullNavyBlue,
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                        color: kFullNavyBlue,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        '$currentHour : $currentMinute',
                        style: kTimeBold,
                      ),
                    ),
                  ],
                ),
                AlarmCard(
                  selectedTime: selectedTime,
                  callBack: (value) {
                    setState(() {
                      _toggleValue = value;
                      print(_toggleValue);
                    });
                  },
                  isSelected: _selections,
                  onPress: (int index) {
                    setState(() {
                      _selections[index] = !_selections[index];
                    });
                  },
                ),
                // AlarmCard(
                //   selectedTime: selectedTime,
                //   callBack: (value) {
                //     setState(() {
                //       _toggleValue = value;
                //       print(_toggleValue);
                //     });
                //   },
                //   isSelected: _selections,
                //   onPress: (int index) {
                //     setState(() {
                //       _selections[index] = !_selections[index];
                //     });
                //   },
                // ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    alignment: Alignment.bottomRight,
                    padding: EdgeInsets.only(
                        top: height * 0.25, right: width * 0.05),
                    child: SvgPicture.asset(
                      'assets/svg/time_management.svg',
                      width: width * 0.2,
                      height: height * 0.2,
                      alignment: Alignment.centerRight,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
