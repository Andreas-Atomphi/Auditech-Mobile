//import 'package:fl_animated_linechart/common/dates.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:AuditechMobile/main.dart';
import '../components.dart';

class AbaEstatisticas extends StatelessWidget {
  Widget build(BuildContext context) {
    double graficoG = tamanhoRelativoL(500.0, context);
    double graficoP = tamanhoRelativoL(150.0, context);

    List<Color> graf = [
      Color.fromRGBO(0, 229, 255, 1),
      Color.fromRGBO(255, 45, 13, 1),
      //Color.fromRGBO(255, 176, 13, 1),
      Colors.blueGrey[300]
    ];

    List<List<Map<String, dynamic>>> graficosAnteriores = [
      [
        {
          "w": graficoP,
          "h": graficoP,
          "d": <double>[7, 5, 2],
          "c": graf,
          "t": "Exercício 1"
        },
        {
          "w": graficoP,
          "h": graficoP,
          "d": <double>[7, 3, 4],
          "c": graf,
          "t": "Exercício 2"
        },
      ],
      [
        {
          "w": graficoP,
          "h": graficoP,
          "d": <double>[5, 5, 4],
          "c": graf,
          "t": "Exercício 3"
        },
        {
          "w": graficoP,
          "h": graficoP,
          "d": <double>[7, 4, 3],
          "c": graf,
          "t": "Exercício 4"
        },
      ],
      [
        {
          "w": graficoP,
          "h": graficoP,
          "d": <double>[7, 3, 4],
          "c": graf,
          "t": "Exercício 5"
        },
        {
          "w": graficoP,
          "h": graficoP,
          "d": <double>[2, 7, 5],
          "c": graf,
          "t": "Exercício 6"
        },
      ],
    ];
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "Estatística Global",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          Container(
            width: graficoG,
            height: graficoG,
            child: PieChart(
              dataMap: {
                "Progredindo": 5,
                "Regredindo": 6,
                "Estagnado": 3,
              },
              legendOptions: LegendOptions(
                legendPosition: LegendPosition.top,
                showLegendsInRow: true,
                legendTextStyle: TextStyle(color: Colors.white),
              ),
              colorList: [
                graf[0],
                graf[1],
                Colors.deepOrangeAccent,
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "Estatísticas das fases",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          Center(
            child: PieChart(
              dataMap: {"Acertos": 0, "Erros": 0, "Não respondeu": 0},
              legendOptions: LegendOptions(
                showLegendsInRow: true,
                legendPosition: LegendPosition.top,
                legendTextStyle: TextStyle(color: Colors.white, fontSize: 15),
              ),
              colorList: graf,
              chartRadius: 0,
            ),
          ),
          ...graficosAnteriores.map(
            (row) => Row(
              children: [
                Spacer(
                  flex: 1,
                ),
                GraficoAE(
                  width: row[0]["w"],
                  height: row[0]["h"],
                  dados: row[0]["d"],
                  cores: row[0]["c"],
                  titulo: row[0]["t"],
                ),
                Spacer(
                  flex: 1,
                ),
                GraficoAE(
                  width: row[1]["w"],
                  height: row[1]["h"],
                  dados: row[1]["d"],
                  cores: row[1]["c"],
                  titulo: row[1]["t"],
                ),
                Spacer(
                  flex: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
