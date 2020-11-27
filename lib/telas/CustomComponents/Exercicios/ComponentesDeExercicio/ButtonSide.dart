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
      child: RaisedButton(
        child: Text(texto),
        onPressed: aoPressionar,
        color: (aoPressionar == null) ? Colors.cyan[800] : cor["fundo"],
        textColor: (aoPressionar == null) ? Colors.cyan[600] : cor["texto"],
        elevation: 0.0,    
      ),
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width * 0.48,
    );
  }
}
