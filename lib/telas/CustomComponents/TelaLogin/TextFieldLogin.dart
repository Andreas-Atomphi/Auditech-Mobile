import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum TipoEntrada {
  CPF,
  DT,
}

extension TipoEntrda2 on TipoEntrada {
  TextInputType get type {
    TextInputType toReturn;
    switch (this) {
      case TipoEntrada.CPF:
        toReturn = TextInputType.number;
        break;
      case TipoEntrada.DT:
        toReturn = TextInputType.datetime;
        break;
    }
    return toReturn;
  }
}

class TextFieldLogin extends StatelessWidget {
  final TextEditingController controller;
  final String dica;
  final bool obscure;
  final TipoEntrada tipo;
  final BorderRadius borderRadius;

  TextFieldLogin({
    this.controller,
    this.dica,
    this.obscure,
    this.tipo,
    this.borderRadius = const BorderRadius.all(
      Radius.circular(5),
    ),
  });

  Widget build(BuildContext context) {
    TextField textfield;
    textfield = TextField(
      keyboardType: tipo.type,
      style: TextStyle(color: Colors.black),
      controller: controller,
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
    return controller.text;
  }
}
