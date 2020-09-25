import 'package:AuditechMobile/telas/Telas.dart';
import 'package:flutter/material.dart';

import '../../../../main.dart';
import '../components.dart';

class AbaTreinamento extends StatelessWidget {
  Widget build(BuildContext context) {
    void irParaTreino(String appbartext, [String numtreino = "exemplo-tr"]) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              TelaInstrucoesTreinamento(appbartext, numtreino),
        ),
      );
    }

    List model = ["Exercício ", "treinamento-"];
    double space = 30;
    return GridView.extent(
      padding: EdgeInsets.all(space),
      maxCrossAxisExtent: 200,
      crossAxisSpacing: space,
      mainAxisSpacing: space,
      children: [
        ...<dynamic>[1, 2, 3, 4, 5, 6, 7, 8].map(
          (e) => ButtonTreinamento(
            model[0] + e.toString(),
            () =>
                irParaTreino(model[0] + e.toString(), model[1] + e.toString()),
          ),
        ),
      ],
    );
  }
}
