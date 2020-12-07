//import 'package:fl_animated_linechart/common/dates.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:auditech_mobile/mainData.dart';
import '../components.dart';

//Adiciona uma função para um operador ^ na List<Map>
extension ListMap on List<Map> {
  //Adiciona junta a map passada como parâmetro e a as maps do objeto instanciado
  List<Map> operator ^(Map<String, dynamic> hashMap) {
    List<Map<String, dynamic>> lista = [];
    for (int i = 0; i < this.length; i++) {
      lista.add({
        ...this[i],
        ...hashMap,
      });
    }
    return lista;
  }
}

class AbaEstatisticas extends StatelessWidget {
  Widget build(BuildContext context) {
    double graficoG = tamanhoRelativoL(500.0, context);
    double graficoP = tamanhoRelativoL(150.0, context);

    List<Color> grafColor = [
      Color.fromRGBO(0, 229, 255, 1),
      Color.fromRGBO(255, 45, 13, 1),
      //Color.fromRGBO(255, 176, 13, 1),
      Colors.blueGrey[300]
    ];

    Map<String, dynamic> graf = {
      "w": graficoP,
      "h": graficoP,
      "c": grafColor,
    };

    List<Map<String, dynamic>> graficosAnteriores = [
          {
            "d": <double>[7, 5, 2],
            "t": "Exercício 1"
          },
          {
            "d": <double>[7, 3, 4],
            "t": "Exercício 2"
          },
          {
            "d": <double>[5, 5, 4],
            "t": "Exercício 3"
          },
        ] ^
        graf;

    double space = 30;
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
                "Ganhando": 5,
                "Perdendo": 6,
                //"Parado": 3,
              },
              legendOptions: LegendOptions(
                legendPosition: LegendPosition.top,
                showLegendsInRow: true,
                legendTextStyle: TextStyle(color: Colors.white),
              ),
              colorList: [
                grafColor[0],
                grafColor[1],
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
              colorList: grafColor,
              chartRadius: 0,
            ),
          ),
          GridView.extent(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(space),
            maxCrossAxisExtent: 200,
            crossAxisSpacing: space,
            mainAxisSpacing: space,
            children: [
              ...graficosAnteriores.map(
                (graf) => GraficoAE(
                  width: graf['w'],
                  height: graf['h'],
                  dados: graf['d'],
                  cores: graf['c'],
                  titulo: graf['t'],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
