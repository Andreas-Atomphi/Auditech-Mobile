import 'package:AuditechMobile/mainData.dart';
import 'package:AuditechMobile/telas/CustomComponents/Global/globalComponents.dart';
import 'package:AuditechMobile/telas/CustomComponents/TelaTreinamento/components.dart';
import 'package:AuditechMobile/telas/Treinamentos/StateTreinamentoBase.dart';
import 'package:flutter/material.dart';
import 'package:sprintf/sprintf.dart';

class _STreinamento1 extends STreinamentoBase<Exercicio1> {
  List<dynamic> selecoes;
  List<String> sons = "$exercicios[0]".concatSList(<String>[
    "Introducao",
    "TomCurto",
    "TomLongo",
  ]).concatSList(".mp3");
  @override
  void iniciarExercicio() {
    numRPS = 3;
    playBack.play(exercicios[0]);
    respostasDadas = gerarStringRespostas(10);
    respostasDadasL = List.generate(
      10,
      (i) => "",
    );
  }

  @override
  Widget build(BuildContext context) {
    selecoes = [
      {"texto": "Tom longo", "método": () => avancar("tl")},
      "s1",
      {"texto": "Tom curto", "método": () => avancar("tc")},
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: backgroundColor,
        appBar: stbAppBar(context, texto: "Exercicio 1"),
        body: Column(
          children: [
            Spacer(
              flex: 1,
            ),
            textInstruct("Aperte os tons que você ouvir na orelha: {valor}"),
            Spacer(
              flex: 1,
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
            )
          ]..removeWhere((w) => w == null),
        ),
      ),
    );
  }
}

class Exercicio1 extends StatefulWidget {
  STreinamentoBase<Exercicio1> createState() {
    return _STreinamento1();
  }
}
