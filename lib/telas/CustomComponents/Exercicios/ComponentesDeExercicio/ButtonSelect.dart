import 'package:auditech_mobile/mainData.dart';
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
        color: (aoPressionar == null)
            ? Theme.of(context).accentColor
            : corDeDestaque,
        textColor: (aoPressionar == null)
            ? Theme.of(context).primaryColor
            : cor["texto"],
        elevation: 0.0,
      ),
    );
  }
}
