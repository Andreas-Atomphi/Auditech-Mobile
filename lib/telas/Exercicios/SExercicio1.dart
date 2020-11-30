import 'package:auditech_mobile/mainData.dart';
import 'package:auditech_mobile/telas/CustomComponents/Exercicios/components.dart';
import 'package:auditech_mobile/telas/Exercicios/SExercicioBase.dart';
import 'package:flutter/material.dart';
import 'telasDeExercicio.dart';

class SExercicio1 extends SExercicioBase {
  List<dynamic> selecoes;

  SExercicio1(int faseId, int exercicioId) : super(faseId, exercicioId);

  @override
  void iniciarExercicio() {
    definirRequisitos(3, exercicios["Ex1"], true);
  }

  @override
  Widget mainRouteBuild() {
    selecoes = [
      {
        "texto": "Tom longo",
        "método": podeAvancar("L"),
      },
      "s1",
      {
        "texto": "Tom curto",
        "método": podeAvancar("C"),
      },
    ];
    return Stack(
      children: <Widget>[
        Column(
          children: [
            Spacer(flex: 1),
            textInstruct("Pressione tom longo ou tom curto após ouvir"),
            Spacer(flex: 1),
            VisorDeRespostas(
              respostasDadasL,
              direcao: VisorDirecao.HORIZONTAL,
            ),
            Container(
              color: secondary,
              margin: EdgeInsets.zero,
              padding: EdgeInsets.all(5),
              child: Row(
                children: [
                  ...selecoes.map(
                    (e) => (e.runtimeType == String)
                        ? Spacer(flex: int.parse(e[1]))
                        : SideButton(
                            e["texto"],
                            e["método"],
                          ),
                  ),
                ]..removeWhere((w) => w == null),
              ),
            )
          ]..removeWhere((w) => w == null),
        ),
        if (sequencia == 0) jmpBtn(),
      ],
    );
  }
}
