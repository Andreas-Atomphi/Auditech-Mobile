import 'package:AuditechMobile/telas/Treinamentos/StateTreinamentoBase.dart';
import 'package:flutter/material.dart';
import 'package:AuditechMobile/mainData.dart';
import 'package:AuditechMobile/telas/CustomComponents/TelaTreinamento/components.dart';
import 'package:sprintf/sprintf.dart';

class _STreinamento4 extends STreinamentoBase<Exercicio4> {
  int respostas = 0;
  int arr = 0;
  int subarr = 0;

  List<String> respostasDadasL = List.generate(
    10,
    (i) => "",
  );

  List<dynamic> selecoes;
  String respostasDadas = gerarStringRespostas(8);

  void avancar(String resp) {
    setState(
      () {
        if (arr < respostasDadasL.length) {
          respostasDadasL[arr] += (subarr < 2) ? "$resp-" : resp;
        } else {
          print(sprintf(respostasDadas, respostasDadasL));
        }

        if (arr <= respostasDadasL.length) {
          respostas++;
          arr = respostas ~/ 3;
          subarr = respostas % 3;
          print(respostasDadasL);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    selecoes = [
      //Lista de Widgets
      "s1",
      [
        "s1",
        {"nome": "Tambor", "método": avancar},
        "s1",
        {"nome": "Piano", "método": avancar},
        "s1",
      ],
      "s1",
      [
        "s1",
        {"nome": "Gaita", "método": avancar},
        "s1",
        {"nome": "Flauta", "método": avancar},
        "s1",
      ],
      "s1",
      [
        "s1",
        {"nome": "Violão", "método": avancar},
        "s1",
      ],
      "s5",
    ];

    return MaterialApp(
      home: Scaffold(
        backgroundColor: backgroundColor,
        appBar: stbAppBar(context, texto: "Exercicio 4"),
        body: Column(
          children: [
            if (arr < selecoes.length)
              // * Adiciona os componentes de forma dinâmica
              ...addDynamicComponents(selecoes),
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
    playBack.play(exercicios[3]);
  }
}

class Exercicio4 extends StatefulWidget {
  STreinamentoBase<Exercicio4> createState() {
    return _STreinamento4();
  }
}
