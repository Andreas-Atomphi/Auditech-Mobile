import 'package:AuditechMobile/mainData.dart';
import 'package:AuditechMobile/telas/CustomComponents/Global/globalComponents.dart';
import 'package:AuditechMobile/telas/CustomComponents/TelaTreinamento/components.dart';
import 'package:AuditechMobile/telas/Treinamentos/StateTreinamentoBase.dart';
import 'package:flutter/material.dart';

class _STreinamento1 extends STreinamentoBase<Exercicio1> {
  int selecionado = 0;

  List<Map<String, dynamic>> selecoes;
  List<List<String>> respostasDadas = List(10);

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
      {"texto": "Tom longo", "método": avancar},
      {"texto": "Tom curto", "método": avancar},
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
              flex: 2,
            ),
          ]..removeWhere((w) => w == null),
        ),
      ),
    );
  }

  void iniciarExercicio() {
    respostasDadas.fillRange(1, 10, List(3));
    playBack.play(exercicios[0]);
  }
}

class Exercicio1 extends StatefulWidget {
  STreinamentoBase<Exercicio1> createState() {
    return _STreinamento1();
  }
}
