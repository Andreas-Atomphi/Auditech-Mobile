import 'package:AuditechMobile/mainData.dart';
import 'package:AuditechMobile/telas/CustomComponents/Global/globalComponents.dart';
import 'package:AuditechMobile/telas/CustomComponents/TelaTreinamento/components.dart';
import 'package:AuditechMobile/telas/Treinamentos/StateTreinamentoBase.dart';
import 'package:flutter/material.dart';
import 'package:sprintf/sprintf.dart';

class _STreinamento2 extends STreinamentoBase<Exercicio2> {
  int respostas = 0;
  int arr = 0;
  int subarr = 0;

  List<String> respostasDadasL = List.generate(
    10,
    (i) => "",
  );

  List<dynamic> selecoes;
  String respostasDadas = gerarStringRespostas(10);

  void avancar(String resp) {
    setState(
      () {
        if (arr < respostasDadasL.length) {
          respostasDadasL[arr] += (subarr < 2) ? "$resp-" : resp;
        } else {
          print(sprintf(respostasDadas, respostasDadasL));
        }

        if (arr <= respostasDadasL.length) {
          respostas++;
          arr = respostas ~/ 3;
          subarr = respostas % 3;
          print(respostasDadasL);
        }
      },
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
            Row(
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
            Spacer(
              flex: 1,
            ),
            Spacer(
              flex: 1,
            ),
          ]..removeWhere((w) => w == null),
        ),
      ),
    );
  }

  void iniciarExercicio() {
    playBack.play(exercicios[1]);
  }
}

class Exercicio2 extends StatefulWidget {
  STreinamentoBase<Exercicio2> createState() {
    return _STreinamento2();
  }
}
