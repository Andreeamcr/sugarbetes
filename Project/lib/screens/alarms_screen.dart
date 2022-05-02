import 'package:flutter/material.dart';
import 'package:sugarbetes/utils/background_design.dart';
import 'package:sugarbetes/utils/constants.dart';

class ReminderPage extends StatefulWidget {
  static String id = 'reminder';
  const ReminderPage({Key? key}) : super(key: key);

  @override
  _ReminderPageState createState() => _ReminderPageState();
}

class _ReminderPageState extends State<ReminderPage> {
  TimeOfDay selectedTime = TimeOfDay.now();

  _selectTime(BuildContext context) async{
    final TimeOfDay? timeOfDay = await showTimePicker(context: context,
        initialTime: selectedTime,
        initialEntryMode: TimePickerEntryMode.dial,
        builder: (context, child){
      return Theme(data: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.light(
          primary: kFullNavyBlue,
          onSurface: kFullNavyBlue,
        ),
        buttonTheme: ButtonThemeData(
          colorScheme: ColorScheme.dark(
            primary: kFullNavyBlue,

          ),
        ),
      ), child: child!);
        }
    );
    if(timeOfDay != null && timeOfDay != selectedTime){
      setState(() {
        selectedTime = timeOfDay;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        BackgroundColorWidget(),
        Scaffold(
          appBar: AppBar(
            title: Text("Alarma insulinei bazale", style: kMathTextStyleBold,),
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
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: width * 0.07, right: width * 0.07, top: height * 0.1,bottom: height * 0.07),
                child: FloatingActionButton(onPressed: (){
                  _selectTime(context);
                },
                  child: Icon(Icons.add,color: kFullGreen,size: 30,),
                backgroundColor: kFullNavyBlue,),
              ),
              Container(
                color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.07),
                      child: Icon(Icons.alarm),
                    ),
                    Text("${selectedTime.hour} : ${selectedTime.minute}"),
                  ],
                ),
              ),

            ],
            //TODO: add an image on the top of the page, add plus button, add new container for the new alarm, add checkboxes for every alarm to check the days for the alarm to ring, add pop-up window to set the alarm time
          ),
        ),
      ],
    );
  }
}
