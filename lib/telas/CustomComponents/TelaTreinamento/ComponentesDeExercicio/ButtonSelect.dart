import 'package:AuditechMobile/mainData.dart';
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
      child: FlatButton(
        child: Text(texto),
        onPressed: aoPressionar,
        color: cor["fundo"],
        textColor: cor["texto"],
      ),
    );
  }
}
