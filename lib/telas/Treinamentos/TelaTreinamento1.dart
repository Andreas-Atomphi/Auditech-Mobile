import 'package:AuditechMobile/mainData.dart';
import 'package:AuditechMobile/telas/CustomComponents/TelaTreinamento/components.dart';
import 'package:AuditechMobile/telas/Treinamentos/StateTreinamentoBase.dart';
import 'package:flutter/material.dart';
import 'treinamentos.dart';

class STreinamento1 extends STreinamentoBase<ExercicioCentral> {
  List<dynamic> selecoes;

  @override
  void iniciarExercicio() {
    definirRequisitos(3, exercicios["Ex1"], true);
  }

  @override
  Widget build(BuildContext context) {
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
    return myPopScope(
      home: Scaffold(
        backgroundColor: backgroundColor,
        appBar: stbAppBar(context, texto: "Exercicio 1"),
        body: Stack(
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
        ),
      ),
    );
  }
}
