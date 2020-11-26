import 'treinamentos.dart';
import 'package:flutter/material.dart';
import 'package:auditech_mobile/mainData.dart';
import 'package:auditech_mobile/telas/CustomComponents/TelaTreinamento/components.dart';

class STreinamento6 extends STreinamentoBase {
  List<dynamic> selecoes;

  @override
  void iniciarExercicio() {
    definirRequisitos(1, exercicios["Ex6"], true);
  }

  @override
  Widget build(BuildContext context) {
    selecoes = [
      "s1",
      //Lista de Widgets
      [
        "s1",
        {"nome": "Grito", "método": podeAvancar("G")},
        "s1",
        {"nome": "Passo", "método": podeAvancar("P")},
        "s1",
      ],
      "s1",
      [
        "s1",
        {"nome": "Palma", "método": podeAvancar("P")},
        "s1",
        {"nome": "Risada", "método": podeAvancar("R")},
        "s1",
      ],
      "s1",
    ];

    return myPopScope(
      context: context,
      home: Scaffold(
        backgroundColor: backgroundColor,
        appBar: stbAppBar(context, texto: "Exercicio 6"),
        body: Stack(
          children: [
            Column(
              children: [
                Spacer(
                  flex: 1,
                ),
                (sequencia > 0)
                    ? (sequencia < 4)
                        ? textInstruct(
                            "Escute com atenção e repita os sons do corpo humano que você ouvir na orelha direita")
                        : textInstruct(
                            "Escute com atenção e repita os sons do corpo humano que você ouvir na orelha esquerda")
                    : textInstruct("Preste atenção na explicação."),
                Spacer(
                  flex: 1,
                ),
                VisorDeRespostas(
                  respostasDadasL,
                  direcao: VisorDirecao.HORIZONTAL,
                ),
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
