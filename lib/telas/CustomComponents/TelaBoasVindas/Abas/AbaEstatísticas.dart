import 'package:AuditechMobile/telas/CustomComponents/Global/Gr%C3%A1ficoPizza.dart';
import 'package:AuditechMobile/telas/CustomComponents/Global/RGr%C3%A1fico.dart';
import 'package:fl_animated_linechart/common/dates.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart';

import '../components.dart';

class AbaEstatisticas extends StatelessWidget {
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          GraficoPizza(
            data: [
              {
                "rankkey": "issae",
                "fatias": [
                  {"n": 500, "cor": Colors.yellow[500], "chave": "q1"},
                  {"n": 500, "cor": Colors.red[500], "chave": "q2"},
                  {"n": 300, "cor": Colors.green[500], "chave": "q3"},
                ],
              },
            ],
          ),
          RGrafico(
            width: 300.0,
            height: 300.0,
            bgcolor: Colors.white,
            lines: [
              {
                "nome": "fase",
                "cor": Colors.red,
                "pontos": [
                  {"x": 0, "y": 0},
                  {"x": 1, "y": 1},
                  {"x": 2, "y": 4}
                ]
              },
            ],
            gradients: [
              [Colors.blue, Colors.transparent],
            ],
            fromTo: Dates(DateTime(2000), DateTime(2001)),
          )
        ],
      ),
    );
  }
}
