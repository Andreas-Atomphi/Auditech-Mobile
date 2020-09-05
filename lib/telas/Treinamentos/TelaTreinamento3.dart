import 'package:AuditechMobile/telas/Telas.dart';
import 'package:flutter/material.dart';
import 'package:AuditechMobile/main.dart';
import 'TelaTreinamentoExemplo.dart';
import 'package:AuditechMobile/telas/CustomComponents/TelaTreinamento/components.dart';
import 'package:AuditechMobile/telas/CustomComponents/Global/globalComponents.dart';

class _STreinamento3 extends State {
  int questaoSelecionada = 0;

  List<List<Widget>> respostas;

  void avancar() {
    setState(() {
      questaoSelecionada += (questaoSelecionada < respostas.length - 1) ? 1 : 0;
      print(questaoSelecionada);
    });
  }

  @override
  Widget build(BuildContext context) {
    void _backPress() {
      Navigator.pop(context);
    }

    respostas = [
      //Animais
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
            SelectButton("Pássaro", avancar),
            Spacer(
              flex: 1,
            ),
            SelectButton("Gato", avancar),
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
            SelectButton("Cavalo", avancar),
            Spacer(
              flex: 1,
            ),
            SelectButton("Bode", avancar),
            Spacer(
              flex: 1,
            ),
          ],
        ),
        Spacer(
          flex: 5,
        ),
      ],

      //Instrumentos
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
            SelectButton("Tambor", avancar),
            Spacer(
              flex: 1,
            ),
            SelectButton("Piano", avancar),
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
            SelectButton("Gaita", avancar),
            Spacer(
              flex: 1,
            ),
            SelectButton("Flauta", avancar),
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
            SelectButton("Violão", avancar),
            Spacer(
              flex: 1,
            ),
          ],
        ),
        Spacer(
          flex: 5,
        ),
      ],

      //Automóveis
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
            SelectButton("Trem", avancar),
            Spacer(
              flex: 1,
            ),
            SelectButton("Fórmula 1", avancar),
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
            SelectButton("Carro", avancar),
            Spacer(
              flex: 1,
            ),
            SelectButton("Helicóptero", avancar),
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
            SelectButton("Ambulância", avancar),
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
          "Exercício 3",
          backButton: true,
          pressBack: _backPress,
        ),
        body: Column(
          children: [
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

class Exercicio3 extends StatefulWidget {
  State createState() {
    return _STreinamento3();
  }
}
