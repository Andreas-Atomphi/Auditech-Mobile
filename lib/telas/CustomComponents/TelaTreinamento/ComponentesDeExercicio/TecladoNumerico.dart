import 'package:flutter/material.dart';

class TecladoNumerico extends StatelessWidget {
  final Color backgroundColor, buttonsColor, textColor;
  final void Function(String txt) aoPressionar;
  final double width, height;
  TecladoNumerico({
    this.width = 50,
    this.height = 50,
    this.backgroundColor,
    this.buttonsColor,
    this.textColor,
    @required this.aoPressionar,
  });

  Widget build(BuildContext context) {
    //Informações dos componentes
    double btnSqr = (width * 0.15 >= 70) ? 70 : width * 0.15;
    List<dynamic> myChildren = [
      "s1",
      ["s1", 1, "s1", 2, "s1", 3, "s1"],
      "s1",
      ["s1", 4, "s1", 5, "s1", 6, "s1"],
      "s1",
      ["s1", 7, "s1", 8, "s1", 9, "s1"],
      "s1",
      ["s1", 0, "s1"],
      "s1",
    ];
    //Componentes
    List<Widget> rSpacers = [];

    //Componentes adicionados durante a runTime
    rSpacers = [
      ...myChildren.map(
        //Adiciona uma linha para cada List
        (rows) => (rows.runtimeType == String)
            ? Spacer(
                flex: int.parse(rows[1]),
              )
            : Row(
                children: [
                  ...rows.map(
                    //Adiciona um Spacer se for uma String ou um Container+FlatButton se for inteiro e null se não for nenhum dos 2
                    (e) => (e.runtimeType == String)
                        //Spacer com o flex alterando de acordo com o segundo dígito da String
                        ? Spacer(
                            flex: int.parse(e[1]),
                          )
                        : (e.runtimeType == int)
                            //Botão do teclado numérico
                            ? Container(
                                width: btnSqr + (width / 15),
                                height: btnSqr,
                                child: FlatButton(
                                  child: Text("$e"),
                                  color: buttonsColor,
                                  textColor: textColor,
                                  onPressed: () {
                                    aoPressionar("$e");
                                    return "$e";
                                  },
                                ),
                              )
                            : null,
                  ),
                ]..removeWhere((w) => w == null),
              ),
      )
    ];

    return Container(
      width: width,
      height: height,
      color: backgroundColor,
      child: Column(
        children: [
          ...rSpacers,
        ],
      ),
    );
  }
}
