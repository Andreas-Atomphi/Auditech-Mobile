import 'package:flutter/material.dart';

class SelectButton extends StatelessWidget {
  final String texto;
  final Map<String, Color> cor;
  final void Function() aoPressionar;
  final double width, height;

  SelectButton(
    this.width,
    this.height,
    this.texto,
    this.aoPressionar, {
    this.cor = const <String, Color>{
      "texto": Colors.white,
      "fundo": Colors.orange,
    },
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: RaisedButton(
        child: Text(texto),
        onPressed: aoPressionar,
        color: (aoPressionar == null) ? Colors.cyan[800] : cor["fundo"],
        textColor: (aoPressionar == null) ? Colors.cyan[600] : cor["texto"],
        elevation: 0.0,
      ),
    );
  }
}
