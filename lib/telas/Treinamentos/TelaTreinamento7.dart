import 'treinamentos.dart';
import 'package:flutter/material.dart';
import 'package:auditech_mobile/mainData.dart';
import 'package:auditech_mobile/telas/CustomComponents/TelaTreinamento/components.dart';

class STreinamento7 extends STreinamentoBase<ExercicioCentral> {
  List<dynamic> selecoes;

  @override
  void iniciarExercicio() {
    definirRequisitos(1, exercicios["Ex7"], true);
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
        {"nome": "Trem", "método": podeAvancar("T")},
        "s1",
        {"nome": "Fórmula 1", "método": podeAvancar("F")},
        "s1",
      ],
      "s1",
      [
        "s1",
        {"nome": "Carro", "método": podeAvancar("C")},
        "s1",
        {"nome": "Helicóptero", "método": podeAvancar("H")},
        "s1",
      ],
      "s1",
      [
        "s1",
        {"nome": "Ambulância", "método": podeAvancar("A")},
        "s1",
      ],
      "s1",
    ];

    return MaterialApp(
      home: Scaffold(
        backgroundColor: backgroundColor,
        appBar: stbAppBar(context, texto: "Exercicio 7"),
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
