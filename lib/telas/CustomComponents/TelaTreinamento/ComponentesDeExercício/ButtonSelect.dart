import 'package:flutter/material.dart';

class SelectButton extends StatelessWidget {
  final String texto;
  final Map<String, Color> cor;

  SelectButton(
    this.texto, {
    this.cor = const <String, Color>{
      "texto": Colors.white,
      "fundo": Colors.orange,
    },
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      child: FlatButton(
        child: Text(texto),
        onPressed: () {},
        color: cor["fundo"],
        textColor: cor["texto"],
      ),
    );
  }
}
