import 'package:AuditechMobile/mainData.dart';
import 'package:AuditechMobile/telas/CustomComponents/Global/globalComponents.dart';
import 'package:AuditechMobile/telas/CustomComponents/TelaTreinamento/components.dart';
import 'package:AuditechMobile/telas/Treinamentos/StateTreinamentoBase.dart';
import 'package:flutter/material.dart';

class _STreinamento1 extends STreinamentoBase<Exercicio1> {
  List<dynamic> selecoes;
  @override
  void iniciarExercicio() {
    numRPS = 3;
    respostasDadas = gerarStringRespostas(10);
    respostasDadasL = List.generate(
      10,
      (i) => "",
    );
    sons = concatListS(
      <String>[
        "Introducao",
        ...List.generate(10, (i) => "Seq" + (i + 1).toString()),
      ],
      ".mp3",
    );

    print(sons);

    playBack.prefix = exercicios[0];
    playBack.play(sons[0]);
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: backgroundColor,
        appBar: stbAppBar(context, texto: "Exercicio 1"),
        body: Stack(
          children: <Widget>[
            if (sequencia == 0)
              Positioned(
                top: MediaQuery.of(context).size.height * 0.3,
                bottom: MediaQuery.of(context).size.height * 0.51,
                right: 0,
                left: 0,
                child: jmpBtn(),
              ),
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
          ],
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
