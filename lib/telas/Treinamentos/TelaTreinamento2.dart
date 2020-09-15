import 'package:AuditechMobile/main.dart';
import 'package:AuditechMobile/telas/CustomComponents/Global/globalComponents.dart';
import 'package:AuditechMobile/telas/CustomComponents/TelaTreinamento/components.dart';
import 'package:flutter/material.dart';

class _STreinamento2 extends State {
  int selecionado = 0;

  @override
  Widget build(BuildContext context) {
    List<List<Map<String, dynamic>>> selecoes;
    void avancar() {
      setState(
        () {
          selecionado += (selecionado < selecoes.length) ? 1 : 0;
        },
      );
      if (selecionado >= selecoes.length)
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: routes["resultados"],
          ),
        );
      print(selecionado);
    }

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

    void _backPress() {
      Navigator.pop(context);
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: backgroundColor,
        appBar: CAppBar(
          "Exemplo",
          backButton: true,
          pressBack: _backPress,
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
            LinearProgressIndicator(
              value: 0.5,
              backgroundColor: Colors.blue,
              valueColor: AlwaysStoppedAnimation(Colors.orange),
              minHeight: 7,
            ),
          ]..removeWhere((widget) => widget == null),
        ),
      ),
    );
  }
}

class Exercicio2 extends StatefulWidget {
  State createState() {
    return _STreinamento2();
  }
}
