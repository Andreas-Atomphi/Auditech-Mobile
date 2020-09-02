import 'package:flutter/material.dart';

import 'TelaTreinamentoExemplo.dart';
import 'package:AuditechMobile/telas/CustomComponents/TelaTreinamento/components.dart';

class Treinamento3State extends TreinamentoStateExemplo {
  Treinamento3State(List<Widget> componentes, String exercicio)
      : super(componentes, exercicio);
}

class Exercicio3 extends StatefulWidget {
  State createState() {
    return Treinamento3State(
      [],
      "Exercício 3",
    );
  }
}

List<List<Widget>> respostas = [
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
        SelectButton("Pássaro"),
        Spacer(
          flex: 1,
        ),
        SelectButton("Gato"),
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
        SelectButton("Cavalo"),
        Spacer(
          flex: 1,
        ),
        SelectButton("Bode"),
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
