import 'package:AuditechMobile/mainData.dart';
import 'package:AuditechMobile/telas/CustomComponents/Global/globalComponents.dart';
import 'package:AuditechMobile/telas/CustomComponents/TelaTreinamento/components.dart';
import 'package:AuditechMobile/telas/Treinamentos/StateTreinamentoBase.dart';
import 'package:flutter/material.dart';

class _STreinamento2 extends STreinamentoBase<Exercicio2> {
  int selecionado = 0;

  List<List<String>> respostasDadas = List(10);
  List<Map<String, dynamic>> selecoes;

  void avancar() {
    setState(
      () {
        if (selecionado < selecoes.length - 1) {
          selecionado++;
        } else {
          irParaResultados(context);
        }
      },
    );
    print(selecionado);
  }

  @override
  Widget build(BuildContext context) {
    selecoes = [
      {"texto": "Tom grave", "método": avancar},
      {"texto": "Tom agudo", "método": avancar},
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
            (selecionado < selecoes.length)
                ? Row(
                    children: [
                      SideButton(
                        selecoes[selecionado]["texto"],
                        selecoes[selecionado]["método"],
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      SideButton(
                        selecoes[selecionado]["texto"],
                        selecoes[selecionado]["método"],
                      ),
                    ],
                  )
                : null,
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
    respostasDadas.fillRange(1, 10, List(3));
    playBack.play(exercicios[1]);
  }
}

class Exercicio2 extends StatefulWidget {
  STreinamentoBase<Exercicio2> createState() {
    return _STreinamento2();
  }
}
