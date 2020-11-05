import 'treinamentos.dart';
import 'package:flutter/material.dart';
import 'package:auditech_mobile/mainData.dart';
import 'package:auditech_mobile/telas/CustomComponents/TelaTreinamento/components.dart';

class STreinamento4 extends STreinamentoBase<ExercicioCentral> {
  List<dynamic> selecoes;

  @override
  void iniciarExercicio() {
    definirRequisitos(1, exercicios["Ex4"], true);
  }

  @override
  Widget build(BuildContext context) {
    selecoes = [
      //Lista de Widgets
      "s1",
      [
        "s1",
        {"nome": "Tambor", "método": podeAvancar("T")},
        "s1",
        {"nome": "Piano", "método": podeAvancar("P")},
        "s1",
      ],
      "s1",
      [
        "s1",
        {"nome": "Gaita", "método": podeAvancar("G")},
        "s1",
        {"nome": "Flauta", "método": podeAvancar("F")},
        "s1",
      ],
      "s1",
      [
        "s1",
        {"nome": "Violão", "método": podeAvancar("V")},
        "s1",
      ],
      "s1",
    ];

    return MaterialApp(
      home: Scaffold(
        backgroundColor: backgroundColor,
        appBar: stbAppBar(context, texto: "Exercicio 4"),
        body: Stack(
          children: [
            Column(
              children: [
                Spacer(
                  flex: 1,
                ),
                VisorDeRespostas(
                  respostasDadasL,
                  direcao: VisorDirecao.HORIZONTAL,
                ),
                if (arr < respostasDadasL.length)
                  addDynamicComponents(selecoes),
              ],
            ),
            if (sequencia == 0) jmpBtn(),
          ],
        ),
      ),
    );
  }
}
