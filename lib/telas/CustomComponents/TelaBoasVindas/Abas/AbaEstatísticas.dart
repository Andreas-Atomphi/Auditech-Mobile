import 'package:AuditechMobile/telas/CustomComponents/Global/GCartesiano.dart';

//import 'package:fl_animated_linechart/common/dates.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import '../components.dart';
import 'package:AuditechMobile/telas/CustomComponents/Global/globalComponents.dart';

class AbaEstatisticas extends StatelessWidget {
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: 500,
            height: 400,
            child: PieChart(
              dataMap: {
                "Progredindo": 5,
                "Regredindo": 6,
                "Estagnado": 3,
              },
              legendOptions: LegendOptions(
                legendPosition: LegendPosition.bottom,
                showLegendsInRow: true,
                legendTextStyle: TextStyle(color: Colors.white),
              ),
              colorList: [
                Colors.green,
                Colors.red,
                Colors.yellow,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
