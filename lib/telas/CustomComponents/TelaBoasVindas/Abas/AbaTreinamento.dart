import 'package:auditech_mobile/telas/CustomComponents/Global/ApiClasses.dart';
import 'package:auditech_mobile/telas/Telas.dart';
import 'package:flutter/material.dart';
import 'package:auditech_mobile/mainData.dart';
import '../components.dart';

class _SAbaTreinamento extends State<AbaTreinamento> {
  Fase mainFase;
  Exercicio mainExercicio;
  Map<String, DateTime> data;
  @override
  void initState() {
    super.initState();
    mainFase = widget.fase;
    mainExercicio = mainFase.exercicio;
    data = {
      'inicio': mainFase.dataInicio,
      'fim': mainFase.dataFinal,
      'atual': DateTime.now(),
    };

    print(data);
    print(
      data['atual'].compareTo(
        data['inicio'],
      ),
    );
    print(
      data['atual'].compareTo(
        data['fim'],
      ),
    );
  }

  Widget build(BuildContext context) {
    irParaTreino(
      String appbartext, [
      String numtreino = "exemplo-tr",
      Fase mainFase,
      Exercicio mainExercicio,
    ]) async {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => InstrucoesExercicio(
              appbartext, numtreino, mainFase, mainExercicio),
        ),
      );
    }

    List model = ["Exercício ", "treinamento-"];
    List<ButtonTreinamento> buttons = [
      //Adiciona os componentes de forma dinâmica através das chaves de routesExercicios
      ...routesExercicios.keys.map(
        //Retorna ButtonTreinamento
        (e) {
          int exercicioNum = int.parse(e.replaceAll(RegExp('[^0-9]'), ''));
          //  Armazena os números dos treinos
          String exercicio = "${model[0]}$exercicioNum";
          //  Retorna um ButtonTreinamento
          return ButtonTreinamento(
            //Concatena model com o último dígito da chave (treinamento-n)
            exercicio,
            //Adiciona o método para ButtonTreinamento
            () => irParaTreino(
              exercicio,
              e,
              mainFase,
              mainExercicio,
            ),
            ((mainFase != null) &&
                (mainExercicio.idExercicio == exercicioNum) &&
                (data['atual'].compareTo(
                          data['inicio'],
                        ) >=
                        0 &&
                    data['atual'].compareTo(
                          data['fim'],
                        ) <=
                        0)),
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
      scrollDirection: Axis.vertical,
      children: buttons,
    );
  }
}

class AbaTreinamento extends StatefulWidget {
  final Fase fase;
  AbaTreinamento({this.fase});

  State<AbaTreinamento> createState() {
    return _SAbaTreinamento();
  }
}
