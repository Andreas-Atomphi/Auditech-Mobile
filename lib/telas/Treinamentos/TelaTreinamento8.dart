import 'treinamentos.dart';
import 'package:flutter/material.dart';
import 'package:auditech_mobile/mainData.dart';
import 'package:auditech_mobile/telas/CustomComponents/TelaTreinamento/components.dart';

class STreinamento8 extends STreinamentoBase {
  List<dynamic> selecoes;

  @override
  void iniciarExercicio() {
    definirRequisitos(1, exercicios["Ex8"], true);
  }

  @override
  Widget build(BuildContext context) {
    selecoes = [
      "s1",
      //Lista de Widgets
      [
        "s1",
        {"nome": "Descarga", "método": podeAvancar("D")},
        "s1",
        {"nome": "Campainha", "método": podeAvancar("C")},
        "s1",
      ],
      "s1",
      [
        "s1",
        {"nome": "Telefone", "método": podeAvancar("T")},
        "s1",
        {"nome": "Liquidificador", "método": podeAvancar("L")},
        "s1",
      ],
      "s1",
      [
        "s1",
        {"nome": "Panela de pressão", "método": podeAvancar("P")},
        "s1",
      ],
      "s1",
    ];

    return myPopScope(
      context: context,
      home: Scaffold(
        backgroundColor: backgroundColor,
        appBar: stbAppBar(context, texto: "Exercicio 8"),
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
                            "Escute com atenção e repita os sons da casa que você ouvir na orelha direita")
                        : textInstruct(
                            "Escute com atenção e repita os sons da casa que você ouvir na orelha esquerda")
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
