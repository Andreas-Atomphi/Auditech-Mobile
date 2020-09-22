import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class GraficoPizza extends StatelessWidget {
  final bool legenda, legendasLadoALado;
  final LegendPosition posicaoLegenda;
  final Map<String, double> dados;
  final List<Color> cores;
  final double width, height, radius;

  GraficoPizza(
    this.dados, {
    this.legenda,
    this.legendasLadoALado,
    this.width,
    this.height,
    this.radius,
    this.posicaoLegenda,
    this.cores,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: PieChart(
        chartRadius: radius,
        legendOptions: LegendOptions(
          legendPosition: LegendPosition.bottom,
          showLegends: true,
          showLegendsInRow: true,
        ),
        dataMap: dados,
        colorList: cores,
      ),
    );
  }
}
