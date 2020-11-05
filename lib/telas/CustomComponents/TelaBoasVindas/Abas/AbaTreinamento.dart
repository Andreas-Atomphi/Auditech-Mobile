import 'dart:convert';
import 'package:auditech_mobile/telas/Telas.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:auditech_mobile/mainData.dart';
import '../components.dart';

class _SAbaTreinamento extends State<AbaTreinamento> {
  Map<String, http.Response> fase;
  Map<String, Map<String, dynamic>> faseJson;
  Map<String, DateTime> data;
  @override
  void initState() {
    super.initState();
    fase = widget.fase;
    faseJson = {
      "fase": jsonDecode(fase['fase'].body),
      "exercicio": jsonDecode(fase['exercicio'].body),
    };
    DateFormat dataPadrao = DateFormat("dd/MM/yyyy HH:mm:ss");
    data = {
      'inicio': dataPadrao.parse(faseJson['fase']['dataInicio']),
      'fim': dataPadrao.parse(faseJson['fase']['dataFinal']),
      'atual': DateTime.now(),
    };

    print(faseJson["fase"]['exercicioIdExercicio']);

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
    irParaTreino(String appbartext,
        [String numtreino = "exemplo-tr", jsonFase]) async {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              TelaInstrucoesTreinamento(appbartext, numtreino, jsonFase),
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
          String exercicio = "${model[0]} $exercicioNum";
          //  Retorna um ButtonTreinamento
          return ButtonTreinamento(
            //Concatena model com o último dígito da chave (treinamento-n)
            exercicio,
            //Adiciona o método para ButtonTreinamento
            () => irParaTreino(
              exercicio,
              e,
              faseJson,
            ),
            ((fase != null) &&
                    (faseJson['fase']['exercicioIdExercicio'] ==
                        exercicioNum) &&
                    (data['atual'].compareTo(
                              data['inicio'],
                            ) >=
                            0 &&
                        data['atual'].compareTo(
                              data['fim'],
                            ) <=
                            0)) ||
                true,
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
  final Map<String, http.Response> fase;

  AbaTreinamento({this.fase});

  State<AbaTreinamento> createState() {
    return _SAbaTreinamento();
  }
}
