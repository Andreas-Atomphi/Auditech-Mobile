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
  final BorderRadius borderRadius;

  TextFieldLogin(
    this.dica,
    this.obscure,
    this.tipo, {
    this.borderRadius = const BorderRadius.all(
      Radius.circular(5),
    ),
  });

  Widget build(BuildContext context) {
    TextField textfield;
    textfield = TextField(
      style: TextStyle(color: Colors.black),
      controller: myController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: borderRadius,
        ),
        fillColor: Colors.white,
        filled: true,
        hintText: dica,
        hintStyle: TextStyle(color: Colors.grey),
        isDense: true,
        contentPadding: EdgeInsets.all(8),
      ),
      obscureText: obscure,
    );
    return Container(
      child: textfield,
      width: MediaQuery.of(context).size.width * 0.8,
    );
  }

  String get text {
    return myController.text;
  }
}
