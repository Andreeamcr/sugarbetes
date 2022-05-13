
import 'package:sugarbetes/services/databaseService.dart';

enum CalculusOptions {
  NC, DTI, IHC, FS, FC
}

Map<String, int> activityLvl = {"Repaus la pat": 25, "Activitate nivel ușor": 30,"Activitate nivel mediu": 35, "Activitate nivel intensiv":40};

class CalculusService {

  int _NC = 0;
  double _DTI = 0;
  double _IHC = 0;
  double _FS = 0;
  double _FC = 0;

  String getValue(CalculusOptions option) {
    switch(option) {
      case CalculusOptions.NC:
        return (_NC == 0 ? calculateNC() : _NC).toString();
      case CalculusOptions.DTI:
        return (_DTI == 0 ? calculateDTI() : _DTI).toStringAsFixed(2);
      case CalculusOptions.IHC:
        return (_IHC == 0 ? calculateIHC() : _IHC).toStringAsFixed(2);
      case CalculusOptions.FS:
        return (_FS == 0 ? calculateFS() : _FS).toStringAsFixed(2);
      case CalculusOptions.FC:
        return (_FC == 0 ? calculateFC() : _FC).toString();
    }
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

  double calculateDTI() {
    var totalRapidInsulin = double.parse(DatabaseService.getUserValue("rapidInsulinQuantity"));
    var totalBaseInsulin = double.parse(DatabaseService.getUserValue("baseInsulinQuantity"));

    _DTI = totalBaseInsulin + totalRapidInsulin;
    return _DTI;
  }

  double calculateIHC() {
    if(_DTI != 0) {
      _IHC = 500/_DTI;
      return _IHC;
    }

    return 0;
  }

  double calculateFS() {
    if(_DTI != 0 ) {
      _FS = 1800/_DTI;
      return _FS;
    }

    return 0;
  }

  double calculateFC() {
    return 0;
  }

}