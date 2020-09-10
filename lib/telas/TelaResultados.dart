import 'package:AuditechMobile/telas/CustomComponents/Global/globalComponents.dart';
import 'package:AuditechMobile/telas/CustomComponents/TelaResultados/components.dart';
import 'package:fl_animated_linechart/common/dates.dart';
import 'package:flutter/material.dart';

class _SResultados extends State {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: CAppBar(
          "Resultados",
          centralizar: true,
        ),
        body: Column(
          children: [
            Spacer(
              flex: 1,
            ),
            Row(
              children: [
                Spacer(
                  flex: 1,
                ),
                RGrafico(
                  width: ((MediaQuery.of(context).size.width - 10) > 300)
                      ? 300
                      : MediaQuery.of(context).size.width - 10,
                  height: ((MediaQuery.of(context).size.width - 10) > 300)
                      ? 300
                      : MediaQuery.of(context).size.width,
                  filled: false,
                  fromTo: Dates(
                    DateTime(1),
                    DateTime(2),
                  ),
                  gradients: [
                    [
                      Colors.red[900],
                      Color.fromRGBO(0, 100, 200, 0),
                    ],
                  ],
                  lines: [
                    {
                      "nome": "Desempenho",
                      "cor": Colors.blue,
                      "pontos": [
                        {"x": 0.0, "y": 0.0},
                        {"x": 1.0, "y": 1.0},
                        {"x": 2.0, "y": 2.0},
                        {"x": 3.0, "y": 1.0},
                        {"x": 4.0, "y": 2.0},
                        {"x": 5.0, "y": 3.0},
                        {"x": 6.0, "y": 4.0},
                      ]
                    },
                  ],
                ),
                Spacer(
                  flex: 1,
                ),
              ],
            ),
            Spacer(
              flex: 1,
            ),
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Text("Voltar a tela principal"),
              color: Colors.grey[300],
            ),
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Text("Tentar de novo"),
              color: Colors.grey[300],
            ),
            Spacer(
              flex: 1,
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
