import 'package:AuditechMobile/telas/Telas.dart';
import 'package:flutter/material.dart';

import '../components.dart';

class AbaTreinamento extends StatelessWidget {
  Widget build(BuildContext context) {
    void irParaTreino(String appbartext,
        [String numtreino = "treinamento-exemplo"]) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              TelaInstrucoesTreinamento(appbartext, numtreino),
        ),
      );
    }

    List<Map<String, dynamic>> components = [
      {
        "texto": "Exercício 1",
        "método": () => irParaTreino("Exercicio 1"),
      },
      {
        "texto": "Exercício 2",
        "método": () => irParaTreino("Exercício 2", "treinamento-2"),
      },
      {
        "texto": "Exercício 3",
        "método": () => irParaTreino("Exercicio 3", "treinamento-3"),
      },
      {
        "texto": "Exercício 4",
        "método": () => irParaTreino("Exercicio 4", "treinamento-4"),
      },
      {
        "texto": "Exercício 5",
        "método": () => irParaTreino("Exercicio 5", "treinamento-5"),
      },
    ];

    double space = 30;
    return GridView.extent(
      padding: EdgeInsets.all(space),
      maxCrossAxisExtent: 200,
      crossAxisSpacing: space,
      mainAxisSpacing: space,
      children: [
        ...components.map(
          (e) => ButtonTreinamento(
            e["texto"],
            e["método"],
          ),
        ),
      ],
    );
  }
}
