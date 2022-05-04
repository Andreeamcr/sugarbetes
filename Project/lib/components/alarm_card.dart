import 'package:flutter/material.dart';
import 'package:sugarbetes/utils/constants.dart';
import 'animated_toggle.dart';

class AlarmCard extends StatelessWidget {
  const AlarmCard({required this.selectedTime, required this.callBack});

  final TimeOfDay selectedTime;
  final Function(dynamic) callBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: kGradient2.withOpacity(0.4),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Icon(
                  Icons.alarm,
                  size: 30,
                ),
              )),
          Expanded(
              flex: 2,
              child: Text(
                "${selectedTime.hour} : ${selectedTime.minute}",
                style: kMathTextStyleBold,
              )),
          Expanded(
            flex: 2,
            child: AnimatedToggle(
              values: ['On', 'Off'],
              onToggleCallback: callBack,
              backgroundColor: kGradient2,
              buttonColor: kFullNavyBlue,
            ),
          ),
        ],
      ),
    );
  }
}
