import 'package:AuditechMobile/telas/Telas.dart';
import 'package:flutter/material.dart';
import 'package:AuditechMobile/main.dart';
import 'package:AuditechMobile/telas/CustomComponents/TelaTreinamento/components.dart';
import 'package:AuditechMobile/telas/CustomComponents/Global/globalComponents.dart';

class _STreinamento4 extends State {
  int questaoSelecionada = 0;

  List<List<Widget>> respostas;

  void avancar() {
    setState(() {
      questaoSelecionada += 1;
      if (questaoSelecionada >= respostas.length) {
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                Resultados(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              var begin = Offset(1.0, 0.0);
              var end = Offset.zero;
              var curve = Curves.ease;
              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              var offsetAnimation = animation.drive(tween);
              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            },
          ),
        );
      }
      print(questaoSelecionada);
    });
  }

  @override
  Widget build(BuildContext context) {
    void _backPress() {
      Navigator.pop(context);
    }

    respostas = [
      //Ser humano
      [
        //Lista de Widgets
        Spacer(
          flex: 1,
        ),
        Row(
          children: [
            Spacer(
              flex: 1,
            ),
            SelectButton("Grito", avancar),
            Spacer(
              flex: 1,
            ),
            SelectButton("Passo", avancar),
            Spacer(
              flex: 1,
            ),
          ],
        ),
        Spacer(
          flex: 1,
        ),
        Row(
          children: [
            Spacer(
              flex: 1,
            ),
            SelectButton("Palma", avancar),
            Spacer(
              flex: 1,
            ),
            SelectButton("Risada", avancar),
            Spacer(
              flex: 1,
            ),
          ],
        ),
        Spacer(
          flex: 5,
        ),
      ],

      //Natureza
      [
        //Lista de Widgets
        Spacer(
          flex: 1,
        ),
        Row(
          children: [
            Spacer(
              flex: 1,
            ),
            SelectButton("Vento", avancar),
            Spacer(
              flex: 1,
            ),
            SelectButton("Água", avancar),
            Spacer(
              flex: 1,
            ),
          ],
        ),
        Spacer(
          flex: 1,
        ),
        Row(
          children: [
            Spacer(
              flex: 1,
            ),
            SelectButton("Ondas", avancar),
            Spacer(
              flex: 1,
            ),
            SelectButton("Mar", avancar),
            Spacer(
              flex: 1,
            ),
          ],
        ),
        Spacer(
          flex: 1,
        ),
        Row(
          children: [
            Spacer(
              flex: 1,
            ),
            SelectButton("Trovão", avancar),
            Spacer(
              flex: 1,
            ),
          ],
        ),
        Spacer(
          flex: 5,
        ),
      ],
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: backgroundColor,
        appBar: CAppBar(
          "Exercício 4",
          backButton: true,
          pressBack: _backPress,
        ),
        body: Column(
          children: [
            if (questaoSelecionada < respostas.length)
              ...respostas[questaoSelecionada],
            LinearProgressIndicator(
              value: 0.5,
              backgroundColor: Colors.blue,
              valueColor: AlwaysStoppedAnimation(Colors.orange),
              minHeight: 7,
            ),
          ],
        ),
      ),
    );
  }
}

class Exercicio4 extends StatefulWidget {
  State createState() {
    return _STreinamento4();
  }
}
