//import 'package:fl_animated_linechart/common/dates.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
// ignore: implementation_imports
import 'package:pie_chart/src/legend.dart';
import 'package:auditech_mobile/mainData.dart';
import 'package:auditech_mobile/telas/CustomComponents/Global/ApiClasses.dart';
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
  final List<TreinamentoFase> treinamentos;

  AbaEstatisticas({this.treinamentos});

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

    double treinamento(int tr) {
      return treinamentos[treinamentos.length - tr].resultadoTreino.toDouble();
    }

    double media([int max = 3]) {
      double toReturn = 0;
      for (int i = 1; i <= max; i++) {
        toReturn += treinamento(i);
      }
      toReturn /= max;
      return toReturn;
    }

    List<Map<String, dynamic>> graficosAnteriores = [
          {
            "d": <double>[treinamento(1), 100.0 - treinamento(1), 0.0],
            "t": "Última tentativa"
          },
          {
            "d": <double>[treinamento(2), 100.0 - treinamento(2), 0.0],
            "t": "Penúltima tentativa"
          },
          {
            "d": <double>[treinamento(3), 100 - treinamento(3), 0.0],
            "t": "Ante-penúltima tentativa"
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
                "Ganhando": media(),
                "Perdendo": 100 - media(),
              },
              chartValuesOptions: ChartValuesOptions(
                showChartValuesInPercentage: true,
              ),
              legendOptions: LegendOptions(
                legendPosition: LegendPosition.top,
                showLegendsInRow: true,
                legendTextStyle: TextStyle(color: Colors.white),
              ),
              colorList: [
                grafColor[0],
                grafColor[1],
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
          Row(
            children: [
              Spacer(
                flex: 1,
              ),
              Legend(
                title: "Acertos",
                legendShape: BoxShape.circle,
                color: grafColor[0],
                style: TextStyle(fontSize: 17),
              ),
              Spacer(
                flex: 1,
              ),
              Legend(
                title: "Erros/Falta de resposta",
                legendShape: BoxShape.circle,
                color: grafColor[1],
                style: TextStyle(fontSize: 17),
              ),
              Spacer(
                flex: 1,
              ),
            ],
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
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
