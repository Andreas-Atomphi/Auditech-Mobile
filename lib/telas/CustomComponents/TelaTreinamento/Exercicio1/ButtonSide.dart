import 'package:flutter/material.dart';

class SideButton extends StatelessWidget {
  final String texto;
  final Map<String, Color> cor;

  SideButton(
    this.texto, {
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
        onPressed: () {},
        color: cor["fundo"],
        textColor: cor["texto"],
      ),
      height: (MediaQuery.of(context).size.height / 100) * 50,
      width: (MediaQuery.of(context).size.width / 100) * 49,
    );
  }
}
