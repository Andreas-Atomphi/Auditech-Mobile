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
    double btnSqr = width * 0.15;
    List<List<Widget>> myChildren = [[], [], [], []];
    //Diz quantas colunas já foram adicionadas
    int actualColumns = 1;

    FlatButton btnNum;

    //Seleciona uma Row
    for (int r = 0; r < 3; r++) {
      //
      int staticAc = actualColumns;
      List<Widget> selectedRow = myChildren[r];
      selectedRow.add(Spacer(flex: 1));
      //Adiciona botôes + Spacer's na coluna
      for (int c = actualColumns; c < staticAc + 3; c++) {
        btnNum = FlatButton(
          child: Text("$c"),
          color: buttonsColor,
          textColor: textColor,
          onPressed: () {
            aoPressionar("$c");
            return "$c";
          },
        );
        selectedRow.add(
          Container(
            width: btnSqr + 30,
            height: btnSqr,
            child: btnNum,
          ),
        );
        selectedRow.add(
          Spacer(
            flex: 1,
          ),
        );
        actualColumns += 1;
      }
    }
    myChildren[3].add(Spacer(
      flex: 1,
    ));
    myChildren[3].add(Container(
      width: btnSqr + 30,
      height: btnSqr,
      child: FlatButton(
        onPressed: () => aoPressionar("0"),
        child: Text("0"),
        color: buttonsColor,
        textColor: textColor,
      ),
    ));
    myChildren[3].add(Spacer(
      flex: 1,
    ));

    List<Widget> rSpacers = [
      Spacer(
        flex: 1,
      ),
      Row(children: myChildren[0]),
      Spacer(
        flex: 1,
      ),
      Row(children: myChildren[1]),
      Spacer(
        flex: 1,
      ),
      Row(children: myChildren[2]),
      Spacer(
        flex: 1,
      ),
      Row(children: myChildren[3]),
      Spacer(
        flex: 1,
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
