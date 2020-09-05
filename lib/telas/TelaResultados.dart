import 'package:AuditechMobile/telas/CustomComponents/Global/globalComponents.dart';
import 'package:fl_animated_linechart/chart/area_line_chart.dart';
import 'package:fl_animated_linechart/chart/chart_line.dart';
import 'package:fl_animated_linechart/chart/chart_point.dart';
import 'package:fl_animated_linechart/common/dates.dart';
import 'package:fl_animated_linechart/fl_animated_linechart.dart';
import 'package:fl_animated_linechart/common/pair.dart';
import 'package:flutter/material.dart';

class _SResultados extends State {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: CAppBar(
          "Resultados",
          centralizar: true,
        ),
        body: Column(
          children: [
            Spacer(
              flex: 1,
            ),
            Row(
              children: [
                Spacer(
                  flex: 1,
                ),
                Spacer(
                  flex: 1,
                ),
              ],
            ),
            Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}

class Resultados extends StatefulWidget {
  State createState() {
    return _SResultados();
  }
}
