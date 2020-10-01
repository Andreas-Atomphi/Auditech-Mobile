import 'package:AuditechMobile/telas/Treinamentos/StateTreinamentoBase.dart';
import 'package:flutter/material.dart';
import 'package:AuditechMobile/mainData.dart';
import 'package:AuditechMobile/telas/CustomComponents/TelaTreinamento/components.dart';
import 'package:sprintf/sprintf.dart';

class _STreinamento3 extends STreinamentoBase<Exercicio3> {
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
        {"nome": "Pássaro", "método": () => avancar("psr")},
        "s1",
        {"nome": "Gato", "método": () => avancar("gat")},
        "s1",
      ],
      "s1",
      [
        "s1",
        {"nome": "Cavalo", "método": () => avancar("cav")},
        "s1",
        {"nome": "Bode", "método": () => avancar("bod")},
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
            if (respostas < selecoes.length)
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

  void iniciarExercicio() async {
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
