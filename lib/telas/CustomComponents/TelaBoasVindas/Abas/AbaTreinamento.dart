import 'package:AuditechMobile/telas/Telas.dart';
import 'package:AuditechMobile/telas/routes.dart';
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
        "método": () => irParaTreino("Exercício 2", "treinamento-animais")
      },
      {
        "texto": "Exercício 3",
        "método": () => irParaTreino("Exercicio 3"),
      },
      {
        "texto": "Exercício 4",
        "método": () => irParaTreino("Exercicio 4"),
      },
    ];
    double space = 30;
    return GridView.count(
      padding: EdgeInsets.all(space),
      crossAxisCount: 2,
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
