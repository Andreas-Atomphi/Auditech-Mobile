import 'package:AuditechMobile/telas/Treinamentos/StateTreinamentoBase.dart';
import 'package:flutter/material.dart';
import 'package:AuditechMobile/mainData.dart';
import 'package:AuditechMobile/telas/CustomComponents/TelaTreinamento/components.dart';

class _STreinamento5 extends STreinamentoBase<Exercicio5> {
  List<dynamic> selecoes;

  @override
  void iniciarExercicio() {
    definirRequisitos(1, 6, exercicios["Ex5"], true);
  }

  @override
  Widget build(BuildContext context) {
    selecoes = [
      "s1",
      //Lista de Widgets
      [
        "s1",
        {"nome": "Vento", "método": podeAvancar("V")},
        "s1",
        {"nome": "Água", "método": podeAvancar("A")},
        "s1",
      ],
      "s1",
      [
        "s1",
        {"nome": "Ondas do mar", "método": podeAvancar("OM")},
        "s1",
        {"nome": "Trovão", "método": podeAvancar("T")},
        "s1",
      ],
      "s1",
      [
        "s1",
        {"nome": "Chuva com trovão", "método": podeAvancar("CT")},
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
            if (sequencia == 0) jmpBtn(),
            Column(
              children: [
                Spacer(
                  flex: 1,
                ),
                if (arr < respostasDadasL.length)
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

class Exercicio5 extends StatefulWidget {
  STreinamentoBase<Exercicio5> createState() {
    return _STreinamento5();
  }
}
