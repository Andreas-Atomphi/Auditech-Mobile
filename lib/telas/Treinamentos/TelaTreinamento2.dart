import 'package:AuditechMobile/mainData.dart';
import 'package:AuditechMobile/telas/CustomComponents/Global/globalComponents.dart';
import 'package:AuditechMobile/telas/CustomComponents/TelaTreinamento/components.dart';
import 'package:AuditechMobile/telas/Treinamentos/StateTreinamentoBase.dart';
import 'package:flutter/material.dart';
import 'package:sprintf/sprintf.dart';

class _STreinamento2 extends STreinamentoBase<Exercicio2> {
  List<dynamic> selecoes;

  @override
  void iniciarExercicio() {
    numRPS = 3;
    playBack.play(exercicios[1]);
    respostasDadas = gerarStringRespostas(10);
    respostasDadasL = List.generate(
      10,
      (i) => "",
    );
  }

  @override
  Widget build(BuildContext context) {
    selecoes = [
      {"texto": "Tom fino", "método": () => avancar("tf")},
      "s1",
      {"texto": "Tom grosso", "método": () => avancar("tg")},
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: backgroundColor,
        appBar: stbAppBar(context, texto: "Exercicio 2"),
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
              color: accent,
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
      ),
    );
  }
}

class Exercicio2 extends StatefulWidget {
  STreinamentoBase<Exercicio2> createState() {
    return _STreinamento2();
  }
}
