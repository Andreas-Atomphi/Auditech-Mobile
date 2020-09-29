import 'package:AuditechMobile/telas/Telas.dart';
import 'package:flutter/material.dart';

import 'package:AuditechMobile/mainData.dart';
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
        //Adiciona os componentes de forma dinâmica através das chaves de routesExercicios
        ...routesExercicios.keys.map(
          //Retorna ButtonTreinamento
          (e) => ButtonTreinamento(
            //Concatena model com o último dígito da chave (treinamento-n)
            model[0] + e[e.length - 1],
            //Adiciona o método para ButtonTreinamento
            () => irParaTreino(
              model[0] + e[e.length - 1],
              e,
            ),
          ),
        )
      ],
    );
  }
}
