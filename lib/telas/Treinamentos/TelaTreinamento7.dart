import 'package:AuditechMobile/telas/Treinamentos/StateTreinamentoBase.dart';
import 'package:flutter/material.dart';
import 'package:AuditechMobile/mainData.dart';
import 'package:AuditechMobile/telas/CustomComponents/TelaTreinamento/components.dart';

class _STreinamento7 extends STreinamentoBase<Exercicio7> {
  List<dynamic> selecoes;

  @override
  void iniciarExercicio() {
    definirRequisitos(1, 6, exercicios["Ex7"], true);
  }

  @override
  Widget build(BuildContext context) {
    selecoes =
        //Automóveis
        [
      "s1",
      //Lista de Widgets
      [
        "s1",
        {"nome": "Trem", "método": podeAvancar("T")},
        "s1",
        {"nome": "Fórmula 1", "método": podeAvancar("F")},
        "s1",
      ],
      "s1",
      [
        "s1",
        {"nome": "Carro", "método": podeAvancar("C")},
        "s1",
        {"nome": "Helicóptero", "método": podeAvancar("H")},
        "s1",
      ],
      "s1",
      [
        "s1",
        {"nome": "Ambulância", "método": podeAvancar("A")},
        "s1",
      ],
      "s1",
    ];

    return MaterialApp(
      home: Scaffold(
        backgroundColor: backgroundColor,
        appBar: stbAppBar(context, texto: "Exercicio 7"),
        body: Stack(
          children: [
            Column(
              children: [
                Spacer(
                  flex: 1,
                ),
                if (arr < respostasDadasL.length)
                  addDynamicComponents(selecoes),
              ],
            ),
            if (sequencia == 0) jmpBtn(),
          ],
        ),
      ),
    );
  }
}

class Exercicio7 extends StatefulWidget {
  STreinamentoBase<Exercicio7> createState() {
    return _STreinamento7();
  }
}
