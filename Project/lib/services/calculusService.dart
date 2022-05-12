
import 'package:sugarbetes/services/databaseService.dart';

enum CalculusOptions {
  NC, DTI, IHC, FS, FC
}

Map<String, int> activityLvl = {"Repaus la pat": 25, "Activitate nivel ușor": 30,"Activitate nivel mediu": 35, "Activitate nivel intensiv":40};

class CalculusService {

  int _NC = 0;
  int _DTI = 0;
  int _IHC = 0;
  int _FS = 0;
  int _FC = 0;

  int getValue(CalculusOptions option) {
    switch(option) {
      case CalculusOptions.NC:
        return _NC == 0 ? calculateNC(): _NC;
      case CalculusOptions.DTI:
        return 0;
      case CalculusOptions.IHC:
        return 0;
      case CalculusOptions.FS:
        return 0;
      case CalculusOptions.FC:
        return 0;
    }
  }

  convertActivityLevel()
  {

  }

  int calculateNC() {
    var height = int.parse(DatabaseService.getUserValue("height"));
    var activity = activityLvl[DatabaseService.getUserValue("activityLevel")] ?? 0;
    if(DatabaseService.userInfo["gender"] == "male") {
       _NC = (height - 100) * activity;
    }
    else {
      _NC = (height - 105) * activity;
    }

    return _NC;
  }

}