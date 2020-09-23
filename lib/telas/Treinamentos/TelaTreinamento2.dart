import 'package:AuditechMobile/main.dart';
import 'package:AuditechMobile/telas/CustomComponents/Global/globalComponents.dart';
import 'package:AuditechMobile/telas/CustomComponents/TelaTreinamento/components.dart';
import 'package:AuditechMobile/telas/Telas.dart';
import 'package:flutter/material.dart';

class _STreinamento2 extends STreinamentoBase<Exercicio2> {
  int selecionado = 0;
  //final Playback pbackTest = Playback();

  @override
  void initState() {
    super.initState();
  }

  List<List<Map<String, dynamic>>> selecoes;

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
      [
        {"texto": "Tom longo", "método": avancar},
        {"texto": "Tom curto", "método": avancar},
      ],
      [
        {"texto": "Tom grave", "método": avancar},
        {"texto": "Tom agudo", "método": avancar},
      ],
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: backgroundColor,
        appBar: CAppBar(
          "Exemplo",
          backButton: true,
          pressBack: () => voltar(context),
        ),
        body: Column(
          children: [
            Spacer(
              flex: 1,
            ),
            (selecionado < selecoes.length)
                ? Row(
                    children: [
                      SideButton(
                        selecoes[selecionado][0]["texto"],
                        selecoes[selecionado][0]["método"],
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      SideButton(
                        selecoes[selecionado][1]["texto"],
                        selecoes[selecionado][1]["método"],
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
    // TODO: implement iniciarExercicio
  }
}

class Exercicio2 extends StatefulWidget {
  STreinamentoBase<Exercicio2> createState() {
    return _STreinamento2();
  }
}
