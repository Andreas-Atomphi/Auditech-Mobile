import 'package:AuditechMobile/telas/Treinamentos/StateTreinamentoBase.dart';
import 'package:flutter/material.dart';
import 'package:AuditechMobile/main.dart';
import 'package:AuditechMobile/telas/CustomComponents/TelaTreinamento/components.dart';

class _STreinamento6 extends STreinamentoBase<Exercicio6> {
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
    respostas = [
      "s1",
      //Lista de Widgets
      [
        "s1",
        {"nome": "Grito", "método": avancar},
        "s1",
        {"nome": "Passo", "método": avancar},
        "s1",
      ],
      "s1",
      [
        "s1",
        {"nome": "Palma", "método": avancar},
        "s1",
        {"nome": "Risada", "método": avancar},
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
              ...respostas[questaoSelecionada].map(
                (lay) => (lay.runtimeType == String)
                    ? Spacer(flex: int.parse(lay[1]))
                    : Row(
                        children: [
                          ...lay.map(
                            (com) => (com.runtimeType == String)
                                ? (com.toString() == "s1")
                                    ? Spacer(flex: 1)
                                    : Spacer(flex: 5)
                                : SelectButton(com["nome"], com["método"]),
                          )
                        ],
                      ),
              ),
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

class Exercicio6 extends StatefulWidget {
  STreinamentoBase<Exercicio6> createState() {
    return _STreinamento6();
  }
}
