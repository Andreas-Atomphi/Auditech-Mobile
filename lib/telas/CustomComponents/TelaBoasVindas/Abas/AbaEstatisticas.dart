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
      var toReturn;
      if (treinamentos != null) {
        if (treinamentos[treinamentos.length - tr] != null)
        {
          if (treinamentos != [] && treinamentos.length > 0) {
          toReturn = treinamentos[treinamentos.length - tr]
              ?.resultadoTreino
              ?.toDouble();
        }
        }
        
      }
      return toReturn;
    }

    double media([int max = 3]) {
      if (treinamentos != null) {
        double toReturn = 0;
        for (int i = 0; i < max; i++) {
          toReturn += treinamento(i);
        }
        toReturn /= max;
        return toReturn;
      }
      return 0;
    }

    List<Map<String, dynamic>> graficosAnteriores;
    if (treinamentos != null) {
      if (treinamentos.length > 0) {
        logPrint("nãoNulo");
        List<String> tentativas = [
          "Última tentativa",
          "Penúltima tentativa",
          "Ante-penúltima tentativa",
        ];
        for (int i = 0; i < treinamentos.length; i++) {
          if (treinamento(i) != null)
            graficosAnteriores.add(
              {
                "d": <double>[treinamento(i), 100.0 - treinamento(1), 0.0],
                "t": tentativas[i],
              },
            );
        }
        graficosAnteriores ^= graf;
      }
    }

    double space = 30;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "Sua média",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          Container(
            width: graficoG,
            height: graficoG,
            child: (graficosAnteriores != null)
                ? PieChart(
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
                  )
                : Text(
                    "Aqui ficará a média dos seus exercícios",
                    style: TextStyle(
                      fontSize: 20,
                    ),
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
          if (graficosAnteriores != null)
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
                )
              ],
            ),
          if (graficosAnteriores == null)
            Text(
              "Suas tentativas serão exibidas aqui",
              style: TextStyle(fontSize: 20),
            ),
        ],
      ),
    );
  }
}
