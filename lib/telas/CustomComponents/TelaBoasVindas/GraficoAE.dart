/* Os gráficos da Aba de estatísitca */

import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class GraficoAE extends Container {
  final double width, height;
  final List<double> dados;
  final List<Color> cores;
  final String titulo;
  GraficoAE({
    this.width,
    this.height,
    this.dados,
    this.cores,
    this.titulo,
  }) : super(
          width: width,
          height: height,
          child: PieChart(
            dataMap: {
              "Acertos": dados[0],
              "Erros": dados[1],
              "Não respondeu": dados[2],
            },
            legendOptions: LegendOptions(
              showLegends: false,
            ),
            colorList: cores,
            centerText: titulo,
            chartValuesOptions: ChartValuesOptions(
              showChartValuesInPercentage: true,
              showChartValuesOutside: true,
            ),
          ),
        );
}
