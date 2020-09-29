import 'package:AuditechMobile/telas/Treinamentos/StateTreinamentoBase.dart';
import 'package:flutter/material.dart';
import 'package:AuditechMobile/mainData.dart';
import 'package:AuditechMobile/telas/CustomComponents/TelaTreinamento/components.dart';

class _STreinamento3 extends STreinamentoBase<Exercicio3> {
  int questaoSelecionada = 0;

  List<dynamic> respostas;
  List<List<String>> respostasDadas = List(2);

  void avancar() {
    setState(
      () {
        questaoSelecionada += 1;
        /*if (questaoSelecionada >= respostas.length) {
          playBack.stop();
          irParaResultados(context);
        }*/
        print(questaoSelecionada);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    respostas = [
      //Lista de Widgets
      "s1",
      [
        "s1",
        {"nome": "Pássaro", "método": avancar},
        "s1",
        {"nome": "Gato", "método": avancar},
        "s1",
      ],
      "s1",
      [
        "s1",
        {"nome": "Cavalo", "método": avancar},
        "s1",
        {"nome": "Bode", "método": avancar},
        "s1",
      ],
      "s5",
    ];

    return MaterialApp(
      home: Scaffold(
        backgroundColor: backgroundColor,
        appBar: stbAppBar(context, texto: "Exercicio 3"),
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

  void iniciarExercicio() async {
    respostasDadas.fillRange(1, 2, List(4));
    try {
      playBack.play(exercicios[2]);
    } catch (e) {
      print(e);
    }
  }
}

class Exercicio3 extends StatefulWidget {
  STreinamentoBase<Exercicio3> createState() {
    return _STreinamento3();
  }
}
