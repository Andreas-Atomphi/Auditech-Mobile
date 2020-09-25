import 'package:AuditechMobile/telas/Treinamentos/StateTreinamentoBase.dart';
import 'package:flutter/material.dart';
import 'package:AuditechMobile/main.dart';
import 'package:AuditechMobile/telas/CustomComponents/TelaTreinamento/components.dart';

class _STreinamento5 extends STreinamentoBase<Exercicio5> {
  int questaoSelecionada = 0;

  List<dynamic> respostas;

  void avancar() {
    setState(
      () {
        questaoSelecionada += 1;
        if (questaoSelecionada >= respostas.length) {
          playBack.stop();
          irParaResultados(context);
        }
        print(questaoSelecionada);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    respostas = //Automóveis
        [
      "s1",
      //Lista de Widgets
      [
        "s1",
        {"nome": "Trem", "método": avancar},
        "s1",
        {"nome": "Fórmula 1", "método": avancar},
        "s1",
      ],
      "s1",
      [
        "s1",
        {"nome": "Carro", "método": avancar},
        "s1",
        {"nome": "Helicóptero", "método": avancar},
        "s1",
      ],
      "s1",
      [
        "s1",
        {"nome": "Ambulância", "método": avancar},
        "s1",
      ],
      "s5",
    ];

    return MaterialApp(
      home: Scaffold(
        backgroundColor: backgroundColor,
        appBar: stbAppBar(context, texto: "Exemplo 3"),
        body: Column(
          children: [
            if (questaoSelecionada < respostas.length)
              // * Adiciona os componentes de forma dinâmica
              ...addDynamicComponents(respostas),
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

  void iniciarExercicio() {
    playBack.play(exercicios[0]);
  }
}

class Exercicio5 extends StatefulWidget {
  STreinamentoBase<Exercicio5> createState() {
    return _STreinamento5();
  }
}
