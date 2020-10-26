import 'treinamentos.dart';
import 'package:flutter/material.dart';
import 'package:AuditechMobile/mainData.dart';
import 'package:AuditechMobile/telas/CustomComponents/TelaTreinamento/components.dart';

class STreinamento5 extends STreinamentoBase<ExercicioCentral> {
  List<dynamic> selecoes;

  @override
  void iniciarExercicio() {
    definirRequisitos(1, exercicios["Ex5"], true);
  }

  @override
  Widget build(BuildContext context) {
    selecoes = [
      "s1",
      //Lista de Widgets
      [
        "s1",
        {"nome": "Vento", "método": podeAvancar("V")},
        "s1",
        {"nome": "Água", "método": podeAvancar("A")},
        "s1",
      ],
      "s1",
      [
        "s1",
        {"nome": "Ondas do mar", "método": podeAvancar("OM")},
        "s1",
        {"nome": "Trovão", "método": podeAvancar("T")},
        "s1",
      ],
      "s1",
      [
        "s1",
        {"nome": "Chuva com trovão", "método": podeAvancar("CT")},
        "s1",
      ],
      "s1",
    ];

    return MaterialApp(
      home: Scaffold(
        backgroundColor: backgroundColor,
        appBar: stbAppBar(context, texto: "Exercicio 5"),
        body: Stack(
          children: [
            if (sequencia == 0) jmpBtn(),
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
                  // * Adiciona os componentes de forma dinâmica
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
