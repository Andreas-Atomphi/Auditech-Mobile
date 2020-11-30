import 'telasDeExercicio.dart';
import 'package:flutter/material.dart';
import 'package:auditech_mobile/telas/CustomComponents/Exercicios/components.dart';

class SExercicio6 extends SExercicioBase {
  List<dynamic> selecoes;

  SExercicio6(int faseId, int exercicioId) : super(faseId, exercicioId);

  @override
  void iniciarExercicio() {
    definirRequisitos(1, exercicios["Ex6"], true);
  }

  @override
  Widget mainRouteBuild() {
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

    return Stack(
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
    );
  }
}
