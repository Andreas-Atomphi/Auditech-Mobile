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
    List<ButtonTreinamento> buttons = [
      //Adiciona os componentes de forma dinâmica através das chaves de routesExercicios
      ...routesExercicios.keys.map(
        //Retorna ButtonTreinamento
        (e) {
          //  Armazena os números dos treinos
          String exercicio =
              "${model[0]} ${int.parse(e.replaceAll(RegExp('[^0-9]'), ''))}";
          //  Retorna um ButtonTreinamento
          return ButtonTreinamento(
            //Concatena model com o último dígito da chave (treinamento-n)
            exercicio,
            //Adiciona o método para ButtonTreinamento
            () => irParaTreino(
              exercicio,
              e,
            ),
          );
        },
      ),
    ];

    double space = 30;
    return GridView.extent(
      padding: EdgeInsets.all(space),
      maxCrossAxisExtent: 200,
      crossAxisSpacing: space,
      mainAxisSpacing: space,
      children: [
        ...buttons,
      ],
    );
  }
}
