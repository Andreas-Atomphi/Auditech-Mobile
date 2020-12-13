import 'package:auditech_mobile/mainData.dart';
import 'package:auditech_mobile/telas/CustomComponents/Exercicios/components.dart';
import 'package:auditech_mobile/telas/CustomComponents/Global/ApiClasses.dart';
import 'package:flutter/material.dart';
import 'telasDeExercicio.dart';

class SExercicio2 extends SExercicioBase {
  List<dynamic> selecoes;

  SExercicio2(Fase fase) : super(fase);

  @override
  void iniciarExercicio() async {
    definirRequisitos(3, exercicios["Ex2"], true);
  }

  @override
  Widget mainRouteBuild() {
    selecoes = [
      {"texto": "Tom fino", "método": podeAvancar("F")},
      "s1",
      {"texto": "Tom grosso", "método": podeAvancar("G")},
    ];
    return Stack(
      children: [
        Column(
          children: [
            Spacer(
              flex: 1,
            ),
            textInstruct("Pressione tom fino ou tom grosso após ouvir"),
            Spacer(
              flex: 1,
            ),
            VisorDeRespostas(
              respostasDadasL,
              direcao: VisorDirecao.HORIZONTAL,
            ),
            Container(
              color: secondary,
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
            ),
          ]..removeWhere((w) => w == null),
        ),
      ],
    );
  }
}
