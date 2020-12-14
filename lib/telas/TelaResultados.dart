import 'package:auditech_mobile/mainData.dart';
import 'package:auditech_mobile/telas/CustomComponents/Global/ApiClasses.dart';
import 'package:auditech_mobile/telas/CustomComponents/Global/globalComponents.dart';
import 'package:auditech_mobile/telas/Telas.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class _STelaResultados extends State<TelaResultados> {
  List<TreinamentoFase> data;
  Usuario usuario;
  @override
  void initState() {
    super.initState();
    usuario = widget.usr;
    data = widget.treinamentos;
  }

  Widget build(BuildContext context) {
    assert(data != null);
    List<Color> graf = [
      //cores dos gráficos
      Colors.red[400],
      Colors.cyan[400],
      Colors.grey[400],
    ]; // graf;

    void _backXTimes(int x) {
      for (int i = 0; i < x; i++) {
        Navigator.pop(context, data);
      }
    }

    double treinamento([int numr = 1]) {
      return data[data.length - numr].resultadoTreino.toDouble();
    }

    return Scaffold(
      appBar: CAppBar(
        "Resultados",
        centralizar: true,
        backButton: true,
        pressBack: () => _backXTimes(2),
      ),
      //Rolável
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              //Espaçamento entre o texto e a AppBar
              height: 50,
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
                      "Acertos": treinamento(),
                      "Erros/Não respondeu": 100 - treinamento(),
                    },
                    legendOptions: LegendOptions(
                      legendTextStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    colorList: [
                      graf[1],
                      graf[0],
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
                      "Acertos": treinamento(2),
                      "Erros/Não respondeu": 100 - treinamento(2),
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
                      "Acertos": treinamento(3),
                      "Erros": 100 - treinamento(3),
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
                    onPressed: () {
                      _backXTimes(3);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TelaBoasVindas(
                            usuario: usuario,
                          ),
                        ),
                      );
                    },
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

class TelaResultados extends StatefulWidget {
  final List<TreinamentoFase> treinamentos;
  final Usuario usr;
  TelaResultados([this.treinamentos, this.usr]);

  State createState() {
    return _STelaResultados();
  }
}
