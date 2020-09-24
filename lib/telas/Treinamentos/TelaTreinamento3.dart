import 'package:AuditechMobile/telas/Telas.dart';
import 'package:flutter/material.dart';
import 'package:AuditechMobile/main.dart';
import 'package:AuditechMobile/telas/CustomComponents/TelaTreinamento/components.dart';

class _STreinamento3 extends STreinamentoBase<Exercicio3> {
  int questaoSelecionada = 0;

  List<List<dynamic>> respostas;

  void avancar() {
    setState(
      () {
        questaoSelecionada += 1;
        if (questaoSelecionada >= respostas.length) {
          irParaResultados(context);
        }
        print(questaoSelecionada);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    respostas = [
      //Animais
      [
        "s1",
        //Lista de Widgets
        [
          "s1",
          {"nome": "Pássaro", "método": avancar},
          "s1",
          {"nome": "Gato", "método": avancar},
          "s1",
        ],
        "s1",
        [
          "s1",
          {"nome": "Cavalo", "método": avancar},
          "s1",
          {"nome": "Bode", "método": avancar},
          "s1",
        ],
        "s5",
      ],

      //Instrumentos
      [
        //Lista de Widgets
        "s1",
        [
          "s1",
          {"nome": "Tambor", "método": avancar},
          "s1",
          {"nome": "Piano", "método": avancar},
          "s1",
        ],
        "s1",
        [
          "s1",
          {"nome": "Gaita", "método": avancar},
          "s1",
          {"nome": "Flauta", "método": avancar},
          "s1",
        ],
        "s1",

        [
          "s1",
          {"nome": "Violão", "método": avancar},
          "s1",
        ],
        "s5",
      ],

      //Automóveis
      [
        "s1",
        //Lista de Widgets
        [
          "s1",
          {"nome": "Trem", "método": avancar},
          "s1",
          {"nome": "Fórmula 1", "método": avancar},
          "s1",
        ],
        "s1",
        [
          "s1",
          {"nome": "Carro", "método": avancar},
          "s1",
          {"nome": "Helicóptero", "método": avancar},
          "s1",
        ],
        "s1",
        [
          "s1",
          {"nome": "Ambulância", "método": avancar},
          "s1",
        ],
        "s5",
      ],
    ];

    return MaterialApp(
      home: Scaffold(
        backgroundColor: backgroundColor,
        appBar: stbAppBar(context, texto: "Exemplo 3"),
        body: Column(
          children: [
            if (questaoSelecionada < respostas.length)
              // * Adiciona os componentes de forma dinâmica
              ...respostas[questaoSelecionada].map(
                (lay) => (lay.runtimeType == String)
                    ? Spacer(flex: int.parse(lay[1]))
                    : Row(
                        children: [
                          ...lay.map(
                            (com) => (com.runtimeType == String)
                                ? (com.toString() == "s1")
                                    ? Spacer(flex: 1)
                                    : Spacer(flex: 5)
                                : SelectButton(com["nome"], com["método"]),
                          )
                        ],
                      ),
              ),
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

  void iniciarExercicio() {
    // TODO: implement iniciarExercicio
  }
}

class Exercicio3 extends StatefulWidget {
  STreinamentoBase<Exercicio3> createState() {
    return _STreinamento3();
  }
}
