import 'package:flutter/material.dart';

class TextFieldLogin extends StatelessWidget {
  final String dica;
  final bool obscure;

  TextFieldLogin(this.dica, this.obscure);

  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        labelStyle: TextStyle(color: Colors.lightBlue),
        hintText: dica,
        isDense: true,
        contentPadding: EdgeInsets.all(8),
      ),
      obscureText: obscure,
    );
  }
}
