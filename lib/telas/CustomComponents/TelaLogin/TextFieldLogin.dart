import 'package:flutter/material.dart';

enum TipoEntrada {
  CPF,
  DT,
}

class TextFieldLogin extends StatelessWidget {
  final myController = TextEditingController();
  final String dica;
  final bool obscure;
  final TipoEntrada tipo;

  TextFieldLogin(this.dica, this.obscure, this.tipo);

  Widget build(BuildContext context) {
    TextField textfield;
    textfield = TextField(
      style: TextStyle(color: Colors.black),
      controller: myController,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(2)),
        fillColor: Colors.white,
        filled: true,
        hintText: dica,
        hintStyle: TextStyle(color: Colors.grey),
        isDense: true,
        contentPadding: EdgeInsets.all(8),
      ),
      obscureText: obscure,
    );
    return Center(
      child: Container(
        child: textfield,
        width: (MediaQuery.of(context).size.width / 100) * 65,
      ),
    );
  }

  String get text {
    return myController.text;
  }
}
