import 'package:AuditechMobile/mainData.dart';
import 'package:AuditechMobile/telas/CustomComponents/TelaTreinamento/components.dart';
import 'package:AuditechMobile/telas/Treinamentos/StateTreinamentoBase.dart';
import 'package:flutter/material.dart';

class _STreinamento2 extends STreinamentoBase<Exercicio2> {
  List<dynamic> selecoes;

  @override
  void iniciarExercicio() async {
    definirRequisitos(3, 10, exercicios["Ex2"], true);
  }

  @override
  Widget build(BuildContext context) {
    selecoes = [
      {"texto": "Tom fino", "método": podeAvancar("F")},
      "s1",
      {"texto": "Tom grosso", "método": podeAvancar("G")},
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: backgroundColor,
        appBar: stbAppBar(context, texto: "Exercicio 2"),
        body: Stack(
          children: [
            if (sequencia == 0) jmpBtn(),
            Column(
              children: [
                Spacer(
                  flex: 1,
                ),
                textInstruct(
                    "Aperte os tons que você ouvir na orelha: {valor}"),
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
                ),
              ]..removeWhere((w) => w == null),
            ),
          ],
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
