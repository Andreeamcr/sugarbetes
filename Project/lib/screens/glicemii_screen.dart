import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sugarbetes/screens/settings_screen.dart';
import 'package:sugarbetes/utils/background_design.dart';
import 'package:sugarbetes/utils/constants.dart';
import 'package:sugarbetes/components/glucose_table.dart';
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _textEditingController = TextEditingController();
  final List<ChartData> chartData = [
    ChartData(DateTime.now().subtract(Duration(hours: 1)), 105),
    ChartData(DateTime.now().subtract(Duration(minutes: 30)), 68),
  ];

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
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.09, vertical: 20),
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
                Padding(
                  padding: EdgeInsets.only(top: height * 0.02),
                  child: Container(
                    child: SfCartesianChart(
                      primaryXAxis: DateTimeAxis(
                        majorGridLines:
                            MajorGridLines(color: Colors.transparent),
                        edgeLabelPlacement: EdgeLabelPlacement.shift,
                        minimum: DateTime.now().subtract(
                            Duration(hours: 8, minutes: 59, seconds: 59)),
                        intervalType: DateTimeIntervalType.hours,
                        desiredIntervals: 1,
                        interval: 1,
                        maximum: DateTime.now().add(
                          Duration(hours: 8, minutes: 59, seconds: 59),
                        ),
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
                          maximum: 250,
                          minimum: 30,
                          edgeLabelPlacement: EdgeLabelPlacement.shift,
                          plotBands: <PlotBand>[
                            PlotBand(
                                start: 180,
                                end: 250,
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
                ListView(
                  padding: EdgeInsets.only(top: 0, bottom: 10),
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
}
