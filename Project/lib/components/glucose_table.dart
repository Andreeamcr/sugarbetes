import 'package:flutter/material.dart';
import 'package:sugarbetes/utils/constants.dart';

class GlucoseTable extends StatelessWidget {
  GlucoseTable({required this.dataRow});
  final List<DataRow> dataRow;
  @override
  Widget build(BuildContext context) {
    return DataTable(columns: [
      DataColumn(
        label: Text(
          'Ora',
          style: kMathTextStyle,
        ),
      ),
      DataColumn(
        label: Text(
          'Valoare glicemie',
          style: kMathTextStyle,
        ),
      )
    ], rows: dataRow);
  }
}
