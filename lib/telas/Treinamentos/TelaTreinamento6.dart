import 'package:AuditechMobile/telas/Treinamentos/StateTreinamentoBase.dart';
import 'package:flutter/material.dart';
import 'package:AuditechMobile/mainData.dart';
import 'package:AuditechMobile/telas/CustomComponents/TelaTreinamento/components.dart';
import 'package:sprintf/sprintf.dart';

class _STreinamento6 extends STreinamentoBase<Exercicio6> {
  List<dynamic> selecoes;

  @override
  void iniciarExercicio() {
    playBack.play(exercicios[5]);
    respostasDadas = gerarStringRespostas(8);
    respostasDadasL = List.generate(
      10,
      (i) => "",
    );
  }

  @override
  Widget build(BuildContext context) {
    selecoes = [
      "s1",
      //Lista de Widgets
      [
        "s1",
        {"nome": "Grito", "método": () => avancar("grt")},
        "s1",
        {"nome": "Passo", "método": () => avancar("pas")},
        "s1",
      ],
      "s1",
      [
        "s1",
        {"nome": "Palma", "método": () => avancar("pma")},
        "s1",
        {"nome": "Risada", "método": () => avancar("rir")},
        "s1",
      ],
      "s1",
    ];

    return MaterialApp(
      home: Scaffold(
        backgroundColor: backgroundColor,
        appBar: stbAppBar(context, texto: "Exercicio 6"),
        body: Column(
          children: [
            Spacer(
              flex: 1,
            ),
            if (arr < selecoes.length)
              // * Adiciona os componentes de forma dinâmica
              addDynamicComponents(selecoes, 4),
            LinearProgressIndicator(
              value: 0.5,
              backgroundColor: Colors.blue,
              valueColor: AlwaysStoppedAnimation(Colors.orange),
              minHeight: 7,
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
