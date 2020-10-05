import 'package:AuditechMobile/telas/Treinamentos/StateTreinamentoBase.dart';
import 'package:flutter/material.dart';
import 'package:AuditechMobile/mainData.dart';
import 'package:AuditechMobile/telas/CustomComponents/TelaTreinamento/components.dart';
import 'package:sprintf/sprintf.dart';

class _STreinamento3 extends STreinamentoBase<Exercicio3> {
  List<dynamic> selecoes;

  @override
  void iniciarExercicio() async {
    numRPS = 1;
    try {
      playBack.play(exercicios[2]);
    } catch (e) {
      print(e);
    }
    respostasDadas = gerarStringRespostas(8);
    respostasDadasL = List.generate(
      10,
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
      "s1",
    ];

    return MaterialApp(
      home: Scaffold(
        backgroundColor: backgroundColor,
        appBar: stbAppBar(context, texto: "Exercicio 3"),
        body: Column(
          children: [
            Spacer(
              flex: 1,
            ),
            if (respostas < selecoes.length)
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

class Exercicio3 extends StatefulWidget {
  STreinamentoBase<Exercicio3> createState() {
    return _STreinamento3();
  }
}
