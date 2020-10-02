import 'package:AuditechMobile/telas/Treinamentos/StateTreinamentoBase.dart';
import 'package:flutter/material.dart';
import 'package:AuditechMobile/mainData.dart';
import 'package:AuditechMobile/telas/CustomComponents/TelaTreinamento/components.dart';
import 'package:sprintf/sprintf.dart';

class _STreinamento5 extends STreinamentoBase<Exercicio5> {
  List<dynamic> selecoes;

  @override
  void iniciarExercicio() {
    numRPS = 1;
    playBack.play(exercicios[6]);
    respostasDadas = gerarStringRespostas(8);
    respostasDadasL = List.generate(
      10,
      (i) => "",
    );
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
        {"nome": "Trem", "método": () => avancar("tre")},
        "s1",
        {"nome": "Fórmula 1", "método": () => avancar("f1")},
        "s1",
      ],
      "s1",
      [
        "s1",
        {"nome": "Carro", "método": () => avancar("car")},
        "s1",
        {"nome": "Helicóptero", "método": () => avancar("hel")},
        "s1",
      ],
      "s1",
      [
        "s1",
        {"nome": "Ambulância", "método": () => avancar("amb")},
        "s1",
      ],
      "s1",
    ];

    return MaterialApp(
      home: Scaffold(
        backgroundColor: backgroundColor,
        appBar: stbAppBar(context, texto: "Exercicio 5"),
        body: Column(
          children: [
            Spacer(
              flex: 1,
            ),
            if (arr < respostasDadasL.length)
              // * Adiciona os componentes de forma dinâmica
              addDynamicComponents(selecoes, 5),
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

class Exercicio5 extends StatefulWidget {
  STreinamentoBase<Exercicio5> createState() {
    return _STreinamento5();
  }
}
