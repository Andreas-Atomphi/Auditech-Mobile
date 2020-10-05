import 'package:AuditechMobile/telas/Treinamentos/StateTreinamentoBase.dart';
import 'package:flutter/material.dart';
import 'package:AuditechMobile/mainData.dart';
import 'package:AuditechMobile/telas/CustomComponents/TelaTreinamento/components.dart';
import 'package:sprintf/sprintf.dart';

class _STreinamento4 extends STreinamentoBase<Exercicio4> {
  List<dynamic> selecoes;

  @override
  void iniciarExercicio() {
    numRPS = 1;
    playBack.play(exercicios[3]);
    respostasDadas = gerarStringRespostas(8);
    respostasDadasL = List.generate(
      8,
      (i) => "",
    );
  }

  @override
  Widget build(BuildContext context) {
    selecoes = [
      //Lista de Widgets
      "s1",
      [
        "s1",
        {"nome": "Tambor", "método": () => avancar("tam")},
        "s1",
        {"nome": "Piano", "método": () => avancar("pia")},
        "s1",
      ],
      "s1",
      [
        "s1",
        {"nome": "Gaita", "método": () => avancar("gai")},
        "s1",
        {"nome": "Flauta", "método": () => avancar("fla")},
        "s1",
      ],
      "s1",
      [
        "s1",
        {"nome": "Violão", "método": () => avancar("vio")},
        "s1",
      ],
      "s1",
    ];

    return MaterialApp(
      home: Scaffold(
        backgroundColor: backgroundColor,
        appBar: stbAppBar(context, texto: "Exercicio 4"),
        body: Column(
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
      ),
    );
  }
}

class Exercicio4 extends StatefulWidget {
  STreinamentoBase<Exercicio4> createState() {
    return _STreinamento4();
  }
}
