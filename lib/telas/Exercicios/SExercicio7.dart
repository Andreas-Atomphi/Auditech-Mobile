import 'telasDeExercicio.dart';
import 'package:flutter/material.dart';
import 'package:auditech_mobile/telas/CustomComponents/Exercicios/components.dart';

class SExercicio7 extends SExercicioBase {
  List<dynamic> selecoes;

  SExercicio7(int faseId, int exercicioId) : super(faseId, exercicioId);

  @override
  void iniciarExercicio() {
    definirRequisitos(1, exercicios["Ex7"], true);
  }

  @override
  Widget mainRouteBuild() {
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
                        "Escute com atenção e repita os sons dos meios de transporte que você ouvir na orelha direita")
                    : textInstruct(
                        "Escute com atenção e repita os sons dos meios de transporte que você ouvir na orelha esquerda")
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
