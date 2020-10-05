import 'package:AuditechMobile/telas/Treinamentos/StateTreinamentoBase.dart';
import 'package:flutter/material.dart';
import 'package:AuditechMobile/mainData.dart';
import 'package:AuditechMobile/telas/CustomComponents/TelaTreinamento/components.dart';

class _STreinamento7 extends STreinamentoBase<Exercicio7> {
  int questaoSelecionada = 0;

  List<dynamic> selecoes;

  @override
  void iniciarExercicio() {
    numRPS = 1;
    playBack.play(exercicios[4]);
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
        {"nome": "Vento", "método": () => avancar("ven")},
        "s1",
        {"nome": "Água", "método": () => avancar("agu")},
        "s1",
      ],
      "s1",
      [
        "s1",
        {"nome": "Ondas do mar", "método": () => avancar("odm")},
        "s1",
        {"nome": "Trovão", "método": () => avancar("tro")},
        "s1",
      ],
      "s1",
      [
        "s1",
        {"nome": "Chuva com trovão", "método": () => avancar("cct")},
        "s1",
      ],
      "s1",
    ];

    return MaterialApp(
      home: Scaffold(
        backgroundColor: backgroundColor,
        appBar: stbAppBar(context, texto: "Exercicio 7"),
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

class Exercicio7 extends StatefulWidget {
  STreinamentoBase<Exercicio7> createState() {
    return _STreinamento7();
  }
}
