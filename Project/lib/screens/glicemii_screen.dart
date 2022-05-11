import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sugarbetes/screens/settings_screen.dart';
import 'package:sugarbetes/utils/background_design.dart';
import 'package:sugarbetes/utils/constants.dart';
import 'package:sugarbetes/components/glucose_table.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:sugarbetes/components/chart_data.dart';

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
                      controller: _textEditingController,
                      validator: (value) {
                        return value!.isNotEmpty
                            ? null
                            : 'Introduceţi o valoare';
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
                      print('update the damn table');
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
    final List<ChartData> chartData = [
      ChartData(DateTime(13, 05), 68),
      ChartData(DateTime(2020, 12, 23, 14, 15, 03), 95)
    ];
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
                      padding: EdgeInsets.symmetric(horizontal: width * 0.09),
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
                ListView(
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
                Container(
                  child: SfCartesianChart(
                    primaryXAxis: DateTimeAxis(
                      minimum: DateTime.now(),
                      intervalType: DateTimeIntervalType.hours,
                      desiredIntervals: 1,
                      interval: 1,
                      maximum: DateTime.now().add(
                        Duration(hours: 12, minutes: 59, seconds: 59),
                      ),
                    ),
                    series: <CartesianSeries>[
                      LineSeries<ChartData, DateTime>(
                        dataSource: chartData,
                        xValueMapper: (ChartData data, _) => data.x,
                        yValueMapper: (ChartData data, _) => data.y,
                        markerSettings: MarkerSettings(
                          isVisible: true,
                        ),
                        dataLabelSettings: DataLabelSettings(
                          isVisible: true,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          // ),
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomInset: false,
        ),
      ],
    );
  }
}
