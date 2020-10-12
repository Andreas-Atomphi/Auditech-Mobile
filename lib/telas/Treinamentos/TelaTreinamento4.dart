import 'package:AuditechMobile/telas/Treinamentos/StateTreinamentoBase.dart';
import 'package:flutter/material.dart';
import 'package:AuditechMobile/mainData.dart';
import 'package:AuditechMobile/telas/CustomComponents/TelaTreinamento/components.dart';
import 'package:sprintf/sprintf.dart';

class _STreinamento4 extends STreinamentoBase<Exercicio4> {
  List<dynamic> selecoes;

  @override
  void iniciarExercicio() {
    definirRequisitos(1, 6, exercicios[3], true);
  }

  @override
  Widget build(BuildContext context) {
    selecoes = [
      //Lista de Widgets
      "s1",
      [
        "s1",
        {"nome": "Tambor", "método": () => responder("T")},
        "s1",
        {"nome": "Piano", "método": () => responder("P")},
        "s1",
      ],
      "s1",
      [
        "s1",
        {"nome": "Gaita", "método": () => responder("G")},
        "s1",
        {"nome": "Flauta", "método": () => responder("F")},
        "s1",
      ],
      "s1",
      [
        "s1",
        {"nome": "Violão", "método": () => responder("V")},
        "s1",
      ],
      "s1",
    ];

    return MaterialApp(
      home: Scaffold(
        backgroundColor: backgroundColor,
        appBar: stbAppBar(context, texto: "Exercicio 4"),
        body: Stack(
          children: [
            if (sequencia == 0) jmpBtn(),
            Column(
              children: [
                Spacer(
                  flex: 1,
                ),
                if (arr < respostasDadasL.length)
                  addDynamicComponents(selecoes),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Exercicio4 extends StatefulWidget {
  STreinamentoBase<Exercicio4> createState() {
    return _STreinamento4();
  }
}
