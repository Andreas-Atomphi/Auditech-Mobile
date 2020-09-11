//Componente do gráfico

import 'package:fl_animated_linechart/chart/area_line_chart.dart';
import 'package:fl_animated_linechart/chart/chart_line.dart';
import 'package:fl_animated_linechart/chart/chart_point.dart';
import 'package:fl_animated_linechart/common/dates.dart';
import 'package:fl_animated_linechart/common/pair.dart';
import 'package:fl_animated_linechart/fl_animated_linechart.dart';
import 'package:flutter/material.dart';

class RGrafico extends StatelessWidget {
  final double width, height;
  final bool filled;
  final List<Map<String, dynamic>> lines;
  final List<List<Color>> gradients;
  final Dates fromTo;
  final Color bgcolor;

  RGrafico(
      {this.width,
      this.height,
      this.filled = true,
      this.lines,
      this.gradients = const [
        [Colors.red, Colors.blue],
      ],
      this.fromTo,
      this.bgcolor});

  @override
  Widget build(BuildContext context) {
    /*
    Exemplo do atributo lines
    [
      {"nome": "nome", cor: , "pontos": [{"x": 0, "y": 0}, {x:"1", y:"1"},]},
    ];
      */
    List<dynamic> arguments = [
      //Argumentos usados
      [
        //Adiciona todos os índices do atributo lines como ChartLines
        ...lines.map(
          (linhasGraf) => ChartLine(
            [
              //adiciona os ChartPoints para a ChartLine através do parâmetro linhasGraf
              ...linhasGraf["pontos"].map(
                (pontosGraf) => ChartPoint(pontosGraf["x"], pontosGraf["y"]),
              ), //...linhasGraf["pontos"].map,
            ],
            linhasGraf["cor"],
            linhasGraf["nome"],
          ),
        ), //...lines.map,
      ],
      fromTo,
      [
        //Adiciona todos os índices do atributo gradients como Pair's
        ...gradients.map(
          (e) => Pair(
            e[0],
            e[1],
          ),
        ),
      ],
    ];
    final fill = (filled)
        ? AreaLineChart(
            arguments[0],
            arguments[1],
            arguments[2],
          )
        : LineChart(
            arguments[0],
            arguments[1],
          );

    return Container(
      width: width,
      height: height,
      color: bgcolor,
      child: AnimatedLineChart(fill),
    );
  }
}

/*AnimatedLineChart(
        AreaLineChart(
          [
            ChartLine(
              [
                ChartPoint(0, 0),
                ChartPoint(1, 1),
                ChartPoint(2, 3),
                ChartPoint(3, 2),
                ChartPoint(4, 7),
                ChartPoint(5, 1),
              ],
              Colors.blue,
              "Issae",
            ),
          ],
          Dates(
            DateTime(2000),
            DateTime(2020),
          ),
          [
            Pair(
              Colors.red[900],
              Color.fromRGBO(100, 100, 255, 0),
            )
          ],
        ),
      ),*/
