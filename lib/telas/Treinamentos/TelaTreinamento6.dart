import 'package:AuditechMobile/telas/Treinamentos/StateTreinamentoBase.dart';
import 'package:flutter/material.dart';
import 'package:AuditechMobile/mainData.dart';
import 'package:AuditechMobile/telas/CustomComponents/TelaTreinamento/components.dart';
import 'package:sprintf/sprintf.dart';

class _STreinamento6 extends STreinamentoBase<Exercicio6> {
  List<dynamic> selecoes;

  @override
  void iniciarExercicio() {
    definirRequisitos(1, 6, exercicios[5], true);
  }

  @override
  Widget build(BuildContext context) {
    selecoes = [
      "s1",
      //Lista de Widgets
      [
        "s1",
        {"nome": "Grito", "método": () => responder("grt")},
        "s1",
        {"nome": "Passo", "método": () => responder("pas")},
        "s1",
      ],
      "s1",
      [
        "s1",
        {"nome": "Palma", "método": () => responder("pma")},
        "s1",
        {"nome": "Risada", "método": () => responder("rir")},
        "s1",
      ],
      "s1",
    ];

    return MaterialApp(
      home: Scaffold(
        backgroundColor: backgroundColor,
        appBar: stbAppBar(context, texto: "Exercicio 6"),
        body: Stack(
          children: [
            if (sequencia == 0) jmpBtn(),
            Column(
              children: [
                Spacer(
                  flex: 1,
                ),
                if (arr < selecoes.length)
                  // * Adiciona os componentes de forma dinâmica
                  addDynamicComponents(selecoes),
                LinearProgressIndicator(
                  value: 0.5,
                  backgroundColor: Colors.blue,
                  valueColor: AlwaysStoppedAnimation(corDeDestaque),
                  minHeight: 7,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Exercicio6 extends StatefulWidget {
  STreinamentoBase<Exercicio6> createState() {
    return _STreinamento6();
  }
}
