import 'package:flutter/material.dart';
import 'package:auditech_mobile/mainData.dart';
import 'package:auditech_mobile/telas/CustomComponents/Exercicios/components.dart';
import 'telasDeExercicio.dart';

class SExercicio3 extends SExercicioBase {
  List<dynamic> selecoes;

  @override
  void iniciarExercicio() async {
    definirRequisitos(1, exercicios["Ex3"], true);
  }

  @override
  Widget build(BuildContext context) {
    selecoes = [
      //Lista de Widgets
      "s1",
      [
        "s1",
        {"nome": "Pássaro", "método": podeAvancar("P")},
        "s1",
        {"nome": "Gato", "método": podeAvancar("G")},
        "s1",
      ],
      "s1",
      [
        "s1",
        {"nome": "Cavalo", "método": podeAvancar("C")},
        "s1",
        {"nome": "Bode", "método": podeAvancar("B")},
        "s1",
      ],
      "s1",
    ];

    return myPopScope(
      context: context,
      home: Scaffold(
        backgroundColor: backgroundColor,
        appBar: stbAppBar(context, texto: "Exercicio 3"),
        body: Stack(
          children: [
            Column(
              children: [
                Spacer(
                  flex: 1,
                ),
                (sequencia > 0)
                    ? (sequencia < 5)
                        ? textInstruct(
                            "Escute com atenção e repita os animais que você ouvir na orelha direita")
                        : textInstruct(
                            "Escute com atenção e repita os animais que você ouvir na orelha esquerda")
                    : textInstruct("Preste atenção na explicação."),
                Spacer(
                  flex: 1,
                ),
                VisorDeRespostas(
                  respostasDadasL,
                  direcao: VisorDirecao.HORIZONTAL,
                ),
                // Adiciona os componentes de forma dinâmica
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
