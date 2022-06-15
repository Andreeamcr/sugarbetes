import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sugarbetes/screens/settings_screen.dart';
import 'package:sugarbetes/utils/background_design.dart';
import 'package:sugarbetes/utils/constants.dart';
import 'package:sugarbetes/services/glucoseService.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:sugarbetes/components/chart_data.dart';
import 'package:intl/intl.dart';

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
  GlucoseService _service = GlucoseService();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _textEditingController = TextEditingController();
   TextEditingController _c = TextEditingController();

  @override
  void initState() {
    _c = TextEditingController();
    _c.text = DateTime.now().hour.toString();
    _populateChartData();
    super.initState();
  }

  List<ChartData> chartData = [
    // ChartData(DateTime.now().subtract(Duration(hours: 9)), 160),
    // ChartData(DateTime.now().subtract(Duration(hours: 8)), 170),
    // ChartData(DateTime.now().subtract(Duration(hours: 7)), 195),
    // ChartData(DateTime.now().subtract(Duration(hours: 6)), 200),
    // ChartData(DateTime.now().subtract(Duration(hours: 5)), 215),
    // ChartData(DateTime.now().subtract(Duration(hours: 2)), 94),
    // ChartData(DateTime.now().subtract(Duration(hours: 1, minutes: 30)), 110),
    // ChartData(DateTime.now().subtract(Duration(hours: 1)), 105),
    // ChartData(DateTime.now().subtract(Duration(minutes: 30)), 68),
  ];

  _populateChartData() {
    chartData = [];
    glucoseValues.forEach((key, value) {
      var now = _service.calculateSpaceGrid();
      var deltaDay = DateTime.now().day - now.day;
        for(var i = 0; i < value.length; i++)
        {
          // print("Now.Day: " + now.day.toString() + " |key: " + key.toString() + "| delta: " + deltaDay.toString());
          var x = DateTime(now.year, now.month, now.day, i, 0,0);

          if (deltaDay == 0) {
            if(i < now.hour && key == 0) {
            // print("000000000000Now.Hour: " + now.hour.toString() + "|i.hour" + i.toString());
            chartData.add(ChartData(x, value[i].toDouble()));
            }
          }
          else {
            if((now.hour - x.hour).abs() <= 10 && deltaDay == key) {
              // print("~~~~~~~~~~Now.Hour: " + now.hour.toString() + "|x.hour" + x.hour.toString());
              chartData.add(ChartData(x, value[i].toDouble()));
            }
          }
        }
    });
    chartData.forEach((element) {
      // print("Date: " + element.x.toString() + " | value: " +element.y.toString());
    });
  }


  Future<void> showInformationDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              content: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _textEditingController,
                      validator: (value) {
                        // return value!.isNotEmpty
                        //     ? null
                        //     : 'Introduceţi o valoare';
                        if (value != null) {
                          double convertedValue = double.parse(value);
                          chartData
                              .add(ChartData(DateTime.now(), convertedValue));
                        } else {
                          print('Introduceti o valoare');
                        }
                      },
                      decoration: InputDecoration(
                          hintText: 'Introduceţi valoarea glicemiei'),
                    ),
                  ],
                ),
              ),
              title: Text('Glicemie (mg/dl)'),
              actions: <Widget>[
                InkWell(
                  child: Text('OK    '),
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pop(context);
                    }
                  },
                )
              ],
            );
          });
        });
  }

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
          extendBodyBehindAppBar: true,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.11,
                ),
                Padding(
                  padding: EdgeInsets.all(height*0.08),
                  child: Text("Bun venit în evidența glicemiilor!",style: kMathTextStyleBold,
                  textAlign: TextAlign.center,),
                ),
                // Row(
                //   children: [
                //     Padding(
                //       padding: EdgeInsets.symmetric(
                //           horizontal: width * 0.09, vertical: 20),
                //       child: FloatingActionButton(
                //         heroTag: 'btn1',
                //         onPressed: () {
                //           setState(() {
                //             if (customIcon.icon == Icons.link_off) {
                //               customIcon = const Icon(Icons.link,
                //                   color: kFullGreen, size: 30);
                //               Navigator.pushNamed(context, SettingsPage.id);
                //             } else {
                //               customIcon = const Icon(
                //                 Icons.link_off,
                //                 color: kFullGreen,
                //                 size: 30,
                //               );
                //             }
                //           });
                //         },
                //         child: customIcon,
                //         backgroundColor: kFullNavyBlue,
                //       ),
                //     ),
                //     Text(
                //       'Status:  $dbStatus',
                //       //TODO: de implementat variabila sa nu mai fie hardcodata
                //       style: kMathTextStyleBold,
                //     ),
                //   ],
                //   mainAxisAlignment: MainAxisAlignment.start,
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        margin: EdgeInsets.only(left: width * 0.1, right: width* 0.05
                        ),
                        padding: EdgeInsets.only(top: height * 0.015, left: width * 0.05),
                        child: androidDropdown(),
                      ),
                      SizedBox(
                        width: width * 0.25,
                        child: TextFormField(
                          controller: _c,
                          validator: (value) {
                            if(value != null) {

                            }
                          },
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                        //  initialValue: _service.getCurrentHour().toString(),
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            labelText: 'Ora',
                            labelStyle: kMathTextStyleBold,
                            floatingLabelAlignment: FloatingLabelAlignment.center,
                            fillColor: Colors.black,
                            border: OutlineInputBorder(
                            ),

                          ),
                          onFieldSubmitted: (value){
                            setState(() {
                              _service.setCurrentHour(int.parse(value));
                              _populateChartData();
                            });
                          },
                        )
                      ),
                  ],
                ),



                Padding(
                  padding: EdgeInsets.only(top: height * 0.02),
                  child: Container(
                    child: SfCartesianChart(
                      primaryXAxis: DateTimeAxis(
                        majorGridLines:
                            MajorGridLines(color: Colors.transparent),
                        edgeLabelPlacement: EdgeLabelPlacement.shift,
                        minimum: _service.calculateSpaceGrid()
                                         .subtract(const Duration(hours: 8, minutes: 59, seconds: 59)),
                        intervalType: DateTimeIntervalType.hours,
                        desiredIntervals: 1,
                        interval: 1,
                        maximum: _service.calculateSpaceGrid()
                                         .add(const Duration(hours: 8, minutes: 59, seconds: 59)),
                        /*DateTime.now().add(
                          Duration(hours: 8, minutes: 59, seconds: 59),
                        ),*/
                      ),
                      series: <CartesianSeries>[
                        SplineSeries<ChartData, DateTime>(
                          color: Colors.white,
                          dataSource: chartData,
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y,
                          markerSettings: MarkerSettings(
                              isVisible: true,
                              shape: DataMarkerType.circle,
                              width: 4,
                              height: 4),
                          dataLabelSettings: DataLabelSettings(
                            isVisible: true,
                          ),
                        ),
                      ],
                      primaryYAxis: NumericAxis(
                          majorGridLines:
                              MajorGridLines(color: Colors.transparent),
                          numberFormat: NumberFormat.compact(),
                          interval: 30,
                          maximum: 400,
                          minimum: 30,
                          edgeLabelPlacement: EdgeLabelPlacement.shift,
                          plotBands: <PlotBand>[
                            PlotBand(
                                start: 180,
                                end: 400,
                                color: kHighValue,
                                opacity: 0.6),
                            PlotBand(
                                start: 70,
                                end: 180,
                                color: kFullGreen,
                                opacity: 0.4),
                            PlotBand(
                                start: 30,
                                end: 70,
                                color: kLowValue,
                                opacity: 0.6)
                          ]),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(width * 0.06),
                  child: SizedBox(
                    width: width * 0.55,
                    height: height * 0.06,
                    child: FloatingActionButton(
                      heroTag: 'btn2',
                      onPressed: () async {
                        await showInformationDialog(context);
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

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: ListView(
                      padding: const EdgeInsets.only(top: 0, bottom: 10),
                      children: [
                        _createDataTable()
                        ],
                      shrinkWrap: true,
                    ),
                ),
              ],
            ),
          ),
          // ),
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomInset: true,
        ),
      ],
    );
  }

  DataTable _createDataTable() {
    return DataTable(columns: _createColumns(), rows: _createRows());
  }

  List<DataRow> _createRows() {
    if(chartData.isEmpty) {
      return List.empty();
    }

    return chartData.map((data) =>
        DataRow(cells: [
          DataCell(Text(DateFormat('yyyy-MM-dd - kk:mm').format(data.x))),
          DataCell(Text(data.y.toString()))
        ])
    ).toList();
  }

  List<DataColumn> _createColumns() {
    return [
      DataColumn(label: Text('Data & ora', style: kMathTextStyleBold,)),
      DataColumn(label: Text('Valoare (mg/dl)', style: kMathTextStyleBold,))
    ];
  }

  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String zi in zile) {
      var newItem = DropdownMenuItem(
        child: Padding(
          child: Text(zi),
          padding: EdgeInsets.symmetric(horizontal: 25),
        ),
        value: zi,
      );
      dropdownItems.add(newItem);
    }
    return DropdownButton(
      // dropdownColor: Colors.white.withOpacity(0.5),
      items: dropdownItems,
      value: _service.getCurrentDay(),
      onChanged: (value) {
        setState(() {
            _service.setCurrentDay(value.toString());
            if(value == zile[0]) {
              print("Merge");
              _c.text = DateTime.now().hour.toString();
              _service.setCurrentHour(DateTime.now().hour);
            }
            _populateChartData();
        });
      },
    );
  }

}

