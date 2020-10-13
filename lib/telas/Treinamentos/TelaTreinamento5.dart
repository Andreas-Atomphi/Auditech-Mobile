import 'package:AuditechMobile/telas/Treinamentos/StateTreinamentoBase.dart';
import 'package:flutter/material.dart';
import 'package:AuditechMobile/mainData.dart';
import 'package:AuditechMobile/telas/CustomComponents/TelaTreinamento/components.dart';
import 'package:sprintf/sprintf.dart';

class _STreinamento5 extends STreinamentoBase<Exercicio5> {
  List<dynamic> selecoes;

  @override
  void iniciarExercicio() {
    definirRequisitos(1, 6, exercicios["Ex5"], true);
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
        {"nome": "Trem", "método": podeAvancar("tre")},
        "s1",
        {"nome": "Fórmula 1", "método": podeAvancar("f1")},
        "s1",
      ],
      "s1",
      [
        "s1",
        {"nome": "Carro", "método": podeAvancar("car")},
        "s1",
        {"nome": "Helicóptero", "método": podeAvancar("hel")},
        "s1",
      ],
      "s1",
      [
        "s1",
        {"nome": "Ambulância", "método": podeAvancar("amb")},
        "s1",
      ],
      "s1",
    ];

    return MaterialApp(
      home: Scaffold(
        backgroundColor: backgroundColor,
        appBar: stbAppBar(context, texto: "Exercicio 5"),
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

class Exercicio5 extends StatefulWidget {
  STreinamentoBase<Exercicio5> createState() {
    return _STreinamento5();
  }
}
