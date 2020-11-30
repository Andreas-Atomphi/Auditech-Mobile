import 'package:auditech_mobile/telas/CustomComponents/Global/ApiClasses.dart';

import 'telasDeExercicio.dart';
import 'package:flutter/material.dart';
import 'package:auditech_mobile/telas/CustomComponents/Exercicios/components.dart';

class SExercicio4 extends SExercicioBase {
  List<dynamic> selecoes;

  SExercicio4(Fase fase) : super(fase);

  @override
  void iniciarExercicio() {
    definirRequisitos(1, exercicios["Ex4"], true);
  }

  @override
  Widget mainRouteBuild() {
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
                        "Escute com atenção e repita os instrumentos que você ouvir na orelha direita")
                    : textInstruct(
                        "Escute com atenção e repita os instrumentos que você ouvir na orelha esquerda")
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
