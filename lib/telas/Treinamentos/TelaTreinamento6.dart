import 'package:AuditechMobile/telas/Treinamentos/StateTreinamentoBase.dart';
import 'package:flutter/material.dart';
import 'package:AuditechMobile/mainData.dart';
import 'package:AuditechMobile/telas/CustomComponents/TelaTreinamento/components.dart';

class _STreinamento6 extends STreinamentoBase<Exercicio6> {
  List<dynamic> selecoes;

  @override
  void iniciarExercicio() {
    definirRequisitos(1, 6, exercicios["Ex6"], true);
  }

  @override
  Widget build(BuildContext context) {
    selecoes = [
      "s1",
      //Lista de Widgets
      [
        "s1",
        {"nome": "Grito", "método": podeAvancar("G")},
        "s1",
        {"nome": "Passo", "método": podeAvancar("P")},
        "s1",
      ],
      "s1",
      [
        "s1",
        {"nome": "Palma", "método": podeAvancar("P")},
        "s1",
        {"nome": "Risada", "método": podeAvancar("R")},
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
            if (sequencia == 0) jmpBtn(),
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
