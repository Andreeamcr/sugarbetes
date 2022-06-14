import 'package:sugarbetes/utils/constants.dart';

class GlucoseService {

  var currentDay = zile[0];
  var currentHour = DateTime.now().hour;

  int getCurrentHour() {
    if(currentDay == zile[0])
      return DateTime.now().hour;

    return currentHour;
  }

  String getCurrentDay() {
    return currentDay;
  }

  setCurrentHour(int hour) {
    currentHour = hour;
  }

  setCurrentDay(String day) {
    currentDay = day;
  }


  DateTime calculateSpaceGrid() {
    if(currentDay == zile[0])
    {
      currentHour = DateTime.now().hour;
      return DateTime.now();
    }
    var day = DateTime.now().subtract(Duration(days: daysMapped[currentDay]!));
    // print("Ziua curenta este" + DateTime(day.year, day.month, day.day, currentHour, 0,0).toString());
    return DateTime(day.year, day.month, day.day, currentHour, 0,0);
  }

}