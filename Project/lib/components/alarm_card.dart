import 'package:flutter/material.dart';
import 'package:sugarbetes/utils/constants.dart';
import 'animated_toggle.dart';

class AlarmCard extends StatelessWidget {
  const AlarmCard(
      {required this.selectedTime,
      required this.callBack,
      required this.onPress,
      required this.isSelected});

  final TimeOfDay selectedTime;
  final Function(dynamic) callBack;
  final Function(int) onPress;
  final List<bool> isSelected;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: kGradient2.withOpacity(0.4),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Row(
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
          Center(
            heightFactor: 1.5,
            child: SizedBox(
              height: height * 0.04,
              child: ToggleButtons(
                children: <Widget>[
                  Text(
                    'Lu',
                    style: kToggleText,
                  ),
                  Text(
                    'Ma',
                    style: kToggleText,
                  ),
                  Text(
                    'Mi',
                    style: kToggleText,
                  ),
                  Text(
                    'Jo',
                    style: kToggleText,
                  ),
                  Text(
                    'Vi',
                    style: kToggleText,
                  ),
                  Text(
                    'Sâ',
                    style: kToggleText,
                  ),
                  Text(
                    'Du',
                    style: kToggleText,
                  ),
                ],
                isSelected: isSelected,
                onPressed: onPress,
                selectedColor: kFullNavyBlue,
                fillColor: kFullNavyBlue,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
