import 'package:auditech_mobile/mainData.dart';
import 'package:auditech_mobile/telas/CustomComponents/Global/globalComponents.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class _SResultados extends State {
  Widget build(BuildContext context) {
    List<Color> graf = [
      //cores dos gráficos
      Colors.red[400],
      Colors.cyan[400],
      Colors.grey[400],
    ]; // graf;

    void _backXTimes(int x) {
      for (int i = 0; i < x; i++) {
        Navigator.pop(context);
      }
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CAppBar(
        "Resultados",
        centralizar: true,
      ),
      //Rolável
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              //Espaçamento entre o texto e a AppBar
              height: 50,
            ),
            Text(
              //Muda de acordo com os resultados
              "Você está: Progredindo/Estagnado/Regredindo",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                backgroundColor: Colors.yellow[900],
              ),
            ),
            Row(
              // O Gráfico principal fica aqui
              children: [
                Spacer(
                  flex: 1,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 0),
                  width: tamanhoRelativoL(500.0, context),
                  height: tamanhoRelativoL(500.0, context),
                  child: PieChart(
                    dataMap: {
                      "Acertos": 5,
                      "Erros": 4,
                      "Não respondeu": 1,
                    },
                    legendOptions: LegendOptions(
                      legendTextStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    colorList: [
                      graf[1],
                      graf[0],
                      graf[2],
                    ],
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
              ],
            ),
            Text(
              "Tentativas anteriores:",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Row(
              // Terá gráficos de duas tentativas anteriores
              children: [
                Spacer(flex: 1),
                Container(
                  width: tamanhoRelativoL(150.0, context),
                  height: tamanhoRelativoL(150.0, context),
                  child: PieChart(
                    dataMap: {
                      "Acertos": 3,
                      "Erros": 5,
                      "Não respondeu": 0,
                    },
                    legendOptions: LegendOptions(
                      legendTextStyle:
                          TextStyle(color: Colors.white, fontSize: 10),
                      legendPosition: LegendPosition.bottom,
                      showLegendsInRow: true,
                      showLegends: false,
                    ),
                    colorList: [
                      graf[1],
                      graf[0],
                      graf[2],
                    ],
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                Container(
                  width: tamanhoRelativoL(150, context),
                  height: tamanhoRelativoL(150, context),
                  child: PieChart(
                    dataMap: {
                      "Acertos": 2,
                      "Erros": 7,
                      "Não respondeu": 0,
                    },
                    legendOptions: LegendOptions(
                      legendTextStyle:
                          TextStyle(color: Colors.white, fontSize: 10),
                      legendPosition: LegendPosition.bottom,
                      showLegendsInRow: true,
                      showLegends: false,
                    ),
                    colorList: [
                      graf[1],
                      graf[0],
                      graf[2],
                    ],
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
              ],
            ),
            SizedBox(
              child: null,
              height: 100,
            ),
            Row(
              children: [
                Spacer(
                  flex: 1,
                ),
                FlatButton(
                    onPressed: () => _backXTimes(3),
                    child: Text(
                      "Voltar a tela principal",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: corDeDestaque),
                Spacer(
                  flex: 1,
                ),
                FlatButton(
                  onPressed: () => _backXTimes(2),
                  child: Text(
                    "Tentar de novo",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: corDeDestaque,
                ),
                Spacer(
                  flex: 1,
                ),
              ],
            ),
            Container(
              child: null,
              height: 30,
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
