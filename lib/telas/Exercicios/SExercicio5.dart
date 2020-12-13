import 'package:auditech_mobile/telas/CustomComponents/Global/ApiClasses.dart';

import 'telasDeExercicio.dart';
import 'package:flutter/material.dart';
import 'package:auditech_mobile/telas/CustomComponents/Exercicios/components.dart';

class SExercicio5 extends SExercicioBase {
  List<dynamic> selecoes;

  SExercicio5(Fase fase) : super(fase);

  @override
  void iniciarExercicio() {
    definirRequisitos(1, exercicios["Ex5"], true);
  }

  @override
  Widget mainRouteBuild() {
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

    return Stack(
      children: [
        if (sequencia == 0) jmpBtn(),
        Column(
          children: [
            Spacer(
              flex: 1,
            ),
            (sequencia > 0)
                ? (sequencia < 4)
                    ? textInstruct(
                        "Escute com atenção e repita os sons da natureza que você ouvir na orelha direita")
                    : textInstruct(
                        "Escute com atenção e repita os sons da natureza que você ouvir na orelha esquerda")
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
      ],
    );
  }
}
