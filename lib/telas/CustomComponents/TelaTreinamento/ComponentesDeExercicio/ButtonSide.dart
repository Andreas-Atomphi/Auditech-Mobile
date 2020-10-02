import 'package:flutter/material.dart';

class SideButton extends StatelessWidget {
  final String texto;
  final Map<String, Color> cor;
  final void Function() aoPressionar;

  SideButton(
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
      child: FlatButton(
        child: Text(texto),
        onPressed: aoPressionar,
        color: cor["fundo"],
        textColor: cor["texto"],
      ),
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width * 0.48,
    );
  }
}
